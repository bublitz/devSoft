unit untMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IniFiles, ComCtrls, RXCtrls, ToolWin, Menus, StdCtrls,
  dbTables, db, BDE, ShellApi, QRPrntr, Buttons, ExtCtrls, ImgList, sysinfo,
  SpeedBar, RxGIF, Grids, DBGrids, Registry, OleServer, Excel97, ComObj;

type
  TfrmMain = class(TForm)
    RxLabel1: TRxLabel;
    Stat: TStatusBar;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Insumos1: TMenuItem;
    Cadastrar1: TMenuItem;
    AlterarPreos1: TMenuItem;
    N1: TMenuItem;
    Listagem1: TMenuItem;
    Servios1: TMenuItem;
    Cadastrar2: TMenuItem;
    N2: TMenuItem;
    Listagem2: TMenuItem;
    RxLabel2: TRxLabel;
    LabParam: TLabel;
    Parmetros1: TMenuItem;
    ConfigurarImpressora1: TMenuItem;
    N3: TMenuItem;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Oramentos1: TMenuItem;
    Abrir1: TMenuItem;
    EditarOramento1: TMenuItem;
    N4: TMenuItem;
    ImprimirOramento1: TMenuItem;
    ImprimirInsumos1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    Fechar1: TMenuItem;
    Sobreomicrro1: TMenuItem;
    ConfigurarPgina1: TMenuItem;
    ImageList1: TImageList;
    N5: TMenuItem;
    RecalculodoOramento1: TMenuItem;
    Cronograma1: TMenuItem;
    EditarCronograma1: TMenuItem;
    Criar1: TMenuItem;
    N6: TMenuItem;
    Imprimir1: TMenuItem;
    Acompanhamento1: TMenuItem;
    Nodisponvel1: TMenuItem;
    ImprimirInsumos2: TMenuItem;
    Editar1: TMenuItem;
    N7: TMenuItem;
    Imprimir2: TMenuItem;
    Insumos2: TMenuItem;
    CriarTabeladeInsumos1: TMenuItem;
    Atualizarvalores1: TMenuItem;
    CadastraPerodos1: TMenuItem;
    Toolbar: TSpeedBar;
    SpeedbarSection1: TSpeedbarSection;
    SpeedItem1: TSpeedItem;
    SpeedItem2: TSpeedItem;
    SpeedbarSection2: TSpeedbarSection;
    SpeedItem4: TSpeedItem;
    SpeedItem5: TSpeedItem;
    SpeedItem6: TSpeedItem;
    SpeedItem7: TSpeedItem;
    SpeedbarSection3: TSpeedbarSection;
    SpeedItem8: TSpeedItem;
    SpeedbarSection4: TSpeedbarSection;
    SpeedItem9: TSpeedItem;
    DadosGerais1: TMenuItem;
    ImprimirComposies1: TMenuItem;
    CronogramaFsico1: TMenuItem;
    CronogramaFinanceiro1: TMenuItem;
    FsicoFinanceiro1: TMenuItem;
    Utilitrios1: TMenuItem;
    Backup1: TMenuItem;
    Restaurabackup1: TMenuItem;
    ExcelApplication1: TExcelApplication;
    function CopyTable( Sender: TObject; Table: ttable; TableName: string; Overwrite: boolean):boolean;
    procedure GetParam(Sender: TObject);
    procedure PutParam(Sender: TObject);
    function TestaIni(Sender: TObject; path, arquivo: string): boolean;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Cadastrar1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Cadastrar2Click(Sender: TObject);
    procedure ConfigurarImpressora1Click(Sender: TObject);
    procedure Parmetros1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure EditarOramento1Click(Sender: TObject);
    procedure Sobreomicrro1Click(Sender: TObject);
    procedure ImprimirOramento1Click(Sender: TObject);
    procedure ImprimirInsumos1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConfigurarPgina1Click(Sender: TObject);
    procedure Listagem1Click(Sender: TObject);
    procedure AlterarPreos1Click(Sender: TObject);
    procedure RecalculodoOramento1Click(Sender: TObject);
    procedure Listagem2Click(Sender: TObject);
    procedure Criar1Click(Sender: TObject);
    procedure CadastraPerodos1Click(Sender: TObject);
    procedure EditarCronograma1Click(Sender: TObject);
    procedure DadosGerais1Click(Sender: TObject);
    procedure CriarTabeladeInsumos1Click(Sender: TObject);
    procedure Atualizarvalores1Click(Sender: TObject);
    procedure ImprimirComposies1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CronogramaFsico1Click(Sender: TObject);
    procedure CronogramaFinanceiro1Click(Sender: TObject);
    procedure ImprimirInsumos2Click(Sender: TObject);
    procedure FsicoFinanceiro1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    NomeAplicacao, SiglaAplic, NomeRegistro, Versao, NomeAutor: string;
    Demo: Boolean;
    MaxRecord: integer;
    TipoDados, ConfParadox, ConfOracle: string;

    LS, BDI: real;

    PageSize, FormatCro: string;
    PageWidth, PageLength, PageTop,
    PageBottom, PageLeft: real;
    LnGrade: Boolean;

    TemCrono, TemAcomp, TemInsu: boolean;

  end;

var
  frmMain: TfrmMain;
  vExcel: variant;
  campos: array[1..999] of TField;
  SI: TSI;

implementation

uses untSobre, untCadInsu, untCadServ, untParam, untDadosGerais,
  untDatMod, Funcoes, untEditOrcam, untCalculo, untSobreMicro, untReport,
  untImpOrcam, untImpInsu, untImpInsOrc, untImpInsCot, untConfPag,
  untImpInsumos, untImpIns, untAltPrecos, untRecal, untImpOrca,
  untImpOrcamPaisa, untImpSer, untImpServAna, untFrmImpSer, untPreview,
  untTipoPeri, untEdtCrono, untVisDadGer, untAtuIns, untCadInsOrc,
  untEditAcomp, untInsCrono, untImpInsCro;

{$R *.DFM}

function GetErrorString(Code: DBIResult): string;
var
   Msg: DBIMSG;
begin
   DbiGetErrorString(Code, Msg);
   Result := Msg;
   Trim(Result);
end;

function TFrmMain.CopyTable( Sender: TObject; Table: ttable; TableName: string; Overwrite: boolean):boolean;
var
   props: curprops;
   dbRes: DBIResult;
   ok: boolean;

begin
   ok := true;
   dbRes := dbiGetCursorProps(Table.handle, props );
   if dbRes <> DBIERR_NONE then begin
      ShowMessage(GetErrorString(dbRes));
      Halt(1);
   end
   else begin
      dbRes := dbiCopyTable(table.dbhandle, overwrite, PChar(Table.TableName),
                         props.szTableType, PChar(TableName));
      if dbRes <> DBIERR_NONE then begin
         ShowMessage('Erro: '+Table.TableName+' -> '+GetErrorString(dbRes));
         ok := false;
      end;
   end;
   CopyTable := ok;
end;

procedure TFrmMain.GetParam(Sender: TObject);
var
   arqini: TIniFile;
   path, arquivo, grade: string;

begin
    path := ExtractFilePath(Application.ExeName);
    arquivo := 'Orcam.ini';
    arqini := TIniFile.Create( path + arquivo );
    LS := StrToFloat(arqini.ReadString( 'Parametros','LS', '0' ));
    BDI := StrToFloat(arqini.ReadString( 'Parametros','BDI', '0' ));
    PageSize   := arqini.ReadString( 'Page','PaperSize', 'A4' );
    PageWidth  := StrToFloat(arqini.ReadString( 'Page','Width', '210,0' ));
    PageLength := StrToFloat(arqini.ReadString( 'Page','Length', '297,0' ));
    PageTop    := StrToFloat(arqini.ReadString( 'Page','TopMargin', '10,0' ));
    PageBottom := StrToFloat(arqini.ReadString( 'Page','BottomMargin', '15,0' ));
    PageLeft   := StrToFloat(arqini.ReadString( 'Page','LeftMargin', '10,0' ));
    grade      := arqini.ReadString( 'Page','ImpGrade', '0' );
    FormatCro  := arqini.ReadString( 'Page','ForCrono', '1' );
    LnGrade    := iif( grade='1', True, False );
    arqini.Free;
end;

procedure TFrmMain.PutParam(Sender: TObject);
var
   arqini: TIniFile;
   path, arquivo: string;

begin
    path := ExtractFilePath(Application.ExeName);
    arquivo := 'Orcam.ini';
    arqini := TIniFile.Create( path + arquivo );
    arqini.WriteString('Parametros','LS', FloatToStr(LS) );
    arqini.WriteString( 'Parametros','BDI', FloatToStr(BDI) );

    arqini.WriteString( 'Page','PaperSize', PageSize );
    arqini.WriteString( 'Page','Width', FloatToStr(PageWidth));
    arqini.WriteString( 'Page','Length', FloatToStr(PageLength));
    arqini.WriteString( 'Page','TopMargin', FloatToStr(PageTop));
    arqini.WriteString( 'Page','BottomMargin', FloatToStr(PageBottom));
    arqini.WriteString( 'Page','LeftMargin', FloatToStr(PageLeft));
    arqini.WriteString( 'Page','ImpGrade', iif( LnGrade, '1', '0' )) ;
    arqini.WriteString( 'Page','ForCrono', FormatCro );
    arqini.Free;
