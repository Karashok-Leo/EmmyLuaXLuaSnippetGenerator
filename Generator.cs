using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.RegularExpressions;
using UnityEditor;
using UnityEngine;

namespace Editor.EmmyLuaSnippetGenerator
{
    /// <summary>
    /// 该文件只用来给ide进行lua类型提示的,不要在运行时require该文件或者打包到版本中.
    /// </summary>
    public static class LuaTypeGenerator
    {
        private static SettingOptions _options;

        private static readonly HashSet<Type> LuaNumberTypeSet = new()
        {
            typeof(byte),
            typeof(sbyte),
            typeof(short),
            typeof(ushort),
            typeof(int),
            typeof(uint),
            typeof(long),
            typeof(ulong),
            typeof(float),
            typeof(double)
        };

        private static readonly HashSet<string> LuaKeywordSet = new()
        {
            "and",
            "break",
            "do",
            "else",
            "elseif",
            "end",
            "false",
            "for",
            "function",
            "if",
            "in",
            "local",
            "nil",
            "not",
            "or",
            "repeat",
            "return",
            "then",
            "true",
            "until",
            "while"
        };

        private static string[] _functionCompatibleTypes;

        private static readonly StringBuilder Sb = new(1024);
        private static readonly StringBuilder TempSb = new(1024);
        private static readonly List<Type> ExportTypeList = new();

        private static readonly Dictionary<Type, List<MethodInfo>>
            ExtensionMethodsDic = new();

        [MenuItem("LuaType/生成EmmyLua类型注解")]
        public static void GenerateEmmyTypeFiles()
        {
            if (!XmlHelper.TryLoadConfig(SettingOptions.SavePath, out SettingOptions loaded))
            {
                Debug.LogError("错误: 需要一份配置文件才能执行操作. 在[设置]页面中配置它然后保存!");
                return;
            }

            _options = loaded;
            if (!Directory.Exists(_options.generatePath))
            {
                Directory.CreateDirectory(_options.generatePath);
            }

            try
            {
                var set = CollectAllExportType();
                ExportTypeList.AddRange(set);

                _functionCompatibleTypes = _options.GetFunctionCompatibleTypes();

                HandleExtensionMethods();

                GenerateTypeDefines();

                ClearEmmyTypeFiles();

                WriteToFile();

                AssetDatabase.Refresh();
            }
            catch (Exception e)
            {
                Debug.LogError("错误: " + e.Message);
                return;
            }
            finally
            {
                ExportTypeList.Clear();
                ExtensionMethodsDic.Clear();
                Sb.Clear();
            }

            Debug.Log("生成注解文件完毕.");
        }

        [MenuItem("LuaType/清除EmmyLua类型注解")]
        public static void ClearEmmyTypeFiles()
        {
            if (!XmlHelper.TryLoadConfig(SettingOptions.SavePath, out SettingOptions loaded))
            {
                Debug.LogError("错误: 需要一份配置文件才能执行操作. 在[设置]页面中配置它然后保存!");
                return;
            }

            _options = loaded;

            if (!Directory.Exists(_options.generatePath))
            {
                return;
            }

            var count = 0;
            var files = Directory.GetFiles(_options.generatePath, "TypeHint_*.lua");

            foreach (var file in files)
            {
                File.Delete(file);
                count++;
            }

            Debug.Log($"清除完毕, 删除了 {count} 份注解文件. (生成时会自动执行该清理)");
        }

        private static HashSet<Type> CollectAllExportType()
        {
            // 收集要导出的类型
            var allAssembly = AppDomain.CurrentDomain.GetAssemblies();
            // 去重复
            var set = new HashSet<Type>();
            foreach (var assemblyInst in allAssembly)
            {
                var collection = CollectType(assemblyInst);
                foreach (var typeInst in collection)
                {
                    set.Add(typeInst);
                }
            }

            return set;
        }

        private static bool IsExportType(Type item)
        {
            var targetNamespaces = _options.GetTargetNamespaces();

            foreach (var targetNamespace in targetNamespaces)
            {
                var itemNamespace = item.Namespace;
                if (string.IsNullOrEmpty(itemNamespace))
                {
                    if (!string.IsNullOrEmpty(item.FullName) &&
                        item.FullName.Contains("Interop"))
                    {
                        return false;
                    }

                    // 很多i,j,p,o这样的类占用空间浪费时间，类名少于3直接干掉
                    return item.Name.Length > 2;
                }

                // 不要编辑器
                if (itemNamespace.StartsWith("UnityEditor"))
                {
                    return false;
                }

                // lua里用不到
                if (itemNamespace.Contains("Burst"))
                {
                    return false;
                }

                if (itemNamespace.StartsWith(targetNamespace))
                {
                    return true;
                }
            }

            return false;
        }

