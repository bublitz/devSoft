unit untCalcCSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  RXCtrls, ExtCtrls, StdCtrls, Buttons, Mask;

type
  TfrmCalcCSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtComp: TEdit;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    lblSenha: TRxLabel;
    edtData: TMaskEdit;
    edtHora: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalcCSenha: TfrmCalcCSenha;

implementation

uses untFuncoes;

{$R *.DFM}

function mistura( v: longint; c: string ): string;
var
  v1, v2: string;
  i, d, r: integer;

begin
  v1 := IntToStr(v);
  v2 := '';
  for i := Length(c) downto 1 do
  begin
    d := Ord(c[i]) div 16;
    r := 16 - Ord(c[i]) mod 16;
    v2 := v2 + DecToHex(d) + Copy(v1, i*2-1, 2 ) + DecToHex(r);
  end;
  mistura := Copy(v2,5,8);
end;

procedure TfrmCalcCSenha.FormShow(Sender: TObject);
begin
  //edtData.Text := '';
  //edtHora.Text := '';
  //edtComp.Text := '';
  edtData.SetFocus;
end;

procedure TfrmCalcCSenha.BitBtn1Click(Sender: TObject);
var
  dia, mes, ano, hor, min, seg, mil: word;
  val1, val2, val3, val4: longint;

begin
  DecodeDate( StrToDate(edtData.Text), ano, mes, dia );
  DecodeTime( StrToTime(edtHora.Text), hor, min, seg, mil );
  val1 := (ano+mes+dia)*(hor+min+seg)*soma(edtData.Text);
  val2 := (ano+mes+dia)*(hor+min+seg)*soma(edtHora.Text);
  val3 := soma(edtComp.Text)*(ano+mes+dia+hor+min+seg);

  val4 := Trunc(val1*val2*val3*(min+ano+min)*10000) +
          soma(edtData.Text)*soma(edtHora.Text);

  lblSenha.Caption := mistura(abs(val4),edtComp.Text);

end;

procedure TfrmCalcCSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    key := #0;
  end;
end;

end.
