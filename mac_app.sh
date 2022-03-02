#!/bin/bash
echo Enter Version:
read version
echo This is Flick $version generation.
echo This will generate a new application of Flick.
if test -f "setup.py"; then
  rm setup.py
fi
py2applet main.py
python3 setup.py py2app
rm setup.py
py2applet no_example.py
python3 setup.py py2app