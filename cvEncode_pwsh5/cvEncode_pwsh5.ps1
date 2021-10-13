# ==================================================================================================
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
function cvEncode_dir {
    param (
        [Parameter(Position=0)]
        [String] $funcName,
        [Parameter(Position=1)]
        [String] $srcPath = "$pwd",
        [Parameter(Position=2)]
        [String] $dstPath,
        [Parameter(ParameterSetName = "Filter")]
        [System.Object] $Filter = @("*.*", "*.*")
    )
    $srcPath = Resolve-Path $srcPath.TrimEnd('\/')
    if (!(Test-Path $srcPath -pathtype 'Container')) {Write-Warning "srcPath is Not folder";return}
    if (!$dstPath) {$dstPath = $srcPath.Substring($srcPath.LastIndexof("\")+1)}
    if (!(Test-Path $dstPath)) {mkdir $dstPath}
    $dstPath = Resolve-Path $dstPath.TrimEnd('\/')
    if (!(Test-Path $dstPath -pathtype 'Container')) {Write-Warning "dstPath is Not folder";return}
    if ($srcPath -eq $dstPath) {Write-Warning "srcPath と dstPath 同じ";return }

    $Items = Get-ChildItem $srcPath -I $Filter -R
    foreach ($item in $Items) {
        $F1 = $item.FullName
        $F2 = $dstPath + "\" + $item.FullName.Substring($srcPath.Length+1)
        Write-Host "  From: $F1"
        Write-Host "  └─To: $F2"
        ($funcName + " '$F1' '$F2'") | Invoke-Expression
    } Write-Host "[ $funcName Done. ]"
}
# ==================================================================================================
function cvJIS2UTF_dir {
    param (
        [Parameter(Position=0)]
        [String] $srcPath = "$pwd",
        [Parameter(Position=1)]
        [String] $dstPath,
        [Parameter(ParameterSetName = "Filter")]
        [System.Object] $Filter = @("*.*", "*.*")
    )
    cvEncode_dir "cvJIS2UTF" $srcPath $dstPath -Filter $Filter
}
function cvUTF2JIS_dir {
    param (
        [Parameter(Position=0)]
        [String] $srcPath = "$pwd",
        [Parameter(Position=1)]
        [String] $dstPath,
        [Parameter(ParameterSetName = "Filter")]
        [System.Object] $Filter = @("*.*", "*.*")
    )
    cvEncode_dir "cvUTF2JIS" $srcPath $dstPath -Filter $Filter
}
# ==================================================================================================
function Test {
    cvJIS2UTF "JIS.md" "out.md"
    cvUTF2JIS "out.md" "out2.md"
    cvJIS2UTF_dir "dir1" "d:/dir2/"
    cvUTF2JIS_dir "d:/dir2/"
    
    # cvJIS2UTF "out.md" "out22.md"
}
# ==================================================================================================
Test
