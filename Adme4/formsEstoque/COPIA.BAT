@echo off
deltree /y copia\.
copy *.r32 copia
copy *.pas copia
copy *.dfm copia
copy *.dpr copia
copy *.res copia
copy *.dof copia
copy *.txt copia
copy *.doc copia
copy *.ini copia
copy config.* copia
deltree /y *.~*
deltree /y *.dcu
deltree /y *.dsk
rem xcopy copia e:\copia /y /v
