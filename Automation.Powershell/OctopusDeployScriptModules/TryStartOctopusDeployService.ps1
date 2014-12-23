$octopusService = Get-Service -computername sto-stosbuild02 'OctopusDeploy'
Write-Host "Octopus Deploy service is:" $octopusService.Status

if ($octopusService.Status -ne "Running"){
    Write-Verbose "Octopus Deploy service was stopped, trying to start."
    $octopusService.Start()
    
    if (octopusService.Status -ne "Running"){
        throw "Unable to start Octopus Deploy service."
    }
}

$octopusService = $null