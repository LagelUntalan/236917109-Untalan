@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Select a Windows utility:
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
set /p utility=Enter your choice (1-8): 

if %utility%==1 goto ipconfig
if %utility%==2 goto tasklist
if %utility%==3 goto taskkill
if %utility%==4 goto chkdsk
if %utility%==5 goto format
if %utility%==6 goto defrag
if %utility%==7 goto find
if %utility%==8 goto attrib
echo Invalid choice. Please enter a number between 1 and 8.
pause
goto menu

:ipconfig
ipconfig
goto end

:tasklist
tasklist
goto end

:taskkill
set /p pid=Enter the PID to kill: 
if "%pid%"=="" (
    echo PID cannot be empty.
    pause
    goto menu
)
taskkill /PID %pid%
if %errorlevel% neq 0 (
    echo Failed to kill the process. Make sure the PID is correct and you have the necessary permissions.
)
goto end

:chkdsk
set /p drive=Enter the drive letter (e.g., C:): 
if "%drive%"=="" (
    echo Drive letter cannot be empty.
    pause
    goto menu
)
chkdsk %drive%
if %errorlevel% neq 0 (
    echo Failed to check the disk. Make sure the drive letter is correct.
)
goto end

:format
set /p drive=Enter the drive letter to format (e.g., D:): 
if "%drive%"=="" (
    echo Drive letter cannot be empty.
    pause
    goto menu
)
echo WARNING: Formatting will erase all data on the drive %drive%
set /p confirm=Are you sure you want to format the drive %drive%? (y/n): 
if /i "%confirm%" neq "y" (
    echo Format cancelled.
    pause
    goto menu
)
format %drive%
if %errorlevel% neq 0 (
    echo Failed to format the drive. Make sure the drive letter is correct and you have the necessary permissions.
)
goto end

:defrag
set /p drive=Enter the drive letter to defrag (e.g., C:): 
if "%drive%"=="" (
    echo Drive letter cannot be empty.
    pause
    goto menu
)
defrag %drive%
if %errorlevel% neq 0 (
    echo Failed to defrag the drive. Make sure the drive letter is correct.
)
goto end

:find
set /p search=Enter the search string: 
if "%search%"=="" (
    echo Search string cannot be empty.
    pause
    goto menu
)
set /p file=Enter the file to search in: 
if "%file%"=="" (
    echo File cannot be empty.
    pause
    goto menu
)
find "%search%" %file%
if %errorlevel% neq 0 (
    echo Failed to find the string in the file. Make sure the file exists and the search string is correct.
)
goto end

:attrib
set /p file=Enter the file to change attributes: 
if "%file%"=="" (
    echo File cannot be empty.
    pause
    goto menu
)
attrib %file%
if %errorlevel% neq 0 (
    echo Failed to change attributes. Make sure the file exists.
)
goto end

:end
echo Script complete.
pause
