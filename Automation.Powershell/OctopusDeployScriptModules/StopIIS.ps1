try{
    $stepName = $OctopusParameters["Octopus.Step.Name"]
    $webSiteName = $OctopusParameters["Octopus.Action[$stepName].IISWebSite.WebSiteName"]
    Write-Output "Stopping IIS web site $webSiteName"
    Import-Module WebAdministration
    $webSite = Get-Item "IIS:\Sites\$webSiteName"
    $webSite.Stop()
}catch{
    Write-Verbose "Unable to stop web site IIS"
}