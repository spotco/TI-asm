@echo off
tasm -t80 -b -i %2%1.z80 %2%1.bin
if errorlevel 1 goto ERR
devpac8x %2%1
echo.
del %2%1.lst
del %2%1.bin
goto XIT
:ERR
echo.
echo Hey, something is wrong here!
echo.
:XIT