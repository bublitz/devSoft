@echo off
deltree /y copia\.
xcopy *.pas copia
xcopy *.dfm copia
xcopy *.dpr copia
xcopy *.res copia
xcopy *.dof copia
xcopy *.doc copia
deltree /y *.~*
deltree /y *.dcu
rem xcopy copia f:\copia /y /v
