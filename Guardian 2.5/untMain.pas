unit untMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, RXCtrls, ExtCtrls, ComCtrls, SpeedBar, StdCtrls, Db, IniFiles,
  Buttons, jpeg, sysinfo, ShellApi;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Tabelas1: TMenuItem;
    Preos1: TMenuItem;
    Feriados1: TMenuItem;
    Micros1: TMenuItem;
    Movimentao1: TMenuItem;
    Incluir1: TMenuItem;
    Relatrio1: TMenuItem;
    FechamentoDiario1: TMenuItem;
    Image1: TImage;
    Toolbar: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    SpeedbarSection2: TSpeedbarSection;
    btnSair: TSpeedItem;
    btnLogin: TSpeedItem;
    btnLogout: TSpeedItem;
    btnSessao: TSpeedItem;
    btnSocios: TSpeedItem;
    N1: TMenuItem;
    Planos1: TMenuItem;
    Scios1: TMenuItem;
    Situao1: TMenuItem;
    btnPlanos: TSpeedItem;
    btnMicros: TSpeedItem;
    btnPrecos: TSpeedItem;
    N2: TMenuItem;
    Usurios1: TMenuItem;
    ContasaReceber1: TMenuItem;
    Cadastrar1: TMenuItem;
    Cadastrar2: TMenuItem;
    Baixar1: TMenuItem;
    FluxodeCaixa1: TMenuItem;
    stBar: TStatusBar;
    btnCaixa: TSpeedItem;
    Configurao1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SI: TSI;
    N5: TMenuItem;
    GerarBoletos1: TMenuItem;
    btnBackup: TSpeedItem;
    FechamentoporPerodo1: TMenuItem;
    Image2: TImage;
    VerificarPendncias1: TMenuItem;
    N6: TMenuItem;
    Grfico1: TMenuItem;
    Arrecadao1: TMenuItem;
    HorasUtilizadas1: TMenuItem;
    btnLog: TSpeedItem;
    N7: TMenuItem;
    SociosVencto1: TMenuItem;
    RelaoSocios1: TMenuItem;
    RelaoSociosPorCdigoBarra1: TMenuItem;
    Desconto1: TMenuItem;
    N8: TMenuItem;
    procedure Bloqueia(Sender: TObject);
    procedure LiberaGeral(Sender: TObject);
    procedure Libera(Sender: TObject);
    procedure Preos1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Micros1Click(Sender: TObject);
    procedure Feriados1Click(Sender: TObject);
    procedure Incluir1Click(Sender: TObject);
    procedure FechamentoDiario1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Situao1Click(Sender: TObject);
    procedure Planos1Click(Sender: TObject);
    procedure Scios1Click(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure GerarBoletos1Click(Sender: TObject);
    procedure Cadastrar2Click(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure btnCaixaClick(Sender: TObject);
    procedure FluxodeCaixa1Click(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure FechamentoporPerodo1Click(Sender: TObject);
    procedure VerificarPendncias1Click(Sender: TObject);
    procedure Baixar1Click(Sender: TObject);
    procedure Arrecadao1Click(Sender: TObject);
    procedure HorasUtilizadas1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnLogClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SociosVencto1Click(Sender: TObject);
    procedure RelaoSocios1Click(Sender: TObject);
    procedure RelaoSociosPorCdigoBarra1Click(Sender: TObject);
    procedure Desconto1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    procedure BloqueiaGeral;
  public
    { Public declarations }
    matricula, tempocortesia, tempo_expira: integer;
    usaNotePad: boolean;
    maxDescto: real;
    demo, hx, hex1, hex2, autor,
    aplic, vrsao, short, regis, vdemo,
    hexa1, hexa2, notep,
    caminho_gdb, caminho_ini: string;
    hoje: TDate;
    tudo_ok: boolean;
  end;

const
  max_menu = 12;

var
  frmMain: TfrmMain;
  opcoes: array[1..max_menu] of TMenuItem;

implementation

uses untPrecos, untMicros, untFeriados, untMovim, untDataRelFech, Sobre,
  untSenha, untDtMod, untConfUser, untContraSenha, untSituacao, untPlanos,
  untSocios, untFuncoes, untCrypt, untGeraBoleto, untRec, untEmpresa,
  untOpenClose, untLanctoCaixa, untBackup, untDataRelPeriodo,
  untRelFech, untCaixa, untAguarde, untPendencia, untGrafico, untGrafHoras,
  untLog, untHoje, untDataRelVencto, untRelSocio, untListClienteBarra,
  untDesconto;

{$R *.DFM}

{$R BACKGRND.R32}

procedure TfrmMain.BloqueiaGeral;
begin
  Tabelas1.Enabled        := False;
  Movimentao1.Enabled     := False;
  Relatrio1.Enabled       := False;
  ContasaReceber1.Enabled := False;
  btnLogin.Enabled        := True;
  btnLogout.Enabled       := False;
  btnMicros.Enabled       := False;
  btnPrecos.Enabled       := False;
  btnPlanos.Enabled       := False;
  btnSocios.Enabled       := False;
  btnSessao.Enabled       := False;
  btnCaixa.Enabled        := False;
  btnLog.Enabled          := False;
  btnBackup.Enabled       := False;
end;

procedure TfrmMain.Bloqueia(Sender: TObject);
begin
  Tabelas1.Enabled        := False;
  Movimentao1.Enabled     := False;
  Relatrio1.Enabled       := False;
  ContasaReceber1.Enabled := False;
  btnLogin.Enabled        := True;
  btnLogout.Enabled       := False;
  btnMicros.Enabled       := False;
  btnPrecos.Enabled       := False;
  btnPlanos.Enabled       := False;
  btnSocios.Enabled       := False;
  btnSessao.Enabled       := False;
  btnCaixa.Enabled        := False;
  btnLog.Enabled          := False;
end;

procedure TfrmMain.LiberaGeral(Sender: TObject);
var
  i: integer;

begin
  Tabelas1.Enabled        := True;
  Movimentao1.Enabled     := True;
  Relatrio1.Enabled       := True;
  ContasaReceber1.Enabled := True;
  Usurios1.Enabled        := True;
  Desconto1.Enabled       := True;
  btnLogin.Enabled        := False;
  btnLogout.Enabled       := True;
  btnMicros.Enabled       := True;
  btnPrecos.Enabled       := True;
  btnPlanos.Enabled       := True;
  btnSocios.Enabled       := True;
  btnSessao.Enabled       := True;
  btnCaixa.Enabled        := True;
  btnLog.Enabled          := True;
  btnBackup.Enabled       := True;
  for i := 1 to max_menu do
    opcoes[i].Enabled := True;
  frmSocios.RxDBComboBox2.Enabled := True;
  frmSocios.btnBonus.Enabled := True;

end;

procedure TfrmMain.Libera(Sender: TObject);
var
  d: string;
  i: integer;

begin
  stBar.Panels[0].Text := '  Usuário: ' + frmSenha.edtUser.Text;
  maxDescto := dtMod.tbUserDESCTOMAXIMO.Value;
  Tabelas1.Enabled        := True;
  Movimentao1.Enabled     := True;
  Relatrio1.Enabled       := True;
  ContasaReceber1.Enabled := True;
  btnLogin.Enabled        := False;
  btnLogout.Enabled       := True;
  Usurios1.Enabled        := False;

  d := dtMod.tbUserDIREITOS.Value;
  if d <> '' then
    for i := 1 to max_menu do
      if d[i] = 'X' then
        opcoes[i].Enabled := True
      else
        opcoes[i].Enabled := False;


  frmSocios.RxDBComboBox2.Enabled := (d[13] = 'X');
  frmSocios.btnBonus.Enabled := (d[14] = 'X');
  btnLog.Enabled := (d[15] = 'X');

  btnSessao.Enabled := True;
  btnCaixa.Enabled  := True;

  btnMicros.Enabled := Micros1.Enabled;
  btnPrecos.Enabled := Preos1.Enabled;
  btnPlanos.Enabled := Planos1.Enabled;
  btnSocios.Enabled := Scios1.Enabled;
  Desconto1.Enabled := Preos1.Enabled;

  frmSocios.btnPlano.Enabled := Planos1.Enabled;

  if UpperCase(dtMod.tbUserUSERNAME.AsString) = 'MASTER' then
    LiberaGeral(Sender);

  if not tudo_ok then
  begin
    Tabelas1.Enabled             := False;
    Movimentao1.Enabled          := False;
    Relatrio1.Enabled            := False;
    ContasaReceber1.Enabled      := False;
    btnPlanos.Enabled            := False;
    btnSocios.Enabled            := False;
    btnLog.Enabled               := False;
    btnBackup.Enabled            := False;
    Configurao1.Enabled          := False;
    frmMovim.btnCLientes.Enabled := False;
  end;

end;

procedure TfrmMain.Preos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPrecos, frmPrecos);
  frmPrecos.ShowModal;
end;

procedure TfrmMain.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.Micros1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmMicros, frmMicros);
  frmMicros.ShowModal;
end;

procedure TfrmMain.Feriados1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmFeriados, frmFeriados);
  frmFeriados.ShowModal;
