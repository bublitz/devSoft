unit untDadosGerais;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, Mask, ExtCtrls, Buttons, Grids, DBGrids,
  RxDBComb, ToolEdit, RXDBCtrl;

type
  TfrmDadosGerais = class(TForm)
    DBNav: TDBNavigator;
    Panel1: TPanel;
    PanDados: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label17: TLabel;
    EditDescricao: TDBEdit;
    EditCliente: TDBEdit;
    EditLocal: TDBEdit;
    EditObs: TDBEdit;
    EditLS: TDBEdit;
    BtnIncluir: TSpeedButton;
    BtnAlterar: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnSalvar: TSpeedButton;
    BtnCanc: TSpeedButton;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    EditBDI: TDBEdit;
    EditBDI2: TDBEdit;
    EditBDI3: TDBEdit;
    EditBDI4: TDBEdit;
    EditBDI5: TDBEdit;
    EditBDI6: TDBEdit;
    EditBDI7: TDBEdit;
    EditBDI8: TDBEdit;
    EditBDI9: TDBEdit;
    EditBDI10: TDBEdit;
    DBText2: TDBText;
    BitBtn1: TBitBtn;
    Label18: TLabel;
    Label19: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label20: TLabel;
    DBEdit2: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    Label22: TLabel;
    DBEdit3: TDBEdit;
    Label23: TLabel;
    DBEdit4: TDBEdit;
    procedure AlternaControl(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmDadosGerais: TfrmDadosGerais;
  niv, per: integer;

implementation

uses untDatMod, Funcoes;

{$R *.DFM}

procedure TfrmDadosGerais.AlternaControl(Sender: TObject);
begin
   DBNav.Enabled := not DBNav.Enabled;
   PanDados.Enabled := not PanDados.Enabled;
   BtnIncluir.Enabled := not BtnIncluir.Enabled;
   BtnAlterar.Enabled := not BtnAlterar.Enabled;
   BtnExcluir.Enabled := not BtnExcluir.Enabled;
   BtnSalvar.Enabled := not BtnSalvar.Enabled;
   BtnCanc.Enabled := not BtnCanc.Enabled;
   BitBtn1.Enabled := not BitBtn1.Enabled;
end;

procedure TfrmDadosGerais.BtnIncluirClick(Sender: TObject);
begin
   AlternaControl( Sender );
   Inclui( DatMod.TabDadosGerais );
   DatMod.TabDadosGeraisDataCriacao.AsDateTime := Date;
   DatMod.TabDadosGeraisDataAtualiza.AsDateTime := Date;
   EditDescricao.SetFocus;
end;

procedure TfrmDadosGerais.BtnAlterarClick(Sender: TObject);
var ArqCro: string;
begin
   ArqCro := DatMod.caminhobase + '\Cro' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 ) + '.db';
   if FileExists( ArqCro ) then
   begin
      if Application.MessageBox( 'Se você alterar os dados do cronograma,'#13'você perderá o Cronograma e o Acompanhamento'#13'Confirma ?',
                                 'Atenção !!', MB_OKCANCEL + MB_ICONWARNING) = IDOK then
      begin
         niv := DatMod.TabDadosGeraisNivel.AsInteger;
         per := DatMod.TabDadosGeraisPerodos.AsInteger;
         AlternaControl( Sender );
         DatMod.TabDadosGerais.Edit;
         DatMod.TabDadosGeraisDataAtualiza.AsDateTime := Date;
         EditDescricao.SetFocus;
      end
   end
   else
   begin
         AlternaControl( Sender );
         DatMod.TabDadosGerais.Edit;
         DatMod.TabDadosGeraisDataAtualiza.AsDateTime := Date;
         EditDescricao.SetFocus;
   end;

end;

procedure TfrmDadosGerais.BtnExcluirClick(Sender: TObject);
var
   NomeArq1, NomeArq2, NomeArq3, NomeArq4, path, ext: string;

begin
   path := DatMod.caminhobase + '\';
   ext  := '.db';
   NomeArq1 := 'Orc' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 );
   NomeArq2 := 'Cro' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 );
   NomeArq3 := 'Aco' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 );
   NomeArq4 := 'Ins' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 );
   if Exclui( DatMod.TabDadosGerais ) then
   begin
      if FileExists( path + NomeArq1 + ext ) then
         DeleteFile( PChar( path + NomeArq1 + ext ) );
      if FileExists( path + NomeArq2 + ext ) then
         DeleteFile( PChar( path + NomeArq2 + ext ) );
      if FileExists( path + NomeArq3 + ext ) then
         DeleteFile( PChar( path + NomeArq3 + ext ) );
      if FileExists( path + NomeArq4 + ext ) then
         DeleteFile( PChar( path + NomeArq4 + ext ) );
   end;
end;

procedure TfrmDadosGerais.BtnSalvarClick(Sender: TObject);
var ArqCro: string;
begin
   if DatMod.TabDadosGerais.State in [ dsInsert, dsEdit ] then
   begin
      DatMod.TabDadosGerais.Post;
      if (niv <> myInt(DatMod.TabDadosGeraisNivel.Value)) or
         (per <> DatMod.TabDadosGeraisPerodos.Value) then
      begin
         ArqCro := DatMod.caminhobase + '\Cro' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 ) + '.db';
         DatMod.TabCrono.Close; // se estiver aberto
         DeleteFile( PChar( ArqCro ) );
      end;
   end;
   AlternaControl( Sender );
end;

procedure TfrmDadosGerais.BtnCancClick(Sender: TObject);
begin
   if DatMod.TabDadosGerais.State in [ dsInsert, dsEdit ] then
      DatMod.TabDadosGerais.Cancel;
   AlternaControl( Sender );
end;

procedure TfrmDadosGerais.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
   DatMod.TabDadosGerais.FindNearest([key]);
end;

end.
