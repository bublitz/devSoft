unit untAniversario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, Buttons, StdCtrls, DB, TFlatSpeedButtonUnit;

type
  TfrmAniversario = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatSpeedButton2: TFlatSpeedButton;
    FlatSpeedButton3: TFlatSpeedButton;
    FlatSpeedButton4: TFlatSpeedButton;
    BitBtn1: TBitBtn;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
    procedure FlatSpeedButton1Click(Sender: TObject);
    procedure FlatSpeedButton2Click(Sender: TObject);
    procedure FlatSpeedButton3Click(Sender: TObject);
    procedure FlatSpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAniversario: TfrmAniversario;

implementation

uses untDtModEst;

{$R *.DFM}

procedure TfrmAniversario.SpeedButton3Click(Sender: TObject);
begin
  DmEst.tbAniversario.append;
end;

procedure TfrmAniversario.SpeedButton2Click(Sender: TObject);
begin
  dmEst.tbAniversario.Edit; 
end;

procedure TfrmAniversario.SpeedButton1Click(Sender: TObject);
begin
  If Application.MessageBox('Confirma Exclusão Aniversariante ?',
      'Confirmação',
       mb_YesNo + mb_ICONQUESTION) = mrYes then
       begin
       dmEst.tbAniversario.Delete;
       end;
end;
procedure TfrmAniversario.DBGrid1Enter(Sender: TObject);
begin
  if dmEst.tbCliente.State in [dsInsert,dsEdit] then
    dmEst.tbCliente.Post;
end;

procedure TfrmAniversario.FlatSpeedButton1Click(Sender: TObject);
begin
  dmEst.tbAniversario.Append;
end;

procedure TfrmAniversario.FlatSpeedButton2Click(Sender: TObject);
begin
  dmEst.tbAniversario.Edit;
end;

procedure TfrmAniversario.FlatSpeedButton3Click(Sender: TObject);
begin
  dmEst.tbAniversario.Delete;
end;

procedure TfrmAniversario.FlatSpeedButton4Click(Sender: TObject);
begin
  dmEst.tbAniversario.Post;
end;

end.
