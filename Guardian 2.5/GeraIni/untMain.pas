unit untMain;

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
    SI: TSI;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
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

  function DefineDataHoraArq(NomeArq: string; DataHora: TDateTime): boolean;
  var
    F: integer;
  begin
    Result := false;
    F := FileOpen(NomeArq, fmOpenWrite or fmShareDenyNone);
    try
      if F > 0 then
        Result := FileSetDate(F, DateTimeToFileDate(DataHora)) = 0;
    finally
      FileClose(F);
    end;
  end;

var
   arqini: TIniFile;
   param, path, arq, demo, bin, hx, hex1, hex2, autor: string;
   chave, i: integer;

begin
   param := ParamStr(1)+ParamStr(2)+ParamStr(3)+ParamStr(4)+ParamStr(5)+ParamStr(6);
   if param <> '.devSoftC:\devSoft\.devSoft.iniInformática'#127 then
      Halt(0);

   path := ParamStr(3);
   arq := ParamStr(5);
   
   param := '';
   for i := 7 to ParamCount do
     param := param + ParamStr(i);

   Edit4.Text := param;
   arqini := TIniFile.Create(path+arq);
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

   end;
   arqini.Free;
   DefineDataHoraArq(path+arq, Now) ;
   showmessage('Arquivo INI gerado!');
   Halt(0);
end;

end.
