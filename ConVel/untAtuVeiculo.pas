unit untAtuVeiculo;

interface

uses
  SysUtils, Types, Classes, QGraphics, QControls, QForms, QDialogs,
  QStdCtrls, QMask, QDBCtrls, QButtons;

type
  TfrmAtuVeiculo = class(TForm)
    Label1: TLabel;
    DBEdit8: TDBEdit;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtuVeiculo: TfrmAtuVeiculo;

implementation

uses untAtuManut, untDatMod;

{$R *.xfm}

procedure TfrmAtuVeiculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAtuVeiculo.btnGravarClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmAtuVeiculo.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
