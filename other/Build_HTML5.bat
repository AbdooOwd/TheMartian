@echo off
echo Building -HTML5-
cd ..
lime build html5 -release
echo Done
pause
pwd
explorer.exe export\html5\bin