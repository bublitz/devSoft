unit untIncIcon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, Buttons, StdCtrls, Mask,
  DBClient, DB, ComCtrls, ToolWin, ImgList, ShellAPI;

type
  TfrmIncIcon = class(TForm)
    DBGrid1: TDBGrid;
    diagAtalho: TOpenDialog;
    diagIcone: TOpenDialog;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    ToolButton4: TToolButton;
    btnExcluir: TToolButton;
    ToolButton7: TToolButton;
    Label1: TLabel;
    edtPesq: TEdit;
    panDados: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnAtalho: TSpeedButton;
    btnIcone: TSpeedButton;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    Image1: TImage;
    imgList: TImageList;
    procedure btnAtalhoClick(Sender: TObject);
    procedure btnIconeClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtPesqChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIncIcon: TfrmIncIcon;

implementation

uses untDatMod;

{$R *.dfm}

procedure TfrmIncIcon.btnAtalhoClick(Sender: TObject);
begin
  diagAtalho.InitialDir := ExtractFilePath(Application.ExeName);
  if diagAtalho.Execute then
    dtMod.LocalATALHO.Value := diagAtalho.FileName;
end;

procedure TfrmIncIcon.btnIconeClick(Sender: TObject);
begin
  diagIcone.InitialDir := ExtractFilePath(Application.ExeName) + 'Icons';
  if diagIcone.Execute then
    dtMod.LocalICONE.Value := diagIcone.FileName;
end;

procedure TfrmIncIcon.btnIncluirClick(Sender: TObject);
begin
  panDados.Enabled    := True;
  btnGravar.Enabled   := True;
  btnCancelar.Enabled := True;
  panDados.Cursor     := crDefault;
  btnIncluir.Enabled  := False;
  btnAlterar.Enabled  := False;
  btnExcluir.Enabled  := False;
  dtMod.Local.Append;
  DBedit3.SetFocus;
  dtMod.Local.Cancel;
  dtMod.Local.Append;
  dtMod.LocalMSDOS.AsString := 'F';
  DBedit3.SetFocus;
end;

procedure TfrmIncIcon.btnAlterarClick(Sender: TObject);
begin
  panDados.Enabled    := True;
  btnGravar.Enabled   := True;
  btnCancelar.Enabled := True;
  panDados.Cursor     := crDefault;
  btnIncluir.Enabled  := False;
  btnAlterar.Enabled  := False;
  btnExcluir.Enabled  := False;
  dtMod.Local.Edit;
  DBedit3.SetFocus;
end;

procedure TfrmIncIcon.btnGravarClick(Sender: TObject);
begin
  panDados.Enabled    := False;
  btnGravar.Enabled   := False;
  btnCancelar.Enabled := False;
  panDados.Cursor     := crNo;
  btnIncluir.Enabled  := True;
  btnAlterar.Enabled  := True;
  btnExcluir.Enabled  := True;
  dtMod.Local.Post;
end;

procedure TfrmIncIcon.btnCancelarClick(Sender: TObject);
begin
  panDados.Enabled    := False;
  btnGravar.Enabled   := False;
  btnCancelar.Enabled := False;
  panDados.Cursor     := crNo;
  btnIncluir.Enabled  := True;
  btnAlterar.Enabled  := True;
  btnExcluir.Enabled  := True;
  dtMod.Local.Cancel;
end;

procedure TfrmIncIcon.edtPesqChange(Sender: TObject);
begin
  dtMod.Local.Locate('NOME', edtPesq.Text, [loCaseInsensitive, loPartialKey])
end;

procedure TfrmIncIcon.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma exclusão?','Excluir Ícone', MB_YESNO) = IDYES then
    dtMod.Local.Delete;
end;

procedure TfrmIncIcon.DBEdit4Exit(Sender: TObject);
begin
  Image1.Picture.Icon.Handle := ExtractIcon(Handle, PChar(DBEdit4.Text), 0);
end;

end.

