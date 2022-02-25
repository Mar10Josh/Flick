@echo off
echo Creation - Flick
title Flick - Creation
echo Starting when key pressed
pause > nul
echo Now using "pyinstaller" to make
pyinstaller --osx-bundle-identifier josiah.apps.flick -n "Flick v.1.0.1" 