try{
    $stepName = $OctopusParameters["Octopus.Step.Name"]
    $webSiteName = $OctopusParameters["Octopus.Action[$stepName].IISWebSite.WebSiteName"]
    Write-Output "Starting IIS web site $webSiteName"
    Import-Module WebAdministration
    $webSite = Get-Item "IIS:\Sites\$webSiteName"
    $webSite.Start()
}catch{
    Write-Verbose "Unable to start web site IIS"
}