        private static Type[] CollectType(Assembly assembly)
        {
            var types = assembly.GetTypes();
            var retTypes = new HashSet<Type>();
            foreach (var item in types)
            {
                if (IsExportType(item))
                {
                    retTypes.Add(item);
                }
            }

            return retTypes.ToArray();
        }

        private static void HandleExtensionMethods()
        {
            foreach (var type in ExportTypeList)
            {
                var publicStaticMethodInfos =
                    type.GetMethods(BindingFlags.Public | BindingFlags.Static | BindingFlags.DeclaredOnly);
                foreach (var methodInfo in publicStaticMethodInfos)
                {
                    if (!methodInfo.IsDefined(typeof(ExtensionAttribute), false))
                    {
                        continue;
                    }

                    var extensionType = methodInfo.GetParameters()[0].ParameterType;
                    if (ExtensionMethodsDic.TryGetValue(extensionType, out var extensionMethodList))
                    {
                        extensionMethodList.Add(methodInfo);
                    }
                    else
                    {
                        var methodList = new List<MethodInfo> { methodInfo };
                        ExtensionMethodsDic.Add(extensionType, methodList);
                    }
                }
            }
        }

        private static void GenerateTypeDefines()
        {
            Sb.Clear();
            Sb.AppendLine("---@meta CSharp");
            Sb.AppendLine("");
            Sb.AppendLine("---@class NotExportType @表明该类型未导出");
            Sb.AppendLine("");
            Sb.AppendLine("---@class NotExportEnum @表明该枚举未导出");
            Sb.AppendLine("");

            WriteGlobalVariablesDefine();

            WriteXLuaDefine();

            var targetNamespaces = _options.GetTargetNamespaces();

            foreach (var namespaceName in targetNamespaces)
            {
                Sb.AppendLine($"---@class {namespaceName}");
                Sb.AppendLine($"{namespaceName} = {{}}");

                if (_options.generateCsAlias)
                {
                    var namespaceCSharpAlias = $"CS.{namespaceName}";

                    Sb.AppendLine($"---@alias {namespaceCSharpAlias} {namespaceName}");
                    Sb.AppendLine($"{namespaceCSharpAlias} = {{}}");
                }

                Sb.AppendLine("");
            }

            foreach (var typeInst in ExportTypeList)
            {
                // 防止一些匿名类型的生成
                if (typeInst.ToString().Contains("<"))
                {
                    continue;
                }

                _keepStringTypeName = typeInst == typeof(string);

                WriteClassDefine(typeInst);
                WriteClassFieldDefine(typeInst);
                Sb.AppendLine($"{typeInst.ToLuaTypeName().ReplaceDotOrPlusWithUnderscore()} = {{}}");

                if (_options.generateCsAlias)
                {
                    WriteClassAliasDefine(typeInst);
                }

                WriteClassConstructorDefine(typeInst);
                WriteClassMethodDefine(typeInst);

                Sb.AppendLine("");
            }
        }

        #region TypeDefineFileGenerator

        private static void WriteToFile()
        {
            var lines = Sb.ToString().Split(new[] { Environment.NewLine }, StringSplitOptions.None);

            var fileCount = 0;
            var lineCount = 0;

            StreamWriter writer = null;

            foreach (var line in lines)
            {
                if (writer == null)
                {
                    var fileName = $"{_options.generatePath}/TypeHint_{fileCount}.lua";
                    writer = new StreamWriter(fileName);
                    writer.WriteLine("---@meta");
                    writer.WriteLine("");
                }

                if (string.IsNullOrWhiteSpace(line) &&
                    _options.singleFileMaxLine != 0 &&
                    lineCount >= _options.singleFileMaxLine)
                {
                    writer.Close();
                    fileCount++;
                    lineCount = 0;
                    writer = null;
                    continue;
                }

                writer.WriteLine(line);
                lineCount++;
            }

            writer?.Close();
        }

