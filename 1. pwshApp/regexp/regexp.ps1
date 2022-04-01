[CmdletBinding()]
Param(
    $srcPath,
    $dstPath
)

if (!$srcPath) {$srcPath = ".\js\WFWD0200.js"}
if (!$dstPath) {
    $dstPath = "zOut\$srcPath"
    New-Item -ItemType File -Path $dstPath -Force | Out-Null
}
# ==============================================================================
$ct = (Get-Content $srcPath)

$ct_dst = $ct -match '(?<=\").*?(?=\")' -match '\|\|'

$ct1 = $ct_dst -replace '\|\|', '\|\|' `
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

$ct2 = $ct_dst -replace '\|\|', '+'

# $ct1 > "zOut\out_1.js"
# $ct2 > "zOut\out_2.js"

for ($i = 0; $i -lt $ct1.Count; $i++) {
    $ct = $ct -replace $ct1[$i], $ct2[$i]
} $ct_out = $ct



$ct2
$ct_out | Out-File $dstPath -Encoding default
# ==============================================================================
