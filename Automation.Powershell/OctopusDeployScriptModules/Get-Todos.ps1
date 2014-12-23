function Get-Todos(){
    [CmdletBinding(DefaultParameterSetName='SolutionFile')]
    param(
        # Physical path of solution file to use
        [Parameter(Mandatory=$false, ParameterSetName='SolutionFile')]
		[AllowNull()]
        [string]$SolutionFile=$null,

        # 1/0 for generating md-file
        [bool]$CreateMD=$false
    )
	
    Begin {
    function Get-FoldersFromSolution(){
		    param(
			    [string]$solution
		    )
		    $projectPaths = New-Object System.Collections.ArrayList
		
		    if ($solution -ne $null){
			    $solutionDirectory = (Get-Item $solution).Directory.FullName
			    $projects = Get-Content $solution |
			      Select-String 'Project\(' |
			        ForEach-Object {
			          $projectParts = $_ -Split '[,=]' | ForEach-Object { $_.Trim('[ "{}]') };
				  
				      $p = Join-Path -Path $solutionDirectory -ChildPath $projectParts[1]
				      if (Test-Path $p){
			      	    $projectPaths.Add($p)
				      }
			        }
		    } 
		    return $projectPaths
	    }
	
        function Append-Todos(){
            param(
                [Parameter(Mandatory=$true)][System.Text.StringBuilder][ref]$stringBuilder,
			    [Parameter(Mandatory=$true)][string]$searchPath
            )
            $Include = @('*.cs','*.js','*.html')
            $Exclude = @('packages','appdata','bin','obj')
            $path = Get-ChildItem -Recurse -Include $Include -Exclude $Exclude -Path $searchPath

            $todos = $path | 
	            % { select-string $_ -pattern 'TODO:' } |
	            select-object LineNumber, Path, FileName, Line;
			
		    if ($todos -ne $null){
			    $stringBuilder.AppendLine() | Out-Null
	            $stringBuilder.AppendLine(('## {0} ##' -f (Get-Item $searchPath).Name)) | Out-Null
	            $stringBuilder.AppendLine() | Out-Null
	            foreach ($todo in $todos){
	                $lineOne = ('File: [{1}]({0}) LineNumber {2}' -f $todo.Path, $todo.FileName, $todo.LineNumber)
	                $lineTwo = ('<pre>{0}</pre>' -f $todo.Line.Trim().Replace('//',''))
	                $stringBuilder.Append($lineOne) | Out-Null
	                $stringBuilder.Append($lineTwo) | Out-Null
	                Write-Host ('File: {0} LineNumber {1} {2}' -f $todo.FileName, $todo.LineNumber, $todo.Line.Trim().Replace('//',''))
	            }
		    }
        }
    }
    Process {
        [System.Text.StringBuilder]$stringBuilder = New-Object System.Text.StringBuilder 
	
	    if ($SolutionFile -eq ''){
		    $SolutionFile = ls -in *.sln -r | select -first 1
	    }
    
        if ($SolutionFile -eq ''){
		    Write-Host ('Hittar ingen solution-fil') -ForegroundColor Red
		    return
	    }
		
	    $heading = ('# {0} TODOS #' -f (Get-Item $SolutionFile).Name.Replace('.sln',''))
	    $stringBuilder.AppendLine($heading) | Out-Null
	    Write-Host $heading
	
	    $folders = Get-FoldersFromSolution($SolutionFile)
	    foreach ($folder in $folders){
		    Append-Todos $stringBuilder $folder
	    }
	
        if ($CreateMD){
		    Function Get-FileName(){
			    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

			    $SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
			    $SaveFileDialog.initialDirectory = (Get-Location)
			    $SaveFileDialog.filter = 'Text files (*.md)|*.md|All files (*.*)|*.*”'
			    $SaveFileDialog.ShowDialog() | Out-Null
			    $SaveFileDialog.filename
            }
		
		    $fileName = Get-FileName
            Out-File -FilePath $fileName -InputObject $stringBuilder.ToString() | Out-Null
            Write-Host ('Fil skapad: {0}' -f $fileName)
        }
    }
}
