unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ToolWin;

type
  TfrmMain = class(TForm)
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    lblEmpresa: TLabel;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Clientes1: TMenuItem;
    ListadeEspera1: TMenuItem;
    ControledePromoesPanfletos1: TMenuItem;
    Email1: TMenuItem;
    Estaes1: TMenuItem;
    UsuariosdoSistema1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    MovimentaoClientes1: TMenuItem;
    ControledeGastosRecebimentosContaCorrente1: TMenuItem;
    CompradeHorasAntecipadas1: TMenuItem;
    ControledeMilhagens1: TMenuItem;
    ContoledeBnus1: TMenuItem;
    Manuteno1: TMenuItem;
    Backup1: TMenuItem;
    Restore1: TMenuItem;
    Log1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Estaes1Click(Sender: TObject);
    procedure UsuariosdoSistema1Click(Sender: TObject);
    procedure ControledePromoesPanfletos1Click(Sender: TObject);
    procedure Email1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses untCadEstacao, untCadUsuario, untPromocao, untEmail, untClientes,
  untAutEmail;

{$R *.dfm}

procedure TfrmMain.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.Estaes1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadEstacao, frmCadEstacao);
  frmCadEstacao.ShowModal;
end;

procedure TfrmMain.UsuariosdoSistema1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadUsuario, frmCadUsuario);
  frmCadUsuario.ShowModal;
end;

procedure TfrmMain.ControledePromoesPanfletos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPromocao, frmPromocao);
  frmPromocao.ShowModal;
end;

procedure TfrmMain.Email1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmAutEmail, frmAutEmail);
  frmAutEmail.ShowModal;
end;

procedure TfrmMain.Clientes1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmClientes, frmClientes);
  frmClientes.ShowModal;
end;

end.
