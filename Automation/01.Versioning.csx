Require<Shovel>();

"GetVersion"
    .RunProgram(shell =>
    {
      shell.Executable = "powershell.exe";
      shell.Arguments("SendTeamCityVersionMessages.ps1");
    });
