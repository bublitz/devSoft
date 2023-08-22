unit DataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, sysinfo, RxQuery;

type
  TDatMod = class(TDataModule)
    DatBanco: TDataSource;
    TabBanco: TTable;
    Sesao: TSession;
    DatLancto: TDataSource;
    TabLancto: TTable;
    DatHist: TDataSource;
    TabHist: TTable;
    DatGrupo: TDataSource;
    TabGrupo: TTable;
    DatEmitido: TDataSource;
    TabEmitido: TTable;
    DatSitu: TDataSource;
    TabSitu: TTable;
    DatRecebido: TDataSource;
    TabRecebido: TTable;
    DatCliente: TDataSource;
    TabCliente: TTable;
    DatSaldo: TDataSource;
    TabSaldo: TTable;
    DatReceb: TDataSource;
    TabReceb: TTable;
    DatPagar: TDataSource;
    TabPagar: TTable;
    DatFornec: TDataSource;
    TabFornec: TTable;
    DatUsu: TDataSource;
    TabUsu: TTable;
    TabBancoCodigo: TAutoIncField;
    TabBancoNome: TStringField;
    TabBancoAgencia: TStringField;
    TabBancoConta: TStringField;
    TabEmitidoNumero: TAutoIncField;
    TabEmitidoEmissao: TDateField;
    TabEmitidoVencimento: TDateField;
    TabEmitidoPagamento: TDateField;
    TabEmitidoFornecedor: TIntegerField;
    TabEmitidoEmitido: TBooleanField;
    TabEmitidoLancamento: TIntegerField;
    TabRecebidoNumero: TAutoIncField;
    TabRecebidoNumeroCheque: TStringField;
    TabRecebidoBanco: TStringField;
    TabRecebidoEmissao: TDateField;
    TabRecebidoVencimento: TDateField;
    TabRecebidoPagamento: TDateField;
    TabRecebidoCliente: TIntegerField;
    TabRecebidoLancamento: TIntegerField;
    TabClienteCodigo: TAutoIncField;
    TabClienteNome: TStringField;
    TabClienteEndereco: TStringField;
    TabClienteBairro: TStringField;
    TabClienteCidade: TStringField;
    TabClienteUf: TStringField;
    TabClienteCep: TStringField;
    TabClienteCgcCpf: TStringField;
    TabClienteIeRg: TStringField;
    TabClienteTelefone: TStringField;
    TabClienteDataCadastro: TDateField;
    TabFornecCodigo: TAutoIncField;
    TabFornecNome: TStringField;
    TabFornecEndereco: TStringField;
    TabFornecBairro: TStringField;
    TabFornecCidade: TStringField;
    TabFornecUf: TStringField;
    TabFornecCep: TStringField;
    TabFornecCgcCpf: TStringField;
    TabFornecIeRg: TStringField;
    TabFornecTelefone: TStringField;
    TabFornecDataCadastro: TDateField;
    TabGrupoCodigo: TAutoIncField;
    TabGrupoDescricao: TStringField;
    TabHistCodigo: TAutoIncField;
    TabHistDescricao: TStringField;
    TabLanctoNumero: TAutoIncField;
    TabLanctoBanco: TIntegerField;
    TabLanctoData: TDateField;
    TabLanctoTipo: TStringField;
    TabLanctoHistorico: TIntegerField;
    TabLanctoComplemento: TStringField;
    TabPagarNumero: TAutoIncField;
    TabPagarFornecedor: TIntegerField;
    TabPagarGrupo: TIntegerField;
    TabPagarEmissao: TDateField;
    TabPagarVencimento: TDateField;
    TabPagarSituacao: TIntegerField;
    TabPagarMulta: TFloatField;
    TabPagarTipoMulta: TStringField;
    TabPagarJuros: TFloatField;
    TabPagarTipoJuros: TStringField;
    TabPagarPagamento: TDateField;
    TabPagarCheque: TIntegerField;
    TabRecebNumero: TAutoIncField;
    TabRecebCliente: TIntegerField;
    TabRecebGrupo: TIntegerField;
    TabRecebEmissao: TDateField;
    TabRecebVencimento: TDateField;
    TabRecebSituacao: TIntegerField;
    TabRecebMulta: TFloatField;
    TabRecebTipoMulta: TStringField;
    TabRecebJuros: TFloatField;
    TabRecebTipoJuros: TStringField;
    TabRecebPagamento: TDateField;
    TabRecebCheque: TIntegerField;
    TabSaldoBanco: TIntegerField;
    TabSaldoData: TDateField;
    TabSituCodigo: TAutoIncField;
    TabSituDescricao: TStringField;
    TabUsuUsuario: TStringField;
    TabUsuSenha: TStringField;
    TabUsuNomeCompleto: TStringField;
    TabUsuAcesso: TStringField;
    TabUsuCrc: TIntegerField;
    SysInf: TSysInfo;
    RxQryPesq: TRxQuery;
    DatPesq: TDataSource;
    TabEmitidoBanco: TIntegerField;
    TabEmitidoCheque: TStringField;
    TabBancoSaldo: TCurrencyField;
    TabEmitidoValor: TCurrencyField;
    TabRecebidoValor: TCurrencyField;
    TabLanctoValor: TCurrencyField;
    TabPagarValor: TCurrencyField;
    TabPagarValorPago: TCurrencyField;
    TabRecebValor: TCurrencyField;
    TabRecebValorPago: TCurrencyField;
    TabSaldoSaldo: TCurrencyField;
    QryRelat: TRxQuery;
    DatRelat: TDataSource;
    procedure DatModCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatMod: TDatMod;

implementation

uses Splash;

{$R *.DFM}

procedure TDatMod.DatModCreate(Sender: TObject);
var
  path: string;

begin
    path := ExtractFilePath(Application.ExeName) + 'Data';
    Sesao.PrivateDir := SysInf.WinTempPath;
    TabBanco.DatabaseName := path;
    TabBanco.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabLancto.DatabaseName := path;
    TabLancto.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabHist.DatabaseName := path;
    TabHist.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabGrupo.DatabaseName := path;
    TabGrupo.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabEmitido.DatabaseName := path;
    TabEmitido.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabSitu.DatabaseName := path;
    TabSitu.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabRecebido.DatabaseName := path;
    TabRecebido.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabCliente.DatabaseName := path;
    TabCliente.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabSaldo.DatabaseName := path;
    TabSaldo.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabReceb.DatabaseName := path;
    TabReceb.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabPagar.DatabaseName := path;
    TabPagar.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabFornec.DatabaseName := path;
    TabFornec.Open;
    SplashForm.PBar.Position := SplashForm.PBar.Position + 1;
    TabUsu.DatabaseName := path;
    TabUsu.Open;
end;

end.
