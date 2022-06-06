unit frmCadBasico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, StdCtrls, Buttons, ImgList, Grids,
  DBGrids, DB, DBClient;

type
  TStatusBotoes = (stInsercao, stNavegacao);
  TStatusPanels = (stCadastro, stConsulta, stResultSet);

  TfCadBasico = class(TForm)
    pnlBotoes: TPanel;
    pnlPesquisa: TPanel;
    pnlResultSet: TPanel;
    pnlCampos: TPanel;
    StatusBar: TStatusBar;
    MenuPrincipal: TMainMenu;
    Arquivo1: TMenuItem;
    Fechar1: TMenuItem;
    Funes1: TMenuItem;
    NovoRegistro: TMenuItem;
    GravarRegistro: TMenuItem;
    N1: TMenuItem;
    EditarRegistro: TMenuItem;
    ExcluirRegistro: TMenuItem;
    N2: TMenuItem;
    Pesquisar: TMenuItem;
    N3: TMenuItem;
    SobreoSistema1: TMenuItem;
    ImageList: TImageList;
    bbtNovoRegistro: TBitBtn;
    bbtGravarRegistro: TBitBtn;
    bbtEditarRegistro: TBitBtn;
    bbtExcluirRegistro: TBitBtn;
    bbtPesquisar: TBitBtn;
    bbtFechar: TBitBtn;
    pnlResultSetBotoes: TPanel;
    bbtSelecionaRegistro: TBitBtn;
    bbtVoltarPesquisa: TBitBtn;
    dbGrid: TDBGrid;
    pnlPesquisaBotoes: TPanel;
    bbtPesquisarRegistro: TBitBtn;
    bbtVoltarCadastro: TBitBtn;
    dsCadBasico: TDataSource;
    cdsCadBasico: TClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtFecharClick(Sender: TObject);
    procedure bbtVoltarPesquisaClick(Sender: TObject);
    procedure bbtSelecionaRegistroClick(Sender: TObject);
    procedure bbtVoltarCadastroClick(Sender: TObject);
    procedure bbtPesquisarRegistroClick(Sender: TObject);
    procedure bbtPesquisarClick(Sender: TObject);
    procedure bbtNovoRegistroClick(Sender: TObject);
    procedure bbtGravarRegistroClick(Sender: TObject);
    procedure bbtExcluirRegistroClick(Sender: TObject);
    procedure bbtEditarRegistroClick(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure ConfiguraBotoes(EStatusBotoes: TStatusBotoes);
    procedure ConfiguraPanels(EStatusPanels: TStatusPanels);
    function PersistirDados: Integer; Virtual; Abstract;
  public
    { Public declarations }
  end;

var
  fCadBasico: TfCadBasico;

implementation

uses untDM;

{$R *.dfm}

{ TfCadBasico }

procedure TfCadBasico.ConfiguraBotoes(EStatusBotoes: TStatusBotoes);
begin
  if EStatusBotoes = stInsercao then
  begin
    // Botoes
    bbtNovoRegistro.Enabled    := False;
    bbtGravarRegistro.Enabled  := True;
    bbtExcluirRegistro.Enabled := True;
    bbtEditarRegistro.Enabled := False;
    // Itens de Menu (Função)
    NovoRegistro.Enabled    := False;
    GravarRegistro.Enabled  := True;
    ExcluirRegistro.Enabled := True;
    EditarRegistro.Enabled := False;
  end
  else
  if EStatusBotoes = stNavegacao then
  begin
    // Botoes
    bbtNovoRegistro.Enabled    := True;
    bbtGravarRegistro.Enabled  := False;
    if not cdsCadBasico.IsEmpty then
    begin
      bbtExcluirRegistro.Enabled := True;
      bbtEditarRegistro.Enabled := True;
    end
    else
    begin
      bbtExcluirRegistro.Enabled := False;
      bbtEditarRegistro.Enabled := False;
    end;
    // Itens de Menu (Função)
    NovoRegistro.Enabled    := True;
    GravarRegistro.Enabled  := False;
    if not cdsCadBasico.IsEmpty then
    begin
      ExcluirRegistro.Enabled := True;
      EditarRegistro.Enabled := True;
    end
    else
    begin
      ExcluirRegistro.Enabled := False;
      EditarRegistro.Enabled := False;
    end;
  end;
end;

procedure TfCadBasico.ConfiguraPanels(EStatusPanels: TStatusPanels);
begin
  if EStatusPanels = stCadastro then
  begin
    pnlCampos.Visible    := True;
    pnlPesquisa.Visible  := False;
    pnlResultSet.Visible := False;
    pnlCampos.BringToFront;
  end
  else if EStatusPanels = stConsulta then
  begin
    pnlPesquisa.Visible  := True;
    pnlCampos.Visible    := False;
    pnlResultSet.Visible := False;
    pnlPesquisa.BringToFront;
  end
  else if EStatusPanels = stResultSet then
  begin
    pnlResultSet.Visible := True;
    pnlPesquisa.Visible  := False;
    pnlCampos.Visible    := False;
    pnlResultSet.BringToFront;
  end;
end;

procedure TfCadBasico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfCadBasico.FormShow(Sender: TObject);
begin
  try
    cdsCadBasico.Open;
    ConfiguraPanels(stCadastro);
    ConfiguraBotoes(stNavegacao);
  except
    on e:exception do
      raise exception.Create('Erro ao inicializar a classe ' +
        Self.ClassName + '.'#13'Mensagem: ' + e.Message);
  end;
end;

procedure TfCadBasico.bbtNovoRegistroClick(Sender: TObject);
begin
  ActiveControl := nil;
  try
    if not pnlCampos.Visible then
      ConfiguraPanels(stCadastro);

    if not dmPrinc.ConAdmi.Connected then
      Exception.Create('O banco de dados não está conectado!');

    if not (cdsCadBasico.Active) then
      Exception.Create('O DataSet não está aberto.');

    if cdsCadBasico.State = dsEdit then
      Exception.Create('O registro se encontra em modo de edição.');

    cdsCadBasico.Append;
    ConfiguraBotoes(stInsercao);
  except
    on E:Exception do
    begin
      ConfiguraBotoes(stNavegacao);
      Raise Exception.Create('Ocorreu um erro inicializar um novo registro.' +#13+ 'Mensagem: ' + E.Message);
    end;
  end;
end;

procedure TfCadBasico.bbtPesquisarClick(Sender: TObject);
begin
  ActiveControl := nil;
  try
    if not pnlPesquisa.Visible then
      ConfiguraPanels(stConsulta);
  except
    ConfiguraBotoes(stNavegacao);
  end;
end;

procedure TfCadBasico.bbtPesquisarRegistroClick(Sender: TObject);
begin
  ConfiguraPanels(stResultSet);
end;

procedure TfCadBasico.bbtSelecionaRegistroClick(Sender: TObject);
begin
  ConfiguraPanels(stCadastro);
end;

procedure TfCadBasico.bbtVoltarCadastroClick(Sender: TObject);
begin
  ConfiguraPanels(stCadastro);
end;

procedure TfCadBasico.bbtVoltarPesquisaClick(Sender: TObject);
begin
  ConfiguraPanels(stConsulta);
end;

procedure TfCadBasico.bbtGravarRegistroClick(Sender: TObject);
begin
  ActiveControl := nil;
  try
    if not pnlCampos.Visible then
      ConfiguraPanels(stCadastro);

    if not dmPrinc.ConAdmi.Connected then
      Exception.Create('O banco de dados não está conectado!');

    if not cdsCadBasico.Active then
      Exception.Create('O DataSet não está aberto.');

    // Se o registro não estiver em estado de inserção ou edição o registro não
    // deverá ser salvo.
    if (not (cdsCadBasico.State = dsInsert)) and  (not (cdsCadBasico.State = dsEdit)) then
      Exception.Create('O registro não se encontra em estado de edição.');

    if PersistirDados < 0 then
      Exit;

    cdsCadBasico.Post;
    if cdsCadBasico.ApplyUpdates(0) > 0 then
      Exception.Create('Falha no banco de dados.');
    ConfiguraBotoes(stNavegacao);
  except
    on E:Exception do
      Raise Exception.Create('Ocorreu um erro ao gravar os dados no banco de dados.' +#13+ 'Mensagem: ' + E.Message);
  end;
end;

procedure TfCadBasico.bbtExcluirRegistroClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Application.MessageBox('Deseja excluir o registro selecionado?', 'Confirma exclusão', MB_YesNo + MB_ICONQUESTION) = IdNo then
    Exit;

  try
    if not pnlCampos.Visible then
      ConfiguraPanels(stCadastro);

    if not dmPrinc.ConAdmi.Connected then
      Exception.Create('O banco de dados não está conectado!');

    if not cdsCadBasico.Active then
      Exception.Create('O DataSet não está aberto.');

    if cdsCadBasico.State = dsEdit then
      cdsCadBasico.Cancel
    else
    begin
      cdsCadBasico.Delete;
      if cdsCadBasico.ApplyUpdates(0) > 0 then
        Exception.Create('Falha no banco de dados.');
    end;
    ConfiguraBotoes(stNavegacao);
  except
    on E:Exception do
    begin
      ConfiguraBotoes(stNavegacao);
      Raise Exception.Create('Ocorreu um erro ao excluir os dados do banco de dados.' +#13+ 'Mensagem: ' + E.Message);
    end;
  end;
end;

procedure TfCadBasico.bbtFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfCadBasico.bbtEditarRegistroClick(Sender: TObject);
begin
  ActiveControl := nil;
  try
    if not pnlCampos.Visible then
      ConfiguraPanels(stCadastro);

    if not dmPrinc.ConAdmi.Connected then
      Exception.Create('O banco de dados não está conectado!');

    if not cdsCadBasico.Active then
      Exception.Create('O DataSet não está aberto.');

    // Se o registro estiver em estado de inserção ou edição o registro não
    // deverá ser colocado em estado de edição.
    if (cdsCadBasico.State = dsInsert) or (cdsCadBasico.State = dsEdit) then
      Exception.Create('O registro já se encontra em edição.');

    cdsCadBasico.Edit;
    ConfiguraBotoes(stInsercao);
  except
    on E:Exception do
    begin
      ConfiguraBotoes(stNavegacao);
      Raise Exception.Create('Ocorreu um erro ao tentar editar o registro.' +#13+ 'Mensagem: ' + E.Message);
    end;
  end;
end;

end.
