#load "Services\\DeployService.csx"

Require<Shovel>();

"SetVariables"
    .Do(()=>{
        var settings = new SettingValues();
        private string project = settings.ProjectName;
        private string checkoutDir = OctopusService.GetCheckoutDirectoryFromTeamCity(Env.ScriptArgs[1]);
        private string octoExecLocation = "Tools\\octo.exe";
        private string target;
    });

"DeployToTest"
    .DependsOn("SetVariables")
    .RunProgram(shell =>
    {
      target = "Test";
      shell.Executable = octoExecLocation;
      shell.Arguments(string.Format("deploy-release --project {0} --deployto {1} --releaseNumber {2} --progress --waitfordeployment --forcepackagedownload --server {3} --apiKey {4} --debug --enableServiceMessages", project, target, config.BuildNumber, config.OctopusApiUrl, config.OctopusApiKey));
    });

"DeployToStage"
    .DependsOn("SetVariables")
    .RunProgram(shell =>
    {
      target = "Stage";
      shell.Executable = octoExecLocation;
      shell.Arguments(string.Format("deploy-release --project {0} --deployto {1} --releaseNumber {2} --progress --waitfordeployment --forcepackagedownload --server {3} --apiKey {4} --debug --enableServiceMessages", project, target, config.BuildNumber, config.OctopusApiUrl, config.OctopusApiKey));
    });

"ProductionPackage"
    .DependsOn("SetVariables")
    .RunProgram(shell =>
    {
      target = "Production";
      shell.Executable = octoExecLocation;
      shell.Arguments(string.Format("deploy-release --project {0} --deployto {1} --releaseNumber {2} --progress --waitfordeployment --forcepackagedownload --server {3} --apiKey {4} --debug --enableServiceMessages", project, target, config.BuildNumber, config.OctopusApiUrl, config.OctopusApiKey));
    });
