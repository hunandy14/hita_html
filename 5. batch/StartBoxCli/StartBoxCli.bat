Set BoxPath=.\
Set WorkPath=[Environment]::GetFolderPath('Desktop')
Set Msg=$(box --version)`n

Set Cmd1=$_=[System.IO.Path]::GetFullPath('%BoxPath%')+'bin\box.cmd'; Set-Alias box $_
start cmd /c PowerShell.exe -NoExit "%Cmd1%; Write-Host %Msg% -Fore:Y; Set-Location $(%WorkPath%);"
