scriptcs -install

$count = 0
Get-ChildItem "$PSScriptRoot\packages" -rec -Filter "*.dll"  | ForEach-Object {
    $inputFile = $_.FullName
    & xcopy $inputFile "$PSScriptRoot\Automation\bin\*" /D /Y | Out-Null
    & xcopy $inputFile "$PSScriptRoot\Automation.Tests.Unit\bin\*" /D /Y | Out-Null
    & xcopy $inputFile "$PSScriptRoot\Automation.Tests.Integration\bin\*" /D /Y | Out-Null
    $count++
}
Write-Host "Done. $count files copied."


# Visual Studio Build events
#if $(ConfigurationName) == Release powershell.exe -Command $(ProjectDir)\build.ps1
#if $(ConfigurationName) == Release powershell.exe -Command $(ProjectDir)\tests.ps1