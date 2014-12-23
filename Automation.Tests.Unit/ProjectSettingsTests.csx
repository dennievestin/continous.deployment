using TestStack.BDDfy.Core;
Require<NUnitRunner>();

[TestFixture]
[Story(
        Title ="Your-project-name settings tests",
        AsA = "As a developer",
        IWant = "I want to have correct project/environment settings",
        SoThat = "So that I can rely on automation")]
public class ProjectSettingsTests {
    private SettingValues settingValues;

    public void WhenThereIsASettingsFile(){
        settingValues = new SettingValues();
        Assert.IsNotNull(settingValues);
    }

    public void ThenTheValuesShouldBeMatching() {
        Assert.AreEqual(settingValues.SolutionFile, "ProjectName.sln");
        Assert.AreEqual(settingValues.ProjectFile,  @"ProjectName.Web\ProjectName.csproj");
        Assert.AreEqual(settingValues.UiDirectory, string.Format("{0}\\ProjectName.Web\\ui", ""));
        Assert.AreEqual(settingValues.OctopusApiUrl, "http://sto-stosbuild02/octopus");
        Assert.AreEqual(settingValues.OctopusApiKey, "SOME-API-KEY");
        Assert.AreEqual(settingValues.OctopackFileShareNightly, "E:\\OctopusReleases\\ProjectName\\Packages\\Nightly");
        Assert.AreEqual(settingValues.OctopackFileShareRelease, "E:\\OctopusReleases\\ProjectName\\Packages\\Release");
    }

    [Test]
    public void Execute() {
        this.BDDfy();
    }
}
