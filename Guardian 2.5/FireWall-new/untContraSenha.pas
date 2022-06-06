unit untContraSenha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, sysinfo;

type
  TfrmContraSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblComp: TLabel;
    lblHora: TLabel;
    lblData: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    edtSenha: TEdit;
    Bevel1: TBevel;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContraSenha: TfrmContraSenha;

implementation

uses untMain, untFuncoes;

{$R *.DFM}


procedure TfrmContraSenha.BitBtn1Click(Sender: TObject);

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

var
  dia, mes, ano, hor, min, seg, mil: word;
  val1, val2, val3, val4: longint;

begin
  DecodeDate( StrToDate(lblData.Caption), ano, mes, dia );
  DecodeTime( StrToTime(lblHora.Caption), hor, min, seg, mil );
  val1 := (ano+mes+dia)*(hor+min+seg)*soma(lblData.Caption);
  val2 := (ano+mes+dia)*(hor+min+seg)*soma(lblHora.Caption);
  val3 := soma(lblComp.Caption)*(ano+mes+dia+hor+min+seg);

  val4 := Trunc(val1*val2*val3*(min+ano+min)*10000) +
          soma(lblData.Caption)*soma(lblHora.Caption);

  if edtSenha.Text = mistura(abs(val4),lblComp.Caption) then
    ModalResult := mrOk
  else
    raise exception.Create('Contra-Senha Inválida!!');

end;

procedure TfrmContraSenha.FormShow(Sender: TObject);
begin
  frmMain.Timer1.Enabled := False;
  edtSenha.SetFocus;
end;

procedure TfrmContraSenha.FormActivate(Sender: TObject);
begin
  frmMain.Timer1.Enabled := False;
end;

procedure TfrmContraSenha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmMain.Timer1.Enabled := True;
end;

end.
