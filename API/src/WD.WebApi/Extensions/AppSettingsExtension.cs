using System.IO;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;

namespace WD.WebApi.Extensions
{
    public static class AppSettingsExtension
    {
        private const string SettingsPath = "Settings";
        private const string DefaultSettingsName = "settings.json";
        private const string SettingsId = "settings.id"; // this we use to find local *.json file name
        private const string DefaultSettingsDevelopmentName = "settings.Development.json";

        public static IConfiguration CreateAppConfiguration(this IConfigurationBuilder builder,
            IWebHostEnvironment webHostEnvironment)
        {
            var rootPath = webHostEnvironment.ContentRootPath;

            var appSettingsFilePath = Path.Combine(rootPath, SettingsPath, DefaultSettingsName);
            var appDevelopmentSettingsFilePath = Path.Combine(rootPath, SettingsPath, DefaultSettingsDevelopmentName);

            // this solution to check "if file exists" works both on Mac OS and Windows
            var appSettingsFileInfo = new FileInfo(appSettingsFilePath);
            var appDevelopmentSettingsFileInfo = new FileInfo(appDevelopmentSettingsFilePath);

            if (appSettingsFileInfo.Exists)
            {
                builder = builder.AddJsonFile(appSettingsFilePath);
            }
            
            if (appDevelopmentSettingsFileInfo.Exists)
            {
                builder = builder.AddJsonFile(appDevelopmentSettingsFilePath);
            }

            var localSettingsPath = TryGetLocalSettingsPath(rootPath);

            if (!string.IsNullOrEmpty(localSettingsPath))
            {
                builder = builder.AddJsonFile(localSettingsPath);
            }

            return builder.Build();
        }

        private static string TryGetLocalSettingsPath(string rootPath)
        {
            var settingsIdPath = Path.Combine(rootPath, SettingsPath, SettingsId);
            var settingsIdFileInfo = new FileInfo(settingsIdPath);

            if (!settingsIdFileInfo.Exists)
            {
                return null;
            }

            var localSettingsName = File.ReadAllText(settingsIdPath);
            var localSettingsPath = Path.Combine(rootPath, SettingsPath, localSettingsName);
            
            var localSettingsFileInfo = new FileInfo(localSettingsPath);

            return localSettingsFileInfo.Exists ? localSettingsPath : null;
        }
    }
}