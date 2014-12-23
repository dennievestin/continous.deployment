$stepName = $OctopusParameters["Octopus.Step.Name"]
$webroot = $OctopusParameters["Octopus.Action[$stepName].IISWebSite.WebRoot"]
$setting = $OctopusParameters["xml-preprocessor-target-setting"] 
$content = (Resolve-Path .\content)

Write-Host "Copy files from $content to $webroot"
& robocopy $content $webroot /S /COPYALL /IS /IT /R:0 | Write-Host

if($LastExitCode -gt 16) {
    Write-Error "Robocoby failed with exit code $LastExitCode"
    exit 1
}
if($LastExitCode -gt 8) {
    Write-Verbose "Robocoby failed copy some files with exit code $LastExitCode"
    exit 0
}
else {
    Write-Host "Robocoby exited with code $LastExitCode"
    exit 0
}
Write-Host "Source with robocopy exit codes http://ss64.com/nt/robocopy-exit.html"