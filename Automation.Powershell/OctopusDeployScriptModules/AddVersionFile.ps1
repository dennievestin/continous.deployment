$stepName = $OctopusParameters["Octopus.Step.Name"]
$webroot = $OctopusParameters["Octopus.Action[$stepName].IISWebSite.WebRoot"]

$date = Get-Date -format "M.d.yyyy HH.mm"
$version = $OctopusParameters["Octopus.Release.Number"]
$releaseLink = $OctopusParameters["Octopus.Web.ReleaseLink"]
$deploymentLink = $OctopusParameters["Octopus.Web.DeploymentLink"]

$link1 = "<a href='http://sto-stosbuild02/octopus$releaseLink'>Release info</a>"
$link2 = "<a href='http://sto-stosbuild02/octopus$deploymentLink'>Deployment info</a>"

$content = "<html><h2>Version: $version</h2><p>Datum: $date</p><p>$link1&nbsp&nbsp&nbsp$link2</p></html>"
Write-Host "$content"

Add-Content -Value $content -Path $webroot\version.htm
