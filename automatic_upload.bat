chcp 65001 
:: 如果路径中有中文则需要此行

:: 修改这里的路径以匹配你的实际路径

:: 获取当前日期和时间
for /f "tokens=2 delims==" %%i in ('"wmic os get localdatetime /value"') do set datetime=%%i
set date=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%
set message=Automated commit on %date% %time%

:: 执行 Git 命令并将输出保存到 output.txt
git add . >> output.txt
git commit -m "%message%" >> output.txt
git push
:: 防止窗口自动关闭
pause