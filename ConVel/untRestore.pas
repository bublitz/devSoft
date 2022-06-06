unit untRestore;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, IBServices, QButtons, IniFiles;

type
  TfrmRestore = class(TForm)
    Label1: TLabel;
    SaveDialog1: TSaveDialog;
    edtCaminho: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    IBRestoreService1: TIBRestoreService;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRestore: TfrmRestore;

implementation

uses untDatMod;

{$R *.xfm}

procedure TfrmRestore.FormShow(Sender: TObject);
var
  inifile: TIniFile;
  caminho: string;

begin
  inifile := TIniFile.Create('convel.ini');
  caminho := inifile.ReadString('Backup', 'Path', 'A:\');
  inifile.Free;
  edtCaminho.Text := caminho;
  IBRestoreService1.DatabaseName.Clear;
  IBRestoreService1.DatabaseName.Add(dtMod.SQLCon.Params.Values['Database']);
end;

procedure TfrmRestore.BitBtn1Click(Sender: TObject);
var
  caminho: string;

begin
  Memo1.Lines.Clear;
  caminho := ExtractFilePath(edtCaminho.Text + 'convel_101.gbk');
  if caminho <> edtCaminho.Text then
    edtCaminho.Text := edtCaminho.Text + '\';

  dtMod.SQLCon.Connected := False;
  with IBRestoreService1 do
  begin
    Active := True;
    try
      Verbose := True;
      Options := [Replace,CreateNewDB];
      BackupFile.Clear;
      BackupFile.Add(edtCaminho.Text + 'convel.gbk');
      ServiceStart;
      While not Eof do
        Memo1.Lines.Insert(0, GetNextLine);
    finally
      Active := False;
      ShowMessage('Restore efutuado com sucesso!');
    end;
  end;
  dtMod.SQLCon.Connected := True;
end;

end.

