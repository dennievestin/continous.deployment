public class SettingValues {
    public string ProjectName { get; set; }
    public string SolutionFile { get; set; }
    public string ProjectFile { get; set; }
    public string BuildNumber { get; set; }
    public string UiDirectory { get; set; }
    public string DeploymentHistoryPath { get; set; }
    public string ToolsPath { get; set; }
    public string OctopusApiUrl { get; set; }
    public string OctopusApiKey { get; set; }
    public string OctopackFileShareNightly { get; set; }
    public string OctopackFileShareRelease { get; set; }
    public string NugetPackageTargetpath { get; set; }

    public SettingValues(){
        ProjectName = Environment.GetEnvironmentVariable("teamcity_project_name");
        SolutionFile = "ProjectName.sln";
        ProjectFile = @"ProjectName.Web\ProjectName.csproj";
        BuildNumber = Environment.GetEnvironmentVariable("build_number");
        UiDirectory = string.Format("{0}\\ProjectName.Web\\ui", BuildNumber);
        DeploymentHistoryPath = "DeploymentHistoryPath";
        ToolsPath = GetDirectoryFromParent("Tools");
        OctopackFileShareNightly = "E:\\OctopusReleases\\ProjectName\\Packages\\Nightly";
        OctopackFileShareRelease = "E:\\OctopusReleases\\ProjectName\\Packages\\Release";
        OctopusApiUrl = "http://sto-stosbuild02/octopus";
        OctopusApiKey = "SOME-API-KEY";
        NugetPackageTargetpath = "";
    }

    private string GetDirectoryFromParent(string subdirectory){
        return Path.Combine(Directory.GetParent(Environment.CurrentDirectory).FullName, subdirectory);
    }
}
