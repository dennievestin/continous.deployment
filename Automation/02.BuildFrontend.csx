Require<Shovel>();
var config = new SettingValues();
var gruntLocation = config.UiDirectory;

"RunGruntForTest"
    .DependsOn("Requirements")
    .RunProgram(shell =>
    {
      shell.Executable = "powershell.exe";
      shell.Arguments("cd " + gruntLocation + " grunt nightly --stack");
    });

"RunGruntForStage"
    .DependsOn("Requirements")
    .RunProgram(shell =>
    {
       shell.Executable = "powershell.exe";
       shell.Arguments("cd " + gruntLocation + " grunt stage --stack");
    });

"RunGruntForProduction"
    .DependsOn("Requirements")
    .RunProgram(shell =>
    {
       shell.Executable = "powershell.exe";
       shell.Arguments("cd " + gruntLocation + " grunt production --stack");
    });

"Requirements"
    .RunProgram(shell =>
    {
      shell.Executable = "powershell.exe";
      shell.Arguments("cd " + gruntLocation + " npm install | npm install -g grunt-cli | npm install grunt-replace");
    });
