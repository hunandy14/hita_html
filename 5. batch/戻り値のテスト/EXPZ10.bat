@echo off
 
rem コマンドプロンプト画面へのメッセージの出力
echo ここは子バッチの中です。

@REM call EXPZ10\0.bat
call EXPZ10\1.bat
@REM echo %errorlevel%


rem 処理を終了する
@REM exit

if %errorlevel%==0 (
    echo "[%errorlevel%]::処理成功"
) else (
    echo "[%errorlevel%]::処理失敗"
)

exit /b