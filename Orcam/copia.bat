@echo off
deltree /y copia\.
xcopy *.r32 copia
xcopy *.pas copia
xcopy *.dfm copia
xcopy *.txt copia
xcopy *.doc copia
xcopy *.ini copia
xcopy config.* copia
xcopy orcam*.* copia
deltree /y *.~*
deltree /y *.dcu
deltree /y *.tmp
rem xcopy copia e:\copia /y /v
