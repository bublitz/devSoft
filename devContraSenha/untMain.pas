unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ValEdit;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Values: TValueListEditor;
    BitBtn1: TBitBtn;
    LabKey1: TLabel;
    LabKey2: TLabel;
    LabKey3: TLabel;
    LabKey4: TLabel;
    LabKey5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses untFuncoes;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  NomeEmpresa, Produto, Versao, Data, Hora,
  Computador, UserWindows, EmprWindows,
  Chave1, Chave2, Chave3,
  comp, user,
  key1, key2, key3, key4, key5: string;

  som: int64;

  i: integer;
  si: TSI;

begin
  NomeEmpresa  := Values.Cells[1, 00];
  Produto      := Values.Cells[1, 01];
  Versao       := Values.Cells[1, 02];
  Data         := Values.Cells[1, 03];
  Hora         := Values.Cells[1, 04];
  Computador   := Values.Cells[1, 05];
  UserWindows  := Values.Cells[1, 06];
  EmprWindows  := Values.Cells[1, 07];
  Chave1       := Values.Cells[1, 08];
  Chave2       := Values.Cells[1, 09];
  Chave3       := Values.Cells[1, 10];

  GeraAtiva(NomeEmpresa, Produto, Versao, Data, Hora,
             Computador, UserWindows, EmprWindows,
             Chave1, Chave2, Chave3,
             key1, key2, key3, key4, key5);

  LabKey1.Caption := key1;
  LabKey2.Caption := key2;
  LabKey3.Caption := key3;
  LabKey4.Caption := key4;
  LabKey5.Caption := key5;
end;

end.
