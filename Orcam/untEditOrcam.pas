unit untEditOrcam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, StdCtrls, db, ToolWin, ComCtrls, ExtCtrls,
  DBCtrls, Buttons, ImgList, Menus;

type
  TfrmEditOrcam = class(TForm)
    PanDetail: TPanel;
    ImageList1: TImageList;
    DBText7: TDBText;
    PopupMenu1: TPopupMenu;
    Indent1: TMenuItem;
    OutDent1: TMenuItem;
    N1: TMenuItem;
    Adiciona1: TMenuItem;
    Insere1: TMenuItem;
    Edita1: TMenuItem;
    Exclui1: TMenuItem;
    N2: TMenuItem;
    Numera1: TMenuItem;
    Calculaagora1: TMenuItem;
    DatNada: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrdOrcam: TRxDBGrid;
    Panel1: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    DBText3: TDBText;
    DBText2: TDBText;
    Label3: TLabel;
    Label5: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label6: TLabel;
    Label7: TLabel;
    DBText6: TDBText;
    StaticText1: TStaticText;
    RxDBGrid1: TRxDBGrid;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ToolButton5: TToolButton;
    SpeedButton2: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton1: TSpeedButton;
    CheckAuto: TCheckBox;
    SpeedButton14: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure DBGrdOrcamKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure DBGrdOrcamKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RxDBGrid1EditButtonClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_serv: string;
  end;

var
  frmEditOrcam: TfrmEditOrcam;

implementation

uses untCalculo, untDatMod, Funcoes, untEditLinha, untPesqServico,
  untVisDadGer;

{$R *.DFM}

