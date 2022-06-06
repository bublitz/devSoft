@Echo off
cd\projetos\devsoft\install\filescomp
Echo Compactando Arquivos....
..\compress \projetos\devsoft\Install\banco\devsoft.gdb devsoft.ban
..\compress \projetos\devsoft\Install\devFir~1\devsoft.ini devsoft.fir
..\compress \projetos\devsoft\Install\devFir~1\joystick.exe joystick.fir
..\compress \projetos\devsoft\Install\devGua~1\devsoft.ini devsoft.gu1
..\compress \projetos\devsoft\Install\devGua~1\devsoft.wav devsoft.gu2
..\compress \projetos\devsoft\Install\devGua~1\Guardian.exe Guardian.gua
..\compress \projetos\devsoft\Install\devGua~1\imp.bat imp.gu1
..\compress \projetos\devsoft\Install\devGua~1\imp.pif imp.gu2
Echo:
Echo Ok!!
cd..