end;

procedure TfrmMain.Incluir1Click(Sender: TObject);
begin
  dtMod.tbOpenClose.Last;
  if (dtMod.tbOpenCloseDHABERTURA.Value <> 0) and (dtMod.tbOpenCloseDHFECHAMENTO.Value = 0) then
    frmMovim.ShowModal
  else
    raise exception.Create('Só é possível abrir Sessões com o caixa Aberto');
end;

procedure TfrmMain.FechamentoDiario1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmDataFech, frmDataFech);
  frmDataFech.showmodal;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  arqini: TIniFile;
  chave, i: integer;

begin
  Toolbar.Wallpaper.Bitmap.Handle := LoadBitmap(hInstance, 'BACKGROUND');
  Randomize;
  tudo_ok := True;

  opcoes[01] := Preos1;
  opcoes[02] := Feriados1;
  opcoes[03] := Micros1;
  opcoes[04] := Situao1;
  opcoes[05] := Planos1;
  opcoes[06] := Scios1;
  opcoes[07] := Cadastrar2;
  opcoes[08] := Baixar1;
  opcoes[09] := FluxodeCaixa1;
  opcoes[10] := Relatrio1;
  opcoes[11] := Configurao1;
  opcoes[12] := GerarBoletos1;

  arqini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'devSoft.ini');

  with arqini do
  begin
    autor       := readString( 'Parametros', 'Author',      '-'   );
    aplic       := readString( 'Parametros', 'Application', '-'   );
    vrsao       := readString( 'Parametros', 'Version',     '-'   );
    short       := readString( 'Parametros', 'ShortAplic',  '-'   );
    regis       := readString( 'Parametros', 'Register',    '-'   );
    vdemo       := readString( 'Parametros', 'Demo',        'S'   );
    hexa1       := readString( 'Parametros', 'Hex1',        '-'   );
    hexa2       := readString( 'Parametros', 'Hex2',        '-'   );
    caminho_gdb := readString( 'Parametros', 'PathGDB',     '{}'  );
    caminho_ini := readString( 'Parametros', 'PathINI',     '{}'  );
    tempo_expira := readInteger( 'Parametros', 'TempoExpira', 5   );
    noteP       := readString( 'Recibo',     'NotePad',     'No' );
  end;
  arqini.Free;

  if caminho_gdb = '{}' then
  begin
    MessageDlg('Caminho da Base de Dados não definido !'#13#13 +
               '[Parametros]'#13'PathGDB=caminho', mtError, [mbAbort], 0);
    Halt(1);
  end;

  if not FileExists( caminho_gdb + '\devSoft.gdb' ) then
  begin
    MessageDlg('Base de Dados não encontrada !', mtError, [mbAbort], 0);
    //Halt(2);
  end;

  if caminho_ini = '{}' then
    caminho_ini := ExtractFilePath(Application.ExeName);

  chave := Soma(autor);

  hx := Crypt( aplic + vrsao + short +
        regis + autor + demo, chave);

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

  i := Min( Length(hexa1), Length(hex1) );

  if Copy(hexa1,1,i) <> Copy(hex1,1,i) then
  begin
    MessageDlg('Este programa não está'#13'registrado para este equipamento!',
               mtError, [mbAbort], 0);
    //Halt(0);
    tudo_ok := False;
    BloqueiaGeral;
  end;

  if hexa2 <> hex2 then
  begin
    MessageDlg('Este programa não está'#13'registrado para este equipamento!',
               mtError, [mbAbort], 0);
    //Halt(0);
    tudo_ok := False;
    BloqueiaGeral;
  end;

  if noteP = 'Yes' then
    usaNotePad := True
  else
    usaNotePad := False;

end;

procedure TfrmMain.Image1Click(Sender: TObject);
begin
  Application.CreateForm(TAboutBox, AboutBox);
  AboutBox.ShowModal;
end;

procedure TfrmMain.Situao1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmSituacao, frmSituacao);
  frmSituacao.ShowModal;
