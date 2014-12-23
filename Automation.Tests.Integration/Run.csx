#load "..\Automation\Config\SettingValues.csx"
#load "..\Automation\Config\SettingKeys.csx"
#load "..\Automation\Services\DeployService.csx"
#load "MachineIntegrationTests.csx"
#load "OctopusServiceTests.csx"
#load "IntegrationTests.csx"

using ConfigR;

var runner = Require<BDDfyRunner>();
runner.HtmlReportOutputPath = @"c:\projects\continous.deployment\Automation.Tests.Integration";
var config = new SettingValues();
runner.RunAllTests();

