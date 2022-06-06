unit untBackup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  backup, StdCtrls, FileCtrl, ComCtrls, DiskCaps, Buttons;

type
  TfrmBackup = class(TForm)
    BackFiles: TBackupFile;
    FileLstBx: TFileListBox;
    DriveCBox: TDriveComboBox;
    StaticText1: TStaticText;
    PBar: TProgressBar;
    CBoxTam: TComboBox;
    StaticText2: TStaticText;
    LabFile: TLabel;
    StaticText3: TStaticText;
    EdtTitle: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BtnExecClick(Sender: TObject);
    procedure BackFilesProgress(Sender: TObject; Filename: String;
      Percent: TPercentage; var Continue: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
   tamdrive: array[0..4] of integer = (
                   0,   // HD sem limite
             1400000,   // 1.44 MB
             2800000,   // 2.80 MB
           100000000,   // 100 MB
           120000000 ); // 120 MB

var
  frmBackup: TfrmBackup;

implementation

uses untDatMod;

{$R *.DFM}

procedure TfrmBackup.BtnExecClick(Sender: TObject);
var
  arqbak: string;

begin
  Application.MessageBox( 'O(s) disco(s) a serem utilizados devem estar vazios!',
                               'Atenção!', MB_OK + MB_ICONWARNING);
  FileLstBx.Directory := DatMod.caminhobase;
  //'C:\Arquivos de Programas\Drache Orcam\Dados'; // pegar do DatMod
  if CBoxTam.ItemIndex > -1 then
     BackFiles.MaxSize := tamdrive[CBoxTam.ItemIndex]
  else
     BackFiles.MaxSize := 0;

  if EdtTitle.Text <> '' then
     BackFiles.BackupTitle := EdtTitle.Text
  else
     BackFiles.BackupTitle := 'Drache Orcam ' + DateToStr( Date );

  BackFiles.BackupMode := bmAll;
  BackFiles.CompressionLevel := clDefault;
  BackFiles.SaveFileID := True;

  arqbak := DriveCBox.Drive + ':\DraOrcam.Bck';
  //arqbak := 'D:\Temp\DraOrcam.Bck';

  if BackFiles.Backup( FileLstBx.Items, arqbak ) then
    Showmessage('Backup completo. Taxa de compressão = '+inttostr(BackFiles.compressionrate)+' %')
  else
    Showmessage('Backup falhou ou abortado!');
  Close;
end;

procedure TfrmBackup.BackFilesProgress(Sender: TObject; Filename: String;
  Percent: TPercentage; var Continue: Boolean);
begin
   with PBar do
   begin
      visible := Percent < 100;
      if visible then position := Percent;
   end;
   if Percent < 100 then LabFile.caption := Filename else LabFile.caption := '';
end;

procedure TfrmBackup.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmBackup.FormShow(Sender: TObject);
begin
  EdtTitle.Text := 'Drache Orcam ' + DateToStr( Date );
end;

end.
