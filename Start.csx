Require<Shovel>();

"Install"
    .DependsOn("Tests")
    .RunProgram(shell =>
    {
      shell.Executable = "Powershell.exe";
      shell.Arguments(Path.Combine(Environment.CurrentDirectory, "build.ps1"));
    });
"RunTests"
    .RunProgram(shell =>
    {
      shell.Executable = "Powershell.exe";
      shell.Arguments(Path.Combine(Environment.CurrentDirectory, "tests.ps1"));
    });