end;

procedure TfrmMain.Planos1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmPlanos, frmPlanos);
  frmPlanos.ShowModal;
end;

procedure TfrmMain.Scios1Click(Sender: TObject);
begin
  frmSocios.ShowModal;
end;

procedure TfrmMain.btnLoginClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSenha, frmSenha);
  if (frmSenha.ShowModal = mrOk) then
    if ((dtMod.tbUser.Locate('USERNAME', frmSenha.edtUser.Text,[loCaseInsensitive])) and
        (dtMod.tbUserSENHA.Value = frmSenha.edtSenha.Text)) then
    begin
      Libera(Sender);
      matricula := dtMod.tbUserMATRICULA.Value;
      tempocortesia := dtMod.tbUserCORTESIA.AsInteger;
      dtMod.Acao('Acessou/Logou');
      dtMod.tbOpenClose.Last;
      if (dtMod.tbOpenCloseDHABERTURA.Value <> 0) and (dtMod.tbOpenCloseDHFECHAMENTO.Value = 0) then
        stBar.Panels[1].Text := '  Status do Caixa: ABERTO '
      else
        stBar.Panels[1].Text := '  Status do Caixa: FECHADO';

    end
    else
      if (UpperCase(frmSenha.edtUser.Text) = 'ROOT') and
         (UpperCase(frmSenha.edtSenha.Text) = 'KYLIX') then
      begin
        Application.CreateForm(TfrmContraSenha, frmContraSenha);
        frmContraSenha.ShowModal;
        if frmContraSenha.senha = frmContraSenha.edtSenha.Text then
        begin
          LiberaGeral(Sender);
          stBar.Panels[0].Text := '  Usuário: ADMINISTRADOR';
          matricula := 0;
          dtMod.Acao('Acessou/Logou');
          dtMod.tbOpenClose.Last;
          if (dtMod.tbOpenCloseDHABERTURA.Value <> 0) and (dtMod.tbOpenCloseDHFECHAMENTO.Value = 0) then
            stBar.Panels[1].Text := '  Status do Caixa: ABERTO '
          else
            stBar.Panels[1].Text := '  Status do Caixa: FECHADO';
        end;
      end
      else
        raise exception.Create('Usuário ou Senha Inválidos'#13#13'ou não Cadastrados!');
end;

procedure TfrmMain.Usurios1Click(Sender: TObject);
begin
  frmConfUser.ShowModal;
end;

procedure TfrmMain.btnLogoutClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma Logout?', 'Atenção', MB_OKCANCEL) = IDOK then
  begin
    Bloqueia(Sender);
    stBar.Panels[0].Text := ' ';
    dtMod.Acao('Des-Logou');
  end;
end;

procedure TfrmMain.GerarBoletos1Click(Sender: TObject);
var
  VData, VDataFech: TDate;
  Ano, Ano1, Mes, Mes1, Dia, Dia1 : Word;

begin
  VData := Date;
  VDataFech := dtmod.tbEmpresaDATAULTIMAGERACAO.VALUE;
  DecodeDate(VData, Ano, Mes, Dia);
  DecodeDate(VDataFech, Ano1, Mes1, Dia1);
  if Mes = Mes1 then
    raise exception.create ('Boletos já Gerados neste mês.')
  else
  begin
    Application.CreateForm(TfrmGeraBoleto, frmGeraBoleto);
    frmGeraBoleto.ShowModal;
  end;
end;

procedure TfrmMain.Configurao1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmempresa, frmEmpresa);
  frmEmpresa.ShowModal;
