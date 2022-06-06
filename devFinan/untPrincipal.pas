unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    PlanodeContas1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    ContasaReceber1: TMenuItem;
    procedure PlanodeContas1Click(Sender: TObject);
    procedure ContasaReceber1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untCadPlano, untCadReceber;

{$R *.dfm}

procedure TfrmPrincipal.PlanodeContas1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmCadPlano, frmCadPlano);
  frmCadPlano.ShowModal;
end;

procedure TfrmPrincipal.ContasaReceber1Click(Sender: TObject);
begin
  frmCadReceber.ShowModal;
end;

end.
