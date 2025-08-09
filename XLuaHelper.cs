using System;
using System.Collections.Generic;

namespace Editor.EmmyLuaSnippetGenerator
{
    public static class XLuaHelper
    {
        public static void SetupXLuaConfig()
        {
            CSObjectWrapEditor.Generator.GetGenConfig(XLua.Utils.GetAllTypes());
        }

        public static List<Type> LuaCallCSharpTypes => CSObjectWrapEditor.Generator.LuaCallCSharp;

        public static HashSet<string> GetTargetNamespaces()
        {
            var namespaces = new HashSet<string>();
            foreach (var type in LuaCallCSharpTypes)
            {
                AppendNamespaces(namespaces, type);
            }

            return namespaces;
        }

        private static void AppendNamespaces(HashSet<string> result, Type type)
        {
            var @namespace = type.Namespace;
            if (string.IsNullOrEmpty(@namespace))
            {
                return;
            }

            var parts = @namespace.Split('.');
            var currentNs = "";

            foreach (var part in parts)
            {
                currentNs = string.IsNullOrEmpty(currentNs) ? part : currentNs + "." + part;
                result.Add(currentNs);
            }
        }
    }
}