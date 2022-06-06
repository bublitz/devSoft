@echo off
deltree /y Copia.Guardian.sg\.
copy *.r32 Copia.Guardian.sg
copy *.pas Copia.Guardian.sg
copy *.dfm Copia.Guardian.sg
copy *.dpr Copia.Guardian.sg
copy *.res Copia.Guardian.sg
copy *.dof Copia.Guardian.sg
copy *.txt Copia.Guardian.sg
copy *.doc Copia.Guardian.sg
copy config.* Copia.Guardian.sg
deltree /y *.~*
deltree /y *.dcu
deltree /y *.bak
