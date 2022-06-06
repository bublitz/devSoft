unit untMainPede;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ValEdit, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Values: TValueListEditor;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label2: TLabel;
    Button1: TButton;
    procedure Edit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if Length((Sender as TEdit).Text) = 5 then
    SelectNext(ActiveControl, True, True);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  si: TSI;
  NomeEmpresa, Produto, Versao, Data, Hora,
  Computador, UserWindows, EmprWindows,
  Chave1, Chave2, Chave3: string;

begin
  Values.Cells[1, 0] := 'Lan Party';
  Values.Cells[1, 0] := InputBox('Digite o Nome da Empresa', 'Empresa:', Values.Cells[1, 0]);

  si := SystemInformation;

  ShortDateFormat := 'dd/MM/yyyy';

  Values.Cells[1, 01] := 'devSoft Security';
  Values.Cells[1, 02] := '3.0';
  Values.Cells[1, 03] := DateToStr(Date);
  Values.Cells[1, 04] := TimeToStr(Time);
  Values.Cells[1, 05] := SI.NetName;
  Values.Cells[1, 06] := SI.UserName;
  Values.Cells[1, 07] := SI.CompName;

  NomeEmpresa  := Values.Cells[1, 00];
  Produto      := Values.Cells[1, 01];
  Versao       := Values.Cells[1, 02];
  Data         := Values.Cells[1, 03];
  Hora         := Values.Cells[1, 04];
  Computador   := Values.Cells[1, 05];
  UserWindows  := Values.Cells[1, 06];
  EmprWindows  := Values.Cells[1, 07];

  GeraChaves(NomeEmpresa, Produto, Versao, Data, Hora,
             Computador, UserWindows, EmprWindows, Si.BIOSDate,
             Si.SerialHD, Si.BIOSInfo ,Chave1, Chave2, Chave3);

  Values.Cells[1, 08] := Chave1;
  Values.Cells[1, 09] := Chave2;
  Values.Cells[1, 10] := Chave3;

  {Edit1.Text := key1;
  Edit2.Text := key2;
  Edit3.Text := key3;
  Edit4.Text := key4;
  Edit5.Text := key5;}
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  NomeEmpresa, Produto, Versao, Data, Hora,
  Computador, UserWindows, EmprWindows,
  Chave1, Chave2, Chave3,
  key1, key2, key3, key4, key5: string;

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

  if (Edit1.Text = key1) and
     (Edit2.Text = key2) and
     (Edit3.Text = key3) and
     (Edit4.Text = key4) and
     (Edit5.Text = key5) then
    ShowMessage('OK!')
  else
    ShowMessage('ERRO!');
end;

end.
