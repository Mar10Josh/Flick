@echo off
setlocal
title Flick MetaData Test
echo Variable MetaData Test
echo Test for BAT Parser
echo When you reach Variable Name prompt you can enter quit to stop.
echo Use the normal syntaxing of variable assigning.
echo USING THE DOUBLE QUOTES IS NOT SUPPORTED IN THIS BATCH PARSER. USE THE SINGLE QUOTE INSTEAD.
REM -> if you are viewing this file from another OS please run cp_variable_metadata.py
: makevar
set /P name="Variable Name: "
if "%name%"=="quit" (
    echo You are quitting, are you sure? (Press any key)
    pause > nul
    exit /B
)
set /P contents="Contents: "
call :strlen res contents
if %contents:~1,1% == "'"  (
   echo "{type: string; content: %contents%; name: %name%;}"
)

goto :makevar

REM -> Because it loops, there is no need to exit.
:strlen <resultVar> <stringVar>
(   
    setlocal EnableDelayedExpansion
    (set^ tmp=!%~2!)
    if defined tmp (
        set "len=1"
        for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
            if "!tmp:~%%P,1!" NEQ "" ( 
                set /a "len+=%%P"
                set "tmp=!tmp:~%%P!"
            )
        )
    ) ELSE (
        set len=0
    )
)
( 
    endlocal
    set "%~1=%len%"
    exit /b
)