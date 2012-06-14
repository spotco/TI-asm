@echo off
echo ==== Now assembling %1.z80 for the TI-83 Plus ====
tasm -80 -i -b c:\asm\source\%1.z80 c:\asm\exec\%1.bin
if errorlevel 1 goto ERRORS
rem This is necessary because of a DevPac8x bug
cd c:\asm\exec
c:\asm\tasm\devpac8x %1
cd c:\asm\tasm
echo ==== Job finished. Program saved as %1.8xp ====
goto DONE
:ERRORS
echo ==== Errors!!! ====
:DONE
del c:\asm\source\%1.lst > NUL
del c:\asm\exec\%1.bin > NUL
echo ==== Done ====