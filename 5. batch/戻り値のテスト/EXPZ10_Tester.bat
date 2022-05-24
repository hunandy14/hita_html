@echo off

rem コマンドプロンプト画面へのメッセージの出力
echo ここは親バッチの中です。

rem 子バッチの呼び出し
call EXPZ10.bat

rem コマンドプロンプト画面へのメッセージの出力
echo 親バッチの中へ帰ってきました。%errorlevel%

