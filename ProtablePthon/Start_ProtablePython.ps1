$path=$PSScriptRoot

$bin=$path+"\Portable Python-3.9.4 x64\App\Python"
$env:path= $env:path+";$bin;"

$bin2=$path+"\Portable Python-3.9.4 x64\App\Python\Scripts"
$env:path= $env:path+";$bin2;"
