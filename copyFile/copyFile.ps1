[CmdletBinding()]
Param(
    [Parameter(Position=0)]
    [String]$srcPath,
    [Parameter(Position=1)]
    [String]$dstPath, 
    [Parameter(ParameterSetName = "Filter")]
    [System.Object]$Filter
)
# ==================================================================================================
function copy_dir {
    param (
        [Parameter(Position=0)]
        [String] $srcPath = "$pwd",
        [Parameter(Position=1)]
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

        New-Item -ItemType File -Path $F2 -Force | Out-Null
        Copy-Item $F1 $F2
    } Write-Host "[ $funcName Done. ]"
}

function Test() {
    $list = @(
        "DMBT0013.java",
        "DMBT0010.java",
        "DMBT0011.java",
        "DMBT0012.java",
        "DMBT0020.java",
        "DMBT0021.java",
        "DMBT0032.java"
    )
    copy_dir "D:\blcbatch_project" "D:\Output\blcbatch_project" -Filter $list
}
Test