end;

function TFrmMain.TestaIni(Sender: TObject; path, arquivo: string): boolean;
var
   arqini: TIniFile;
   hx, hex, hex1, hex2, hexhw, verdemo: string;
   i: integer;

begin
    TestaIni := False;
    arqini := TIniFile.Create( path + arquivo );

    NomeAplicacao := arqini.ReadString( 'Parametros','Application', '-' );
    SiglaAplic := arqini.ReadString( 'Parametros','ShortAplic', '-' );
    NomeRegistro := arqini.ReadString( 'Parametros','Register', '-' );
    Versao := arqini.ReadString( 'Parametros','Version', '-' );
    NomeAutor := arqini.ReadString( 'Parametros','Author', '-' );

    hex := arqini.ReadString( 'Parametros','Hex', '-' );
    hexhw := arqini.ReadString( 'Parametros','HexHardWare', '-' );

    verdemo := arqini.ReadString( 'Parametros','Demo', 'Yes' );

    if verdemo = 'No' then Demo := False
    else Demo := True;

    MaxRecord := 10;

    {BitBtn1.Key := arquivo;
    BitBtn1.Text := NomeAplicacao + Versao + SiglaAplic +
          NomeRegistro + NomeAutor + verdemo;
    hx := BitBtn1.CriptoHex;
    hex1 := '';
    for i := 1 to Length( hx ) do
       if i mod 2 = 1 then
          hex1 := hex1 + hx[i];

    BitBtn1.Text := SI.CPUType + SI.DriveC + SI.ProductId +
                    SI.ProductKey + SI.ProductType +
                    SI.RegOrganisation + SI.RegOwner +
                    SI.WinBuild + SI.WinType + SI.WinVersion +
                    SI.BiosDate;
    hx := BitBtn1.CriptoHex;

    hex2 := '';
    for i := 1 to Length( hx ) do
       if i mod 2 = 1 then
          hex2 := hex2 + hx[i];
    }
    arqini.Free;

    Application.Title := NomeAplicacao;
    RxLabel1.Caption := NomeAplicacao;
    Stat.SimpleText := 'Copyright © 2000 by ' + NomeAutor;
    Caption := SiglaAplic;

    //if (hex1 = hex) and (hex2 = hexhw) then
       TestaIni := True;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
var path, arquivo: string;
begin
  {$R BACKGRND.R32}

  //BitBtn1 := TCriptografa.Create( Self );
  SI := TSI.Create( Self );

  Toolbar.Wallpaper.Bitmap.Handle := LoadBitmap(hInstance, 'BACKGROUND');

  GetParam(Sender);

  path := ExtractFilePath(Application.ExeName);
  arquivo := 'Drache.ini';
  if not FileExists( path + arquivo ) then begin
       Application.MessageBox( 'Erro #1 (1498) - Chame o suporte! - (0xx65)9975-5183 Jorge',
                               'Erro !!', MB_OK + MB_ICONERROR);
       //Halt(0);
       Stat.SimpleText := 'Chame o suporte (0xx65) 9975-5183 ' + NomeAutor;
       Parmetros1.Enabled := False;
       ConfigurarPgina1.Enabled := False;
       ConfigurarImpressora1.Enabled := False;
       Insumos1.Enabled := False;
       Servios1.Enabled := False;
       CadastraPerodos1.Enabled := False;
       Oramentos1.Enabled := False;
       Cronograma1.Enabled := False;
       Acompanhamento1.Enabled := False;
       Utilitrios1.Enabled := False;
       ToolBar.Visible := False;
  end;
  if not TestaIni( Sender, path, arquivo ) then begin
       Application.MessageBox( 'Erro #2 (1587) - Chame o suporte! - (0xx65)9975-5183 Jorge',
                               'Erro !!', MB_OK + MB_ICONERROR);
       //Halt(0);
       Stat.SimpleText := ' Chame o suporte (0xx65) 9975-5183 ' + NomeAutor;
       Parmetros1.Enabled := False;
       ConfigurarPgina1.Enabled := False;
       ConfigurarImpressora1.Enabled := False;
       Insumos1.Enabled := False;
       Servios1.Enabled := False;
       CadastraPerodos1.Enabled := False;
       Oramentos1.Enabled := False;
       Cronograma1.Enabled := False;
       Acompanhamento1.Enabled := False;
       Utilitrios1.Enabled := False;
       ToolBar.Visible := False;
  end;

  LabParam.Caption := 'LS: ' + FloatToStrF( LS, ffFixed, 15, 2 ) +
                      '%         BDI: ' + FloatToStrF( BDI, ffFixed, 15, 2 ) + '%';
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
   if Demo then begin
      frmReport.SBtnImp.Enabled := False;
      frmPreview.ToolButton10.Enabled := False;
   end;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
var
  RegIni  : TRegIniFile;
  serial  : string;

begin
   RegIni := TRegIniFile.Create('');
   with RegIni do
   begin
     RootKey := HKEY_LOCAL_MACHINE;
     OpenKey('\Software\Drache Informática\Drache Orçamentos 1.35',False);
     serial := ReadString('1.35.3.2000','Serial','Não Registrado');
     Free;
   end;

   Left := 0;
   Top := 0;
   ShortDateFormat := 'dd/MM/yyyy';

   AboutBox.ProductName.Caption := NomeAplicacao;
   AboutBox.Copyright.Caption := 'Copyright © 2000 by ' + NomeAutor;

   if Demo then Versao := Versao + ' Demo';
   AboutBox.Label1.Caption := 'Versão: ' + Versao + chr(13) +
                              'Serial: ' + serial + chr(13) +
                              'Registrado para ' + NomeRegistro;

   rptImpServAna.QRLbDr.Caption := NomeAplicacao + ' ' + Versao;
   rptImpServAna.QRLbCl.Caption := NomeRegistro;
   with rptImpServAna.QRep.Page do begin
      Width := PageWidth;
      Length := PageLength;
      BottomMargin := PageBottom;
      TopMargin := PageTop;
      LeftMargin := PageLeft;
      PaperSize := iif( PageSize='A4', A4, iif( PageSize='Letter', Letter, Custom));
   end;

   rptImpServicos.QRLbDr.Caption := NomeAplicacao + ' ' + Versao;
   rptImpServicos.QRLbCl.Caption := NomeRegistro;
   with rptImpServicos.QRep.Page do begin
      Width := PageWidth;
      Length := PageLength;
      BottomMargin := PageBottom;
      TopMargin := PageTop;
      LeftMargin := PageLeft;
      PaperSize := iif( PageSize='A4', A4, iif( PageSize='Letter', Letter, Custom));
   end;

   rptImpOrcam.QRLbDr.Caption := NomeAplicacao + ' ' + Versao;
   rptImpOrcam.QRLbCl.Caption := NomeRegistro;
   with rptImpOrcam.QRepOrcam.Page do begin
      Width := PageWidth;
      Length := PageLength;
      BottomMargin := PageBottom;
      TopMargin := PageTop;
      LeftMargin := PageLeft;
      PaperSize := iif( PageSize='A4', A4, iif( PageSize='Letter', Letter, Custom));
   end;

   rptImpOrcamPaisa.QRLbDr.Caption := NomeAplicacao + ' ' + Versao;
   rptImpOrcamPaisa.QRLbCl.Caption := NomeRegistro;
   with rptImpOrcamPaisa.QRepOrcam.Page do begin
      Width := PageWidth;
      Length := PageLength;
      BottomMargin := PageBottom;
      TopMargin := PageTop;
      LeftMargin := PageLeft;
      PaperSize := iif( PageSize='A4', A4, iif( PageSize='Letter', Letter, Custom));
   end;

   rptImpInsOrc.QRLbDr.Caption := NomeAplicacao + ' ' + Versao;
   rptImpInsOrc.QRLbCl.Caption := NomeRegistro;
   with rptImpInsOrc.QRepIns.Page do begin
      Width := PageWidth;
      Length := PageLength;
      BottomMargin := PageBottom;
      TopMargin := PageTop;
      LeftMargin := PageLeft;
      PaperSize := iif( PageSize='A4', A4, iif( PageSize='Letter', Letter, Custom));
   end;

   rptImpInsCot.QRLbDr.Caption := NomeAplicacao + ' ' + Versao;
   rptImpInsCot.QRLbCl.Caption := NomeRegistro;
   with rptImpInsCot.QRepIns.Page do begin
      Width := PageWidth;
      Length := PageLength;
      BottomMargin := PageBottom;
      TopMargin := PageTop;
      LeftMargin := PageLeft;
      PaperSize := iif( PageSize='A4', A4, iif( PageSize='Letter', Letter, Custom));
   end;

   rptImpInsumos.QRLbDr.Caption := NomeAplicacao + ' ' + Versao;
   rptImpInsumos.QRLbCl.Caption := NomeRegistro;
   with rptImpInsumos.QRepIns.Page do begin
      Width := PageWidth;
      Length := PageLength;
      BottomMargin := PageBottom;
      TopMargin := PageTop;
      LeftMargin := PageLeft;
      PaperSize := iif( PageSize='A4', A4, iif( PageSize='Letter', Letter, Custom));
   end;

   rptImpInsCro.QRLbDr.Caption := NomeAplicacao + ' ' + Versao;
   rptImpInsCro.QRLbCl.Caption := NomeRegistro;
   with rptImpInsCro.QRepIns.Page do begin
      Width := PageWidth;
      Length := PageLength;
      BottomMargin := PageBottom;
      TopMargin := PageTop;
      LeftMargin := PageLeft;
      PaperSize := iif( PageSize='A4', A4, iif( PageSize='Letter', Letter, Custom));
   end;

   frmSobreMicro.RxLabel1.Caption := NomeAplicacao;
   frmSobreMicro.Label2.Caption := 'Copyright © 2000 by ' + NomeAutor;

