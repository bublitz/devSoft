unit untPricIni;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, IniFiles, StdCtrls;

type
  TfrmPrincipal = class(TForm)
    ValList: TValueListEditor;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ini: TIniFile;
    comppass, username, userpass: string;
  end;

var
  frmPrincipal: TfrmPrincipal;

const
  SK = 1;
  MK = 2;
  AK = 2;

implementation

uses untFuncoes;

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ini := TIniFile.Create('Convel.ini');
  ValList.Strings.Values['CompPass'] := EncryptSTR(ini.ReadString('Application', 'CompPass', '-'), SK, MK, AK);
  ValList.Strings.Values['LocalApp'] := ini.ReadString('Application', 'LocalApp', '-');
  ValList.Strings.Values['RemotApp'] := ini.ReadString('Application', 'RemotApp', '-');
  ValList.Strings.Values['LocalRep'] := ini.ReadString('Application', 'LocalRep', '-');
  ValList.Strings.Values['RemotRep'] := ini.ReadString('Application', 'RemotRep', '-');
  ValList.Strings.Values['Banco'   ] := ini.ReadString('Params', 'Banco', '-');
  ValList.Strings.Values['UserName'] := EncryptSTR(ini.ReadString('User', 'UserName', '-'), SK, MK, AK);
  ValList.Strings.Values['UserPass'] := EncryptSTR(ini.ReadString('User', 'UserPass', '-'), SK, MK, AK);
  ValList.Strings.Values['Regional'] := ini.ReadString('Conf', 'Regional', '-');
  ValList.Strings.Values['Setor'   ] := ini.ReadString('Conf', 'Setor', '-');
  ValList.Strings.Values['Path'    ] := ini.ReadString('Backup', 'Path', '-');
  ini.Free;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  ini := TIniFile.Create('Convel.ini');
  ini.WriteString('Application', 'CompPass', EncryptSTR(ValList.Strings.Values['CompPass'], SK, MK, AK));
  ini.WriteString('Application', 'LocalApp', ValList.Strings.Values['LocalApp']);
  ini.WriteString('Application', 'RemotApp', ValList.Strings.Values['RemotApp']);
  ini.WriteString('Application', 'LocalRep', ValList.Strings.Values['LocalRep']);
  ini.WriteString('Application', 'RemotRep', ValList.Strings.Values['RemotRep']);
  ini.WriteString('Params',      'Banco',    ValList.Strings.Values['Banco'   ]);
  ini.WriteString('User',        'UserName', EncryptSTR(ValList.Strings.Values['UserName'], SK, MK, AK));
  ini.WriteString('User',        'UserPass', EncryptSTR(ValList.Strings.Values['UserPass'], SK, MK, AK));
  ini.WriteString('Conf',        'Regional', ValList.Strings.Values['Regional']);
  ini.WriteString('Conf',        'Setor',    ValList.Strings.Values['Setor'   ]);
  ini.WriteString('Backup',      'Path',     ValList.Strings.Values['Path'    ]);
  ini.Free;
end;

end.
