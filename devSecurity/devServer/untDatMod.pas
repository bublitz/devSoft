unit untDatMod;

interface

uses
  SysUtils, Classes, DB, DBTables, Forms;

type
  TdtMod = class(TDataModule)
    dsUser: TDataSource;
    dsEstacao: TDataSource;
    tbUser: TTable;
    tbEstacao: TTable;
    tbUserCodigoUser: TAutoIncField;
    tbUserNomeCompleto: TStringField;
    tbUserNomeLogin: TStringField;
    tbUserSenha: TStringField;
    tbEstacaoCodigoEstacao: TAutoIncField;
    tbEstacaoDescricao: TStringField;
    tbEstacaoIP: TStringField;
    tbEstacaoHoraDomI: TTimeField;
    tbEstacaoHoraDomF: TTimeField;
    tbEstacaoHoraSegSexI: TTimeField;
    tbEstacaoHoraSegSexF: TTimeField;
    tbEstacaoHoraSabI: TTimeField;
    tbEstacaoHoraSabF: TTimeField;
    dsLog: TDataSource;
    tbLog: TTable;
    tbLogCodigoUser: TIntegerField;
    tbLogCodigoEstacao: TIntegerField;
    tbLogData: TDateField;
    tbLogHora: TTimeField;
    tbLogDescricao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtMod: TdtMod;

implementation

{$R *.dfm}

procedure TdtMod.DataModuleCreate(Sender: TObject);
begin
  tbUser.DatabaseName := ExtractFilePath(Application.ExeName);
  tbEstacao.DatabaseName := tbUser.DatabaseName;
  tbUser.Open;
  tbEstacao.Open;
end;

end.
