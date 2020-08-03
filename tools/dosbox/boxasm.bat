@echo off
if exist T.exe del T.exe
if exist T.OBJ del T.OBJ
if "%1"=="MASM" goto MASM
if "%1"=="TASM" goto TASM
goto end
:MASM
set path=%path%;c:\masm
masm T.ASM;>T.txt
link T.OBJ;>>T.txt
if  exist T.exe goto MASMNEXT
exit
:MASMNEXT
if "%2"=="run" goto run
if "%2"=="debug" goto MASMdebug
goto end

:TASM
set path=%path%;c:\tasm
tasm  T.ASM>T.txt
tlink  T.OBJ>>T.txt
if  exist T.exe goto TASMNEXT
exit
:TASMNEXT
if "%2"=="run" goto run
if "%2"=="debug" goto TASMdebug

:MASMdebug
debug T.EXE
exit
:TASMdebug
copy c:\tasm\TDC2.TD TDCONFIG.TD
TD T.EXE
exit
:run
T.EXE
echo END OF YOUR PROGRAM
if "%3"=="p" pause
if "%3"=="k" goto end
exit
:end
