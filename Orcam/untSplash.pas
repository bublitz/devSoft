unit untSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, jpeg, ComCtrls, Registry;

type
  TSplashForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.DFM}

procedure TSplashForm.FormCreate(Sender: TObject);
var
  RegIni  : TRegIniFile;
  serial  : string;

begin
  RegIni := TRegIniFile.Create('');
  with RegIni do
  begin
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey('\Software\Drache Informática\Drache Orçamentos 1.35',False);
    serial := ReadString('1.35.3.2000','Serial','Não Registrado!');
    Free;
  end;
  Label1.Caption := 'Serial: ' + serial;
end;

end.