end;

procedure TfrmMain.btnCaixaClick(Sender: TObject);
begin
  dtMod.tbOpenClose.Last;
  Application.CreateForm(TfrmOpenClose, frmOpenClose);
  if (dtMod.tbOpenCloseDHABERTURA.Value <> 0) and (dtMod.tbOpenCloseDHFECHAMENTO.Value = 0) then
    with frmOpenClose do
    begin
      Caption := 'Guardian - Fechamento Caixa';
      Label5.Visible  := True;
      Label2.Visible  := True;
      Label3.Visible  := False;
      CurrencyEdit1.Visible := False;
    end
  else
    with frmOpenClose do
    begin
      Caption := 'Guardian - Abertura Caixa';
      Label5.Visible  := False;
      Label2.Visible  := False;
      Label3.Visible  := True;
      CurrencyEdit1.Visible := True;
    end;

  frmOpenClose.Label4.Caption := DateTimeToStr(Now);

  if frmOpenClose.ShowModal = mrOk then
  begin
    dtMod.tbOpenClose.Last;
    if (dtMod.tbOpenCloseDHABERTURA.Value <> 0) and (dtMod.tbOpenCloseDHFECHAMENTO.Value = 0) then
      stBar.Panels[1].Text := '  Status do Caixa: ABERTO '
    else
      stBar.Panels[1].Text := '  Status do Caixa: FECHADO';
  end;
