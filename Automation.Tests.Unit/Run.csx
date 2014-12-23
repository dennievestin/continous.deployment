#load "..\Automation\Config\SettingValues.csx"
#load "..\Automation\Config\SettingKeys.csx"
#load "..\Automation\Services\DeployService.csx"
#load "ProjectSettingsTests.csx"

using ConfigR;

Require<BDDfyRunner>();
var runner = Require<BDDfyRunner>();
runner.HtmlReportOutputPath = @"c:\projects\continous.deployment\Automation.Tests.Unit";
var config = new SettingValues();
runner.RunAllTests();

