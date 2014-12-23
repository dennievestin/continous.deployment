scriptcs "$PSScriptRoot\Automation.Tests.Integration\Run.csx" -debug -loglevel Error 
scriptcs "$PSScriptRoot\Automation.Tests.Unit\Run.csx" -debug -loglevel Error 

Write-Host "`n------------------------------" -NoNewLine
Write-Host " Test results " -ForegroundColor White -NoNewLine
Write-Host "----------------------------------`n" -NoNewLine
Write-Host "`nIntegration Tests:`n$PSScriptRoot\Automation.Tests.Integration\BDDfy.html" -ForegroundColor Blue
Write-Host "`nUnit Tests:`n$PSScriptRoot\Automation.Tests.Unit\BDDfy.html" -ForegroundColor Blue
Write-Host "`n------------------------------------------------------------------------------`n"

Start-Process -FilePath "$PSScriptRoot\Automation.Tests.Integration\BDDfy.html"
Start-Process -FilePath "$PSScriptRoot\Automation.Tests.Unit\BDDfy.html"