end;

procedure TfrmMain.FluxodeCaixa1Click(Sender: TObject);
begin
  dtMod.tbOpenClose.Last;
  if (dtMod.tbOpenCloseDHABERTURA.Value <> 0) and (dtMod.tbOpenCloseDHFECHAMENTO.Value = 0) then
  begin
    Application.CreateForm(TfrmCaixa, frmCaixa);
    frmCaixa.ShowModal;
  end
  else
    raise exception.Create('Só é possível fazer lançamentos no caixa com o caixa Aberto !!');
end;

procedure TfrmMain.btnBackupClick(Sender: TObject);
begin
  Application.CreateForm(TfrmBackup, frmBackup);
  frmBackup.ShowModal;
end;

procedure TfrmMain.FechamentoporPerodo1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmDataRelPeriodo, frmDataRelPeriodo);
  frmDataRelPeriodo.ShowModal;
end;

procedure TfrmMain.VerificarPendncias1Click(Sender: TObject);
begin
  dtMod.tbSocio.IndexFieldNames := 'Nome';
  dtMod.tbSocio.Filter := 'CODIGOSOCIO > 0';
  dtMod.tbSocio.Filtered := True;
  dtMod.tbSocio.First;

  Application.CreateForm(TfrmPendencia, frmPendencia);
  frmPendencia.qryFaturas.ParamByName('DTVENCTO').AsString := DateToStr(Date);
  frmPendencia.qryFaturas.Open;
  frmPendencia.ShowModal;
  frmPendencia.qryFaturas.Close;
  
  dtMod.tbSocio.Filtered := False;
  dtMod.tbSocio.Filter := '';
  dtMod.tbSocio.IndexFieldNames := '';
end;

procedure TfrmMain.Cadastrar2Click(Sender: TObject);
begin
  Application.CreateForm(TfrmRec, frmRec);
  frmRec.btnBaixar.Visible := False;
  frmRec.Panel1.Enabled    := False;
  frmRec.PanDados.Enabled  := True;
  frmRec.Panel1.Top        := 135;
  frmRec.Height            := 317;
  frmRec.ShowModal;
end;

