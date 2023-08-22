unit CadTabela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dbtables, Buttons, Grids, DBGrids, RXDBCtrl;

type
  TFrmTabela = class(TForm)
    RxDBGrid: TRxDBGrid;
    SpBtnFechar: TSpeedButton;
    SpBtnExcluir: TSpeedButton;
    procedure SpBtnFecharClick(Sender: TObject);
    procedure SpBtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tabela: TTable;
  end;

var
  FrmTabela: TFrmTabela;

implementation

{$R *.DFM}

uses DataMod, Funcoes;

procedure TFrmTabela.SpBtnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TFrmTabela.SpBtnExcluirClick(Sender: TObject);
begin
   exclui( Tabela );
end;

end.
