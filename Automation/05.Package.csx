Require<Shovel>();
Require<OctopusClient>();

var settings = new SettingValues();

"CleanUp"
			.RunProgram(shell =>
			{
				shell.Executable = "powershell.exe";
				shell.Arguments("Tools\\PowershellScripts\\CopyReleaseFiles.ps1");
			});

"NugetPack"
		.DependsOn("CleanUp")
		.NuGet().Pack(p =>
		{
			p.NuSpec = settings.NuspecFile;
			p.OutputDirectory = settings.NugetPackageTargetpath;
		});

"OctoPack"
		.DependsOn("CleanUp")
		.RunProgram(shell =>
		{
			target = "Test";
			shell.Executable = "Tools\\octo.exe";
			shell.Arguments(string.Format("pack --id {0} --version {1}", settings.ProjectName, settings.BuildNumber));
		});
