function TeamCityBootstraper () {
		[CmdletBinding(DefaultParameterSetName='Step')]
		param(
				[Parameter(Mandatory=$false, ParameterSetName='Step',Position=0)]
				[int]$Step=$null,

				[Parameter(Mandatory=$false, ParameterSetName='Help')]
				[switch]$Help
		)
		Begin {
					function InstallChocolatey(){
							﻿if (-not (choco)) {
								Write-Host 'Installing chocolatey'
								iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
								Write-Host 'Restart your console and continue with next step.'
							}
					}

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
							Write-Output 'Step 1 installs chocolatey (restart console required after)'
              Write-Output 'Step 2 installs ruby, sass, nodejs.install and npm (restart console required after)'
							Write-Output 'step 3 installs grunt-cli globaly and scriptcs (restart console required after)'
							Write-Output 'step 4 installs ScriptCs.Contracts, ScriptCs.NUnit, scriptcs.shovel'
					}
		}
		Process {
				if ($Help){
						Help
				}

        if($Step -eq 1){
						InstallChocolatey
				}

				if($Step -eq 2){
						InstallGruntDependencies1
				}

				if ($Step -eq 3){
						InstallGruntDependencies2
						InstallScriptCs
				}

				if ($Step -eq 4){
						InstallScriptCsPlugins
				}

		}
}