end;

procedure TfrmMain.Cadastrar1Click(Sender: TObject);
begin
   frmCadInsu.ShowModal;
end;

procedure TfrmMain.Sair1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmMain.Cadastrar2Click(Sender: TObject);
begin
   frmCadServ.ShowModal;
end;

procedure TfrmMain.ConfigurarImpressora1Click(Sender: TObject);
begin
   PrinterSetupDialog1.Execute;
end;

procedure TfrmMain.Parmetros1Click(Sender: TObject);
begin
   frmParam.EdtLS.Value := LS;
   frmParam.EdtBDI.Value := BDI;
   if frmParam.ShowModal = mrOk then begin
      LS := frmParam.EdtLS.Value;
      BDI := frmParam.EdtBDI.Value;
      PutParam(Sender);
      LabParam.Caption := 'LS: ' + FloatToStrF( LS, ffFixed, 15, 2 ) +
                        '%    --     BDI: ' + FloatToStrF( BDI, ffFixed, 15, 2 ) + '%';
   end;
end;

procedure TfrmMain.Sobre1Click(Sender: TObject);
begin
   AboutBox.ShowModal;
end;

procedure TfrmMain.Abrir1Click(Sender: TObject);
var
   NomeArq, path, ext, cods: string;
   cria: boolean;
begin
   cria := False;
   path := DatMod.caminhobase + '\';
   ext  := '.db';

   if frmDadosGerais.ShowModal = mrYes then begin
      Abrir1.Enabled := False;
      DadosGerais1.Enabled := True;
      SpeedItem4.Enabled := False;
      SpeedItem5.Enabled := True;
      SpeedItem6.Enabled := True;
      SpeedItem7.Enabled := True;
      ImprimirInsumos1.Enabled := True;
      ImprimirOramento1.Enabled := True;
      ImprimirComposies1.Enabled := True;
      EditarOramento1.Enabled := True;
      Insumos2.Enabled := True;
      RecalculodoOramento1.Enabled := True;
      Fechar1.Enabled := True;
      Caption := DatMod.TabDadosGeraisDescricao.AsString + ' - ' + SiglaAplic;
      //Orçamento
      NomeArq := 'Orc' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 );
      if not FileExists( path + NomeArq + ext ) then begin
         DatMod.TabPadrao.Active := False;
         DatMod.TabPadrao.Exclusive := True;
         DatMod.TabPadrao.Active := True;
         CopyTable( Sender, DatMod.TabPadrao, path+NomeArq, true );
         DatMod.TabPadrao.Active := False;
         if Application.MessageBox( 'Deseja criar um orçamento padrão ?',
            'Orçamento Novo', MB_OKCANCEL + MB_ICONQUESTION ) = IDOK then
            cria := True;
      end;
      DatMod.TabOrcam.TableName := NomeArq;
      DatMod.TabOrcam.Open;
      if cria then
      begin
         DatMod.TabOrcam.Append;
         DatMod.TabOrcam.FieldByName('BDI').AsString := '0';
         DatMod.TabOrcam.FieldByName('Nivel').AsString := '3';
         DatMod.TabOrcam.FieldByName('DescricaoServico').AsString := DatMod.TabDadosGeraisDescricao.AsString;
         DatMod.TabOrcam.Post;
         DatMod.TabServicos.IndexName := '';
         DatMod.TabServicos.First;
         while not DatMod.TabServicos.Eof do
         begin
            cods := DatMod.TabServicosCodigoServico.AsString;
            if Copy(cods, 5, 2) = '00' then
            begin
               DatMod.TabOrcam.Append;
               DatMod.TabOrcam.FieldByName('CodigoServico').AsString := DatMod.TabServicosCodigoServico.AsString;
               DatMod.TabOrcam.FieldByName('DescricaoServico').AsString := DatMod.TabServicosDescricao.AsString;
               if Copy(cods, 3, 2) = '00' then
                  DatMod.TabOrcam.FieldByName('Nivel').AsString := '2'
               else
                  DatMod.TabOrcam.FieldByName('Nivel').AsString := '1';
               DatMod.TabOrcam.Post;
            end;
            DatMod.TabServicos.Next;
         end;
      end;
      //Insumos
      NomeArq := 'Ins' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 );
      if not FileExists( path + NomeArq + ext ) then
      begin
         CriarTabeladeInsumos1.Enabled := True;
         Atualizarvalores1.Enabled := False;
         TemInsu := False;
      end
      else
      begin
         CriarTabeladeInsumos1.Enabled := False;
         Atualizarvalores1.Enabled := True;
         DatMod.TabInsu.TableName := NomeArq;
         DatMod.TabInsu.Open;
         TemInsu := True;
      end;
      //Cronograma
      NomeArq := 'Cro' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 );
      if not FileExists( path + NomeArq + ext ) then
      begin
         Criar1.Enabled := True;
         TemCrono := False;
      end
      else
      begin
         DatMod.TabCrono.TableName := NomeArq;
         DatMod.TabCrono.Open;
         EditarCronograma1.Enabled := True;
         Imprimir1.Enabled := True;
         ImprimirInsumos2.Enabled := True;
         TemCrono := True;
      //Acompanhamento
      //Se tem Cronograma, pode ter Acompanhamento
      
      end;
      CalcOrcam;
   end;
end;

procedure TfrmMain.Fechar1Click(Sender: TObject);
begin
   Abrir1.Enabled := True;
   DadosGerais1.Enabled := True;
   SpeedItem4.Enabled := True;
   SpeedItem5.Enabled := False;
   SpeedItem6.Enabled := False;
   SpeedItem7.Enabled := False;
   ImprimirInsumos1.Enabled := False;
   ImprimirOramento1.Enabled := False;
   ImprimirComposies1.Enabled := False;
   EditarOramento1.Enabled := False;
   Insumos2.Enabled := False;
   CriarTabeladeInsumos1.Enabled := True;
   Atualizarvalores1.Enabled := False;
   Fechar1.Enabled := False;
   RecalculodoOramento1.Enabled := False;

   Criar1.Enabled := False;
   EditarCronograma1.Enabled := False;
   Imprimir1.Enabled := False;
   ImprimirInsumos2.Enabled := False;

   Caption := SiglaAplic;

   if DatMod.TabOrcam.Active then
      CalcOrcam;
      
   DatMod.TabOrcam.Close;
   DatMod.TabCrono.Close;
end;

procedure TfrmMain.EditarOramento1Click(Sender: TObject);
var NomeArq: string;
begin
   if TemCrono then
   begin
      if Application.MessageBox( 'Você perderá seu Cronograma !!'#13#13'  Deseja continuar ??',
                               'Atenção !!', MB_OKCANCEL + MB_ICONWARNING) = IDOK then
      begin
         DatMod.TabCrono.Close;
         NomeArq := '\Cro' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 );
         DeleteFile( PChar( DatMod.caminhobase + NomeArq + '.db' ));
         Criar1.Enabled := True;
         TemCrono := False;
         EditarCronograma1.Enabled := False;
         Imprimir1.Enabled := False;
         ImprimirInsumos2.Enabled := False;
         EditarOramento1Click(Sender);
      end
   end
   else
   begin
      DatMod.TabDadosGerais.Edit;
      DatMod.TabDadosGeraisDataAtualiza.AsDateTime := Date;
      DatMod.TabDadosGerais.Post;
      CalcOrcam;
      DatMod.TabOrcam.First;
      frmEditOrcam.ShowModal;
   end;
end;

procedure TfrmMain.Sobreomicrro1Click(Sender: TObject);
begin
   frmSobreMicro.ShowModal;
end;

procedure TfrmMain.ImprimirOramento1Click(Sender: TObject);
begin
   CalcOrcam;
   if frmImpOrcam.ShowModal = mrOk then begin
      // Retrato
      if frmImpOrcam.RBtnRetra.Checked then begin
         // se é Apresentação ou Conferência
         if frmImpOrcam.RBtnApres.Checked then
            with rptImpOrcam do begin
               QRDBText1.DataField := 'Numero';
               QRDBText10.DataField := 'Numero';
               QRLabel1.Caption := 'Número';
            end
         else
            with rptImpOrcam do begin
               QRDBText1.DataField := 'CodigoServico';
               QRDBText10.DataField := 'CodigoServico';
               QRLabel1.Caption := 'Código';
            end;
         frmReport.Report := rptImpOrcam.QRepOrcam;
      end
      else begin//Paisagem
         // se é Apresentação ou Conferência
         if frmImpOrcam.RBtnApres.Checked then
            with rptImpOrcamPaisa do begin
               QRDBText1.DataField := 'Numero';
               QRDBText10.DataField := 'Numero';
               QRLabel1.Caption := 'Número';
            end
         else
            with rptImpOrcampaisa do begin
               QRDBText1.DataField := 'CodigoServico';
               QRDBText10.DataField := 'CodigoServico';
               QRLabel1.Caption := 'Código';
            end;
         frmReport.Report := rptImpOrcamPaisa.QRepOrcam;
      end;
      frmReport.Caption := 'Imprimir Orçamento...';
      frmReport.Show;
   end;
