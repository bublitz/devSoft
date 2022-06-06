unit untImpSocio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DB, Printers, Grids, DBGrids, RXDBCtrl,
  IBCustomDataSet, IBQuery, RxCombos, IniFiles;

type
  TfrmImpSocio = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    RxDBGrid1: TRxDBGrid;
    qrEmissaoCart: TIBQuery;
    dsEmissaoCart: TDataSource;
    qrEmissaoCartCODIGOSOCIO: TIntegerField;
    qrEmissaoCartNOME: TIBStringField;
    qrEmissaoCartCARTEIRA: TIBStringField;
    qrEmissaoCartDATACADASTRO: TDateTimeField;
    dsCart: TDataSource;
    qrCart: TIBQuery;
    qrCartCODIGOSOCIO: TIntegerField;
    qrCartNOME: TIBStringField;
    qrCartDATACADASTRO: TDateTimeField;
    qrCartCARTEIRA: TIBStringField;
    qrCartCODIGOPLANO: TIntegerField;
    qrCartENDERECO: TIBStringField;
    qrCartCOMPLEMENTO: TIBStringField;
    qrCartBAIRRO: TIBStringField;
    qrCartCIDADE: TIBStringField;
    qrCartUF: TIBStringField;
    qrCartCEP: TIBStringField;
    qrCartCPF: TIBStringField;
    qrCartRG: TIBStringField;
    qrCartDATANASCIMENTO: TDateTimeField;
    qrCartFOTO: TBlobField;
    qrCartTELEFONE: TIBStringField;
    qrCartEMAIL: TIBStringField;
    qrCartSITUACAO: TIBStringField;
    qrCartDIAVENCTO: TIntegerField;
    qrCartCodigoBarra: TStringField;
    Label1: TLabel;
    EditPesq: TEdit;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure EditPesqChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpSocio: TfrmImpSocio;

implementation

uses untDtMod, untRepCart;

{$R *.DFM}

procedure TfrmImpSocio.FormShow(Sender: TObject);
begin
  qrEmissaoCart.Close;
  qrEmissaoCart.Open;
  qrCart.Close;
end;

procedure TfrmImpSocio.SpeedButton1Click(Sender: TObject);
begin
  qrEmissaoCart.DisableControls;
  qrEmissaoCart.First;
  while not qrEmissaocart.Eof do
  begin
   if RxDBGrid1.SelectedRows.CurrentRowSelected then
   begin
     dtMod.tbSocio.Locate ('CodigoSocio', qrEmissaoCartCODIGOSOCIO.Value, []);
     dtMod.tbSocio.Edit;
     dtMod.tbSocioCARTEIRA.Value := 'I';
     dtMod.tbSocio.Post;
     dtMod.Acao('Imprimiu carteirinha '+dtMod.tbSocioNOME.AsString);
   end;
   qrEmissaoCart.next;
  end;
  qrEmissaoCart.EnableControls;
  qrCart.Open;

  Application.CreateForm(TfrmRepCart, frmRepCart);
  frmRepCart.QuickRep1.Preview;

  if Application.MessageBox('Carteiras impressa com Sucesso?',
                   'Confirmação', MB_YESNO) = IDYES then
  begin
    dtMod.tbSocio.First;
    while not dtMod.tbSocio.Eof do
    begin
      if dtMod.tbSocioCARTEIRA.Value = 'I' then
      begin
        dtMod.tbSocio.Edit;
        dtMod.tbSocioCARTEIRA.Value := 'S';
        dtMod.tbSocio.Post;
      end;
      dtMod.tbSocio.Next
    end;
  end;
  qrEmissaoCart.Close;
  qrEmissaoCart.Open;
  qrCart.Close;
end;

procedure TfrmImpSocio.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qrEmissaoCartCARTEIRA.Value = 'S' then
  begin
    Background := clGreen;
    AFont.Color := clWhite;
  end
  else
  begin
    Background := clRed;
    AFont.Color := clWhite;
  end;
end;

procedure TfrmImpSocio.EditPesqChange(Sender: TObject);
begin
  qrEmissaoCart.Locate('Nome', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmImpSocio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
