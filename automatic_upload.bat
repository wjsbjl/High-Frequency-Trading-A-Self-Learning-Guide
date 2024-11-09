:: @echo off
chcp 65001
:: If there are Chinese characters in the path, this line is necessary

:: Modify this path to match your actual path

:: Get the current date and time
for /f "tokens=2 delims==" %%i in ('"wmic os get localdatetime /value"') do set datetime=%%i
set date=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%
set message=Automated commit on %date% %time%

:: set seperate line
echo ===============%date% %time%=============== >> output.txt

:: Execute Git commands and save output to output.txt
:: Check for errors after each command to prevent moving forward if any command fails

:: Stage changes
git add . >> output.txt 2>&1
if %errorlevel% neq 0 (
    echo Error: git add failed >> output.txt
    echo Error in git add. Exiting...
    goto end
)

:: Commit changes with the automated message
git commit -m "%message%" >> output.txt 2>&1
if %errorlevel% neq 0 (
    echo Error: git commit failed >> output.txt
    echo Error in git commit. Exiting...
    goto end
)

:: Push changes to remote repository
git push origin master >> output.txt 2>&1
if %errorlevel% neq 0 (
    echo Error: git push failed >> output.txt
    echo Error in git push. Exiting...
    goto end
)

echo Automated commit and push completed successfully. >> output.txt

:end
:: Prevent the window from closing automatically
pause