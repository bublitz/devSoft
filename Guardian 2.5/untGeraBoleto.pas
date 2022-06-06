unit untGeraBoleto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons;

type
  TfrmGeraBoleto = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    Pbar: TProgressBar;
    Panel2: TPanel;
    Label3: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraBoleto: TfrmGeraBoleto;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmGeraBoleto.SpeedButton1Click(Sender: TObject);
var
  numbol: integer;
  dia: string;
  dvencto: TDate;
  mesatual, anoatual, day, mes, ano, nAno, nMes, nDia: word;

begin
  Label3.caption := 'Aguarde Gerando Boletos !!!';
  dtMod.tbSocio.Last;
  pbar.Max := dtMod.tbSocioCODIGOSOCIO.Value;
  frmGeraBoleto.Update;

  DecodeDate( Now, anoatual, mesatual, day );

  dtMod.tbReceb.IndexFieldNames := '';
  dtMod.tbReceb.Last;
  numbol := dtMod.tbRecebNUMERO.AsInteger;

  dtMod.tbSocio.First;
  while not dtMod.TbSocio.eof do
  begin
    if (dtmod.tbSocioCODIGOSOCIO.value <> 0) then
    begin
      DecodeDate( dtMod.tbSocioDATACADASTRO.Value, ano, mes, day );
      if (mesatual<>mes) and (anoatual>=ano)  then
      begin
        dtMod.tbReceb.Insert;
        inc(numbol);
        dtMod.tbRecebNUMERO.Value := numbol;
        dtMod.tbRecebCODIGOSOCIO.Value := dtMod.tbSocioCodigoSocio.Value;
        dtMod.tbRecebCODIGOSITUACAO.Value := 1;
        dtMod.tbRecebDATAEMISSAO.AsString := DateToStr(Date);
        //dia := dtMod.tbSocioDIAVENCTO.AsString;
        //DecodeDate( dtMod.tbSocioDataVencto.Value, nAno, nMes, nDia );
        dvencto := dtMod.tbSocioDataVencto.Value;
        IncMonth(dvencto,1);
        dtMod.tbRecebDATAVENCIMENTO.Value := dvencto;
        dtMod.tbRecebJUROS.Value := dtMod.tbEmpresaJUROS.Value;
        dtMod.tbRecebMULTA.Value := dtMod.tbEmpresaMULTA.Value;
        dtMod.tbPlano.Locate('CODIGOPLANO', dtMod.tbSocioCODIGOPLANO.Value, [] );
        dtMod.tbRecebVALOR.Value := dtMod.tbPlanoVALOR.value;
        dtmod.tbReceb.post;
      end;
    end;
    dtMod.tbSocio.Next;
    pbar.position := pbar.position + 1;
  end;

  // Atualiza Data da Última Geração Boletos
  dtMod.tbEmpresa.edit;
  dtMod.tbEmpresaDATAULTIMAGERACAO.value := Date;
  dtMod.tbEmpresa.Post;
  if dtMod.IBTrans.InTransaction then
    dtMod.IBTrans.CommitRetaining;
  BitBtn1.Visible := True;
  Label3.caption := 'Geração de Boletos OK !!!';
end;


procedure TfrmGeraBoleto.FormShow(Sender: TObject);
begin
  Label3.Caption := '';
  BitBtn1.Visible := False;
  pbar.position := 0;
end;

procedure TfrmGeraBoleto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