        private static void WriteGlobalVariablesDefine()
        {
            foreach (var (varName, varTypeName) in _options.GetGlobalVariables())
            {
                Sb.AppendLine($"---@type {varTypeName}");
                Sb.AppendLine($"{varName} = nil");
                Sb.AppendLine("");
            }
        }

        // xLua相关的定义单独写
        private static void WriteXLuaDefine()
        {
            // CS table
            Sb.AppendLine("---@class CS");
            Sb.AppendLine("CS = {}");
            Sb.AppendLine("");

            // typeof function
            Sb.AppendLine(@"---@param obj any");
            Sb.AppendLine(@"---@return System.Type");
            Sb.AppendLine(@"function typeof(obj) end");
            Sb.AppendLine("");
        }

        private static void WriteClassDefine(Type type)
        {
            if (type.BaseType != null && !type.IsEnum)
            {
                Sb.AppendLine($"---@class {type.ToLuaTypeName()} : {type.BaseType.ToLuaTypeName()}");
            }
            else
            {
                Sb.AppendLine($"---@class {type.ToLuaTypeName()}");
            }
        }

        private static void WriteClassFieldDefine(Type classType)
        {
            var publicInstanceFieldInfos =
                classType.GetFields(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly);

            var publicStaticFieldInfos =
                classType.GetFields(BindingFlags.Public | BindingFlags.Static | BindingFlags.DeclaredOnly);

            var fieldInfoList = new List<FieldInfo>();

            fieldInfoList.AddRange(publicStaticFieldInfos);

            if (!classType.IsEnum)
            {
                fieldInfoList.AddRange(publicInstanceFieldInfos);
            }

            foreach (var fieldInfo in fieldInfoList)
            {
                if (fieldInfo.IsMemberObsolete(classType))
                {
                    continue;
                }

                var fieldTypeName = fieldInfo.FieldType.ToLuaTypeName();

                Sb.AppendLine($"---@field {fieldInfo.Name} {fieldTypeName.MakeLuaFunctionCompatible()}");
            }

            var publicInstancePropertyInfo =
                classType.GetProperties(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly);

            var publicStaticPropertyInfo =
                classType.GetProperties(BindingFlags.Public | BindingFlags.Static | BindingFlags.DeclaredOnly);

            var propertyInfoList = new List<PropertyInfo>();
            propertyInfoList.AddRange(publicStaticPropertyInfo);

            if (!classType.IsEnum)
            {
                propertyInfoList.AddRange(publicInstancePropertyInfo);
            }

            foreach (var propertyInfo in propertyInfoList)
            {
                if (propertyInfo.IsMemberObsolete(classType))
                {
                    continue;
                }

                var propertyTypeName = propertyInfo.PropertyType.ToLuaTypeName();

                Sb.AppendLine($"---@field {propertyInfo.Name} {propertyTypeName.MakeLuaFunctionCompatible()}");
            }

            if (!_options.inferGenericFieldType)
            {
                return;
            }

            Dictionary<string, Type> inferredGenericFieldInfos = new();

            // 如果一个类型自身不是泛型, 但其父类是泛型, 则可认为在本次继承过程中完全地提供了父类所需的泛型信息.
            // 这种情况下, 从父类继承而来的泛型字段可以通过该信息进行类型推断.
            if (classType.IsGenericType ||
                classType.BaseType is not { IsGenericType: true } ||
                // 只适用于父类的泛型参数只有一个的情况
                // 如果有多个泛型参数, 则不能很好的分析泛型字段应使用哪一个
                classType.BaseType.GetGenericArguments().Length != 1)
            {
                return;
            }

            var genericTypeDefinition = classType.BaseType.GetGenericTypeDefinition();

            // 尝试推断泛型字段
            var baseClassFields =
                genericTypeDefinition.GetFields(BindingFlags.Public | BindingFlags.Instance)
                    .Concat(
                        genericTypeDefinition.GetFields(BindingFlags.Public | BindingFlags.Static)
                    )
                    .ToArray();

            foreach (var field in baseClassFields)
            {
                if (!field.FieldType.IsGenericParameter)
                {
                    continue;
                }

                inferredGenericFieldInfos.Add(field.Name, classType);
            }

            // 尝试推断泛型属性
            var baseClassProperties =
                genericTypeDefinition.GetProperties(BindingFlags.Public | BindingFlags.Instance)
                    .Concat(
                        genericTypeDefinition.GetProperties(BindingFlags.Public | BindingFlags.Static)
                    )
                    .ToArray();

            foreach (var property in baseClassProperties)
            {
                if (!property.PropertyType.IsGenericParameter)
                {
                    continue;
                }

                inferredGenericFieldInfos.Add(property.Name, classType);
            }

            // 写入
            foreach (var inferredGenericFieldInfo in inferredGenericFieldInfos)
            {
                Sb.AppendLine($"---@field {inferredGenericFieldInfo.Key} {inferredGenericFieldInfo.Value.ToLuaTypeName()} -- inferred from {classType.BaseType}");
            }
        }

