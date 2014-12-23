#load "../Automation/Config/SettingKeys.csx"
#load "../Automation/Config/SettingValues.csx"
using System.Reflection;
using System.Diagnostics;

var settingValues = new SettingValues();

Add(SettingKeys.ProjectName, settingValues.ProjectName);
Add(SettingKeys.SolutionFile, settingValues.SolutionFile);
Add(SettingKeys.BuildNumber, settingValues.BuildNumber);
Add(SettingKeys.UiDirectory, settingValues.UiDirectory);
Add(SettingKeys.DeploymentHistoryPath, settingValues.DeploymentHistoryPath);
Add(SettingKeys.ToolsPath, settingValues.ToolsPath);
Add(SettingKeys.OctopusApiUrl, settingValues.OctopusApiUrl);
Add(SettingKeys.OctopusApiKey, settingValues.OctopusApiKey);
Add(SettingKeys.OctopackFileShareNightly, settingValues.OctopackFileShareNightly);
Add(SettingKeys.OctopackFileShareRelease, settingValues.OctopackFileShareRelease);
