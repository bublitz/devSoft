unit untPrincipalEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, SpeedBar, ExtCtrls;

type
  TfrmPrincipalEst = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Carto1: TMenuItem;
    Cliente1: TMenuItem;
    Fornecedor1: TMenuItem;
    Grupo1: TMenuItem;
    Moeda1: TMenuItem;
    Produto1: TMenuItem;
    Pagamento1: TMenuItem;
    Recebimento1: TMenuItem;
    SubGrupo1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    MovimentoVenda1: TMenuItem;
    PedidoCompra1: TMenuItem;
    PedidoVenda1: TMenuItem;
    Toolbar: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    SpeedbarSection2: TSpeedbarSection;
    ExitBtn: TSpeedItem;
    View1Btn: TSpeedItem;
    View2Btn: TSpeedItem;
    View3Btn: TSpeedItem;
    WizardBtn: TSpeedItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    Linhas1: TMenuItem;
    Conjunto1: TMenuItem;
    Pedras1: TMenuItem;
    SpeedItem1: TSpeedItem;
    SpeedItem2: TSpeedItem;
    Relatrio1: TMenuItem;
    EmissodeEtiquetas1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Carto1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Grupo1Click(Sender: TObject);
    procedure Moeda1Click(Sender: TObject);
    procedure Pagamento1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure Recebimento1Click(Sender: TObject);
    procedure SubGrupo1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Linhas1Click(Sender: TObject);
    procedure Conjunto1Click(Sender: TObject);
    procedure PedidoCompra1Click(Sender: TObject);
    procedure PedidoVenda1Click(Sender: TObject);
    procedure Pedras1Click(Sender: TObject);
    procedure SpeedItem1Click(Sender: TObject);
    procedure SpeedItem2Click(Sender: TObject);
    procedure EmissodeEtiquetas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalEst: TfrmPrincipalEst;

implementation

uses untAdmCartao, untCliente, untGrupo, untMoeda, untFormaPaga,
  untFormaRec, untSubGrupo, untFornec, untProd, untLinha, untConjunto,
  untPedidoComp, untPedidoVend, untPedra, untSelEti;

{$R *.DFM}

procedure TfrmPrincipalEst.FormCreate(Sender: TObject);
begin
  Toolbar.Wallpaper.Bitmap.Handle := LoadBitmap(hInstance, 'BACKGROUND')
end;

procedure TfrmPrincipalEst.Carto1Click(Sender: TObject);
begin
  frmAdmCartao.ShowModal;
end;

procedure TfrmPrincipalEst.Cliente1Click(Sender: TObject);
begin
  frmCliente.ShowModal;
end;

procedure TfrmPrincipalEst.Fornecedor1Click(Sender: TObject);
begin
  frmFornec.ShowModal;
end;

procedure TfrmPrincipalEst.Grupo1Click(Sender: TObject);
begin
  frmGrupo.ShowModal;
end;

procedure TfrmPrincipalEst.Moeda1Click(Sender: TObject);
begin
  frmMoeda.ShowModal;
end;

procedure TfrmPrincipalEst.Pagamento1Click(Sender: TObject);
begin
  frmFormaPaga.ShowModal;
end;

procedure TfrmPrincipalEst.Produto1Click(Sender: TObject);
begin
  frmProd.ShowModal;
end;

procedure TfrmPrincipalEst.Recebimento1Click(Sender: TObject);
begin
  frmFormaRec.ShowModal;
end;

procedure TfrmPrincipalEst.SubGrupo1Click(Sender: TObject);
begin
  frmSubGrupo.ShowModal;
end;

procedure TfrmPrincipalEst.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipalEst.Linhas1Click(Sender: TObject);
begin
  frmLinha.ShowModal;
end;

procedure TfrmPrincipalEst.Conjunto1Click(Sender: TObject);
begin
  with frmConjunto do
  begin
    qryPesq.Close;
    qryConj.Close;
    qryProd.Close;
    qryPesq.Open;
    qryConj.Open;
    qryProd.Open;
    ShowModal;
  end;
end;

procedure TfrmPrincipalEst.PedidoCompra1Click(Sender: TObject);
begin
  frmPedidoComp.ShowModal;
end;

procedure TfrmPrincipalEst.PedidoVenda1Click(Sender: TObject);
begin
  frmPedVend.ShowModal;
end;

procedure TfrmPrincipalEst.Pedras1Click(Sender: TObject);
begin
  frmPedra.ShowModal;
end;

procedure TfrmPrincipalEst.SpeedItem1Click(Sender: TObject);
begin
  frmGrupo.ShowModal;
end;

procedure TfrmPrincipalEst.SpeedItem2Click(Sender: TObject);
begin
  frmSubGrupo.ShowModal;
end;

procedure TfrmPrincipalEst.EmissodeEtiquetas1Click(Sender: TObject);
begin
  Application.CreateForm (TfrmSelEti, frmSelEti);
  frmSelEti.ShowModal;
end;

end.