        private static void WriteClassAliasDefine(Type type)
        {
            var typeName = type.ToLuaTypeName(addCSharpPrefix: false);
            var typeCSharpAlias = type.ToLuaTypeName(addCSharpPrefix: true);

            Sb.AppendLine($"---@alias {typeCSharpAlias} {typeName}");
            Sb.AppendLine($"{typeCSharpAlias} = {typeName}");
            Sb.AppendLine("");
        }

        private static void WriteClassConstructorDefine(Type type)
        {
            if (type == typeof(MonoBehaviour) || type.IsSubclassOf(typeof(MonoBehaviour)))
            {
                return;
            }

            var className = type.ToLuaTypeName().ReplaceDotOrPlusWithUnderscore();
            var constructorInfos = type.GetConstructors();
            if (constructorInfos.Length == 0)
            {
                return;
            }

            for (var i = 0; i < constructorInfos.Length - 1; i++)
            {
                var ctorInfo = constructorInfos[i];
                if (ctorInfo.IsStatic || ctorInfo.IsGenericMethod)
                {
                    continue;
                }

                WriteOverloadMethodCommentDeclare(
                    parameterInfos: ctorInfo.GetParameters(),
                    returnType: type,
                    classType: null // constructor has no "class type", although it's a member of the class
                );
            }

            var lastCtorInfo = constructorInfos[^1];
            WriteMethodFunctionDeclare(lastCtorInfo.GetParameters(), type, "New", className, true);
        }

        private static void WriteClassMethodDefine(Type type)
        {
            // string classNameWithNameSpace = type.ToLuaTypeName().Replace(".", "_");
            var classNameWithNameSpace = type.ToLuaTypeName();

            var methodGroup = new Dictionary<string, List<MethodInfo>>();
            var publicInstanceMethodInfos =
                type.GetMethods(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly);
            var publicStaticMethodInfos =
                type.GetMethods(BindingFlags.Public | BindingFlags.Static | BindingFlags.DeclaredOnly);

            foreach (var methodInfo in publicStaticMethodInfos)
            {
                if (methodInfo.IsMemberObsolete(type))
                {
                    continue;
                }

                RecordMethodGroup(methodInfo);
            }

            foreach (var methodInfo in publicInstanceMethodInfos)
            {
                if (methodInfo.IsMemberObsolete(type))
                {
                    continue;
                }

                RecordMethodGroup(methodInfo);
            }

            foreach (var oneGroup in methodGroup)
            {
                var methodInfoList = oneGroup.Value;
                // 前面的方法都是overload
                for (var i = 0; i < methodInfoList.Count - 1; i++)
                {
                    var methodInfo = methodInfoList[i];

                    WriteOverloadMethodCommentDeclare(
                        parameterInfos: methodInfo.GetParameters(),
                        returnType: methodInfo.ReturnType,
                        classType: methodInfo.IsStatic ? null : type
                    );
                }

                var lastMethodInfo = methodInfoList[^1];
                WriteMethodFunctionDeclare(lastMethodInfo.GetParameters(), lastMethodInfo.ReturnType,
                    lastMethodInfo.Name,
                    classNameWithNameSpace, lastMethodInfo.IsStatic);
            }

            WriteExtensionMethodFunctionDeclare(type);
            return;

            void RecordMethodGroup(MethodInfo methodInfo)
            {
                var methodName = methodInfo.Name;

                if (methodInfo.IsGenericMethod)
                {
                    return;
                }

                if (methodName.StartsWith("get_") || methodName.StartsWith("set_") || methodName.StartsWith("op_"))
                {
                    return;
                }

                if (methodName.StartsWith("add_") || methodName.StartsWith("remove_"))
                {
                    return;
                }

                if (methodGroup.ContainsKey(methodName))
                {
                    var methodInfoList = methodGroup[methodName] ?? new List<MethodInfo>();

                    methodInfoList.Add(methodInfo);
                    methodGroup[methodName] = methodInfoList;
                }
                else
                {
                    methodGroup.Add(methodName, new List<MethodInfo> { methodInfo });
                }
            }
        }

