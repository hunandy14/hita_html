$ct = "_Init_"
$ct1 = "_Init_"

# 完成版
$ct = (Get-Content 'WFWA0020.js')

$ct_dst = $ct -match '(?<=\").*?(?=\")' -match '\|\|'
$ct1 = $ct_dst -replace '\|\|', '\|\|' -replace '\+', '\+'
$ct2 = $ct_dst -replace '\|\|', '+'

$ct1 > out_1.js
$ct2 > out_2.js

# $ct1
for ($i = 0; $i -lt $ct1.Count; $i++) {
    $ct = $ct -replace $ct1[$i], $ct2[$i]
} $ct_out = $ct

# $ct_out > out.js
