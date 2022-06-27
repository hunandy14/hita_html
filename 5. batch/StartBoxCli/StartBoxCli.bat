Set BoxPath=.\
Set WorkPath=$([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop))
Set Msg=$(box --version)`n

Set Cmd1=$_=[System.IO.Path]::GetFullPath('%BoxPath%')+'bin\box.cmd'; Set-Alias box $_
start cmd /c PowerShell.exe -NoExit "%Cmd1%; Write-Host %Msg% -Fore:Y; $s='%WorkPath%'; if($s[0] -eq '$'){Set-Location ($s|iex)}else{Set-Location $s};"
