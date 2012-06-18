@echo off
echo.
echo  ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo  ³ MirageOS Batch File ³ Type: "mirage PROGNAME" (No Ext.) ³
echo  ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
if exist %1.z80 tasm -80 -i -b %1.z80 %1.bin
if exist %1.asm tasm -80 -i -b %1.asm %1.bin
if errorlevel 1 goto errors
devpac8X %1
goto exit
:errors
echo !! There were errors !!
:exit
echo.
del %1.lst >> nul
del %1.bin >> nul
