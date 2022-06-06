unit untBackup;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, IBServices, QButtons, IniFiles;

type
  TfrmBackup = class(TForm)
    IBBackupService1: TIBBackupService;
    Label1: TLabel;
    SaveDialog1: TSaveDialog;
    edtCaminho: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

uses untDatMod;

{$R *.xfm}

procedure TfrmBackup.FormShow(Sender: TObject);
var
  inifile: TIniFile;
  caminho: string;

begin
  inifile := TIniFile.Create('convel.ini');
  caminho := inifile.ReadString('Backup', 'Path', 'A:\');
  inifile.Free;
  edtCaminho.Text := caminho;
  IBBackupService1.DatabaseName := dtMod.SQLCon.Params.Values['Database']; ;
end;

procedure TfrmBackup.BitBtn1Click(Sender: TObject);
var
  inifile: TIniFile;
  caminho: string;

begin
  Memo1.Lines.Clear;
  caminho := ExtractFilePath(edtCaminho.Text + 'convel_101.gbk');
  if caminho <> edtCaminho.Text then
    edtCaminho.Text := edtCaminho.Text + '\';

  with IBBackupService1 do
  begin
    Active := True;
    try
      Verbose := True;
      Options := [NonTransportable, IgnoreLimbo];
      BackupFile.Clear;
      BackupFile.Add(edtCaminho.Text + 'convel.gbk');
      ServiceStart;
      while not Eof do
        Memo1.Lines.Insert(0,GetNextLine);
    finally
      Active := False;
      inifile := TIniFile.Create('convel.ini');
      inifile.WriteString('Backup', 'Path', edtCaminho.Text);
      inifile.Free;
      ShowMessage('Backup efutuado com sucesso!');
    end;
  end;
end;

end.

