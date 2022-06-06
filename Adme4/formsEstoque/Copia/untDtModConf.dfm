object dmConf: TdmConf
  OldCreateOrder = False
  Left = 192
  Top = 107
  Height = 480
  Width = 696
  object dtBase: TDatabase
    DatabaseName = 'ADME4'
    DriverName = 'INTRBASE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=c:\Adme\Adme.gdb'
      'USER NAME=SYSDBA'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'ENABLE BCD=FALSE'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=masterkey')
    SessionName = 'Default'
    Left = 22
    Top = 16
  end
end