procedure TfrmEditOrcam.DBGrdOrcamKeyPress(Sender: TObject; var Key: Char);
begin
   if Key in [ 'N', 'n' ] then SpeedButton2Click(Sender)
   else
   if Key in [ 'C', 'c' ] then SpeedButton1Click(Sender)
   else
   if Key in [ 'I', 'i' ] then SpeedButton5Click(Sender)
   else
   if Key in [ 'X', 'x' ] then SpeedButton3Click(Sender)
   else
   if Key in [ 'A', 'a', #13 ] then SpeedButton4Click(Sender)
   else
   if Key in [ 'E', 'e' ] then SpeedButton6Click(Sender);
end;

procedure TfrmEditOrcam.DBGrdOrcamKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 45 then SpeedButton5Click(Sender) // insert
   else
   if Key = 46 then SpeedButton3Click(Sender) // delete
   else
   if Key = 39  then SpeedButton6Click(Sender); // -->
end;

procedure TfrmEditOrcam.SpeedButton1Click(Sender: TObject);
begin
   DBGrdOrcam.DataSource := DatNada;
   RxDBGrid1.DataSource := DatNada;
   CalcOrcam;
   DBGrdOrcam.DataSource := DatMod.DatOrcam;
   RxDBGrid1.DataSource := DatMod.DatOrcam;
   DatMod.TabOrcam.Refresh;
end;

procedure TfrmEditOrcam.SpeedButton6Click(Sender: TObject);
var r: integer;
begin
   r := DatMod.TabOrcam.RecNo;
   DatMod.TabOrcam.Prior;
   cod_serv := DatMod.TabOrcamCodigoServico.AsString;
   DatMod.TabOrcam.RecNo := r;
   DatMod.TabOrcam.Edit;
   if frmEditLinha.ShowModal = mrCancel then
      DatMod.TabOrcam.Cancel
   else begin
      DatMod.TabOrcam.Post;
      if DatMod.TabOrcamNivel.Value = ' ' then DatMod.TabOrcamNivel.Value := '0';
      if DatMod.TabOrcamBDI.Value = ' ' then DatMod.TabOrcamBDI.Value := '0';
   end;
   if CheckAuto.Checked then SpeedButton1Click(Sender);
end;

procedure TfrmEditOrcam.SpeedButton5Click(Sender: TObject);
var r: integer;
begin
   r := DatMod.TabOrcam.RecNo;
   DatMod.TabOrcam.Prior;
   cod_serv := DatMod.TabOrcamCodigoServico.AsString;
   DatMod.TabOrcam.RecNo := r;
   Insere( DatMod.TabOrcam );
   if frmEditLinha.ShowModal = mrOk then begin
      DatMod.TabOrcam.Post;
      if DatMod.TabOrcamNivel.Value = ' ' then DatMod.TabOrcamNivel.Value := '0';
      if DatMod.TabOrcamBDI.Value = ' ' then DatMod.TabOrcamBDI.Value := '0';
   end
   else
      DatMod.TabOrcam.Cancel;
   if CheckAuto.Checked then SpeedButton1Click(Sender);
end;

procedure TfrmEditOrcam.SpeedButton4Click(Sender: TObject);
var r: integer;
begin
   r := DatMod.TabOrcam.RecNo;
   DatMod.TabOrcam.Prior;
   cod_serv := DatMod.TabOrcamCodigoServico.AsString;
   DatMod.TabOrcam.RecNo := r;
   Inclui( DatMod.TabOrcam );
   if frmEditLinha.ShowModal = mrOk then begin
      if DatMod.TabOrcamNivel.Value = ' ' then DatMod.TabOrcamNivel.Value := '0';
      if DatMod.TabOrcamBDI.Value = ' ' then DatMod.TabOrcamBDI.Value := '0';
      DatMod.TabOrcam.Post;
   end
   else
      DatMod.TabOrcam.Cancel;
   if CheckAuto.Checked then SpeedButton1Click(Sender);
end;

procedure TfrmEditOrcam.SpeedButton2Click(Sender: TObject);
var
   n0, n1, n2, nivel, registro: integer;
begin
   n0 := 0; n1 := 0; n2 := 0;
   with DatMod do begin
      registro := TabOrcam.RecNo;
      TabOrcam.First;
      while not TabOrcam.Eof do begin
         if Copy( TabOrcamCodigoServico.Value, 1, 1) <> 'T' then begin
            nivel := myInt(TabOrcamNivel.AsString);
            TabOrcam.Edit;
            if nivel = 3 then begin
               TabOrcamNumero.Value := ' ';
            end else
            if nivel = 2 then begin
               Inc(n2); n0 := 0; n1 := 0;
               TabOrcamNumero.Value := IntToStr(n2);
            end else
            if nivel = 1 then begin
               Inc(n1); n0 := 0;
               TabOrcamNumero.Value := IntToStr(n2)+'.'+IntToStr(n1);
            end else
            if nivel = 0 then begin
               Inc(n0);
               TabOrcamNumero.Value := IntToStr(n2)+'.'+IntToStr(n1)+'.'+IntToStr(n0);
            end;
            if TabOrcamNivel.Value = ' ' then TabOrcamNivel.Value := '0';
            if TabOrcamBDI.Value = ' ' then TabOrcamBDI.Value := '0';
         end;
         TabOrcam.Next;
      end;
      if TabOrcam.State = dsEdit then
         TabOrcam.Post;
      TabOrcam.RecNo := registro;
   end;
end;

procedure TfrmEditOrcam.SpeedButton3Click(Sender: TObject);
begin
   if Exclui( DatMod.TabOrcam ) then
      DatMod.TabOrcam.Refresh;
   if CheckAuto.Checked then SpeedButton1Click(Sender);
end;

procedure TfrmEditOrcam.ToolButton2Click(Sender: TObject);
var
   n: string;
begin
   case myInt(DatMod.TabOrcamNivel.AsString) of
   0: n := '1';
   1: n := '2';
   2: n := '3';
   else
      n := '0';
   end;
   DatMod.TabOrcam.Edit;
   DatMod.TabOrcamNivel.Value := n;
   DatMod.TabOrcam.Post;
   if CheckAuto.Checked then SpeedButton1Click(Sender);
end;

procedure TfrmEditOrcam.ToolButton3Click(Sender: TObject);
var
   n: string;
begin
   case myInt(DatMod.TabOrcamNivel.AsString) of
   1: n := '0';
   2: n := '1';
   3: n := '2';
   else
      n := '3';
   end;
   DatMod.TabOrcam.Edit;
   DatMod.TabOrcamNivel.Value := n;
   DatMod.TabOrcam.Post;
   if CheckAuto.Checked then SpeedButton1Click(Sender);
end;

procedure TfrmEditOrcam.RxDBGrid1EditButtonClick(Sender: TObject);
var
   valMDO, valMAT: real;
begin
  if (Sender as TRxDBGrid).SelectedField = DatMod.TabOrcamCodigoServico then
     if frmPesqServ.ShowModal = mrOk then begin
        valMDO := 0.00;
        valMAT := 0.00;
        if DatMod.TabOrcam.State <> dsEdit then
           DatMod.TabOrcam.Edit;
        DatMod.TabOrcamCodigoServico.AsString := DatMod.TabServicosCodigoServico.AsString;
        CalcServDesc( DatMod.TabOrcamCodigoServico.AsString, valMDO, valMAT, True );
        with DatMod do begin
           TabOrcamDescricaoServico.Value := TabServicosDescricao.Value;
           TabOrcamUnidade.Value := TabServicosUnidade.Value;
           TabOrcamMAT.Value := valMAT;
           TabOrcamMDO.Value := valMDO;
        end;
        DatMod.TabOrcam.Post;
     end;
end;

procedure TfrmEditOrcam.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if myInt((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Nivel').AsString) > 0 then
    AFont.Style := AFont.Style + [fsBold];
end;

procedure TfrmEditOrcam.SpeedButton7Click(Sender: TObject);
begin
   frmVisDadGer.ShowModal;
end;

end.
