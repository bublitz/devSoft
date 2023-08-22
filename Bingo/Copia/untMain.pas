unit untMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ImgList, ExtCtrls, RXCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Cartelas1: TMenuItem;
    Cadastrar1: TMenuItem;
    Consultar1: TMenuItem;
    Imprimir1: TMenuItem;
    Sorteio1: TMenuItem;
    Iniciar1: TMenuItem;
    ToolbarImages: TImageList;
    N1: TMenuItem;
    Gerar1: TMenuItem;
    SPan: TSecretPanel;
    procedure Sair1Click(Sender: TObject);
    procedure Cadastrar1Click(Sender: TObject);
    procedure Consultar1Click(Sender: TObject);
    procedure Iniciar1Click(Sender: TObject);
    procedure Gerar1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untCadCartela, untConsCartela, untCadSorteio, untSorteio,
  untGeraCartelas, untImpCartelas;

{$R *.DFM}

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrincipal.Cadastrar1Click(Sender: TObject);
begin
   frmCadCartelas.ShowModal;
end;

procedure TfrmPrincipal.Consultar1Click(Sender: TObject);
begin
   frmConsCartelas.ShowModal;
end;

procedure TfrmPrincipal.Iniciar1Click(Sender: TObject);
begin
   if frmCadSorteio.ShowModal = mrOk then
      frmSorteio.ShowModal;
end;

procedure TfrmPrincipal.Gerar1Click(Sender: TObject);
begin
   frmGeraCartelas.ShowModal;
end;

procedure TfrmPrincipal.Imprimir1Click(Sender: TObject);
begin
   frmImpCartelas.ShowModal;
end;

end.
