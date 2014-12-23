function BackEndLocalBootstrapper () {
    [CmdletBinding(DefaultParameterSetName='Step')]
    param(
        [Parameter(Mandatory=$false, ParameterSetName='Step',Position=0)]
        [int]$Step=$null,

        [Parameter(Mandatory=$false, ParameterSetName='Help')]
        [switch]$Help
    )
    Begin {
          function InstallScriptCs(){
              # install scriptcs
              # exec scripts with: scriptcs csharpfile.csx
              try{
                  if (-not(scriptcs)){
                      cinst scriptcs
                  }
              } catch{
                  cinst scriptcs
                  Write-Host 'Restart your console and continue with next step.'
              }
          }

          function InstallScriptCsPlugins(){
              scriptcs -install ScriptCs.Contracts
              scriptcs -install ScriptCs.NUnit
              scriptcs -install ScriptCs.Shovel
              scriptcs -install ScriptCs.BDDfy
              scriptcs -install ConfigR
              scriptcs -install Octopus.Client
          }

          function Help(){
              Write-Output 'step 1 installs ScriptCs (restart console required after)'
              Write-Output 'step 2 installs ScriptCs.Contracts, ScriptCs.NUnit, ScriptCs.Shovel, ScriptCs.BDDfy, ConfigR, Octopus.Client'
          }
    }
    Process {
        if ($Help){
            Help
        }

        if ($Step -eq 1){
            InstallScriptCs
        }

        if ($Step -eq 2){
            InstallScriptCsPlugins
        }

    }
}
