echo off
::関数
SET funcName[0]=cvJIS2UTF
SET funcName[1]=cvUTF2JIS
SET funcName[2]=cvJIS2UTF_dir
SET funcName[3]=cvUTF2JIS_dir
::設定値
SET srcPath=D:\Users\71856726\OneDrive - Hitachi Group\HitachiXPC\Desktop\ap\gitRepo\hita_html
SET dstPath=OUTPUT
SET srcFile=JIS.md
SET dstFile=OUTPUT.md


::使いの例
@REM SET parm=%funcName[0]% '%srcFile%' '%dstFile%'
@REM SET parm=%funcName[2]% '%srcPath%' -Filter *.md
@REM SET parm=%funcName[2]% '%srcPath%' '%dstPath%'
@REM SET parm=%funcName[2]% '%srcPath%' '%dstPath%' -Filter *.md


::プログラム開始
:: echo %parm%
POWERSHELL -Command "& {.\cvEncode_pwsh5.ps1 %parm%}"
