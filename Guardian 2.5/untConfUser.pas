unit untConfUser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, RxLookup, StdCtrls, RXCtrls, CheckLst, ExtCtrls, Buttons,
  DBBBtn, NavBtn, DBCtrls, Mask, Grids, DBGrids, DB;

type
  TfrmConfUser = class(TForm)
    Panel2: TPanel;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBGrid1: TDBGrid;
    edtSenha: TEdit;
    Label6: TLabel;
    Panel1: TPanel;
    chkLstEstoque: TCheckListBox;
    sBtnAllEst: TSpeedButton;
    sBtnNotEst: TSpeedButton;
    btnSalvar: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    procedure sBtnAllEstClick(Sender: TObject);
    procedure sBtnNotEstClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure chkLstEstoqueClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbNavBtnSaveBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure DBEdit5Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    altsenha: boolean;
  end;

var
  frmConfUser: TfrmConfUser;

implementation

uses untDtMod;

{$R *.DFM}


procedure TfrmConfUser.sBtnAllEstClick(Sender: TObject);
var
  i: Integer;
begin
  dtMod.tbUser.Edit;
  chkLstEstoqueClick(Sender);
  for i := 0 to chkLstEstoque.Items.Count - 1 do
    chkLstEstoque.Checked[i] := True;
end;

procedure TfrmConfUser.sBtnNotEstClick(Sender: TObject);
var
  i: Integer;
begin
  dtMod.tbUser.Edit;
  chkLstEstoqueClick(Sender);
  for i := 0 to chkLstEstoque.Items.Count - 1 do
    chkLstEstoque.Checked[i] := False;
end;

procedure TfrmConfUser.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfUser.chkLstEstoqueClick(Sender: TObject);
begin
  btnSalvar.Enabled := True;
  dtMod.tbUser.Edit;
end;

procedure TfrmConfUser.btnSalvarClick(Sender: TObject);
var
  direit: string;
  i: integer;
begin
  direit := '                              ';
  for i := 0 to chkLstEstoque.Items.Count - 1 do
    if chkLstEstoque.Checked[i] = True then
      direit[i+1] := 'X';

  if not (dtMod.tbUser.State in [dsInsert,dsEdit]) then
    dtMod.tbUser.Edit;

  dtMod.tbUserDIREITOS.Value := direit;

  dtMod.tbUser.Post;
end;

procedure TfrmConfUser.dbNavBtnSaveBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  if altsenha then
  begin
    if Length(dtMod.tbUserSENHA.AsString) < 6 then
    begin
      raise exception.create( 'A senha deve ter no mínimo 6 caracteres !!' );
      ActionIsDone := False;
      DBEdit5.SetFocus;
    end;
    if dtmod.tbUserSENHA.AsString <> edtSenha.Text then
    begin
      raise exception.create( 'As senhas não são iguais !!' );
      ActionIsDone := False;
      DBEdit5.SetFocus;
    end;
  end;

  if ActionIsDone then
    btnSalvarClick(Sender);

  if dtMod.tbUserDIREITOS.Value = '' then    
    dtMod.tbUserDIREITOS.Value := '       ';
end;

procedure TfrmConfUser.DBEdit5Change(Sender: TObject);
begin
  altsenha := True;
end;

procedure TfrmConfUser.FormShow(Sender: TObject);
begin
  dtMod.tbUserAfterScroll(dtMod.tbUser);
  altsenha := False;
end;

procedure TfrmConfUser.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dtMod.IBTrans.InTransaction then
    dtMod.IBTrans.CommitRetaining;
end;

end.
