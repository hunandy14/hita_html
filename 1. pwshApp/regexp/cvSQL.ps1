[CmdletBinding()]
Param(
    $srcPath,
    $dstPath
)

if (!$srcPath) {$srcPath = "src\jp\co\Hitachi\soft\blc\dmbt\DMBT0020.java"}
if (!$dstPath) {
    $dstPath = "zOut/$srcPath"
    New-Item -ItemType File -Path $dstPath -Force | Out-Null
}
# ==============================================================================

$str1='LENGTH\('
$str2='LEN('

$ct = (Get-Content $srcPath)
$ct_dst = $ct -match '(?<=\").*?(?=\")' -match $str1 -notmatch '""'

$ct_dst


$ct1 = $ct_dst -replace '\|', '\|' `
            -replace '\(', '\(' `
            -replace '\)', '\)' `
            -replace '\[', '\[' `
            -replace '\]', '\]' `
            -replace '\{', '\}' `
            -replace '\{', '\}' `
            -replace '\+', '\+' `
            -replace '\-', '\-' `
            -replace '\*', '\*' `
            -replace '\/', '\/'

$ct2 = $ct_dst -replace $str1, $str2

$ct_dst > "zOut\out_1.js"
$ct2 > "zOut\out_2.js"

for ($i = 0; $i -lt $ct1.Count; $i++) {
    $ct = $ct -replace $ct1[$i], $ct2[$i]
} $ct_out = $ct



# $ct2
$ct_out | Out-File $dstPath -Encoding default
# ==============================================================================
