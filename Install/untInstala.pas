unit untInstala;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, LZExpand, StdCtrls, Buttons, ExtCtrls, IBServices,
  IBInstall;

type
  TfrmInstala = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    chkBanco: TCheckBox;
    chkGuardian: TCheckBox;
    chkInter: TCheckBox;
    edtCaminho: TLabeledEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    IBSecurityService1: TIBSecurityService;
    BitBtn4: TBitBtn;
    SpeedButton1: TSpeedButton;
    chkConf: TCheckBox;
    Shape1: TShape;
    Image25: TImage;
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CopyZ(FromFileName, ToFileName: string);
  end;

const
  dirguard = 'C:\devSoft';
  dirbanco = 'C:\devSoft\Dados';

  arqguard: array[0..4,0..1] of string = ( ('devsoft.gu1','devsoft.ini'),
                                           ('devsoft.gu2','devsoft.wav'),
                                           ('guardian.gua','guardian.exe'),
                                           ('imp.gu1','imp.bat'),
                                           ('imp.gu2','imp.bat') );

var
  frmInstala: TfrmInstala;

implementation

uses untMain, untAjuda, untMainPede, untFuncoes;

{$R *.dfm}

procedure TfrmInstala.CopyZ(FromFileName, ToFileName: string);
var
  FromFile, ToFile: File;
begin
  AssignFile(FromFile, FromFileName); { Assign FromFile to FromFileName }
  AssignFile(ToFile, ToFileName);     { Assign ToFile to ToFileName }
  Reset(FromFile);                    { Open file for input }
  try
    Rewrite(ToFile);                  { Create file for output }
    try
      { copy the file an if a negative value is returned }
      { raise an exception }
      if LZCopy(TFileRec(FromFile).Handle, TFileRec(ToFile).Handle) < 0
        then
        raise EInOutError.Create('Erro ao copiar o arquivo ' + ExtractFileName(ToFileName))
    finally
      CloseFile(ToFile);  { Close ToFile }
    end;
  finally
    CloseFile(FromFile);  { Close FromFile }
  end;
end;

procedure TfrmInstala.FormShow(Sender: TObject);
begin
  if frmPrincipal.ShowModal = mrCancel then
    Close;
end;

procedure TfrmInstala.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmInstala.BitBtn1Click(Sender: TObject);
var
  arq1, arq2: TFileName;
  i: integer;
  instib: boolean;

begin
  if chkInter.Checked then
  begin
    ShowMessage('Siga as instruções na tela!!');
    ExecAndWait(ExtractFilePath(Application.ExeName)+'IB6Server\Setup.exe', '', SW_SHOW);
  end;

  if chkConf.Checked then
  begin
    IBSecurityService1.Active := False;
    IBSecurityService1.Params.Clear;
    IBSecurityService1.Params.Add('user_name=SYSDBA');
    IBSecurityService1.Params.Add('password=masterkey');
    try
      IBSecurityService1.Active := True;
      IBSecurityService1.UserName := 'SYSDBA';
      IBSecurityService1.Password := 'devkey';
      IBSecurityService1.ModifyUser;
      IBSecurityService1.Active := False;
    except
      chkConf.Checked := False;
      raise exception.Create('Não foi possível configurar o Interbase!'#13'Ou não é necessário!');
    end;
  end;

  if chkGuardian.Checked then
  begin
    if not DirectoryExists(dirguard) then
      ForceDirectories(dirguard);

    for i := 0 to 4 do
    begin
      arq1 := ExtractFilePath(Application.ExeName) + 'FilesComp\' + arqguard[i,0];
      arq2 := dirguard + '\' + arqguard[i,1];
      CopyZ(arq1, arq2);
    end;
    DefineDataHoraArq('c:\devSoft\devSoft.ini', Now) 
  end;

  if chkBanco.Checked then
  begin
    if not DirectoryExists(dirbanco) then
      ForceDirectories(dirbanco);

    arq1 := ExtractFilePath(Application.ExeName) + 'FilesComp\devsoft.ban';
    arq2 := dirbanco + '\devsoft.gdb';
    CopyZ(arq1, arq2);
  end;

  ShowMessage('Instalação Server concluída com sucesso!');
  chkBanco.Checked := False;
  chkConf.Checked := False;
  chkGuardian.Checked := False;
  chkInter.Checked := False;

end;

procedure TfrmInstala.BitBtn4Click(Sender: TObject);
begin
  frmAjuda.ShowModal;
end;

procedure TfrmInstala.SpeedButton1Click(Sender: TObject);
begin
  frmContraSenha.contador := 1;
  frmContraSenha.ShowModal;
end;

procedure TfrmInstala.BitBtn2Click(Sender: TObject);
var
  arq1, arq2: TFileName;

begin
  arq1 := ExtractFilePath(Application.ExeName) + 'FilesComp\devsoft.fir';
  arq2 := edtCaminho.Text + '\devsoft.ini';
  CopyZ(arq1, arq2);

  arq1 := ExtractFilePath(Application.ExeName) + 'FilesComp\joystick.fir';
  arq2 := edtCaminho.Text + '\joystick.exe';
  CopyZ(arq1, arq2);

  ShowMessage('Instalação finalizada!');
end;

end.
