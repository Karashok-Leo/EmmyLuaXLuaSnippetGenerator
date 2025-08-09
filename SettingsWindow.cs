using System;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace Editor.EmmyLuaSnippetGenerator
{
    [Serializable]
    public sealed class SettingOptions
    {
        public string subGeneratePath;
        public string targetNamespacesStr;
        public string globalVariablesStr;
        public string functionCompatibleTypesStr;
        public bool generateCsAlias = true;
        public bool inferGenericFieldType = true;
        public int singleFileMaxLine = 5000;

        public static string SavePath => Path.Combine(Application.dataPath, "Editor", "EmmyLuaSnippetGenerator", "config.xml");

        public string[] GetTargetNamespaces()
        {
            return string.IsNullOrWhiteSpace(targetNamespacesStr) ?
                Array.Empty<string>() :
                targetNamespacesStr.Split(' ');
        }

        // varName, typeName
        public (string, string)[] GetGlobalVariables()
        {
            if (string.IsNullOrWhiteSpace(globalVariablesStr))
            {
                return Array.Empty<(string, string)>();
            }

            var varInfos = globalVariablesStr.Split(' ');
            return varInfos.Select(info => info.Split(':')).Select(info => (info[0], info[1])).ToArray();
        }

        public string[] GetFunctionCompatibleTypes()
        {
            return string.IsNullOrWhiteSpace(functionCompatibleTypesStr) ?
                Array.Empty<string>() :
                functionCompatibleTypesStr.Split(' ');
        }
    }

    public sealed class SettingsWindow : EditorWindow
    {
        private SettingOptions _options;

        [MenuItem("LuaType/设置")]
        public static void ShowWindow()
        {
            GetWindow<SettingsWindow>("Lua类型注解文件设置");
        }

        private void OnEnable()
        {
            _options = XmlHelper.TryLoadConfig(SettingOptions.SavePath, out SettingOptions settings) ? settings : new SettingOptions();
        }

        private void OnGUI()
        {
            GUILayout.Space(20);

            GUILayout.Label(
                "生成类型注解文件的路径"
            );
            _options.subGeneratePath = EditorGUILayout.TextField(
                _options.subGeneratePath,
                GUILayout.MinWidth(200)
            );

            GUILayout.Space(10);

            GUILayout.Label(
                "要生成注解的C#命名空间"
                + "\n- 多个命名空间用空格分隔"
                + "\n- 例如: UnityEngine DG FairyGUI"
            );
            _options.targetNamespacesStr = EditorGUILayout.TextField(
                _options.targetNamespacesStr,
                GUILayout.MinWidth(200)
            );

            GUILayout.Space(10);

            GUILayout.Label(
                "要生成注解的全局变量"
                + "\n- 变量名:类型名, 多个组用空格分隔"
                + "\n- 例如: UNITY_EDITOR:boolean DEBUG_LV:integer"
            );
            _options.globalVariablesStr = EditorGUILayout.TextField(
                _options.globalVariablesStr,
                GUILayout.MinWidth(200)
            );

            GUILayout.Space(10);

            GUILayout.Label(
                "使以下类型名兼容Lua function类型"
                + "\n- 多个类型名用空格分隔"
                + "\n- 例如: System.Action FairyGUI.EventCallback0"
            );
            _options.functionCompatibleTypesStr = EditorGUILayout.TextField(
                _options.functionCompatibleTypesStr,
                GUILayout.MinWidth(200)
            );

            GUILayout.Space(10);

            GUILayout.Label(
                "生成带CS.前缀的兼容alias"
                + "\n- 启用后, 将为生成的类型名额外添加带CS.前缀的版本"
            );
            _options.generateCsAlias = EditorGUILayout.Toggle(_options.generateCsAlias);

            GUILayout.Space(10);

            GUILayout.Label(
                "尝试推理泛型字段类型"
                + "\n- 启用后, 将在继承泛型类的非泛型派生中添加泛型字段的类型"
                + "\n- 显著影响注解生成速度, 但不影响类型分析性能"
            );
            _options.inferGenericFieldType = EditorGUILayout.Toggle(_options.inferGenericFieldType);

            GUILayout.Space(10);

            GUILayout.Label(
                "单个注解文件的最大行数"
                + "\n- 超过该行数时会自动拆分成多个文件"
                + "\n- 大幅影响类型分析性能, 请依据电脑配置设置"
            );
            _options.singleFileMaxLine = (int)EditorGUILayout.Slider(
                _options.singleFileMaxLine,
                5000,
                40000,
                GUILayout.MinWidth(200)
            );

            GUILayout.Space(20);

            if (GUILayout.Button("保存配置文件"))
            {
                try
                {
                    XmlHelper.SaveConfig(_options, SettingOptions.SavePath);
                    Close();
                }
                catch (UnauthorizedAccessException e)
                {
                    // ReSharper disable once Unity.PerformanceCriticalCodeInvocation
                    Debug.LogError($"错误: 没有对目录 {SettingOptions.SavePath} 的操作权限. 尝试修改配置文件的存放路径.\n{e.StackTrace}");
                }
            }

            if (GUILayout.Button("取消"))
            {
                Close();
            }
        }
    }
}