        private static void WriteOverloadMethodCommentDeclare(
            ParameterInfo[] parameterInfos,
            Type returnType,
            Type classType // if null, means static method
        )
        {
            var outOrRefParameterInfoList = new List<ParameterInfo>();

            TempSb.Clear();
            for (var i = 0; i < parameterInfos.Length; i++)
            {
                var parameterInfo = parameterInfos[i];
                var parameterName = parameterInfo.Name;
                var parameterTypeName = parameterInfo.ParameterType.ToLuaTypeName().MakeLuaFunctionCompatible();
                if (parameterInfo.IsOut)
                {
                    parameterName = "out_" + parameterName;
                    outOrRefParameterInfoList.Add(parameterInfo);

                    parameterTypeName = parameterInfo.ParameterType.GetElementType().ToLuaTypeName().MakeLuaFunctionCompatible();
                }
                else if (parameterInfo.ParameterType.IsByRef)
                {
                    parameterName = "ref_" + parameterName;
                    outOrRefParameterInfoList.Add(parameterInfo);

                    parameterTypeName = parameterInfo.ParameterType.GetElementType().ToLuaTypeName().MakeLuaFunctionCompatible();
                }

                // write self parameter
                if (i == 0 && classType != null)
                {
                    TempSb.Append($"self: {classType.ToLuaTypeName()}, ");
                }

                // write other parameters
                parameterName = EscapeLuaKeyword(parameterName);
                TempSb.Append(
                    i == parameterInfos.Length - 1 ?
                        $"{parameterName}: {parameterTypeName}" :
                        $"{parameterName}: {parameterTypeName}, "
                );
            }

            // return
            var returnTypeList = new List<Type>();
            if (returnType != null && returnType != typeof(void))
            {
                returnTypeList.Add(returnType);
            }

            foreach (var parameterInfo in outOrRefParameterInfoList)
            {
                returnTypeList.Add(parameterInfo.ParameterType.GetElementType());
            }

            var returnTypeString = "";
            for (var i = 0; i < returnTypeList.Count; i++)
            {
                if (i == returnTypeList.Count - 1)
                {
                    returnTypeString += returnTypeList[i].ToLuaTypeName();
                }
                else
                {
                    returnTypeString += returnTypeList[i].ToLuaTypeName() + ", ";
                }
            }

            Sb.AppendLine(
                returnTypeList.Count > 0 ?
                    $"---@overload fun({TempSb}) : {returnTypeString}" :
                    $"---@overload fun({TempSb})"
            );
        }

        private static void WriteMethodFunctionDeclare(
            ParameterInfo[] parameterInfos,
            Type returnType,
            string methodName,
            string className,
            bool isStaticMethod
        )
        {
            var outOrRefParameterInfoList = new List<ParameterInfo>();

            TempSb.Clear();
            for (var i = 0; i < parameterInfos.Length; i++)
            {
                var parameterInfo = parameterInfos[i];
                var parameterName = parameterInfo.Name;
                var parameterTypeName = parameterInfo.ParameterType.ToLuaTypeName();
                if (parameterInfo.IsOut)
                {
                    parameterName = "out_" + parameterName;
                    outOrRefParameterInfoList.Add(parameterInfo);

                    parameterTypeName = parameterInfo.ParameterType.GetElementType().ToLuaTypeName();
                }
                else if (parameterInfo.ParameterType.IsByRef)
                {
                    parameterName = "ref_" + parameterName;
                    outOrRefParameterInfoList.Add(parameterInfo);

                    parameterTypeName = parameterInfo.ParameterType.GetElementType().ToLuaTypeName();
                }

                parameterName = EscapeLuaKeyword(parameterName);

                TempSb.Append(
                    i == parameterInfos.Length - 1 ?
                        parameterName :
                        $"{parameterName}, "
                );

                Sb.AppendLine($"---@param {parameterName} {parameterTypeName.MakeLuaFunctionCompatible()}");
            }

            // return
            var haveReturn = returnType != null && returnType != typeof(void) || outOrRefParameterInfoList.Count > 0;

            if (haveReturn)
            {
                Sb.Append("---@return ");
            }

            if (returnType != null && returnType != typeof(void))
            {
                Sb.Append(returnType.ToLuaTypeName().MakeLuaFunctionCompatible());
            }

            foreach (var parameterInfo in outOrRefParameterInfoList)
            {
                Sb.Append($",{parameterInfo.ParameterType.GetElementType().ToLuaTypeName()}");
            }

            if (haveReturn)
            {
                Sb.AppendLine("");
            }

            Sb.AppendLine(
                isStaticMethod ?
                    $"function {className}.{methodName}({TempSb}) end" :
                    $"function {className}:{methodName}({TempSb}) end"
            );
        }

