unit untConsCartela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Grids, DBGrids, StdCtrls;

type
  TfrmConsCartelas = class(TForm)
    DBGridCartela: TDBGrid;
    ListView: TListView;
    procedure MontaCartela(Sender: TObject);
    procedure DBGridCartelaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridCartelaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridCartelaCellClick(Column: TColumn);
    procedure DBGridCartelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsCartelas: TfrmConsCartelas;

implementation

uses untDatMod;

{$R *.DFM}

procedure TfrmConsCartelas.MontaCartela(Sender: TObject);
var
  I: integer;
  ListItem: TListItem;

begin
  with ListView do
  Items.Clear;
  begin
    for I := 1 to 25 do
    begin
      ListItem := ListView.Items.Add;
      ListItem.Caption := Copy(DatMod.TabCartelas.FieldByName('Dezenas').AsString, i*2-1, 2 );
    end;
  end;
end;

procedure TfrmConsCartelas.DBGridCartelaKeyPress(Sender: TObject;
  var Key: Char);
begin
   MontaCartela(Sender);
end;

procedure TfrmConsCartelas.DBGridCartelaEnter(Sender: TObject);
begin
   MontaCartela(Sender);
end;

procedure TfrmConsCartelas.FormShow(Sender: TObject);
begin
   MontaCartela(Sender);
end;

procedure TfrmConsCartelas.DBGridCartelaCellClick(Column: TColumn);
begin
   MontaCartela(frmConsCartelas);
end;

procedure TfrmConsCartelas.DBGridCartelaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   MontaCartela(Sender);
end;

end.


