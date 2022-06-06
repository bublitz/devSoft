unit untLog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, RxLookup, ComCtrls, Db, IBCustomDataSet,
  IBQuery, Buttons, Grids, DBGrids, ExtCtrls, DBCtrls;

type
  TfrmLog = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    rbTodos: TRadioButton;
    rbEsp: TRadioButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDate1: TDateTimePicker;
    edtDate2: TDateTimePicker;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    dsLog: TDataSource;
    qrLog: TIBQuery;
    qrLogNOME: TIBStringField;
    qrLogDESCRICAO: TIBStringField;
    qrLogDATA: TDateField;
    qrLogHORA: TTimeField;
    edtUser: TRxLookupEdit;
    SpeedButton2: TSpeedButton;
    btnExcluir: TSpeedButton;
    procedure rbTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLog: TfrmLog;

implementation

uses untDtMod, untrellog, untMain;

{$R *.DFM}

procedure TfrmLog.rbTodosClick(Sender: TObject);
begin
  edtUser.Visible := rbEsp.Checked;
end;

procedure TfrmLog.FormShow(Sender: TObject);
begin
  edtDate1.Date := Date;
  edtDate2.Date := Date;
end;

procedure TfrmLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmLog.SpeedButton1Click(Sender: TObject);
begin
  qrLog.Close;
  qrLog.SQL.Clear;
  qrLog.SQL.Add('select u.nome, l.data, l.hora, l.descricao');
  qrLog.SQL.Add('from log l, usuario u');
  qrLog.SQL.Add('where l.matricula = u.matricula');
  if rbEsp.Checked then
  begin
    qrLog.SQL.Add('and l.matricula = :MATRIC');
    qrLog.ParamByName('MATRIC').AsString := edtUser.LookupValue;
  end;
  qrLog.SQL.Add('and l.data >= :DATA1' );
  qrLog.SQL.Add('and l.data <= :DATA2' );
  qrLog.ParamByName('DATA1').Asdate := edtDate1.Date;
  qrLog.ParamByName('DATA2').Asdate := edtDate2.Date;
  qrLog.SQL.Add('order by data desc, hora');
  qrLog.Open;
end;

procedure TfrmLog.SpeedButton2Click(Sender: TObject);
begin
  frmRelLog.QRCopy.Caption := frmMain.aplic;
  frmRelLog.QuickRep1.PrinterSetup;
  frmRelLog.QuickRep1.Prepare;
  frmRelLog.QuickRep1.Print;
end;

procedure TfrmLog.btnExcluirClick(Sender: TObject);
begin
  qrLog.Close;
  qrLog.SQL.Clear;
  qrLog.SQL.Add('delete from log');
  qrLog.SQL.Add('where data >= :DATA1' );
  qrLog.SQL.Add('  and data <= :DATA2' );
  qrLog.ParamByName('DATA1').Asdate := edtDate1.Date;
  qrLog.ParamByName('DATA2').Asdate := edtDate2.Date;
  if rbEsp.Checked then
  begin
    qrLog.SQL.Add('and matricula = :MATRIC');
    qrLog.ParamByName('MATRIC').AsString := edtUser.LookupValue;
  end;
  qrLog.ExecSQL;
  ShowMessage('Log excluído com sucesso!!');
end;

end.
