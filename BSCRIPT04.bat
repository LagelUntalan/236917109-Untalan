@echo off
setlocal enabledelayedexpansion

:sort_by_date
echo Sorting text files on Drive C: by date...
for /f "tokens=*" %%a in ('dir C:\*.txt /b /a-d /o-d') do (
    echo %%a
)
echo.

:archive
set /p days=Enter the number of days to archive files older than: 
set archiveDir=C:\ArchivedTextFiles
if not exist %archiveDir% (
    mkdir %archiveDir%
)
echo Archiving files older than %days% days to %archiveDir%...
forfiles /p C:\ /s /m *.txt /d -%days% /c "cmd /c move @file %archiveDir%"
echo.

:sort_by_size
echo Sorting archived files on %archiveDir% by size...
for /f "tokens=*" %%a in ('dir %archiveDir%\*.txt /b /o-s') do (
    echo %%a
)
echo.

:delete_files
set /p delete=Do you want to delete the old, large files in the archive? (y/n): 
if /i "%delete%"=="y" (
    echo Deleting old, large files in the archive...
    for /f "tokens=*" %%a in ('dir %archiveDir%\*.txt /b /o-s') do (
        del "%archiveDir%\%%a"
    )
    echo Files deleted.
) else (
    echo Deletion cancelled.
)
goto end

:end
echo Script complete.
pause
