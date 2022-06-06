@echo off
deltree /y copia
md Copia
md Copia\formsEstoque
copy *.r32 copia
copy *.pas copia
copy *.dfm copia
copy *.dpr copia
copy *.res copia
if exist *.~* deltree /y *.~*
if exist *.dcu deltree /y *.dcu
if exist *.dsk deltree /y *.dsk
cd formsEstoque
copy *.r32 ..\copia\formsEstoque
copy *.pas ..\copia\formsEstoque
copy *.dfm ..\copia\formsEstoque
copy *.dpr ..\copia\formsEstoque
copy *.res ..\copia\formsEstoque
if exist *.~* deltree /y *.~*
if exist *.dcu deltree /y *.dcu
if exist *.dsk deltree /y *.dsk
cd..

