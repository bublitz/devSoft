unit untCadUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, ComCtrls,
  ToolWin, DB, CheckLst, ExtCtrls;

type
  TfrmCadUsuario = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnEditar: TToolButton;
    ToolButton4: TToolButton;
    btnExcluir: TToolButton;
    btnAtualizar: TToolButton;
    ToolButton7: TToolButton;
    StaticText1: TStaticText;
    edtPesq: TEdit;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    btnGravar: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    chkModulos: TCheckListBox;
    chkAdm: TCheckListBox;
    chkGuardian: TCheckListBox;
    RadioGroup1: TRadioGroup;
    chkEstoque: TCheckListBox;
    chkFinan: TCheckListBox;
    chkReport: TCheckListBox;
    chkGraphic: TCheckListBox;
    procedure btnGravarClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

uses untDatModPrinc, untFuncoes;

{$R *.dfm}

procedure TfrmCadUsuario.btnGravarClick(Sender: TObject);

var
  i, erros: integer;
  direitos: string;

begin
  direitos := IntToStr(RadioGroup1.ItemIndex);
  for i := 0 to chkModulos.Items.Count - 1 do
    if chkModulos.Checked[i] = True then
      direitos := direitos + 'X'
    else
      direitos := direitos + ' ';

  for i := 0 to chkGuardian.Items.Count - 1 do
    if chkGuardian.Checked[i] = True then
      direitos := direitos + 'X'
    else
      direitos := direitos + ' ';

  for i := 0 to chkAdm.Items.Count - 1 do
    if chkAdm.Checked[i] = True then
      direitos := direitos + 'X'
    else
      direitos := direitos + ' ';

  for i := 0 to chkEstoque.Items.Count - 1 do
    if chkEstoque.Checked[i] = True then
      direitos := direitos + 'X'
    else
      direitos := direitos + ' ';

  for i := 0 to chkFinan.Items.Count - 1 do
    if chkFinan.Checked[i] = True then
      direitos := direitos + 'X'
    else
      direitos := direitos + ' ';

  for i := 0 to chkReport.Items.Count - 1 do
    if chkReport.Checked[i] = True then
      direitos := direitos + 'X'
    else
      direitos := direitos + ' ';

  for i := 0 to chkGraphic.Items.Count - 1 do
    if chkGraphic.Checked[i] = True then
      direitos := direitos + 'X'
    else
      direitos := direitos + ' ';

  with dmPrinc do
  begin
    sqlUsuarioDIREITOS.Value := direitos;

    if sqlUsuario.State in [dsInsert, dsEdit] then
      SQLUsuario.Post;

    if SQLUsuario.ChangeCount > 0 then
    begin
      erros := SQLUsuario.ApplyUpdates(-1);
      if erros = 0 then
      begin
        SQLConLocal.Commit(TransDesc);
        TabSheet1.TabVisible := True;
        TabSheet2.TabVisible := False;
      end;
    end
    else
    begin
      TabSheet1.TabVisible := True;
      TabSheet2.TabVisible := False;
    end;
    if SQLConLocal.InTransaction then
      SQLConLocal.Commit(TransDesc);
  end;
end;

procedure TfrmCadUsuario.BitBtn2Click(Sender: TObject);
begin
  with dmPrinc do
  begin
    if SQLUsuario.State in [dsInsert, dsEdit] then
      SQLUsuario.Cancel;
    if SQLConLocal.InTransaction then
      SQLConLocal.Rollback(TransDesc);
  end;
  TabSheet1.TabVisible := True;
  TabSheet2.TabVisible := False;
end;

procedure TfrmCadUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  dmPrinc.sqlLoja.Close;
  dmPrinc.SQLUsuario.Close;
end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  dmPrinc.sqlLoja.Open;
  dmPrinc.SQLUsuario.Open;
end;

