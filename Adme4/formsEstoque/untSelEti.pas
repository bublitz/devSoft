unit untSelEti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, RXDBCtrl, Buttons, ExtCtrls, Db, DBTables,
  IBCustomDataSet, IBQuery, IniFiles;

type
  TfrmSelEti = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    EditPesq: TEdit;
    dsProduto: TDataSource;
    dsProd: TDataSource;
    qrProduto: TIBQuery;
    qrProd: TIBQuery;
    qrProdutoCODIGOPRODUTO: TIntegerField;
    qrProdutoDESCRICAO: TIBStringField;
    qrProdutoEMITETIQ: TIBStringField;
    qrProdutoDATACADASTRO: TDateTimeField;
    qrProdCODIGOPRODUTO: TIntegerField;
    qrProdDESCRICAO: TIBStringField;
    qrProdCODIGOCOMPLETO: TIBStringField;
    qrProdCODIGOLINHA: TIBStringField;
    qrProdCODIGOGRUPO: TIBStringField;
    qrProdCODIGOSUBGRUPO: TIBStringField;
    qrProdCODIGOBARRA: TIBStringField;
    qrProdDESCRICAODETALHADA: TIBStringField;
    qrProdFOTO: TBlobField;
    qrProdREFERENCIAFORNEC: TIBStringField;
    qrProdCODIGOMOEDA: TIntegerField;
    qrProdPRECOCUSTO: TFloatField;
    qrProdPESOPEDRA: TFloatField;
    qrProdPESOPECA: TFloatField;
    qrProdPRECOVENDA: TFloatField;
    qrProdESTOQUEFISICO: TIntegerField;
    qrProdESTOQUEMINIMO: TIntegerField;
    qrProdESTOQUECRITICO: TIntegerField;
    qrProdUNIDADE: TIBStringField;
    qrProdCOMISSAO: TFloatField;
    qrProdOBSERVACAO: TIBStringField;
    qrProdTEMCONJUNTO: TIBStringField;
    qrProdDATACADASTRO: TDateTimeField;
    qrProdFORMULA: TIBStringField;
    qrProdMARGEM: TFloatField;
    qrProdGRAMA: TFloatField;
    qrProdMAOOBRA: TFloatField;
    qrProdINDICE: TFloatField;
    qrProdJUROS: TFloatField;
    qrProdDOLAR: TFloatField;
    qrProdSEGURO: TFloatField;
    qrProdCODFORNEC: TFloatField;
    qrProdCODIGOMETAL: TIntegerField;
    qrProdEMITETIQ: TIBStringField;
    procedure ImprimeEtiq(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    cod1, cod2, gra1, gra2, bar1, bar2: string;
  end;

var
  frmSelEti: TfrmSelEti;

implementation

uses untDtModEst, untRelEtiq, untDtModConf, untProd;

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

procedure TfrmSelEti.ImprimeEtiq(Sender: TObject);
var
  arqini: TIniFile;
  lab1top, lab2top, lab1left, lab2left: integer;

begin
  arqini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'devSoft.ini');
  lab1Top  := arqini.ReadInteger('ParamEtiq', 'Label1Top',    3);
  lab2Top  := arqini.ReadInteger('ParamEtiq', 'Label2Top',   50);
  lab1Left := arqini.ReadInteger('ParamEtiq', 'Label1Left',  85);
  lab2Left := arqini.ReadInteger('ParamEtiq', 'Label2Left', 256);
  arqini.Free;

  Application.CreateForm(TfrmRelEtiq, frmRelEtiq);

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

  frmRelEtiq.QRLabel1.Caption := cod1;
  frmRelEtiq.QRLabel3.Caption := gra1;
  frmRelEtiq.QRBarcode1.Digits := bar1;

  frmRelEtiq.QRLabel2.Caption := cod2;
  frmRelEtiq.QRLabel4.Caption := gra2;
  frmRelEtiq.QRBarcode2.Digits := bar2;

  frmRelEtiq.QuickRep1.PrintBackground;

end;

procedure TfrmSelEti.SpeedButton1Click(Sender: TObject);
var
  c, i: integer;

begin
  qrProduto.DisableControls;
  qrProduto.First;
  while not qrProduto.Eof do
  begin
   if RxDBGrid1.SelectedRows.CurrentRowSelected then
   begin
     dmEst.tbProduto.Locate ('CodigoProduto', qrProdutoCODIGOProduto.Value, []);
     dmEst.tbProduto.Edit;
     dmEst.tbProdutoEMITETIQ.Value := 'I';
     dmEst.tbProduto.Post;
     //dtMod.Acao('Imprimiu carteirinha '+dtMod.tbSocioNOME.AsString);
   end;
   qrProduto.next;
  end;
  qrProduto.EnableControls;
  qrProd.Open;
  i := qrProdESTOQUEFISICO.AsInteger;
  while not qrProd.Eof do
  begin

    cod1 := qrProdCODIGOCOMPLETO.AsString;
    gra1 := qrProdGRAMA.AsString;
    bar1 := StrZero(qrProdCODIGOPRODUTO.value, 5, 0);
    cod2 := cod1;
    gra2 := gra1;
    bar2 := bar1;

    while i > 1 do
    begin
      ImprimeEtiq(Sender);
      i := i - 2
    end;

    qrProd.Next;

    if not qrProd.Eof then
    begin
      if i = 1 then
      begin
        i := qrProdESTOQUEFISICO.AsInteger - 1;
        cod2 := qrProdCODIGOCOMPLETO.AsString;
        gra2 := qrProdGRAMA.AsString + 'g';
        bar2 := StrZero(qrProdCODIGOPRODUTO.value, 5, 0);
        ImprimeEtiq(Sender);
      end
      else
        i := qrProdESTOQUEFISICO.AsInteger;
    end
    else
    begin
      cod2 := '';
      gra2 := '';
      bar2 := '';
      ImprimeEtiq(Sender);
    end;

  end;

  //frmRelEtiq.QuickRep1.Preview;

  if Application.MessageBox('Etiquetas impressa com Sucesso?',
                   'Confirmação', MB_YESNO) = IDYES then
  begin
    dmEst.tbProduto.First;
    while not dmEst.tbProduto.Eof do
    begin
      if dmEst.tbProdutoEMITETIQ.Value = 'I' then
      begin
        dmEst.tbProduto.Edit;
        dmEst.tbProdutoEMITETIQ.Value := 'S';
        dmEst.tbProduto.Post;
      end;
      dmEst.tbProduto.Next
    end;
  end;
  qrProduto.Close;
  qrProduto.Open;
  qrProd.Close;

end;

procedure TfrmSelEti.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmSelEti.FormCreate(Sender: TObject);
begin
  qrProduto.Open;
end;

procedure TfrmSelEti.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qrProduTOEMITETIQ.Value = 'S' then
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

end.
