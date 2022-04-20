@echo off
echo Building -Windows-
cd ..
lime build windows
echo Done
pause
pwd
explorer.exe export\windows\bin