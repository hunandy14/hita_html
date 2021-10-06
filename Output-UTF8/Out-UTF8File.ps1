# https://bit.ly/3mwvw92
# https://charlottehong.blogspot.com/2021/04/powershell-bom-utf-8.html

function Out-UTF8File {
    param (
        $Content,
        $FilePath = ((Get-Location).Path+"\utf8.txt")
    )
    $UTF8NoBomEnc = New-Object System.Text.UTF8Encoding $False
    [System.IO.File]::WriteAllLines($FilePath, $Content, $UTF8NoBomEnc)
}
Out-UTF8File 'あいうえお'
