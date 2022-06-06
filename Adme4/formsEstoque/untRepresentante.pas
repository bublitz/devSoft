unit untRepresentante;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DB, TFlatSpeedButtonUnit;

type
  TfrmRepresentante = class(TForm)
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
  frmRepresentante: TfrmRepresentante;

implementation

uses untDtModEst;

{$R *.DFM}

procedure TfrmRepresentante.SpeedButton3Click(Sender: TObject);
begin
  dmEst.tbRepresentante.Append;
end;

procedure TfrmRepresentante.SpeedButton2Click(Sender: TObject);
begin
  dmEst.tbRepresentante.Edit;
end;

procedure TfrmRepresentante.SpeedButton1Click(Sender: TObject);
begin
 If Application.MessageBox('Confirma Exclusão Representate ?',
      'Confirmação',
       mb_YesNo + mb_ICONQUESTION) = mrYes then
       begin
       dmEst.tbRepresentante.Delete;
       end;
end;

procedure TfrmRepresentante.DBGrid1Enter(Sender: TObject);
begin
  if dmEst.tbFornec.State in [dsInsert, dsEdit] then
     dmEst.tbFornec.Post;
end;

procedure TfrmRepresentante.FlatSpeedButton1Click(Sender: TObject);
begin
  dmEst.tbRepresentante.Append;
end;

procedure TfrmRepresentante.FlatSpeedButton2Click(Sender: TObject);
begin
  dmEst.tbRepresentante.Edit;
end;

procedure TfrmRepresentante.FlatSpeedButton3Click(Sender: TObject);
begin
  dmEst.tbRepresentante.Delete;
end;

procedure TfrmRepresentante.FlatSpeedButton4Click(Sender: TObject);
begin
  dmEst.tbRepresentante.Post;
end;

end.
