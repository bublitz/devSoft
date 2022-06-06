@echo off
cls
upx convel.exe
cls
upx shellconvel.exe
cls
upx conrelat.exe
cls
upx geraini.exe

cls
copy convel.exe       \convel > nul
copy shellconvel.exe  \convel > nul
copy conrelat.exe     \convel > nul
copy geraini.exe      \convel > nul

cls
if exist *.~*  del *.~*
if exist *.dcu del *.dcu


