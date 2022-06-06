unit untMain;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QExtCtrls, QComCtrls, QImgList, QTypes, QMenus, QButtons;

type
  TfrmMain = class(TForm)
    imgIcons: TImageList;
    imageBottom_Left: TImage;
    lcd: TLCDNumber;
    imageTop_Left: TImage;
    imageMiddle_Left: TImage;
    imageTop_Center: TImage;
    imageTop_Right: TImage;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    imageMiddle_Right: TImage;
    imageBottom_Center: TImage;
    imageBottom_Right: TImage;
    imgLogo: TImage;
    Panel1: TPanel;
    IconView1: TIconView;
    Panel2: TPanel;
    IconView2: TIconView;
    Panel3: TPanel;
    IconView3: TIconView;
    lblDisp: TLabel;
    lblUso: TLabel;
    lblExpi: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    SpeedButton1: TSpeedButton;
    Timer1: TTimer;
    Bevel1: TBevel;
    Label1: TLabel;
    imgAtual2: TImage;
    imgAdic2: TImage;
    imgSair2: TImage;
    imgAbrir2: TImage;
    imgFechar2: TImage;
    imgSair1: TImage;
    imgFechar1: TImage;
    imgAbrir1: TImage;
    imgAdic1: TImage;
    imgAtual1: TImage;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure IconView1ItemClicked(Sender: TObject; Item: TIconViewItem);
    procedure IconView2ItemClicked(Sender: TObject; Item: TIconViewItem);
    procedure IconView3ItemClicked(Sender: TObject; Item: TIconViewItem);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgSair1Click(Sender: TObject);
    procedure imgAbrir1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation


{$R *.xfm}

procedure TfrmMain.FormShow(Sender: TObject);
var i: integer;
begin

  IconView1.Items.Clear;
  for i := 11 to 33 do
  begin
    IconView1.Items.Add;
    IconView1.Items[i-11].Caption := 'LP-'+IntToStr(i);
    IconView1.Items[i-11].ImageIndex := 0;
  end;

  lblDisp.Caption := 'Estações Disponíveis: ' + IntToStr(IconView1.Items.Count);
  lblUso.Caption  := 'Estações em Uso: '      + IntToStr(IconView2.Items.Count);
  lblExpi.Caption := 'Estações Expiradas: '   + IntToStr(IconView3.Items.Count);
  
end;

procedure TfrmMain.IconView1ItemClicked(Sender: TObject;
  Item: TIconViewItem);
begin
  IconView2.SelectAll(False);
  IconView3.SelectAll(False);
  ImgAbrir1.Visible := True;
end;

procedure TfrmMain.IconView2ItemClicked(Sender: TObject;
  Item: TIconViewItem);
begin
  IconView1.SelectAll(False);
  IconView3.SelectAll(False);
  ImgAbrir1.Visible := False;
end;

procedure TfrmMain.IconView3ItemClicked(Sender: TObject;
  Item: TIconViewItem);
begin
  IconView1.SelectAll(False);
  IconView2.SelectAll(False);
  ImgAbrir1.Visible := False;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  lcd.Value := TimeToStr(Time);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  imgAtual1.Top  := imgAtual2.Top;
  imgAdic1.Top   := imgAdic2.Top;
  imgSair1.Top   := imgSair2.Top;
  imgAbrir1.Top  := imgAbrir2.Top;
  imgFechar1.Top := imgFechar2.Top;
  imgAtual1.Left  := imgAtual2.Left;
  imgAdic1.Left   := imgAdic2.Left;
  imgSair1.Left   := imgSair2.Left;
  imgAbrir1.Left  := imgAbrir2.Left;
  imgFechar1.Left := imgFechar2.Left;

end;

procedure TfrmMain.imgSair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.imgAbrir1Click(Sender: TObject);
var
  i: integer;

begin
  if IconView1.SelCount > 0 then
  begin
    IconView2.Items.Add;
    i := IconView2.Items.Count - 1;
    IconView2.Items[i].Caption := IconView1.Items[IconView1.Selected.Index].Caption;
    IconView2.Items[i].ImageIndex := 0;
    IconView1.Items[IconView1.Selected.Index].Destroy;
    IconView1.Realign;

    lblDisp.Caption := 'Estações Disponíveis: ' + IntToStr(IconView1.Items.Count);
    lblUso.Caption  := 'Estações em Uso: '      + IntToStr(IconView2.Items.Count);

  end;
end;

end.
