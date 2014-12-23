function FrontEndLocalBootstrapper () {
    [CmdletBinding(DefaultParameterSetName='Step')]
    param(
        [Parameter(Mandatory=$false, ParameterSetName='Step',Position=0)]
        [int]$Step=$null,

        [Parameter(Mandatory=$false, ParameterSetName='Help')]
        [switch]$Help
    )
    Begin {
          function InstallGruntDependencies1(){
              # install applications
              cinst ruby
              cinst sass
              cinst nodejs.install
              cinst npm
              Write-Host 'Restart your console and continue with next step.'
          }

          function InstallGruntDependencies2(){
              npm install -g grunt-cli
          }

          function Help(){
              Write-Output 'Step 1 installs ruby, sass, nodejs.install and npm (restart console required after)'
              Write-Output 'step 2 installs grunt-cli globaly'
          }
    }
    Process {
        if ($Help){
            Help
        }

        if($Step -eq 1){
            InstallGruntDependencies1
        }

        if ($Step -eq 2){
            InstallGruntDependencies2
        }
    }
}
