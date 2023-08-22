unit untDatMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDatMod = class(TDataModule)
    Database: TDatabase;
    DatCartelas: TDataSource;
    DatSorteio: TDataSource;
    TabCartelas: TTable;
    TabSorteio: TTable;
    procedure DatModCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatMod: TDatMod;

implementation

{$R *.DFM}

procedure TDatMod.DatModCreate(Sender: TObject);
begin
   DataBase.Params.Clear;
   DataBase.Params.Add('PATH='+ExtractFilePath(Application.ExeName)+'Data');
   DataBase.Connected := True;
   TabCartelas.Open;
   TabSorteio.Open;
end;

end.
