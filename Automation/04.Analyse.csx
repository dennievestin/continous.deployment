var inspectPathExe = "Tools\\inspectcode.exe";
var duplicateFinderExe = "Tools\\dupfinder.exe";
var settings = new SettingValues();

"InspectCode"
    .RunProgram(shell =>
    {
      shell.Executable = inspectPathExe;
      shell.Arguments(string.Format("{0} /output={1}\\InspectCodeReport.xml /show-text", settings.SolutionFile, settings.DeploymentHistoryPath);
    });

"DuplicateFinder"
    .RunProgram(shell =>
    {
      shell.Executable = duplicateFinderExe;
      shell.Arguments(string.Format("{0} /output={1}\\DuplicateCode.xml /show-text", settings.SolutionFile, settings.DeploymentHistoryPath);
    });

"GenerateTodos"
    .RunProgram(shell =>
    {
       shell.Executable = "powershell.exe";
       shell.Arguments(string.Format(".\\Tools\\PowershellScripts\\Get-Todos.ps1 {0} $false", settings.SolutionFile);
    });
