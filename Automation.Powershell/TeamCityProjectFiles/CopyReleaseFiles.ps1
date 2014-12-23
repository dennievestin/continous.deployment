$projectFolder = "ProjectName.WebRoot.Web"
$source = "..\Development"
$destination = "ReleaseFiles"

if(!(Test-Path -Path $destination )){
    New-Item -ItemType directory -Path $destination
}
Remove-Item $destination\* -Recurse

$rootIncludeWildcards = @("DeployTo*.bat")

$generalIncludeWildcards = @("*.asax", "*.aspx", "*.ascx", "*.browser", "*.cshtml", "*.css", `
							 "*.config", "*.dll", "*.eot", "*.gif", "*.html", "*.htm", "*.ico", `
							 "*.jpg", "*.js", "*.json", "*.nupkg", "*.nuspec", "*.png", "*.svc", `
							 "*.svg", "*.ttf", "*.txt", "*.woff", "*.xml", "*.zip", "*.sass")

$toolsIncludeWildcards = @("*.exe", "*.ps1")
$settingsIncludeWildcards = @("*.xml", "*.ps1")

$includes = @(@(".", $rootIncludeWildcards), `
			  @("AppData", $generalIncludeWildcards), `
			  @("Settings", $settingsIncludeWildcards), `
			  @("Tools", $toolsIncludeWildcards), `
			  @($projectFolder, $generalIncludeWildcards))

$excludeDirectories = @("blobs", "obj")
$excludeFiles = @("License.config")


foreach($include in $includes) {
	$dir = $include[0]
	$wildcards = $include[1]
	robocopy $source\$dir $destination\$dir $wildcards /xd $excludeDirectories /xf $excludeFiles /s
}