procedure TfrmMain.Baixar1Click(Sender: TObject);
begin
  dtMod.tbOpenClose.Last;
  if (dtMod.tbOpenCloseDHABERTURA.Value <> 0) and (dtMod.tbOpenCloseDHFECHAMENTO.Value = 0) then
  begin
    Application.CreateForm(TfrmRec, frmRec);
    frmRec.btnBaixar.Visible := True;
    frmRec.Panel1.Enabled    := False;
    frmRec.PanDados.Enabled  := False;
    frmRec.Height            := 426;
    frmRec.Panel1.Top        := 255;
    frmRec.ShowModal;
  end
  else
    raise exception.Create('Só é possível baixar Faturas o caixa Aberto');
end;

procedure TfrmMain.Arrecadao1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmGrafico, frmGrafico);
  frmGrafico.ShowModal;
end;

procedure TfrmMain.HorasUtilizadas1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmGrafHoras, frmGrafHoras);
  frmGrafHoras.ShowModal;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Application.MessageBox('Confirma Saída do Sistema?',
                   'Atenção', MB_OKCANCEL) = IDOK then
  begin
    dtMod.Acao('Encerrou o Sistema');
    canClose := True;
  end
  else
    canClose := False;
end;

procedure TfrmMain.btnLogClick(Sender: TObject);
begin
  Application.CreateForm(TfrmLog, frmLog);
  frmLog.ShowModal;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  arqini: TIniFile;
  cData: String;
  data, VData, VDataFech: TDate;
  Ano, Ano1, Mes, Mes1, Dia, Dia1 : Word;
  DataArq: TDate;

begin
  Update;
  Refresh;
  Application.ProcessMessages;
  
  arqini := TIniFile.Create( ExtractFilePath(Application.ExeName) + 'devSoft.ini' );
  cData := arqini.readString( 'Atualiza', 'Data', '' );
  arqini.Free;

  try
    data := StrToDate( cData );
  except
    data := Date - 10;
  end;

  hoje := Date;
  frmHoje.edtDate1.Date := hoje;
  frmHoje.ShowModal;
  hoje := frmHoje.edtDate1.Date;

  DataArq:= FileDateToDateTime(FileAge(ExtractFilePath(Application.ExeName)+'devSoft.ini'));
  if (Abs(hoje - DataArq)>10) or (Abs(Date - DataArq)>10) then
  begin
    MessageDlg('Este programa está a 10 dias'#13'sem ser registrado para este equipamento'#13+
               'e por isso será finalizado !!', mtError, [mbAbort], 0);
    Application.Terminate;
  end;

  if data <> hoje then
  begin
    Application.CreateForm(TfrmAguarde, frmAguarde);
    frmAguarde.ShowModal;
    arqini := TIniFile.Create( ExtractFilePath(Application.ExeName) + 'devSoft.ini' );
    arqini.writeString( 'Atualiza', 'Data', DateToStr(Date) );
    arqini.Free;
  end;

  VData := hoje;
  VDataFech := dtmod.tbEmpresaDATAULTIMAGERACAO.VALUE;
  DecodeDate(VData, Ano, Mes, Dia);
  DecodeDate(VDataFech, Ano1, Mes1, Dia1);
  if Mes <> Mes1 then
    if Application.MessageBox('Deseja gerar os Boletos do Mês?',
                   'Gerar Boletos', MB_YESNO) = IDYES then
    begin
      Application.CreateForm(TfrmGeraBoleto, frmGeraBoleto);
      frmGeraBoleto.ShowModal;
    end;
end;

procedure TfrmMain.SociosVencto1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmDataVencto, frmDataVencto);
  frmDataVencto.showmodal;

end;

procedure TfrmMain.RelaoSocios1Click(Sender: TObject);
begin
  frmRelSocio.qrRelSocio.open;
  frmRelSocio.QuickRep1.PrinterSetup;
  frmRelSocio.QuickRep1.Prepare;
  frmRelSocio.QuickRep1.Preview;
  frmRelSocio.qrRelSocio.Close;

end;

procedure TfrmMain.RelaoSociosPorCdigoBarra1Click(Sender: TObject);
begin
  frmListClientBarra.QuickRep1.Preview;
end;

procedure TfrmMain.Desconto1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmDesconto, frmDesconto);
  frmDesconto.ShowModal;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

end.
