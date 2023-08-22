unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ToolWin, ComCtrls, Buttons, ExtCtrls, RXCtrls, Animate, GIFCtrl,
  Cripto, IniFiles;

type
  TFrmMain = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    ConfigurarImpressora1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    CAdastros1: TMenuItem;
    Bancos1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    N2: TMenuItem;
    Histricos1: TMenuItem;
    Pagar1: TMenuItem;
    Bancos2: TMenuItem;
    Lanar3: TMenuItem;
    Caixa1: TMenuItem;
    Lanar4: TMenuItem;
    Relatrios1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    Grupos1: TMenuItem;
    Panel1: TPanel;
    Stat: TStatusBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    N3: TMenuItem;
    Usurios1: TMenuItem;
    PrnSetupDlg: TPrinterSetupDialog;
    Situao1: TMenuItem;
    Panel2: TPanel;
    RxGIF: TRxGIFAnimator;
    RxLabel1: TRxLabel;
    N4: TMenuItem;
    ChequesEmitidos1: TMenuItem;
    ChequesRecebidos1: TMenuItem;
    Clientes2: TMenuItem;
    Fornecedores2: TMenuItem;
    N5: TMenuItem;
    Contas1: TMenuItem;
    Cheques1: TMenuItem;
    ExtratoBancrio1: TMenuItem;
    SaldosBancrios1: TMenuItem;
    Pagar2: TMenuItem;
    Receber2: TMenuItem;
    Pagar3: TMenuItem;
    Receber3: TMenuItem;
    Lanar5: TMenuItem;
    Baixar3: TMenuItem;
    Lanar1: TMenuItem;
    Baixar1: TMenuItem;
    Cript: TCriptografa;
    procedure FormActivate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure ConfigurarImpressora1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Lanar1Click(Sender: TObject);
    procedure Histricos1Click(Sender: TObject);
    procedure Grupos1Click(Sender: TObject);
    procedure Situao1Click(Sender: TObject);
    procedure Baixar1Click(Sender: TObject);
    procedure Lanar2Click(Sender: TObject);
    procedure Baixar2Click(Sender: TObject);
    procedure Pagar2Click(Sender: TObject);
    procedure Receber2Click(Sender: TObject);
    procedure Lanar3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Trava(Sender: TObject);
    function TestaIni(Sender: TObject; path,arquivo: string): boolean;
  private
    { Private declarations }
  public
    { Public declarations }
    NomeAplicacao, SiglaAplic, NomeRegistro, Versao, NomeAutor: string;
    Demo: Boolean;
    MaxRecord: integer;
  end;

var
  FrmMain: TFrmMain;

implementation

uses CadClientes, CadFornec, CadBanco, Sobre, CadPagar, CadTabela, DataMod,
  CadReceber, RelatContas, CadLancto, ReportContas;

{$R *.DFM}

function TFrmMain.TestaIni(Sender: TObject; path,arquivo: string): boolean;
var
   arqini: TIniFile;
   hex, hex1, verdemo: string;

begin
    TestaIni := True; //alterar
    arqini := TIniFile.Create( path + arquivo );

    NomeAplicacao := arqini.ReadString( 'Parametros','Application', '-' );
    SiglaAplic := arqini.ReadString( 'Parametros','ShortAplic', '-' );
    NomeRegistro := arqini.ReadString( 'Parametros','Register', '-' );
    Versao := arqini.ReadString( 'Parametros','Version', '-' );
    NomeAutor := arqini.ReadString( 'Parametros','Author', '-' );

    hex := arqini.ReadString( 'Parametros','Hex', '-' );
    verdemo := arqini.ReadString( 'Parametros','Demo', 'Yes' );

    if verdemo = 'No' then Demo := False
    else Demo := True;

    MaxRecord := 10;

    cript.Key := arquivo;
    cript.Text := NomeAplicacao + Versao + SiglaAplic +
          NomeRegistro + NomeAutor + verdemo;
    hex1 := cript.CriptoHex;

    arqini.Free;

    Application.Title := NomeAplicacao;
    RxLabel1.Caption := NomeAplicacao;
    Stat.Panels[0].Text := 'Copyright (c) 1998,1999 by ' + NomeAutor;
    Stat.Panels[1].Text := Versao;
    Caption := SiglaAplic;

    if hex1 = hex then
       TestaIni := True;

end;

procedure TFrmMain.Trava(Sender: TObject);
begin
   CAdastros1.Enabled := False;
   Pagar1.Enabled := False;
   Bancos2.Enabled := False;
   Caixa1.Enabled := False;
   Relatrios1.Enabled := False;
   SpeedButton2.Enabled := False;
   SpeedButton3.Enabled := False;
   SpeedButton4.Enabled := False;
   SpeedButton5.Enabled := False;
   SpeedButton6.Enabled := False;
   SpeedButton7.Enabled := False;
   SpeedButton8.Enabled := False;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
