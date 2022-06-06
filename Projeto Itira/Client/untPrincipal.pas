unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CategoryButtons, XPMan, ImgList, ActnList, ComCtrls, ExtCtrls, jpeg,
  DB, Grids, DBGrids;

type
  TfrmPrincipal = class(TForm)
    CategoryButtons1: TCategoryButtons;
    ActionList1: TActionList;
    imgButtons: TImageList;
    XPManifest1: TXPManifest;
    acConfImp: TAction;
    acSair: TAction;
    acClientes: TAction;
    acFornec: TAction;
    acFPagto: TAction;
    acGrupos: TAction;
    acProdutos: TAction;
    acOrcam: TAction;
    acCtasReceb: TAction;
    PgPrinc: TPageControl;
    tbPrinc: TTabSheet;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure Image2Click(Sender: TObject);
    procedure acOrcamExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untDM, untTeste;

{$R *.dfm}

procedure TfrmPrincipal.acOrcamExecute(Sender: TObject);
//var
//  tab: TTabSheet;
//  i: integer;

begin
{  for i := 0 to Pred(PgPrinc.PageCount) do
    if PgPrinc.Pages[i].Caption = frmOrcam.Caption then
    begin
      PgPrinc.ActivePage := PgPrinc.Pages[i];
      exit;
    end;
  tab := TTabSheet.Create(PgPrinc);
  tab.PageControl := PgPrinc;
  tab.Caption := frmOrcam.Caption;
  tab.ImageIndex := 2;
  PgPrinc.ActivePage := tab;
  with TfrmOrcam.Create(tab) do
  begin
    BorderStyle := bsNone;
    Align := alClient;
    Parent := tab;
    Show;
  end;}
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  PgPrinc.ActivePage := tbPrinc;
  ShortDateFormat := 'dd/MM/yyyy';
  //dmPrinc.cdsPesqCli.Params[0].AsString := '%';
  //dmPrinc.cdsPesqCli.Open;
end;

procedure TfrmPrincipal.Image2Click(Sender: TObject);
begin
  frmTeste.showmodal;
end;

end.
