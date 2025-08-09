using System.Diagnostics;
using System.IO;
using System.Xml.Serialization;

namespace Editor.EmmyLuaSnippetGenerator
{
    public static class XmlHelper
    {
        public static void SaveConfig<T>(T config, string filePath)
        {
            var directoryName = Path.GetDirectoryName(filePath);
            if (string.IsNullOrEmpty(directoryName))
            {
                throw new DirectoryNotFoundException("Directory name cannot be null or empty.");
            }

            if (!Directory.Exists(directoryName))
            {
                Directory.CreateDirectory(directoryName);
            }

            XmlSerializer serializer = new(typeof(T));

            using StreamWriter writer = new(filePath);

            serializer.Serialize(writer, config);
        }

        public static bool TryLoadConfig<T>(string filePath, out T config)
        {
            if (!File.Exists(filePath))
            {
                config = default;
                return false;
            }

            XmlSerializer serializer = new(typeof(T));
            using StreamReader reader = new(filePath);

            config = (T)serializer.Deserialize(reader);
            return true;
        }

        public static void OpenWithDefaultEditor(string filePath)
        {
            Process.Start(new ProcessStartInfo(filePath) { UseShellExecute = true });
        }
    }
}