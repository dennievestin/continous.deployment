$tentacleService = get-service -computername sto-stos42.co.int "OctopusDeploy Tentacle"
Write-Host "Tentacle service is:" $tentacleService.Status

if ($tentacleService.Status -ne "Running"){
    Write-Verbose "Tentacle service was stopped, trying to start."
    
    $tentacleService.Start()
    
    if (tentacleService.Status -ne "Running"){
        throw "Unable to start tentacle service."
    }
}

$tentacleService = $null