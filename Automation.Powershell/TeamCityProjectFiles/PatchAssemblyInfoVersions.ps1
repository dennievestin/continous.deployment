Param(
	[string]$path,
	[string]$major,
	[string]$minor,
	[string]$patch,
	[string]$commitCount
)

function Update-SourceVersion {

	$assemblyVersion = 'AssemblyVersion("' + $major + "." + $minor + "." + $patch + '.0")';
	$assemblyFileVersion = 'AssemblyFileVersion("' + $major + "." + $minor + "." + $patch + "." + $commitCount + '")';
	$assemblyInformationalVersion = 'AssemblyInformationalVersion("' + $major + "." + $minor + "." + $patch + '")';

	echo $assemblyVersion
	echo $assemblyFileVersion
	echo $assemblyInformationalVersion

	foreach ($o in $input) {
		Write-Host "Updating '$($o.FullName)'"

		$assemblyVersionPattern = 'AssemblyVersion\("[0-9]+(\.([0-9]+|\*)){1,3}"\)'
		$assemblyFileVersionPattern = 'AssemblyFileVersion\("[0-9]+(\.([0-9]+|\*)){1,3}"\)'
		$assemblyInformationalVersionPattern = 'AssemblyInformationalVersion\("[0-9]+(\.([0-9]+|\*)){1,3}"\)'
		(Get-Content $o.FullName) | ForEach-Object {
			% {$_ -replace $assemblyVersionPattern, $assemblyVersion } |
			% {$_ -replace $assemblyFileVersionPattern, $assemblyFileVersion } |
			% {$_ -replace $assemblyInformationalVersionPattern, $assemblyInformationalVersion }
		} | Out-File $o.FullName -encoding UTF8 -force
	}
}

function Update-AllAssemblyInfoFiles {
	Write-Host "Searching '$path'"
	foreach ($file in "SharedAssemblyInfo.cs") {
		Get-ChildItem $path -recurse |? {$_.Name -eq $file} | Update-SourceVersion;
	}
}

Update-AllAssemblyInfoFiles
