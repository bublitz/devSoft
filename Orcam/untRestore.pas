unit untRestore;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, backup, RXCtrls, Buttons, ComCtrls;

type
  TfrmRestore = class(TForm)
    BackupFile1: TBackupFile;
    DriveCBox: TDriveComboBox;
    StaticText1: TStaticText;
    MeFiles: TMemo;
    LabAchou: TRxLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabFile: TLabel;
    PBar: TProgressBar;
    procedure DriveCBoxChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BackupFile1Progress(Sender: TObject; Filename: String;
      Percent: TPercentage; var Continue: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRestore: TfrmRestore;

implementation

uses untDatMod;

{$R *.DFM}

procedure TfrmRestore.DriveCBoxChange(Sender: TObject);
var
   files: tstringlist;
   I: integer;
   S, FA, SZ: string;

begin
   files := TStringlist.create;
   MeFiles.lines.clear;
   LabAchou.Caption := backupfile1.getArchiveTitle( DriveCBox.Drive + ':\DraOrcam.Bck', files);

   MeFiles.lines.beginupdate;
   for I := 0 to files.count-1 do
   begin
        S  := copy(files[i],1,pos(#9,Files[i])-1);  //file name
        FA := copy(files[i],pos(#9,Files[i])+1,pos('=',Files[i])-pos(#9,Files[i])-1);  //file age
        FA := DateToStr(
              FileDateToDateTime(
              StrtoInt(FA)       //integer file date is system + language independent!
              ));
        SZ := copy(files[i],pos('=',Files[i])+1, length(Files[i])-pos('=',Files[i]));  //file size in Bytes
        MeFiles.lines.add(S + ' from ' + FA + ', ' + SZ + ' bytes');
   end;
   if files.count = 0 then MeFiles.lines.add('Não encontrei arquivo de Backup.');
   MeFiles.lines.endupdate;
end;

procedure TfrmRestore.BitBtn1Click(Sender: TObject);
begin
   if Application.MessageBox( 'Confirma a restauração do backup ?', 'ATENÇÃO !!',
                              MB_OKCANCEL + MB_ICONWARNING) = IDOK then begin
      Datmod.DataBase.Connected := False;

      backupfile1.Restoremode := TRestoreMode(0);
      backupfile1.restoreFullpath := True;
      if backupfile1.restore(DriveCBox.Drive + ':\DraOrcam.Bck', '') then
         showmessage('Restauração realizada com sucesso!'+chr(13)+inttostr(backupfile1.FilesProcessed)+' aquivos de '+inttostr(backupfile1.FilesTotal)+' foram restaurados.')
      else
         showmessage('Restauração falhou ou abortada pelo usuário!');

      with Datmod do
      begin
        DataBase.Connected := True;
        TabInsumos.Open;
        TabCompInsu.Open;
        TabCompServ.Open;
        TabServicos.Open;
        TabTPeri.Open;
        TabDadosGerais.Open;
        TabDadosGerais.IndexName := 'IndDesc';
        TabDadosGerais.First;
      end;
      Close;
  end;
end;

procedure TfrmRestore.BitBtn3Click(Sender: TObject);
begin
     if not BackupFile1.busy then close
     else if Application.MessageBox( 'Cancela a restauração do backup ?', 'ATENÇÃO !!',
                              MB_YESNO + MB_ICONWARNING) = IDYES
          then Backupfile1.Stop;
end;

procedure TfrmRestore.BackupFile1Progress(Sender: TObject;
  Filename: String; Percent: TPercentage; var Continue: Boolean);
begin
   with PBar do
   begin
      visible := Percent < 100;
      if visible then position := Percent;
   end;
   if Percent < 100 then LabFile.caption := Filename else LabFile.caption := '';
end;

end.
