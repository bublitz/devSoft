unit untConfEtiq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IniFiles;

type
  TfrmConfEtiq = class(TForm)
    btnTestar: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edt1Top: TEdit;
    Label2: TLabel;
    edt1Left: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edt2Top: TEdit;
    edt2Left: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure btnTestarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfEtiq: TfrmConfEtiq;

implementation

uses untRelEtiq, untDtModEst, untProd;

{$R *.DFM}

  function Alltrim(Text : string) : string;
  begin
    while Pos(' ',Text) > 0 do
      Delete(Text,Pos(' ',Text),1);
    Result := Text;
  end;

  function StrZero(Num : Real ; Zeros,Deci: integer): string;
  var
    tam, z: integer;
    res, zer: string;
  begin
    Str(Num:Zeros:Deci, res);
    res := Alltrim(res);
    tam := length(res);
    zer := '';
    for z := 1 to (Zeros-tam) do
      zer := zer + '0';
    Result := zer+res;
  end;

procedure TfrmConfEtiq.btnTestarClick(Sender: TObject);
var
  lab1top, lab2top, lab1left, lab2left: integer;

begin
  lab1top  := StrToInt(edt1Top.Text);
  lab2top  := StrToInt(edt2Top.Text);
  lab1left := StrToInt(edt1Left.Text);
  lab2left := StrToInt(edt2Left.Text);

  frmRelEtiq.QRLabel1.Top    := lab1top;
  frmRelEtiq.QRLabel1.Left   := lab1left;
  frmRelEtiq.QRLabel3.Top    := lab1top + 21;
  frmRelEtiq.QRLabel3.Left   := lab1left;
  frmRelEtiq.QRBarcode1.Top  := lab1top + 43;
  frmRelEtiq.QRBarcode1.Left := lab1left + 3;

  frmRelEtiq.QRLabel2.Top    := lab2top;
  frmRelEtiq.QRLabel2.Left   := lab2left;
  frmRelEtiq.QRLabel4.Top    := lab2top + 21;
  frmRelEtiq.QRLabel4.Left   := lab2left;
  frmRelEtiq.QRBarcode2.Top  := lab2top + 43;
  frmRelEtiq.QRBarcode2.Left := lab2left + 3;

  frmRelEtiq.QRLabel1.Caption := dmEst.tbProdutoCODIGOCOMPLETO.AsString;
  frmRelEtiq.QRLabel3.Caption := dmEst.tbProdutoGRAMA.AsString + 'g';
  frmRelEtiq.QRBarcode1.Digits := StrZero(dmEst.tbProdutoCODIGOPRODUTO.value, 5, 0);
  frmRelEtiq.QRLabel2.Caption := dmEst.tbProdutoCODIGOCOMPLETO.AsString;
  frmRelEtiq.QRLabel4.Caption := dmEst.tbProdutoGRAMA.AsString + 'g';
  frmRelEtiq.QRBarcode2.Digits := StrZero(dmEst.tbProdutoCODIGOPRODUTO.value, 5, 0);
  frmRelEtiq.QuickRep1.Preview;
end;

procedure TfrmConfEtiq.Button1Click(Sender: TObject);
var
  arqini: TIniFile;
begin
  arqini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'devSoft.ini');
  edt1Top.Text  := arqini.ReadString('ParamEtiq', 'Label1Top',    '3');
  edt2Top.Text  := arqini.ReadString('ParamEtiq', 'Label2Top',   '50');
  edt1Left.Text := arqini.ReadString('ParamEtiq', 'Label1Left',  '85');
  edt2Left.Text := arqini.ReadString('ParamEtiq', 'Label2Left', '256');
  arqini.Free;
end;

procedure TfrmConfEtiq.Button2Click(Sender: TObject);
var
  arqini: TIniFile;
begin
  arqini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'devSoft.ini');
  arqini.WriteString('ParamEtiq', 'Label1Top',  edt1Top.Text);
  arqini.WriteString('ParamEtiq', 'Label2Top',  edt2Top.Text);
  arqini.WriteString('ParamEtiq', 'Label1Left', edt1Left.Text);
  arqini.WriteString('ParamEtiq', 'Label2Left', edt2Left.Text);
  arqini.Free;
end;

end.
