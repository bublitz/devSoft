unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IniFiles, sysinfo, Buttons;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    ChkBoxDemo: TCheckBox;
    OD: TOpenDialog;
    SD: TSaveDialog;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SI: TSI;
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

uses untCrypt;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
  function soma(st:string):integer;
  var
    i, s: integer;
  begin
    s := 0;
    for i := 1 to Length(st) do
      s := s + Ord(st[i]);
    soma := s;
  end;
var
   arqini: TIniFile;
   path, arq, demo, bin, hx, hex1, hex2, autor: string;
   chave, i: integer;

begin
   path := ExtractFilePath(Application.ExeName);
   arq := 'devSoft.ini';

   arqini := TIniFile.Create( path + arq );
   if ChkBoxDemo.Checked then demo := 'Yes' else
      demo := 'No';

   autor := 'devSoft';

   chave := Soma(autor);

   hx := Crypt( Edit1.Text + Edit2.Text + Edit3.Text +
          Edit4.Text + autor + demo, chave);

   hex1 := '';
   for i := 1 to Length( hx ) do
      if i mod 2 = 1 then
         hex1 := hex1 + hx[i];

   hx := Crypt( SI.CPUType + SI.DriveC + SI.ProductId +
         SI.ProductKey + SI.ProductType +
         SI.RegOrganisation + SI.RegOwner +
         SI.WinBuild + SI.WinType + SI.WinVersion +
         SI.SerialHD, chave);

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
      WriteString( 'Parametros','Hex1', hex1 );

      if ChkBoxDemo.Checked = False then
         WriteString( 'Parametros','Hex2', hex2 );

      {WriteString( 'Base','Tipo', 'Interbase');

      WriteString( 'Interbase','Config', 'Config.itb');

      WriteString( 'Oracle','Config', 'Config.ora');}

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

    arq := 'devSoft.ini';

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