end;

procedure TfrmMain.ImprimirInsumos1Click(Sender: TObject);
var
   cond: string;
   cont: byte;

begin
    cont := 0;
    cond := '';
    if frmImpInsu.ShowModal = mrOk then begin
      CalcInsumos;
      DatMod.QryInscOrc.Close;
      DatMod.QryInscOrc.SQL.Clear;
      DatMod.QryInscOrc.SQL.Add('select CodigoInsumo, Descricao, Unidade, Tipo,');
      DatMod.QryInscOrc.SQL.Add('Quantidade, Valor, Quantidade*Valor as ValorTotal');
      DatMod.QryInscOrc.SQL.Add('from InsumOrcam');
      if frmImpInsu.ChkBoxMao.Checked then begin
         Inc(cont);
         cond := '1';
      end;
      if frmImpInsu.ChkBoxMat.Checked then begin
         Inc(cont);
         cond := iif(cond='','2',cond+',2');
      end;
      if frmImpInsu.ChkBoxEqu.Checked then begin
         Inc(cont);
         cond := iif(cond='','3',cond+',3');
      end;
      if cont < 3 then
         if cont = 1 then
            DatMod.QryInscOrc.SQL.Add('where tipo='+cond)
         else
            DatMod.QryInscOrc.SQL.Add('where tipo in ('+cond+')');
      if frmImpInsu.RdGrpOrdem.ItemIndex = 1 then
         DatMod.QryInscOrc.SQL.Add('order by ValorTotal desc')
      else
         DatMod.QryInscOrc.SQL.Add('order by Descricao');

      DatMod.QryInscOrc.Open;

      if frmImpInsu.ChkBoxCota.Checked then
         frmReport.Report := rptImpInsCot.QRepIns
      else
         frmReport.Report := rptImpInsOrc.QRepIns;

      frmReport.Caption := 'Imprimir Insumos do Orçamento...';
      frmReport.Show;
   end;
end;

procedure TfrmMain.ConfigurarPgina1Click(Sender: TObject);
begin
   frmConfPag.EdTop.Value := PageTop;
   frmConfPag.EdBot.Value := PageBottom;
   frmConfPag.EdWid.Value := PageWidth;
   frmConfPag.EdLen.Value := PageLength;
   frmConfPag.CBoxLen.ItemIndex := iif( PageSize='A4', 0, iif( PageSize='Letter', 1, 2));
   frmConfPag.ChkBxGrade.Checked := LnGrade;
   frmConfPag.RGrpMod.ItemIndex := iif( FormatCro='1', 0, iif( FormatCro='12', 1, iif( FormatCro='17', 2, 3 )));
   //frmConfPag.EdLef.Value := PageLeft;
   if frmConfPag.ShowModal = mrOk then begin
      PageTop    := frmConfPag.EdTop.Value;
      PageBottom := frmConfPag.EdBot.Value;
      PageWidth  := frmConfPag.EdWid.Value;
      PageLength :=  frmConfPag.EdLen.Value;
      //PageLeft   := frmConfPag.EdLef.Value;
      LnGrade    := frmConfPag.ChkBxGrade.Checked;

      case frmConfPag.CBoxLen.ItemIndex of
      0: PageSize := 'A4';
      1: PageSize := 'Letter';
      else
         PageSize := 'Custom';
      end;

      case frmConfPag.RGrpMod.ItemIndex of
      0: FormatCro := '1';
      1: FormatCro := '12';
      2: FormatCro := '17';
      3: FormatCro := '18';
      end;
      PutParam(Sender);
      FormActivate( Sender );
   end;
end;

procedure TfrmMain.Listagem1Click(Sender: TObject);
var
   cond: string;
   cont: byte;
   filtro: boolean;

begin
   cont := 0;
   cond := '';
   if frmImpInsumos.ShowModal = mrOk then begin
      DatMod.QryInscOrc.Close;
      DatMod.QryInscOrc.SQL.Clear;
      DatMod.QryInscOrc.SQL.Add('select * from Insumos');
      if frmImpInsumos.ChkBoxMao.Checked then begin
         Inc(cont);
         cond := '1';
      end;
      if frmImpInsumos.ChkBoxMat.Checked then begin
         Inc(cont);
         cond := iif(cond='','2',cond+',2');
      end;
      if frmImpInsumos.ChkBoxEqu.Checked then begin
         Inc(cont);
         cond := iif(cond='','3',cond+',3');
      end;

      filtro := true;
      if (cont > 1) and (cont < 3) then
         if cont = 1 then
            DatMod.QryInscOrc.SQL.Add('where tipo='+cond)
         else
            DatMod.QryInscOrc.SQL.Add('where tipo in ('+cond+')')
      else
         filtro := false;

      cond := '';
      if frmImpInsumos.RdGrpOrdem.ItemIndex = 0 then begin
         if frmImpInsumos.EdIni.Text <> '' then
            cond := 'descricao >= "'+frmImpInsumos.EdIni.Text+'"';
         if frmImpInsumos.EdFin.Text <> '' then
            cond := iif(cond='', cond, cond+' and ') + 'descricao <= "'+frmImpInsumos.EdFin.Text+'"';
         if cond <> '' then
            if filtro then
               DatMod.QryInscOrc.SQL.Add('and ' + cond)
            else
               DatMod.QryInscOrc.SQL.Add('where ' + cond);
      end;

      if frmImpInsumos.RdGrpOrdem.ItemIndex = 1 then
         DatMod.QryInscOrc.SQL.Add('order by tipo, CodigoInsumo')
      else
         DatMod.QryInscOrc.SQL.Add('order by tipo, Descricao');

      DatMod.QryInscOrc.Open;

      frmReport.Report := rptImpInsumos.QRepIns;
      frmReport.Caption := 'Imprimir Insumos...';
      frmReport.Show;
   end;
end;

procedure TfrmMain.AlterarPreos1Click(Sender: TObject);
begin
   frmAltPrecos.ShowModal;
end;

procedure TfrmMain.RecalculodoOramento1Click(Sender: TObject);
begin
   frmRecal.PBar.Position := 0;
   frmRecal.LabMens.Caption := '';
   frmRecal.EdValor.Value := 0.00;
   frmRecal.EdValor.Enabled := False;
   frmRecal.CheckBox1.Checked := False;
   frmRecal.LabAtual.Caption := FloatToStrF(DatMod.TabDadosGeraisTotal.Value, ffCurrency, 15, 2 );
   frmRecal.ShowModal;
end;

procedure TfrmMain.Listagem2Click(Sender: TObject);
var ordem, ini, fin: string;
    RecAnt: longint;
    pv: boolean;
    
