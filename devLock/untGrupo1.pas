unit untGrupo1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TfrmGrupo1 = class(TForm)
    ListView1: TListView;
    procedure ListView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    comando: TStringList;
    msdos:   TStringList;
  end;

var
  frmGrupo1: TfrmGrupo1;

implementation

uses untFuncoes;

{$R *.dfm}

procedure TfrmGrupo1.ListView1DblClick(Sender: TObject);
var
  i: integer;

begin
  i := ListView1.ItemIndex;
  if msdos[i] = 'T' then
    ExecutaDOS(comando[i])
  else
    Executa(comando[i]);
end;

end.