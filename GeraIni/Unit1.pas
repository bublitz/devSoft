unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Cripto, IniFiles, sysinfo;

type
  TForm1 = class(TForm)
    Cripto: TCriptografa;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Button1: TButton;
    ChkBoxDemo: TCheckBox;
    Button2: TButton;
    SI: TSysInfo;
    OD: TOpenDialog;
    SD: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
var
   arqini: TIniFile;
   path, arq, demo, bin, hx, hex1, hex2, autor: string;
   i: integer;

begin
   if SD.Execute then
      path := ExtractFilePath(SD.FileName)
   else
      path := ExtractFilePath(Application.ExeName);

   arq := 'Drache.ini';

   arqini := TIniFile.Create( path + arq );
   if ChkBoxDemo.Checked then demo := 'Yes' else
      demo := 'No';

   autor := 'Jorge Luis Bublitz';

   cripto.Key := arq;
   cripto.Text := Edit1.Text + Edit2.Text + Edit3.Text +
          Edit4.Text + autor + demo;
   hx := cripto.CriptoHex;

   hex1 := '';
   for i := 1 to Length( hx ) do
      if i mod 2 = 1 then
         hex1 := hex1 + hx[i];

   cripto.Text := SI.CPUType + SI.DriveC + SI.ProductId +
                  SI.ProductKey + SI.ProductType +
                  SI.RegOrganisation + SI.RegOwner +
                  SI.WinBuild + SI.WinType + SI.WinVersion +
                  SI.BiosDate;
   hx := cripto.CriptoHex;

   hex2 := '';
   for i := 1 to Length( hx ) do
      if i mod 2 = 1 then
         hex2 := hex2 + hx[i];

   with arqini do begin
      WriteString( 'Parametros','Author', autor );
      WriteString( 'Parametros','Application', Edit1.Text );
      WriteString( 'Parametros','Version', Edit2.Text );
      WriteString( 'Parametros','ShortAplic', Edit3.Text );
      WriteString( 'Parametros','Register', Edit4.Text );
      WriteString( 'Parametros','Demo', demo );
      WriteString( 'Parametros','Hex', hex1 );

      if ChkBoxDemo.Checked = False then
         WriteString( 'Parametros','HexHardWare', hex2 );

      WriteString( 'Base','Tipo', 'Paradox');

      WriteString( 'Paradox','ConfigParadox', 'Config.par');

      WriteString( 'Oracle','ConfigOracle', 'Config.ora');

   end;
   arqini.Free;
   showmessage( 'Arquivo INI gerado!');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
   arqini: TIniFile;
   path, arq, verdemo: string;

begin
    if OD.Execute then
       path := ExtractFilePath(OD.FileName)
    else
       path := ExtractFilePath(Application.ExeName);

    arq := 'Drache.ini';

    arqini := TIniFile.Create( path + arq );

    Edit1.Text := arqini.ReadString( 'Parametros','Application', '-' );
    Edit3.Text := arqini.ReadString( 'Parametros','ShortAplic', '-' );
    Edit4.Text := arqini.ReadString( 'Parametros','Register', '-' );
    Edit2.Text := arqini.ReadString( 'Parametros','Version', '-' );

    verdemo := arqini.ReadString( 'Parametros','Demo', 'Yes' );

    if verdemo = 'No' then ChkBoxDemo.Checked := False
    else ChkBoxDemo.Checked := True;

    arqini.Free;
    showmessage( 'Arquivo INI Lido!');

end;

end.
