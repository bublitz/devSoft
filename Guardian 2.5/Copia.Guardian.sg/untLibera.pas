unit untLibera;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrmLibera = class(TForm)
    Label1: TLabel;
    edtSenha: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLibera: TfrmLibera;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmLibera.FormShow(Sender: TObject);
begin
  edtSenha.Text := '';
  edtSenha.SetFocus;
end;

procedure TfrmLibera.Button1Click(Sender: TObject);
begin
  if edtSenha.Text = dtMod.tbEmpresaSENHALIBERA.Value then
    ModalResult := mrOk
  else
  begin
    raise exception.Create('Senha Inválida !');
    ModalResult := mrCancel;
  end;
end;

procedure TfrmLibera.SpeedButton2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmLibera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