var path, arquivo: string;
begin
    path := ExtractFilePath(Application.ExeName);
    arquivo := 'Drache.ini';
    if not FileExists( path + arquivo ) then begin
       Trava( Sender );
       Stat.Panels[0].Text := 'Erro #1 (1498) - Chame o suporte! - (065)925-5397 Jorge';
    end;
    if not TestaIni( Sender, path, arquivo ) then begin
       Trava( Sender );
       Stat.Panels[0].Text := 'Erro #2 (1587) - Chame o suporte! - (065)925-5397 Jorge';
    end;
end;

procedure TFrmMain.FormActivate(Sender: TObject);
begin
   FrmMain.Left := 0;
   FrmMain.Top := 0;
   ShortDateFormat := 'dd/MM/yyyy';

   AboutBox.ProductName.Caption := NomeAplicacao;
   AboutBox.Copyright.Caption := 'Copyright (c) 1998,1999 by ' + NomeAutor;

   if Demo then Versao := Versao + ' demo';
   AboutBox.Label1.Caption := 'Versão: ' + Versao + chr(13) + chr(13) +
                               'Registrado para ' + NomeRegistro;

   frmRepContas.QRLabel1.Caption := NomeAplicacao + ' ' + Versao;
   frmRepContas.QRLabel2.Caption := NomeRegistro;

   if Demo then
      AboutBox.ShowModal;
end;

procedure TFrmMain.Sair1Click(Sender: TObject);
begin
   if Application.MessageBox( 'Deseja encerrar ?', 'Atenção',
                              MB_OKCANCEL) = IDOK then
      Close;
end;

procedure TFrmMain.Clientes1Click(Sender: TObject);
begin
   FrmClientes.ShowModal;
end;

procedure TFrmMain.Fornecedores1Click(Sender: TObject);
begin
   FrmFornec.ShowModal;
end;

procedure TFrmMain.Bancos1Click(Sender: TObject);
begin
   FrmBanco.ShowModal;
end;

procedure TFrmMain.ConfigurarImpressora1Click(Sender: TObject);
begin
   PrnSetupDlg.Execute;
end;

procedure TFrmMain.Sobre1Click(Sender: TObject);
begin
   AboutBox.ShowModal;
end;

procedure TFrmMain.Lanar1Click(Sender: TObject);
begin
   with FrmCtasPagar do begin
      SpBtnIncluir.Enabled := True;
      SpBtnAlterar.Enabled := True;
      SpBtnExcluir.Enabled := True;
      SpBtnBaixar.Enabled := False;
      GBoxBaixa.Visible := False;
      ShowModal;
   end;
end;

procedure TFrmMain.Histricos1Click(Sender: TObject);
begin
   FrmTabela.Caption := 'Históricos Bancários';
   FrmTabela.RxDBGrid.DataSource := DatMod.DatHist;
   FrmTabela.Tabela := DatMod.TabHist;
   FrmTabela.ShowModal;
end;

procedure TFrmMain.Grupos1Click(Sender: TObject);
begin
   FrmTabela.Caption := 'Grupos de Conta';
   FrmTabela.RxDBGrid.DataSource := DatMod.DatGrupo ;
   FrmTabela.Tabela := DatMod.TabGrupo;
   FrmTabela.ShowModal;
end;

procedure TFrmMain.Situao1Click(Sender: TObject);
begin
   FrmTabela.Caption := 'Situação das Contas';
   FrmTabela.RxDBGrid.DataSource := DatMod.DatSitu ;
   FrmTabela.Tabela := DatMod.TabSitu;
   FrmTabela.ShowModal;
end;

procedure TFrmMain.Baixar1Click(Sender: TObject);
begin
   with FrmCtasPagar do begin
      SpBtnIncluir.Enabled := False;
      SpBtnAlterar.Enabled := False;
      SpBtnExcluir.Enabled := False;
      SpBtnBaixar.Enabled := True;
      GBoxBaixa.Visible := True;
      ShowModal;
   end;
end;

procedure TFrmMain.Lanar2Click(Sender: TObject);
begin
   with FrmCtasReceb do begin
      SpBtnIncluir.Enabled := True;
      SpBtnAlterar.Enabled := True;
      SpBtnExcluir.Enabled := True;
      SpBtnBaixar.Enabled := False;
      GBoxBaixa.Visible := False;
      ShowModal;
   end;
end;

procedure TFrmMain.Baixar2Click(Sender: TObject);
begin
   with FrmCtasReceb do begin
      SpBtnIncluir.Enabled := False;
      SpBtnAlterar.Enabled := False;
      SpBtnExcluir.Enabled := False;
      SpBtnBaixar.Enabled := True;
      GBoxBaixa.Visible := True;
      ShowModal;
   end;
end;

procedure TFrmMain.Pagar2Click(Sender: TObject);
begin
   FrmRelContas.Tabela := 'Pagar';
   FrmRelContas.ShowModal;
end;

procedure TFrmMain.Receber2Click(Sender: TObject);
begin
   FrmRelContas.Tabela := 'Receber';
   FrmRelContas.ShowModal;
end;

procedure TFrmMain.Lanar3Click(Sender: TObject);
begin
   FrmCadLancto.ShowModal;
end;

end.
