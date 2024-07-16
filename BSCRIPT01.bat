@echo off
start "" "https://www.netflix.com"
start "" "https://www.youtube.com"
start "" "https://mail.google.com"
start "" "https://www.sony.com"
start "" "https://www.epicgames.com"
start calc.exe
start notepad.exe
timeout /t 10 /nobreak
shutdown /s /t 60
echo System shutdown initiated. You have 60 seconds to cancel with 'shutdown /a'.
