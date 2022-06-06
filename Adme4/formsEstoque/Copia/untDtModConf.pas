unit untDtModCOnf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmConf = class(TDataModule)
    dtBase: TDatabase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConf: TdmConf;

implementation

{$R *.DFM}

end.