procedure TfrmCadUsuario.btnIncluirClick(Sender: TObject);
begin
 with dmPrinc do
  begin
    SQLConLocal.StartTransaction(TransDesc);
    SQLUsuario.Append;
    SQLUsuarioCODIGOLOJA.Value := SQLLojaCODIGOLOJA.VALUE;
    SQLUsuarioCODIGOUSUARIO.AsInteger := GeraCodigoLocal('GEN_CODUSUARIO');
    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmCadUsuario.btnEditarClick(Sender: TObject);
var
  i, c: integer;
  direitos: string;

begin
  with dmPrinc do
  begin
    SQLConLocal.StartTransaction(TransDesc);
    direitos := sqlUsuarioDIREITOS.AsString + Spaces(100);

    try
      RadioGroup1.ItemIndex := StrToInt(direitos[1]);
    except
      RadioGroup1.ItemIndex := -1;
    end;

    c := 2;
    for i := 0 to chkModulos.Items.Count-1 do
    begin
      chkModulos.Checked[i] := (direitos[c]='X');
      Inc(c);
    end;

    for i := 0 to chkGuardian.Items.Count-1 do
    begin
      chkGuardian.Checked[i] := (direitos[c]='X');
      Inc(c);
    end;

    for i := 0 to chkAdm.Items.Count-1 do
    begin
      chkAdm.Checked[i] := (direitos[c]='X');
      Inc(c);
    end;

    for i := 0 to chkEstoque.Items.Count-1 do
    begin
      chkEstoque.Checked[i] := (direitos[c]='X');
      Inc(c);
    end;

    for i := 0 to chkFinan.Items.Count-1 do
    begin
      chkFinan.Checked[i] := (direitos[c]='X');
      Inc(c);
    end;

    for i := 0 to chkReport.Items.Count-1 do
    begin
      chkReport.Checked[i] := (direitos[c]='X');
      Inc(c);
    end;

    for i := 0 to chkGraphic.Items.Count-1 do
    begin
      chkGraphic.Checked[i] := (direitos[c]='X');
      Inc(c);
    end;

    SQLUsuario.Edit;
    TabSheet2.TabVisible := True;
    TabSheet1.TabVisible := False;
    DBEdit2.SetFocus;
  end;

end;

procedure TfrmCadUsuario.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma exclusão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmPrinc.SQLUsuario.Delete;
    dmPrinc.SQLUsuario.ApplyUpdates(-1);
    btnAtualizarClick(Sender);
  end;

end;

procedure TfrmCadUsuario.btnAtualizarClick(Sender: TObject);
begin
 with dmPrinc do
  begin
    if SQLConLocal.InTransaction then
      SQLConLocal.Commit(TransDesc);
    SQLUsuario.Refresh;
  end;
end;

procedure TfrmCadUsuario.edtPesqChange(Sender: TObject);
begin
 if edtPesq.Text <> '' then
   dmPrinc.SQLUsuario.Locate('NomeLogin', edtPesq.Text, [loCaseInsensitive, loPartialKey]);
end;

procedure TfrmCadUsuario.RadioGroup1Click(Sender: TObject);
var i: integer;
begin
  if RadioGroup1.ItemIndex = 0 then //Master
  begin
    for i := 0 to chkModulos.Items.Count - 1 do
      chkModulos.Checked[i] := True;

    for i := 0 to chkGuardian.Items.Count - 1 do
      chkGuardian.Checked[i] := True;

    for i := 0 to chkAdm.Items.Count - 1 do
      chkAdm.Checked[i] := True;

    for i := 0 to chkEstoque.Items.Count - 1 do
      chkEstoque.Checked[i] := True;

    for i := 0 to chkFinan.Items.Count - 1 do
      chkFinan.Checked[i] := True;

    for i := 0 to chkReport.Items.Count - 1 do
      chkReport.Checked[i] := True;

    for i := 0 to chkGraphic.Items.Count - 1 do
      chkGraphic.Checked[i] := True;
  end;
end;

end.
