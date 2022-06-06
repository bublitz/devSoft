unit untGrupo2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TfrmGrupo2 = class(TForm)
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
  frmGrupo2: TfrmGrupo2;

implementation

uses untFuncoes;

{$R *.dfm}

procedure TfrmGrupo2.ListView1DblClick(Sender: TObject);
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
