unit untConfUser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, RxLookup, StdCtrls, RXCtrls, CheckLst, ExtCtrls, Buttons,
  DBBBtn, NavBtn, DBCtrls, Mask, Grids, DBGrids, DB;

type
  TfrmConfUser = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    chkLstEstoque: TCheckListBox;
    sBtnAllEst: TSpeedButton;
    sBtnNotEst: TSpeedButton;
    Panel2: TPanel;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    btnSalvar: TBitBtn;
    rdGrpConf: TDBRadioGroup;
    DBGrid1: TDBGrid;
    edtSenha: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    procedure AtualizaPerms(Sender: TObject; op: Integer);
    procedure rdGrpConfClick(Sender: TObject);
    procedure sBtnAllEstClick(Sender: TObject);
    procedure sBtnNotEstClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure chkLstEstoqueClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dbNavBtnSaveBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure DBEdit5Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    altsenha: boolean;
  end;

type
  opcao = array[0..5, 1..1] of String;

//                     Estoque
const defi: opcao = (('XXXXXXXXXXX'),
                     ('XXXXXXXXXXX'),
                     ('XXXXX XXXXX'),
                     ('X X X  X X '),
                     ('X   X  X X '),
                     ('X          '));

var
  frmConfUser: TfrmConfUser;

implementation

uses untDtModConf;

{$R *.DFM}


procedure TfrmConfUser.AtualizaPerms(Sender: TObject; op: Integer);
var
  i: Integer;
begin
  for i := 0 to 10 do
    if defi[ op, 1 ][i+1] = 'X' then
      chkLstEstoque.Checked[i] := True
    else
      chkLstEstoque.Checked[i] := False;
end;

procedure TfrmConfUser.rdGrpConfClick(Sender: TObject);
begin
  AtualizaPerms( Sender, rdGrpConf.ItemIndex );
  btnSalvar.Enabled := True;
end;

procedure TfrmConfUser.sBtnAllEstClick(Sender: TObject);
var
  i: Integer;
begin
  chkLstEstoqueClick(Sender);
  for i := 0 to chkLstEstoque.Items.Count - 1 do
    chkLstEstoque.Checked[i] := True;
end;

procedure TfrmConfUser.sBtnNotEstClick(Sender: TObject);
var
  i: Integer;
begin
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
end;

procedure TfrmConfUser.btnSalvarClick(Sender: TObject);
var
  direit: string;
  i: integer;
begin
  direit := '                            ';
  for i := 0 to chkLstEstoque.Items.Count - 1 do
    if chkLstEstoque.Checked[i] = True then
      direit[i+1] := 'X';

  if not (dmConf.tbUser.State in [dsInsert,dsEdit]) then
    dmConf.tbUser.Edit;

  dmConf.tbUserDIREITOS.Value := direit;
end;

procedure TfrmConfUser.dbNavBtnSaveBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  {if altsenha then
  begin
    if Length(dmConf.tbUserSENHA.AsString) < 6 then
    begin
      raise exception.create( 'A senha deve ter no mínimo 6 caracteres !!' );
      ActionIsDone := False;
      DBEdit5.SetFocus;
    end;
    if dmConf.tbUserSENHA.AsString <> edtSenha.Text then
    begin
      raise exception.create( 'As senhas não são iguais !!' );
      ActionIsDone := False;
      DBEdit5.SetFocus;
    end;
  end;

  if ActionIsDone then
    btnSalvarClick(Sender);
  }
end;

procedure TfrmConfUser.DBEdit5Change(Sender: TObject);
begin
  altsenha := True;
end;

procedure TfrmConfUser.FormShow(Sender: TObject);
begin
  dmConf.tbUserAfterScroll(dmConf.tbUser);
  altsenha := False;
end;

end.
