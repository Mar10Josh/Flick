@echo off
echo Creation Stage
title Flick - Creation
set /P ver="What version is this?"
echo Starting when key pressed
pause > nul
echo Now using "pyinstaller" to make
pyinstaller --icon win.ico -n "Flick v.1.0.1" --onefile main.py
pyinstaller --icon win.ico -n "Flick v.1.0.1 No Example" --onefile no_example.py
title Attention: Go to mac, waiting - Flick
echo Flick is done with %ver%. Waiting for Flick creation to finish on mac.
echo Press any key when done on both systems...
pause > nul
