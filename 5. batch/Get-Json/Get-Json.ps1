$PSBaseName = split-path $MyInvocation.MyCommand.Name -LeafBase
$Param = (Get-Content 'parameter.json'|ConvertFrom-Json).$PSBaseName
$csv = Import-Csv $Param.InputFile
$csv
