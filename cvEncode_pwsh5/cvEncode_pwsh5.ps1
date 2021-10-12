function cvJIS2UTF{
    param (
        $scrPath,
        $dstPath
    )
    $Content = Get-Content $scrPath -Encoding Default
    $UTF8NoBomEnc = New-Object System.Text.UTF8Encoding $False
    New-Item -ItemType File -Path $dstPath -Force | Out-Null
    [System.IO.File]::WriteAllLines($dstPath, $Content, $UTF8NoBomEnc)
}

function cvUTF2JIS {
    param (
        $scrPath,
        $dstPath
    )
    $Content = Get-Content $scrPath -Encoding UTF8
    New-Item -ItemType File -Path $dstPath -Force | Out-Null
    Write-Output $Content | Out-File $dstPath -Encoding default
}
# cvUTF2JIS .\UTF8.md .\out.md

function getDirItem {
    param (
        [Parameter(Position=0)]
        [String] $srcPath,
        [Parameter(ParameterSetName = "Filter")]
        [System.Object] $Filter = @("*.*", "*.*")
    )
    return (cgi $srcPath -R -I $Filter).FullName
}

function cvJIS2UTF_dir {
    param (
        [Parameter(Position=0)]
        [String] $srcPath = "$pwd",
        [Parameter(Position=1)]
        [String] $dstPath = "output",
        [Parameter(ParameterSetName = "Filter")]
        [System.Object] $Filter = @("*.*", "*.*")
    )
    if (!(Test-Path $dstPath)) {mkdir $dstPath}
    $srcPath = Resolve-Path $srcPath.TrimEnd('\/')
    $dstPath = Resolve-Path $dstPath.TrimEnd('\/')
    $Items = Get-ChildItem $srcPath -I $Filter -R
    foreach ($item in $Items) {
        $F1 = $item.FullName
        $F2 = $dstPath + "\" + $item.FullName.Substring($srcPath.Length+1)
        Write-Warning "  From: $F1"
        Write-Warning "  └─To: $F2"
        cvJIS2UTF $F1 $F2
    }
    Write-Warning "# Finish # [UTF -> JIS]"
}
function cvUTF2JIS_dir {
    param (
        [Parameter(Position=0)]
        [String] $srcPath = "$pwd",
        [Parameter(Position=1)]
        [String] $dstPath = "output",
        [Parameter(ParameterSetName = "Filter")]
        [System.Object] $Filter = @("*.*", "*.*")
    )
    if (!(Test-Path $dstPath)) {mkdir $dstPath}
    $srcPath = Resolve-Path $srcPath.TrimEnd('\/')
    $dstPath = Resolve-Path $dstPath.TrimEnd('\/')
    $srcPath
    $Items = Get-ChildItem $srcPath -I $Filter -R
    foreach ($item in $Items) {
        $F1 = $item.FullName
        $F2 = $dstPath + "\" + $item.FullName.Substring($srcPath.Length+1)
        Write-Warning "  From: $F1"
        Write-Warning "  └─To: $F2"
        cvUTF2JIS $F1 $F2
    }
    Write-Warning "# Finish # [UTF -> JIS]"
}


cvJIS2UTF "JIS.md" "out.md"
cvUTF2JIS "out.md" "out2.md"
cvJIS2UTF_dir "dir1" "d:/dir2/"
cvUTF2JIS_dir "d:/dir2/"