begin
   if frmImpSer.ShowModal = mrOk then begin
      ini := trim(frmImpSer.EdtIni.Text)+'';
      fin := trim(frmImpSer.EdtFin.Text)+'';
      if frmImpSer.RdGrpTipo.ItemIndex = 0 then begin
         if frmImpSer.RdGrpOrdem.ItemIndex = 0 then
            DatMod.TabServicos.IndexName := 'IndDescricao'
         else
            DatMod.TabServicos.IndexName := '';

         if (ini <> '') and (fin <> '') then begin
            //if ini = fin then
            //   DatMod.TabServicos.Filter := 'descricao = '''+ini+''' '
            //else
            DatMod.TabServicos.Filter := '( descricao >= '''+ini+''') and (descricao <='''+fin+''') ';
            DatMod.TabServicos.Filtered := True;
         end;

         frmReport.Report := rptImpServicos.QRep;
         frmReport.Caption := 'Imprimir Composições (Sintético)...';
         frmReport.Show;
      end
      else begin
         pv := true;
         if (ini <> '') and (fin <> '') then begin
            DatMod.TabServicos.Filter := '(descricao >= "'+ini+'") and (descricao <="'+fin+'")';
            DatMod.TabServicos.Filtered := True;
         end;
         DatMod.TabServicos.First;
         repeat
            RecAnt := DatMod.TabServicos.RecNo;
            MontaCompos(DatMod.TabServicosCodigoServico.AsString, LS, BDI, pv);
            DatMod.TabServicos.RecNo := RecAnt;
            if pv then pv := false;
            DatMod.TabServicos.Next;
         until DatMod.TabServicos.Eof;
         if frmImpSer.RdGrpOrdem.ItemIndex = 0 then
            ordem := 'order by s.descricao, c.tipo, c.descricao'
         else
            ordem := 'order by c.codigo, c.tipo, c.componente';
         with DatMod.QryComp do begin
            Close;
            Sql.Clear;
            Sql.Add('select c.codigo, s.descricao, s.unidade as unid, c.componente, c.tipo, c.descricao as desccomp, c.unidade, c.quantidade as quant, c.valor, c.LS, c.BDI');
            Sql.Add('from composicoes c, servicos s');
            Sql.Add('where c.codigo = s.codigoservico');
            Sql.Add( ordem );
            Open;
         end;
         frmReport.Report := rptImpServAna.QRep;
         frmReport.Caption := 'Imprimir Composições (Analítico)...';
         frmReport.Show;
         //rptImpServAna.QRep.Preview;
      end;
   end;
   DatMod.TabServicos.Filtered := False;
end;

procedure TfrmMain.Criar1Click(Sender: TObject);
var NomeArq: string;
    i,t: integer;
begin
   if ( Copy(DatMod.TabDadosGeraisDataInicio.AsString,1,1) = ' ' ) or
      ( DatMod.TabDadosGeraisPerodos.AsInteger = 0 ) or
      ( DatMod.TabDadosGeraisTipoPeriodo.AsInteger = 0 ) then
       Application.MessageBox( 'Os dados do Cronograma estão incompletos.'#13'Por favor, corriga-os.',
                               'Dados Incompletos !!', MB_OK + MB_ICONERROR)
   else begin
      NomeArq := 'Cro' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 );
      t := DatMod.TabDadosGeraisPerodos.Value;
      with DatMod.TabCrono do begin
         Active := False;
         DatabaseName := 'Orcam';
         TableType := ttParadox;
         TableName := NomeArq;
         with FieldDefs do begin
            Clear;
            Add('Numero', ftString, 10, False );
            Add('Nivel', ftString, 1, False );
            Add('Descricao', ftString, 100, False );
            Add('Valor', ftCurrency, 0, False );
            for i := 1 to t do
            begin
               Add('PerV'+StrZero(i,5,0), ftCurrency, 0, False );
               Add('PerP'+StrZero(i,5,0), ftFloat, 0, False );
            end;
            Add('TotalV', ftCurrency, 0, False );
            Add('TotalP', ftFloat, 0, False );
         end;
         CreateTable;
         Open;
      end;

      // Copia Dados do Orçamento
      CalcOrcam;
      DatMod.TabOrcam.First;
      while DatMod.TabOrcam.Eof = False do begin
         if myInt(DatMod.TabOrcamNivel.Value) >= myInt(DatMod.TabDadosGeraisNivel.AsString) then begin
            DatMod.TabCrono.Append;
            DatMod.TabCrono.FieldByName('Numero').Value := DatMod.TabOrcamNumero.Value;
            DatMod.TabCrono.FieldByName('Nivel').Value := DatMod.TabOrcamNivel.Value;
            DatMod.TabCrono.FieldByName('Descricao').Value := DatMod.TabOrcamDescricaoServico.Value;
            DatMod.TabCrono.FieldByName('Valor').Value := Trunc(DatMod.TabOrcamTotalServ.Value*100)/100;
         end;
         DatMod.TabOrcam.Next;
      end;
      if DatMod.TabCrono.State in [dsEdit,dsInsert] then
         DatMod.TabCrono.Post;

      Criar1.Enabled := False;
      EditarCronograma1.Enabled := True;
      Imprimir1.Enabled := True;
      ImprimirInsumos2.Enabled := True;
      TemCrono := True;

      Application.MessageBox( 'Cronograma criado !', 'Operação Completa !!', MB_OK);

   end;
end;

procedure TfrmMain.CadastraPerodos1Click(Sender: TObject);
begin
    frmTipoPeri.ShowModal;
end;

procedure TfrmMain.EditarCronograma1Click(Sender: TObject);
begin
   CalcCrono;
   frmEdtCrono.ShowModal;
end;

procedure TfrmMain.DadosGerais1Click(Sender: TObject);
begin
   frmVisDadGer.ShowModal;
end;

procedure TfrmMain.CriarTabeladeInsumos1Click(Sender: TObject);
var
    NomeArq, status: string;
    codi: integer;
    val1, val2: real;
    data: TDate;

begin
   if Application.MessageBox( 'Deseja criar tabela de Insumos para este Orçamento ?',
                              'Criar Tabela', MB_OKCANCEL ) = IDOK then
   begin
      status := Stat.SimpleText;
      Stat.SimpleText := 'Aguarde... Criando Tabela...';

      NomeArq := 'Ins' + StrZero( DatMod.TabDadosGeraisCodigoOrcam.AsInteger, 8, 0 );
      with DatMod.TabInsu do begin
         Active := False;
         DatabaseName := 'Orcam';
         TableType := ttParadox;
         TableName := NomeArq;
         with FieldDefs do begin
            Clear;
            Add('CodigoInsumo', ftInteger, 0, True );
            Add('Valor', ftFloat, 0, False );
            Add('DataAtualiz', ftDate, 0, False );
            Add('ValorAnt', ftFloat, 0, False );
         end;
         with IndexDefs do
         begin
            Clear;
            { O 1º Índice não tem nome porque é uma Chave Primária do Paradox }
            Add('', 'CodigoInsumo', [ixPrimary, ixUnique]);
         end;
         CreateTable;
         Open;
      end;
      // Copia dados dos Insumos
      with DatMod do
      begin
         TabInsumos.First;
         while TabInsumos.Eof = False do
         begin
            codi := TabInsumosCodigoInsumo.Value;
            val1 := TabInsumosValor.Value;
            val2 := TabInsumosValorAnt.Value;
            data := TabInsumosDataAtualiz.Value;
            TabInsu.Append;
            TabInsuCodigoInsumo.Value := codi;
            TabInsuValor.Value        := val1;
            TabInsuValorAnt.Value     := val2;
            TabInsuDataAtualiz.Value  := data;
            TabInsu.Post;
            TabInsumos.Next;
         end;
      end;
      ShowMessage( 'Tabela de Insumos Criada !!' );
      TemInsu := True;
      CriarTabeladeInsumos1.Enabled := False;
      Atualizarvalores1.Enabled := True;
      Stat.SimpleText := status;
   end;
end;

procedure TfrmMain.Atualizarvalores1Click(Sender: TObject);
begin
   frmCadInsOrc.ShowModal;
end;

procedure TfrmMain.ImprimirComposies1Click(Sender: TObject);
var
   pv: boolean;
   RecAnt, resp: integer;
   codser: string;
begin
   resp := Application.MessageBox( 'Deseja emitir as Composições Auxiliares ??',
                              'Emitir Composições - Analítico', MB_YESNOCANCEL+MB_ICONQUESTION );
   if resp <> IDCANCEL then
   begin
      pv := true;
      DatMod.TabOrcam.First;
      repeat
         codser := DatMod.TabOrcamCodigoServico.AsString;
         if DatMod.TabServicos.FindKey([ codser ]) then
         begin
            if DatMod.TabCompServ.FindKey([ CodSer ]) then
            begin
               while ( DatMod.TabCompServ.FieldByName('CodigoServico').AsString = CodSer ) and
                     ( not DatMod.TabCompServ.Eof ) do
               begin
                  RecAnt := DatMod.TabCompServ.RecNo;
                  MontaCompos(DatMod.TabCompServ.FieldByName('CodigoServComp').AsString,
                              DatMod.TabDadosGeraisLS.Value, DatMod.TabOrcamValBDI.Value, pv);
                  if pv then pv := False;
                  DatMod.TabCompServ.RecNo := RecAnt;
                  DatMod.TabCompServ.Next;
               end;
            end;
            MontaCompos(CodSer, DatMod.TabDadosGeraisLS.Value, DatMod.TabOrcamValBDI.Value, pv);
            if pv then pv := false;
         end;
         DatMod.TabOrcam.Next;
      until DatMod.TabOrcam.Eof;

      with DatMod.QryComp do begin
         Close;
         Sql.Clear;
         Sql.Add('select c.codigo, s.descricao, s.unidade as unid, c.componente, c.tipo, c.descricao as desccomp, c.unidade, c.quantidade as quant, c.valor, c.LS, c.BDI');
         Sql.Add('from composicoes c, servicos s');
         Sql.Add('where c.codigo = s.codigoservico');
         Sql.Add( 'order by s.descricao, c.tipo, c.descricao' );
         Open;
      end;
      frmReport.Report := rptImpServAna.QRep;
      frmReport.Caption := 'Imprimir Composições do Orçamento (Analítico)...';
      frmReport.Show;
   end;
end;

{************************************************
*************************************************
****                                         ****
****        IMPRIME CRONOGRAMA FISICO        ****
****                                         ****
*************************************************
*************************************************
}
procedure TfrmMain.CronogramaFsico1Click(Sender: TObject);
var
   range, rgdat, cell, r1: string;
   soma: real;
   i, j, l, c, d, p, li : integer;

begin
   if not VarIsEmpty(vExcel) then
   begin
      vExcel.DisplayAlerts := False;
      vExcel.Quit;
   end;

   MaxRecord := 20;
   Stat.SimpleText := 'Inicializando o Excel...';

   try
      //CoInitialize(nil);
      vExcel := CreateOleObject('Excel.Application');
   except
      Application.MessageBox( 'Não foi possível inicializar'#13'o Microsoft Excel !!',
                              'Erro !!', MB_OK+MB_ICONERROR );
      Stat.SimpleText := 'Copyright © 2000 by ' + NomeAutor;
      exit;
   end;

   Stat.SimpleText := 'Transferindo Dados Gerais...';
   vExcel.Workbooks.Add;

   vExcel.ActiveSheet.PageSetup.Orientation := 2;
   vExcel.ActiveSheet.PageSetup.LeftHeader  := NomeRegistro;
   vExcel.ActiveSheet.PageSetup.CenterHeader  := chr(13)+'&16CRONOGRAMA FÍSICO';
   vExcel.ActiveSheet.PageSetup.LeftFooter := NomeAplicacao + ' ' + Versao;
   vExcel.ActiveSheet.PageSetup.RightFooter  := 'Página: &P de &N';
   vExcel.ActiveSheet.PageSetup.PrintGridlines := LnGrade;
   // vExcel.ActiveSheet.PageSetup.CenterVertically := True;
   // vExcel.ActiveSheet.PageSetup.CenterHorizontally := True;

   // Cells[ linha, coluna ]
   DatMod.TabTPeri.FindKey( [DatMod.TabDadosGeraisTipoPeriodo.AsInteger ] );

   vExcel.Cells[ 1, 1 ].Value := DatMod.TabDadosGeraisDescricao.AsString;
   vExcel.Cells[ 1, 1 ].Font.Bold := True;
   vExcel.Cells[ 1, 1 ].Font.Size := 12;
   vExcel.Cells[ 2, 1 ].Value := 'Início da Obra: ' + DatMod.TabDadosGeraisDataInicio.AsString;
   vExcel.Cells[ 3, 1 ].Value := 'Períodos: ' + DatMod.TabDadosGeraisPerodos.AsString + '     ' +
                                 'Tipo: ' + DatMod.TabTPeriDescricao.AsString;

   li := 5;
   vExcel.Cells[ li, 1 ].Value := 'Etapa';

   vExcel.ActiveSheet.Columns[1].ColumnWidth := 80;

   c := 2; // 2ª Coluna
   d := 0;
   DatMod.TabTPeri.FindKey( [DatMod.TabDadosGeraisTipoPeriodo.AsInteger ] );
   p := DatMod.TabTPeriDias.Value;

   for i := 4 to DatMod.TabDadosGeraisPerodos.Value+3 do
   begin
      vExcel.ActiveSheet.Columns[c].ColumnWidth := 16;
      vExcel.Cells[ li , c ].Value := chr(39) + IntToStr(d+1) + ' - ' + IntToStr(d+p);
      vExcel.Cells[ li-1, c].Value := 'Período ' + IntToStr( i-3 );
      vExcel.Cells[ li-1, c].HorizontalAlignment := 4;
      d := d + p;
      c := c + 1;
   end;

   if c > 25 then  // AA, AB, etc.
   begin
      r1 := 'A' + chr( 37 + c);
      range := 'B'+IntToStr(li-1)+':' + r1 + IntToStr(li);
      rgdat := 'A'+IntToStr(li-1)+':' + 'A' + chr( 38 + c);
      cell  := 'A' + chr( 38 + c ) + IntToStr(li);
   end
   else
   begin
      r1 := chr( 63 + c);
      range := 'B'+IntToStr(li-1)+':' + r1 + IntToStr(li);
      rgdat := 'A'+IntToStr(li-1)+':' + chr( 64 + c);
      cell  := chr( 64 + c ) + IntToStr(li);
   end;

   vExcel.ActiveSheet.Range[ range ].HorizontalAlignment := 4;
   vExcel.ActiveSheet.Range[ cell ].HorizontalAlignment := 4;
   vExcel.ActiveSheet.Range[ cell ].Value := 'Total';

   Stat.SimpleText := 'Transferindo dados do Cronograma...';
   l := li+1;
   DatMod.TabCrono.First;
   DatMod.TabCrono.Next;
   repeat
      if myInt(DatMod.TabCrono.FieldByName('Nivel').AsString) > myInt(DatMod.TabDadosGeraisNivel.AsString) then
      begin
         Inc(l);
         vExcel.Cells[ l, 1 ].Font.Bold := True;
         vExcel.Cells[ l, 2 ].Font.Bold := True;
      end;

      vExcel.Cells[ l, 1 ].Value := DatMod.TabCrono.FieldByName('Numero').asString + '   ' +
                                    Trim(DatMod.TabCrono.FieldByName('Descricao').asString);

      c := 5; //Fisico    4=Financeiro
      j := 2; // coluna 2

      soma := 0;
      for i := 4 to DatMod.TabDadosGeraisPerodos.Value+3 do
      begin
         if DatMod.TabCrono.Fields[c].AsFloat > 0.00 then
         begin
            vExcel.Cells[ l, j ].Value := FloatToStrF( DatMod.TabCrono.Fields[c].AsFloat, ffNumber, 15, 2 ) + '%';
            soma := soma + DatMod.TabCrono.Fields[c].AsFloat;
            vExcel.Cells[ l, j ].HorizontalAlignment := 4;
            if myInt(DatMod.TabCrono.FieldByName('Nivel').AsString) > myInt(DatMod.TabDadosGeraisNivel.AsString) then
               vExcel.Cells[ l, j ].Font.Bold := True;
         end;
         Inc(j);
         c := c + 2;
      end;
      //vExcel.Cells[ l, j ].Value := '100,00%'; //DatMod.TabCrono.Fields[4].AsCurrency;
      //vExcel.Cells[ l, j ].Formula := '=SUM(B'+IntToStr(l)+':'+r1+IntToStr(l)+')';
      vExcel.Cells[ l, j ].Value := FloatToStrF( soma, ffNumber, 15, 2 ) + '%';
      vExcel.Cells[ l, j ].HorizontalAlignment := 4;

      Inc(l);
      DatMod.TabCrono.Next;
   until DatMod.TabCrono.Eof;

   {DatMod.TabCrono.First;

   Inc(l);
   vExcel.Cells[ l, 1 ].Font.Bold := True;
   vExcel.Cells[ l, 2 ].Font.Bold := True;

   c := 5; //Fisico    4=Financeiro
   j := 2; // coluna 2

   for i := 4 to DatMod.TabDadosGeraisPerodos.Value+3 do
   begin
      if DatMod.TabCrono.Fields[c].AsFloat > 0.00 then
      begin
         vExcel.Cells[ l, j ].Value := FloatToStrF( DatMod.TabCrono.Fields[c].AsFloat, ffNumber, 15, 2 ) + '%';
         vExcel.Cells[ l, j ].HorizontalAlignment := 4;
         if myInt(DatMod.TabCrono.FieldByName('Nivel').AsString) > myInt(DatMod.TabDadosGeraisNivel.AsString) then
            vExcel.Cells[ l, j ].Font.Bold := True;
      end;
      Inc(j);
      c := c + 2;
   end;
   vExcel.ActiveSheet.Columns[j].ColumnWidth := 16;
   //vExcel.Cells[ l, j ].HorizontalAlignment := 4;
   //vExcel.Cells[ l, j ].Value := '100,00%'; //DatMod.TabCrono.Fields[4].AsCurrency;
   }

   vExcel.ActiveSheet.Range[ rgdat+IntToStr(l) ].AutoFormat[ FormatCro ];

   Stat.SimpleText := 'Enviando Cronograma para a Fila de Impressão...';
   //vExcel.Visible := True;
   //vExcel.ActiveWorkBook.PrintPreview;
   vExcel.ActiveSheet.PrintOut;

   Sleep( 2000 );

   Stat.SimpleText := 'Copyright © 2000 by ' + NomeAutor;
   //ShowMessage( 'Cronograma enviado para a Impressão !!' );
end;

{************************************************
*************************************************
****                                         ****
****      IMPRIME CRONOGRAMA FINANCEIRO      ****
****                                         ****
*************************************************
*************************************************
}
procedure TfrmMain.CronogramaFinanceiro1Click(Sender: TObject);
var
   range, rgdat, cell: string;
   i, j, l, c, d, p, li : integer;

begin
   if not VarIsEmpty(vExcel) then
   begin
      vExcel.DisplayAlerts := False;
      vExcel.Quit;
   end;

   MaxRecord := 20;
   Stat.SimpleText := 'Inicializando o Excel...';

   try
      //CoInitialize(nil);
      vExcel := CreateOleObject('Excel.Application');
   except
      Application.MessageBox( 'Não foi possível inicializar'#13'o Microsoft Excel !!',
                              'Erro !!', MB_OK+MB_ICONERROR );
      Stat.SimpleText := 'Copyright © 2000 by ' + NomeAutor;
      exit;
   end;

   Stat.SimpleText := 'Transferindo Dados Gerais...';
   vExcel.Workbooks.Add;

   vExcel.ActiveSheet.PageSetup.Orientation := 2;
   vExcel.ActiveSheet.PageSetup.LeftHeader  := NomeRegistro;
   vExcel.ActiveSheet.PageSetup.CenterHeader  := chr(13)+'&16CRONOGRAMA FINANCEIRO';
   vExcel.ActiveSheet.PageSetup.LeftFooter := NomeAplicacao + ' ' + Versao;
   vExcel.ActiveSheet.PageSetup.RightFooter  := 'Página: &P de &N';
   vExcel.ActiveSheet.PageSetup.PrintGridlines := LnGrade;
   //vExcel.ActiveSheet.PageSetup.CenterHorizontally := True;

   // Cells[ linha, coluna ]
   DatMod.TabTPeri.FindKey( [DatMod.TabDadosGeraisTipoPeriodo.AsInteger ] );

   vExcel.Cells[ 1, 1 ].Value := DatMod.TabDadosGeraisDescricao.AsString;
   vExcel.Cells[ 1, 1 ].Font.Bold := True;
   vExcel.Cells[ 1, 1 ].Font.Size := 12;
   vExcel.Cells[ 2, 1 ].Value := 'Início da Obra: ' + DatMod.TabDadosGeraisDataInicio.AsString;
   vExcel.Cells[ 3, 1 ].Value := 'Períodos: ' + DatMod.TabDadosGeraisPerodos.AsString + '     ' +
                                 'Tipo: ' + DatMod.TabTPeriDescricao.AsString;

   li := 5;
   vExcel.Cells[ li, 1 ].Value := 'Etapa';

   vExcel.ActiveSheet.Columns[1].ColumnWidth := 80;

   c := 2; // 2ª Coluna
   d := 0;
   DatMod.TabTPeri.FindKey( [DatMod.TabDadosGeraisTipoPeriodo.AsInteger ] );
   p := DatMod.TabTPeriDias.Value;

   for i := 4 to DatMod.TabDadosGeraisPerodos.Value+3 do
   begin
      vExcel.ActiveSheet.Columns[c].ColumnWidth := 16;
      vExcel.Cells[ li , c ].Value := chr(39) + IntToStr(d+1) + ' - ' + IntToStr(d+p);
      vExcel.Cells[ li-1, c].Value := 'Período ' + IntToStr( i-3 );
      vExcel.Cells[ li-1, c].HorizontalAlignment := 4;
      d := d + p;
      c := c + 1;
   end;
   vExcel.ActiveSheet.Columns[c].ColumnWidth := 16;

   if c > 25 then  // AA, AB, etc.
   begin
      range := 'B'+IntToStr(li-1)+':A' + chr( 37 + c) + IntToStr(li);
      rgdat := 'A'+IntToStr(li-1)+':A' + chr( 38 + c);
      cell  := 'A' + chr( 38 + c ) + IntToStr(li-1);
   end
   else
   begin
      range := 'B'+IntToStr(li-1)+':' + chr( 63 + c) + IntToStr(li);
      rgdat := 'A'+IntToStr(li-1)+':' + chr( 64 + c);
      cell  := chr( 64 + c ) + IntToStr(li);
   end;

   vExcel.ActiveSheet.Range[ range ].HorizontalAlignment := 4;
   vExcel.ActiveSheet.Range[ cell ].HorizontalAlignment := 4;
   vExcel.ActiveSheet.Range[ cell ].Value := 'Total';

   Stat.SimpleText := 'Transferindo dados do Cronograma...';
   l := li+1;
   DatMod.TabCrono.First;
   DatMod.TabCrono.Next;
   repeat
      if myInt(DatMod.TabCrono.FieldByName('Nivel').AsString) > myInt(DatMod.TabDadosGeraisNivel.AsString) then
      begin
         Inc(l);
         vExcel.Cells[ l, 1 ].Font.Bold := True;
         vExcel.Cells[ l, 2 ].Font.Bold := True;
      end;

      vExcel.Cells[ l, 1 ].Value := DatMod.TabCrono.FieldByName('Numero').asString + '   ' +
                                    Trim(DatMod.TabCrono.FieldByName('Descricao').asString);

      c := 4; //Financeiro
      j := 2; // coluna 2

      for i := 4 to DatMod.TabDadosGeraisPerodos.Value+3 do
      begin
         if DatMod.TabCrono.Fields[c].AsFloat > 0.00 then
         begin
            vExcel.Cells[ l, j ].Value := DatMod.TabCrono.Fields[c].AsCurrency;
            vExcel.Cells[ l, j ].HorizontalAlignment := 4;
            if myInt(DatMod.TabCrono.FieldByName('Nivel').AsString) > myInt(DatMod.TabDadosGeraisNivel.AsString) then
               vExcel.Cells[ l, j ].Font.Bold := True;
         end;
         Inc(j);
         c := c + 2;
      end;
      vExcel.Cells[ l, j ].Value := DatMod.TabCrono.Fields[3].AsCurrency;

      Inc(l);
      DatMod.TabCrono.Next;
   until DatMod.TabCrono.Eof;

   DatMod.TabCrono.First;

   c := 4; //Financeiro
   j := 2; // coluna 2

   Inc(l);
   vExcel.Cells[ l, 1 ].Font.Bold := True;
   vExcel.Cells[ l, 2 ].Font.Bold := True;

   for i := 4 to DatMod.TabDadosGeraisPerodos.Value+3 do
   begin
      if DatMod.TabCrono.Fields[c].AsFloat > 0.00 then
      begin
         vExcel.Cells[ l, j ].Value := DatMod.TabCrono.Fields[c].AsCurrency;
         //vExcel.Cells[ l, j ].Value := FloatToStrF( DatMod.TabCrono.Fields[c].AsFloat, ffNumber, 15, 2 ) + '%';
         vExcel.Cells[ l, j ].HorizontalAlignment := 4;
         if myInt(DatMod.TabCrono.FieldByName('Nivel').AsString) > myInt(DatMod.TabDadosGeraisNivel.AsString) then
            vExcel.Cells[ l, j ].Font.Bold := True;
      end;
      Inc(j);
      c := c + 2;
   end;
   vExcel.Cells[ l, j ].Value := DatMod.TabCrono.Fields[3].AsCurrency;

   vExcel.ActiveSheet.Range[ rgdat+IntToStr(l) ].AutoFormat[ FormatCro ];

   Stat.SimpleText := 'Enviando Cronograma para a Fila de Impressão...';
   //vExcel.Visible := True;
   //vExcel.ActiveWorkBook.PrintPreview;
   vExcel.ActiveSheet.PrintOut;

   Sleep( 2000 );

   Stat.SimpleText := 'Copyright © 2000 by ' + NomeAutor;
   ShowMessage( 'Cronograma enviado para a Impressão !!' );
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
   if not VarIsEmpty(vExcel) then
   begin
      vExcel.DisplayAlerts := False;
      vExcel.Quit;
   end;
end;

{***************************************
****************************************
****                                ****
****  IMPRIME INSUMOS DO CRONOGRAMA ****
****                                ****
****************************************
****************************************
}
procedure TfrmMain.ImprimirInsumos2Click(Sender: TObject);
var
   periodos: TStrings;
   cond: string;
   i, d, p: integer;
   cont: byte;

begin
   periodos := TStringList.Create;

   d := 0;
   DatMod.TabTPeri.FindKey( [DatMod.TabDadosGeraisTipoPeriodo.AsInteger ] );
   p := DatMod.TabTPeriDias.Value;

   for i := 1 to DatMod.TabDadosGeraisPerodos.Value do
   begin
      //periodos.Add( 'Período ' + IntToStr(i) + ': ' + IntToStr(d+1) + ' - ' + IntToStr(d+p) );
      periodos.Add( 'Período ' + IntToStr(i) + ': ' + DateToStr( DatMod.TabDadosGeraisDataInicio.AsDateTime + d + 1 ) +
                    ' - ' + DateToStr( DatMod.TabDadosGeraisDataInicio.AsDateTime + d + p ));

      d := d + p;
   end;

   with frmInsCrono do
   begin
      CBoxPer.Items.Clear;
      CBoxPer.Items := periodos;
   end;

   if frmInsCrono.ShowModal = mrOk then
   begin
      CalcInsCrono( frmInsCrono.CBoxPer.ItemIndex+1 );

      DatMod.QryInscOrc.Close;
      DatMod.QryInscOrc.SQL.Clear;
      DatMod.QryInscOrc.SQL.Add('select CodigoInsumo, Descricao, Unidade, Tipo,');
      DatMod.QryInscOrc.SQL.Add('Quantidade, Valor, Quantidade*Valor as ValorTotal');
      DatMod.QryInscOrc.SQL.Add('from InsumOrcam');
      cont := 0;
      if frmInsCrono.ChkBoxMao.Checked then begin
         Inc(cont);
         cond := '1';
      end;
      if frmInsCrono.ChkBoxMat.Checked then begin
         Inc(cont);
         cond := iif(cond='','2',cond+',2');
      end;
      if frmInsCrono.ChkBoxEqu.Checked then begin
         Inc(cont);
         cond := iif(cond='','3',cond+',3');
      end;
      if cont < 3 then
         if cont = 1 then
            DatMod.QryInscOrc.SQL.Add('where tipo='+cond)
         else
            DatMod.QryInscOrc.SQL.Add('where tipo in ('+cond+')');

      if frmInsCrono.RdGrpOrdem.ItemIndex = 1 then
         DatMod.QryInscOrc.SQL.Add('order by ValorTotal desc')
      else
         DatMod.QryInscOrc.SQL.Add('order by Descricao');

      DatMod.QryInscOrc.Open;

      //if frmInsCrono.ChkBoxCota.Checked then
      //   frmReport.Report := rptImpInsCot.QRepIns
      //else

      rptImpInsCro.QRLabPer.Caption := periodos[ frmInsCrono.CBoxPer.ItemIndex ];
      frmReport.Report := rptImpInsCro.QRepIns;

      frmReport.Caption := 'Imprimir Insumos do Cronograma...';
      frmReport.Show;
   end;
end;


{***********************************************
************************************************
****                                        ****
****  IMPRIME CRONOGRAMA FISICO-FINANCEIRO  ****
****                                        ****
************************************************
************************************************
}
procedure TfrmMain.FsicoFinanceiro1Click(Sender: TObject);
var
   range, rgdat, cell: string;
   soma: real;
   i, j, l, c, d, p, li : integer;

begin
   if not VarIsEmpty(vExcel) then
   begin
      vExcel.DisplayAlerts := False;
      vExcel.Quit;
   end;

   MaxRecord := 20;
   Stat.SimpleText := 'Inicializando o Excel...';

   try
      //CoInitialize(nil);
      vExcel := CreateOleObject('Excel.Application');
   except
      Application.MessageBox( 'Não foi possível inicializar'#13'o Microsoft Excel !!',
                              'Erro !!', MB_OK+MB_ICONERROR );
      Stat.SimpleText := 'Copyright © 2000 by ' + NomeAutor;
      exit;
   end;

   Stat.SimpleText := 'Transferindo Dados Gerais...';
   vExcel.Workbooks.Add;

   vExcel.ActiveSheet.PageSetup.Orientation := 2;
   vExcel.ActiveSheet.PageSetup.LeftHeader  := NomeRegistro;
   vExcel.ActiveSheet.PageSetup.CenterHeader  := chr(13)+'&16CRONOGRAMA FINANCEIRO';
   vExcel.ActiveSheet.PageSetup.LeftFooter := NomeAplicacao + ' ' + Versao;
   vExcel.ActiveSheet.PageSetup.RightFooter  := 'Página: &P de &N';
   vExcel.ActiveSheet.PageSetup.PrintGridlines := LnGrade;
   //vExcel.ActiveSheet.PageSetup.CenterHorizontally := True;

   // Cells[ linha, coluna ]
   DatMod.TabTPeri.FindKey( [DatMod.TabDadosGeraisTipoPeriodo.AsInteger ] );

   vExcel.Cells[ 1, 1 ].Value := DatMod.TabDadosGeraisDescricao.AsString;
   vExcel.Cells[ 1, 1 ].Font.Bold := True;
   vExcel.Cells[ 1, 1 ].Font.Size := 12;
   vExcel.Cells[ 2, 1 ].Value := 'Início da Obra: ' + DatMod.TabDadosGeraisDataInicio.AsString;
   vExcel.Cells[ 3, 1 ].Value := 'Períodos: ' + DatMod.TabDadosGeraisPerodos.AsString + '     ' +
                                 'Tipo: ' + DatMod.TabTPeriDescricao.AsString;

   li := 5;
   vExcel.Cells[ li, 1 ].Value := 'Etapa';

   vExcel.ActiveSheet.Columns[1].ColumnWidth := 80;

   c := 2; // 2ª Coluna
   d := 0;
   DatMod.TabTPeri.FindKey( [DatMod.TabDadosGeraisTipoPeriodo.AsInteger ] );
   p := DatMod.TabTPeriDias.Value;

   for i := 4 to DatMod.TabDadosGeraisPerodos.Value+3 do
   begin
      vExcel.ActiveSheet.Columns[c].ColumnWidth := 16;
      vExcel.Cells[ li , c ].Value := chr(39) + IntToStr(d+1) + ' - ' + IntToStr(d+p);
      vExcel.Cells[ li-1, c].Value := 'Período ' + IntToStr( i-3 );
      vExcel.Cells[ li-1, c].HorizontalAlignment := 4;
      d := d + p;
      c := c + 1;
   end;
   vExcel.ActiveSheet.Columns[c].ColumnWidth := 16;

   if c > 25 then  // AA, AB, etc.
   begin
      range := 'B'+IntToStr(li-1)+':A' + chr( 37 + c) + IntToStr(li);
      rgdat := 'A'+IntToStr(li-1)+':A' + chr( 38 + c);
      cell  := 'A' + chr( 38 + c ) + IntToStr(li-1);
   end
   else
   begin
      range := 'B'+IntToStr(li-1)+':' + chr( 63 + c) + IntToStr(li);
      rgdat := 'A'+IntToStr(li-1)+':' + chr( 64 + c);
      cell  := chr( 64 + c ) + IntToStr(li);
   end;

   vExcel.ActiveSheet.Range[ range ].HorizontalAlignment := 4;
   vExcel.ActiveSheet.Range[ cell ].HorizontalAlignment := 4;
   vExcel.ActiveSheet.Range[ cell ].Value := 'Total';

   Stat.SimpleText := 'Transferindo dados do Cronograma...';
   l := li+1;
   DatMod.TabCrono.First;
   DatMod.TabCrono.Next;
   repeat
      if myInt(DatMod.TabCrono.FieldByName('Nivel').AsString) > myInt(DatMod.TabDadosGeraisNivel.AsString) then
      begin
         l := l + 2;
         vExcel.Cells[ l, 1 ].Font.Bold := True;
         vExcel.Cells[ l, 2 ].Font.Bold := True;
      end;

      vExcel.Cells[ l, 1 ].Value := DatMod.TabCrono.FieldByName('Numero').asString + '   ' +
                                    Trim(DatMod.TabCrono.FieldByName('Descricao').asString);

      c := 4; //Financeiro
      j := 2; // coluna 2

      soma := 0;
      for i := 4 to DatMod.TabDadosGeraisPerodos.Value+3 do
      begin
         if DatMod.TabCrono.Fields[c].AsFloat > 0.00 then
         begin
            vExcel.Cells[ l, j ].Value := DatMod.TabCrono.Fields[c].AsCurrency;
            vExcel.Cells[ l, j ].HorizontalAlignment := 4;
            if myInt(DatMod.TabCrono.FieldByName('Nivel').AsString) > myInt(DatMod.TabDadosGeraisNivel.AsString) then
               vExcel.Cells[ l, j ].Font.Bold := True;
         end;
         if DatMod.TabCrono.Fields[c+1].AsFloat > 0.00 then
         begin
            vExcel.Cells[ l+1, j ].Value := FloatToStrF( DatMod.TabCrono.Fields[c+1].AsFloat, ffNumber, 15, 2 ) + '%';
            vExcel.Cells[ l+1, j ].HorizontalAlignment := 4;
            soma := soma + DatMod.TabCrono.Fields[c+1].AsFloat;
            vExcel.Cells[ l+1, j ].HorizontalAlignment := 4;
            if myInt(DatMod.TabCrono.FieldByName('Nivel').AsString) > myInt(DatMod.TabDadosGeraisNivel.AsString) then
               vExcel.Cells[ l+1, j ].Font.Bold := True;
         end;

         Inc(j);
         c := c + 2;
      end;
      vExcel.Cells[ l, j ].Value := DatMod.TabCrono.Fields[3].AsCurrency;

      vExcel.Cells[ l+1, j ].Value := FloatToStrF( soma, ffNumber, 15, 2 ) + '%';
      vExcel.Cells[ l+1, j ].HorizontalAlignment := 4;

      l := l + 2;

      DatMod.TabCrono.Next;
   until DatMod.TabCrono.Eof;

   DatMod.TabCrono.First;

   c := 4; //Financeiro
   j := 2; // coluna 2

   Inc(l);
   vExcel.Cells[ l, 1 ].Font.Bold := True;
   vExcel.Cells[ l, 2 ].Font.Bold := True;

   for i := 4 to DatMod.TabDadosGeraisPerodos.Value+3 do
   begin
      if DatMod.TabCrono.Fields[c].AsFloat > 0.00 then
      begin
         vExcel.Cells[ l, j ].Value := DatMod.TabCrono.Fields[c].AsCurrency;
         //vExcel.Cells[ l, j ].Value := FloatToStrF( DatMod.TabCrono.Fields[c].AsFloat, ffNumber, 15, 2 ) + '%';
         vExcel.Cells[ l, j ].HorizontalAlignment := 4;
         if myInt(DatMod.TabCrono.FieldByName('Nivel').AsString) > myInt(DatMod.TabDadosGeraisNivel.AsString) then
            vExcel.Cells[ l, j ].Font.Bold := True;
      end;
      Inc(j);
      c := c + 2;
   end;
   vExcel.Cells[ l, j ].Value := DatMod.TabCrono.Fields[3].AsCurrency;

   vExcel.ActiveSheet.Range[ rgdat+IntToStr(l) ].AutoFormat[ FormatCro ];

   Stat.SimpleText := 'Enviando Cronograma para a Fila de Impressão...';
   vExcel.Visible := True;
   vExcel.ActiveWorkBook.PrintPreview;
   //vExcel.ActiveSheet.PrintOut;

   //Sleep( 2000 );

   Stat.SimpleText := 'Copyright © 2000 by ' + NomeAutor;
   //ShowMessage( 'Cronograma enviado para a Impressão !!' );
end;

end.
