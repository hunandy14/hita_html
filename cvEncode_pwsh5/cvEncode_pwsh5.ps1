function cvUTF2JIS {
    param (
        $scrPath,
        $dstPath
    )
    $Content = Get-Content $scrPath -Encoding UTF8
    $UTF8NoBomEnc = New-Object System.Text.UTF8Encoding $False
    New-Item -ItemType File -Path $dstPath -Force | Out-Null
    [System.IO.File]::WriteAllLines($dstPath, $Content, $UTF8NoBomEnc)
}
# cvUTF2JIS .\UTF8.md .\out.md

function cvJIS2UTF {
    param (
        $scrPath,
        $dstPath
    )
    $Content = Get-Content $scrPath -Encoding Default
    New-Item -ItemType File -Path $dstPath -Force | Out-Null
    Write-Output $Content | Out-File $dstPath -Encoding default
}
# cvJIS2UTF .\JIS.md .\out2.md
