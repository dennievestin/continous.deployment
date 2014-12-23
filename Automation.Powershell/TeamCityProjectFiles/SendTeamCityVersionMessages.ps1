$git_version = (git describe --tags --long --match ?.?.? | Select-String -pattern '(?<major>[0-9]+)\.(?<minor>[0-9]+).(?<patch>[0-9]+)-(?<commitCount>[0-9]+)-(?<hash>[a-z0-9]+)').Matches[0].Groups
 
$git_describe = $git_version[0].Value

$majorVersion = $git_version['major']
$minorVersion = $git_version['minor']
$patchVersion = $git_version['patch']
$commitCount = $git_version['commitCount']
$commitCountWithLeadingZeros = "{0:D3}" -f [int]"$commitCount"

$version = [string]::Join('.', @(
  $majorVersion,
  $minorVersion,
  $patchVersion
))

Write-Host "##teamcity[setParameter name='MajorVersion' value='$majorVersion']"
Write-Host "##teamcity[setParameter name='MinorVersion' value='$minorVersion']"
Write-Host "##teamcity[setParameter name='PatchVersion' value='$patchVersion']"
Write-Host "##teamcity[setParameter name='CommitCount' value='$commitCount']"
Write-Host "##teamcity[setParameter name='CommitCountWithLeadingZeros' value='$commitCountWithLeadingZeros']"
Write-Host "##teamcity[buildNumber '$version+$commitCountWithLeadingZeros']"