        private static void WriteExtensionMethodFunctionDeclare(Type type)
        {
            if (!ExtensionMethodsDic.TryGetValue(type, out var extensionMethodList))
            {
                return;
            }

            foreach (var methodInfo in extensionMethodList)
            {
                var parameterInfos = methodInfo.GetParameters();
                if (parameterInfos.Length > 0)
                {
                    // 第一个param是拓展类型，去掉
                    parameterInfos = parameterInfos.ToList().GetRange(1, parameterInfos.Length - 1).ToArray();
                }

                var returnType = methodInfo.ReturnType;
                var methodName = methodInfo.Name;
                var classNameWithNameSpace = type.ToLuaTypeName();

                WriteMethodFunctionDeclare(parameterInfos, returnType, methodName, classNameWithNameSpace, false);
            }
        }

        #endregion

        private static string MakeLuaFunctionCompatible(this string typeName)
        {
            return _functionCompatibleTypes.Contains(typeName) ? typeName + " | function" : typeName;
        }

        private static bool _keepStringTypeName;

        private static string ToLuaTypeName(this Type type, bool addCSharpPrefix = false)
        {
            var prefix = addCSharpPrefix ? "CS." : "";

            if (type == null)
            {
                return "NullType";
            }

            if (LuaNumberTypeSet.Contains(type))
            {
                return "number";
            }

            if (type == typeof(string))
            {
                return _keepStringTypeName ? "System.String" : "string";
            }

            if (type == typeof(bool))
            {
                return "boolean";
            }

            var typeName = type.FullName;
            if (typeName == null)
            {
                return prefix + type.ToString().EscapeGenericTypeSuffix();
            }

            if (type.IsEnum)
            {
                return prefix + type.FullName.EscapeGenericTypeSuffix().Replace("+", ".");
            }

            // 去除泛型后缀
            typeName = typeName.EscapeGenericTypeSuffix();

            var bracketIndex = typeName.IndexOf("[[", StringComparison.Ordinal);
            if (bracketIndex > 0)
            {
                typeName = typeName[..bracketIndex];
            }

            return prefix + typeName;
        }

        private static readonly Dictionary<Type, string> CSharpTypeNameDic = new()
        {
            { typeof(byte), "byte" },
            { typeof(sbyte), "sbyte" },
            { typeof(short), "short" },
            { typeof(ushort), "ushort" },
            { typeof(int), "int" },
            { typeof(uint), "uint" },
            { typeof(long), "long" },
            { typeof(ulong), "ulong" },
            { typeof(float), "float" },
            { typeof(double), "double" },
            { typeof(bool), "bool" },
            { typeof(string), "string" },
        };


        private static string EscapeLuaKeyword(string s)
        {
            if (LuaKeywordSet.Contains(s))
            {
                return "_" + s;
            }

            return s;
        }

        private static string ReplaceDotOrPlusWithUnderscore(this string s)
        {
            // return s.Replace(".", "_").Replace("+", "_");
            return s.Replace("+", "_");
        }

        private static string EscapeGenericTypeSuffix(this string s)
        {
            var result = Regex.Replace(s, @"\`[0-9]+", "");

            result = result.Replace("+", ".");

            return result;
        }

        private static bool IsMemberObsolete(this MemberInfo memberInfo, Type type)
        {
            return memberInfo.GetCustomAttributes(typeof(ObsoleteAttribute), false).Length > 0 || IsMemberFilter(memberInfo, type);
        }

        // TODO: ???
        private static bool IsMemberFilter(MemberInfo mi, Type type)
        {
            if (type.IsGenericType)
            {
            }

            return false;
        }
    }
}