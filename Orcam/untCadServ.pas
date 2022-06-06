unit untCadServ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls, DBCtrls, DB, RxDBComb, Mask,
  Buttons;

type
  TfrmCadServ = class(TForm)
    Panel1: TPanel;
    PageCad: TPageControl;
    TabGrid: TTabSheet;
    TabDetalhe: TTabSheet;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    Panel2: TPanel;
    DBNav: TDBNavigator;
    PanDados: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    BtnIncluir: TSpeedButton;
    BtnAlterar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnCanc: TSpeedButton;
    DBText2: TDBText;
    PageComp: TPageControl;
    TabInsu: TTabSheet;
    DBGrid2: TDBGrid;
    PanControl: TPanel;
    TabComp: TTabSheet;
    DBGrid3: TDBGrid;
    Panel3: TPanel;
    SBtnIncIns: TSpeedButton;
    SBtnAltIns: TSpeedButton;
    SBtnExcIns: TSpeedButton;
    SBtnIncSer: TSpeedButton;
    SBtnAltSer: TSpeedButton;
    SBtnExcSer: TSpeedButton;
    DBEdit3: TDBEdit;
    procedure AtualizaComposicao(Sender: TObject);
    procedure AlternaControl(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure EditPesqChange(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancClick(Sender: TObject);
    procedure DBNavClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure SBtnIncInsClick(Sender: TObject);
    procedure SBtnAltInsClick(Sender: TObject);
    procedure SBtnExcInsClick(Sender: TObject);
    procedure SBtnIncSerClick(Sender: TObject);
    procedure SBtnAltSerClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadServ: TfrmCadServ;

implementation

uses untDatMod, Funcoes, untCompInsumo, untCompServico, untCalculo, untMain;

{$R *.DFM}

procedure TfrmCadServ.AtualizaComposicao(Sender: TObject);
begin
   with DatMod.QryCInsu do begin
      Close;
      ParamByName('CodSer').AsString := DatMod.TabServicosCodigoServico.AsString;
      Open;
   end;
   with DatMod.QryCServ do begin
      Close;
      ParamByName('CodSer').AsString := DatMod.TabServicosCodigoServico.AsString;
      Open;
   end;
end;

procedure TfrmCadServ.AlternaControl(Sender: TObject);
begin
   DBNav.Enabled := not DBNav.Enabled;
   EditPesq.Enabled := not EditPesq.Enabled;
   PanDados.Enabled := not PanDados.Enabled;
   BtnIncluir.Enabled := not BtnIncluir.Enabled;
   BtnAlterar.Enabled := not BtnAlterar.Enabled;
   BtnExcluir.Enabled := not BtnExcluir.Enabled;
   BtnSalvar.Enabled := not BtnSalvar.Enabled;
   BtnCanc.Enabled := not BtnCanc.Enabled;
end;

procedure TfrmCadServ.RdGrpOrdemClick(Sender: TObject);
begin
   if RdGrpOrdem.ItemIndex = 0 then
      DatMod.TabServicos.IndexName := 'IndDescricao'
   else
      DatMod.TabServicos.IndexName := '';
end;

procedure TfrmCadServ.EditPesqChange(Sender: TObject);
begin
   DatMod.TabServicos.Locate( 'Descricao', EditPesq.Text, [loPartialKey,loCaseInsensitive]);
end;

procedure TfrmCadServ.BtnIncluirClick(Sender: TObject);
begin
   //Alterna Controles
   AlternaControl( Sender );
   Inclui( DatMod.TabServicos );
   DBEdit3.SetFocus;
end;

procedure TfrmCadServ.BtnAlterarClick(Sender: TObject);
begin
   //Alterna Controles
   AlternaControl( Sender );
   DatMod.TabServicos.Edit;
   DBEdit3.SetFocus;
end;

procedure TfrmCadServ.BtnExcluirClick(Sender: TObject);

begin
   if Exclui( DatMod.TabServicos ) then begin

   end;
end;

procedure TfrmCadServ.BtnSalvarClick(Sender: TObject);
begin
   if DatMod.TabServicos.State in [ dsInsert, dsEdit ] then
      DatMod.TabServicos.Post;
   //Alterna Controles
   AlternaControl( Sender );
end;

procedure TfrmCadServ.BtnCancClick(Sender: TObject);
begin
   if DatMod.TabServicos.State in [ dsInsert, dsEdit ] then
      DatMod.TabServicos.Cancel;
   //Alterna Controles
   AlternaControl( Sender );
end;

procedure TfrmCadServ.DBNavClick(Sender: TObject; Button: TNavigateBtn);
begin
   AtualizaComposicao( Sender );
end;

procedure TfrmCadServ.FormShow(Sender: TObject);
begin
   AtualizaComposicao( Sender );
end;

procedure TfrmCadServ.SBtnIncInsClick(Sender: TObject);
begin
   DatMod.TabCompInsu.Append;
   frmCompInsumo.Caption := 'Inclui Insumo...';
   if frmCompInsumo.ShowModal = mrOk then begin
      DatMod.TabCompInsu.FieldByName('CodigoServico').Value := DatMod.TabServicosCodigoServico.AsString;
      if DatMod.TabCompInsu.State in [ dsInsert, dsEdit ] then
         DatMod.TabCompInsu.Post;
      DatMod.TabServicos.Refresh;
      AtualizaComposicao( Sender );
   end
   else
      DatMod.TabCompInsu.Cancel;
end;

procedure TfrmCadServ.SBtnAltInsClick(Sender: TObject);
var
   CodIns: integer;
   CodSer: string;

begin
   CodSer := DatMod.TabServicosCodigoServico.AsString;
   CodIns := DatMod.QryCInsu.FieldByName('CodigoInsumoComp').AsInteger;
   if DatMod.TabCompInsu.FindKey([ CodSer, CodIns ]) then begin
      DatMod.TabCompInsu.Edit;
      frmCompInsumo.Caption := 'Altera Insumo...';
      if frmCompInsumo.ShowModal = mrOk then begin
         DatMod.TabCompInsu.FieldByName('CodigoServico').Value := CodSer;
         if DatMod.TabCompInsu.State in [ dsInsert, dsEdit ] then
            DatMod.TabCompInsu.Post;
         DatMod.TabServicos.Refresh;
         AtualizaComposicao( Sender );
      end
      else
         DatMod.TabCompInsu.Cancel;
   end;
end;

procedure TfrmCadServ.SBtnExcInsClick(Sender: TObject);
var
   CodIns: integer;
   CodSer: string;

begin
   CodSer := DatMod.TabServicosCodigoServico.AsString;
   CodIns := DatMod.QryCInsu.FieldByName('CodigoInsumoComp').AsInteger;
   if DatMod.TabCompInsu.FindKey([ CodSer, CodIns ]) then
      if Exclui( DatMod.TabCompInsu ) then begin
         DatMod.TabServicos.Refresh;
         AtualizaComposicao( Sender );
      end;
end;

procedure TfrmCadServ.SBtnIncSerClick(Sender: TObject);
var
  CodSer, CodSerComp: String;
  ValSer: real;

begin
   frmCompServico.Caption := 'Inclui Serviço...';
   frmCompServico.inclui := True;
   if frmCompServico.ShowModal = mrOk then begin
      CodSer     := DatMod.TabServicosCodigoServico.AsString;
      CodSerComp := DatMod.QryServ.FieldByName('CodigoServico').AsString;
      DatMod.TabCompServ.Append;
      DatMod.TabCompServ.FieldByName('CodigoServico').Value := CodSer;
      DatMod.TabCompServ.FieldByName('CodigoServComp').Value := CodSerComp;
      DatMod.TabCompServ.FieldByName('Quantidade').Value := StrToFloat( frmCompServico.Edit1.Text );
      ValSer := CalcServico( DatMod.TabServicosCodigoServico.AsString, frmMain.LS, frmMain.BDI, True );
      if ValSer < 0 then
      begin
         if DatMod.TabCompServ.FindKey([ CodSer, CodSerComp ]) then
            DatMod.TabCompServ.Delete;
      end
      else
         if DatMod.TabCompServ.State in [ dsInsert, dsEdit ] then
            DatMod.TabCompServ.Post;
      DatMod.TabServicos.Refresh;
      AtualizaComposicao( Sender );
   end;
end;

procedure TfrmCadServ.SBtnAltSerClick(Sender: TObject);
var
  CodSer, CodSerComp: String;
  ValSer: real;

  begin
   frmCompServico.Caption := 'Alterar Serviço...';
   frmCompServico.inclui := False;
   frmCompServico.Edit1.Text := IntToStr(DatMod.QryCServ.FieldByName('Quantidade').Value);
   CodSer     := DatMod.TabServicosCodigoServico.AsString;
   CodSerComp := DatMod.TabCompServCodigoServComp.AsString;
   if frmCompServico.ShowModal = mrOk then begin
      DatMod.TabCompServ.FindKey([ CodSer, CodSerComp ]);
      DatMod.TabCompServ.Edit;
      DatMod.TabCompServ.FieldByName('Quantidade').Value := StrToFloat( frmCompServico.Edit1.Text );
      ValSer := CalcServico( DatMod.TabServicosCodigoServico.AsString, frmMain.LS, frmMain.BDI, True );
      if ValSer < 0 then
      begin
         if DatMod.TabCompServ.FindKey([ CodSer, CodSerComp ]) then
            DatMod.TabCompServ.Delete;
      end
      else
         if DatMod.TabCompServ.State in [ dsInsert, dsEdit ] then
            DatMod.TabCompServ.Post;
      DatMod.TabServicos.Refresh;
      AtualizaComposicao( Sender );
   end;
end;

procedure TfrmCadServ.DBGrid1DblClick(Sender: TObject);
begin
   PageCad.ActivePage := TabDetalhe;
end;

procedure TfrmCadServ.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if DatMod.TabServicos.State in [ dsInsert, dsEdit ] then
      DatMod.TabServicos.Cancel;
end;

end.

