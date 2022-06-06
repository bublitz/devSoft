unit untBackup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ibman, StdCtrls, Buttons, IniFiles, TFlatSpeedButtonUnit,
  TFlatTabControlUnit, ComCtrls;

type
  TfrmBackup = class(TForm)
    IbMan: TIbManager;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    edtPatch: TEdit;
    Label2: TLabel;
    btnBackup: TFlatSpeedButton;
    Label3: TLabel;
    edtRestore: TEdit;
    Label4: TLabel;
    btnRestaura: TFlatSpeedButton;
    stBar: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBackupClick(Sender: TObject);
    procedure btnRestauraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmBackup.FormShow(Sender: TObject);
var
  arqini: TIniFile;

begin
  arqini := TIniFile.Create( ExtractFilePath(Application.ExeName) + 'devSoft.ini' );
  edtPatch.Text := arqini.readString( 'Backup','Path', '' );
  edtRestore.Text := edtPatch.Text;
  arqini.Free;
end;

procedure TfrmBackup.FormClose(Sender: TObject; var Action: TCloseAction);
var
  arqini: TIniFile;

begin
  arqini := TIniFile.Create( ExtractFilePath(Application.ExeName) + 'devSoft.ini' );
  arqini.WriteString( 'Backup','Path', edtPatch.Text );
  arqini.Free;
  Action := caFree;
end;

procedure TfrmBackup.btnBackupClick(Sender: TObject);
begin
  IbMan.Filename := dtMod.dtBase.DatabaseName;
  IbMan.Destination := edtPatch.Text + '\devSoft.gbk';
  if IbMan.Backup(false,true) then
    MessageDlg('Backup efetuado com sucesso', mtInformation, [mbOk], 0)
  else
    MessageDlg('Backup não foi efetuado com sucesso', mtError, [mbAbort], 0);
end;

procedure TfrmBackup.btnRestauraClick(Sender: TObject);
begin
  IbMan.Filename := dtMod.dtBase.DatabaseName;
  stBar.SimpleText := 'Aguarde... Desconectando usuários...';
  dtMod.IBTrans.Commit;
  dtMod.dtBase.Close;
  IbMan.Destination := edtPatch.Text + '\devSoft.gbk';
  IbMan.ShutDown(true);
  stBar.SimpleText := 'Aguarde... Restaurando backup...';
  if IbMan.Restore(true) then
    MessageDlg('Restore efetuado com sucesso', mtInformation, [mbOk], 0)
  else
    MessageDlg('Restore não foi efetuado com sucesso', mtError, [mbAbort], 0);
  stBar.SimpleText := 'Aguarde... Conectando ao Banco...';
  dtMod.DataModuleCreate(dtMod);
  stBar.SimpleText := '';
end;

end.

