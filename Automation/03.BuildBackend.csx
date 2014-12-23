Require<Shovel>();
var config = new SettingValues();

"BuildContinous"
	.DependsOn("SetVariables")
	.MsBuild(msb =>
		{
			msb.ArbitraryArgs("/p:Configuration=Debug");
			msb.Project = projectFile;
			msb.Targets("Clean", "Build");
			msb.NoLogo();
		});

"BuildNightly"
	.DependsOn("SetVariables")
  .MsBuild(msb =>
    {
      msb.ArbitraryArgs(string.Format("{0}, {1}, {2}, {3}", octopackVariables, octopackBuildVersion, octopackFileShareNightly));
      msb.Project = projectFile;
      msb.Targets("Clean", "Reuild");
			msb.NoLogo();
    });

"BuildRelease"
	.DependsOn("SetVariables")
	.MsBuild(msb =>
		{
			msb.ArbitraryArgs(string.Format("{0}, {1}, {2}, {3}", octopackVariables, octopackBuildVersion, octopackFileShareRelease));
			msb.Project = projectFile;
			msb.Targets("Clean", "Reuild");
			msb.NoLogo();
		});
"SetVariables"
		.Do(()=>{
				var config = new SettingValues();

				var projectFile = settings.ProjectFile;
				var octopackVariables = "/p:Configuration=Release, /p:RunOctoPack=true, /p:OctoPackEnforceAddingFiles=true";
				var octopackBuildVersion = string.Format("/p:OctopackPackageVersion={0}", config.BuildNumber);
				var octopackFileShareNightly = string.Format("/p:OctoPackPublishPackageToFileShare={0}", config.OctopackFileShareNightly);
				var octopackFileShareRelease = string.Format("/p:OctoPackPublishPackageToFileShare={0}", config.OctopackFileShareRelease);
		});
