function TransformConfigurations() {
    [CmdletBinding()]
    param(            
        [Parameter(Mandatory=$true)]
        [string]$setting,
        [Parameter(Mandatory=$true)]
        [string]$path
    )  

    try{
        $settingXml = (Resolve-Path .\settings\Settings.xml)
        $exe = (Resolve-Path .\tools\XmlPreprocess.exe)
        Write-Host "Transforming configs on $path"

        Get-ChildItem $path -rec -Filter "*.config"  | ForEach-Object {
            $inputFile = $_.FullName
            &"$exe" /i:$inputFile /x $settingXml /e $setting | Write-Output
            Write-Host "Config file: $inputFile"
        }
    }catch{
        $errorMessage = $_.Exception.Message
        $failedItem = $_.Exception.ItemName

        Write-Host "Error while running xml preprocessor $errorMessage $failedItem"
        Break
    }
}