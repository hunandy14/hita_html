echo off
@REM pwsh -Command "& {.\cvEncode_pwsh5.ps1 'cvUTF2JIS_dir' 'PATH1' 'PATH2'}"

SET funcName[0]=cvJIS2UTF
SET funcName[1]=cvUTF2JIS
SET funcName[2]=cvJIS2UTF_dir
SET funcName[3]=cvUTF2JIS_dir


SET funcp=%funcName[2]%
SET srcPath=D:\Users\71856726\OneDrive - Hitachi Group\HitachiXPC\Desktop\ap\gitRepo\hita_html
SET dstPath=
SET srcFile=JIS.md
SET dstFile=



@REM SET parm='%funcName[2]%' '%srcPath%' '%dstPath%'
SET parm='%funcName[2]%' '%srcPath%' '%dstPath%' -Filter *.md

@REM SET parm='%funcName[2]%' '%srcPath%' '%dstPath%'
@REM SET parm='%funcName[2]%' '%srcPath%' '%dstPath%'

@REM echo %parm%
POWERSHELL -Command "& {.\cvEncode_pwsh5.ps1 %parm%}"
