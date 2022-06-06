unit untSobreMicro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, sysinfo, RXCtrls;

type
  TfrmSobreMicro = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    RxLabel1: TRxLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobreMicro: TfrmSobreMicro;
  SysInf: TSI;

implementation

uses untAutores, untMain;

{$R *.DFM}

procedure TfrmSobreMicro.Button1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmSobreMicro.FormActivate(Sender: TObject);
begin
   Label2.Caption := frmMain.Stat.SimpleText;

   Label4.Caption := 'CPU: ' + SysInf.CPUType;
   Label5.Caption := SysInf.WinType +
                      ' ' + SysInf.WinVersion +
                      ' [' + SysInf.WinBuild + ']';

   Label9.Caption := 'Computador: ' + SysInf.NetComputerName;
   Label10.Caption := 'Pasta Temp: ' + SysInf.WinTempPath;

   //Label6.Caption := 'RAM Total: ' + SysInf.MemTotal;
   //Label7.Caption := 'Swap File: ' + SysInf.SwapFileSize;
   //Label8.Caption := 'Memória Usada: ' + SysInf.MemUsage;
   Update;
end;

procedure TfrmSobreMicro.Image1Click(Sender: TObject);
begin
   frmAutor.ShowModal;
end;

procedure TfrmSobreMicro.FormCreate(Sender: TObject);
begin
  SysInf := TSI.Create( Self );
end;

end.
