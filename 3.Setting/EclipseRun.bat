@echo off
Title JAVA_PATH By Charlotte.HonG& Color 1A

set appPATH=%~dp0jdk-18\bin;
powershell -Command "&{$env:path = $env:path+';%appPATH%'; .\eclipse.exe}"

exit