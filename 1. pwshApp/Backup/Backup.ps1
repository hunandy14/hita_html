####################################################################################################
function Remove2Recycle($FileName) {
    $shell = new-object -comobject "Shell.Application" 
    $item = $shell.Namespace(0).ParseName("$FileName") 
    $item.InvokeVerb("delete") 
}
function SetPath($addPath) {
    $env:path = "$env:path;" + $addPath
}
####################################################################################################
$vsPath = "D:\Users\71856726\OneDrive - Hitachi Group\HitachiXPC\Desktop\ap\VSCode"
$vsCache = @(
    # "data\user-data\Cache",
    "data\user-data\CachedData",
    "data\user-data\CachedExtensions",
    "data\user-data\Service Worker\CacheStorage"
) 

# set 7z
$7zPath = "C:\Program Files\7-Zip;"
SetPath $7zPath
# Delete Cache
# foreach ($item in $vsCache) {Remove2Recycle "$vsPath\$item"}
# 7z

$srcFile="D:\Users\71856726\OneDrive - Hitachi Group\HitachiXPC\Desktop\Test\*"
$dstFile="D:\ap1018.7z"
7z a $dstFile $srcFile -t7z -mx=9 -md=384m -mfb=273
####################################################################################################


