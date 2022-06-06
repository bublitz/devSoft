unit untGrafHoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, TeeProcs, TeEngine, Chart, DBChart, Db, Grids, DBGrids, Series,
  IBCustomDataSet, IBQuery, RXCtrls, StdCtrls, Mask, ToolEdit,
  TFlatSpeedButtonUnit;

type
  TfrmGrafHoras = class(TForm)
    qrGraph: TIBQuery;
    dsGraph: TDataSource;
    Graf: TDBChart;
    Series1: TBarSeries;
    qrGraphCODIGOMICRO: TIntegerField;
    qrGraphHORAS: TFloatField;
    qrGraphDESCRICAO: TIBStringField;
    Panel1: TPanel;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    FlatSpeedButton1: TFlatSpeedButton;
    btnImprimir: TFlatSpeedButton;
    btnCopiar: TFlatSpeedButton;
    RadioGroup1: TRadioGroup;
    rgTipo: TRadioGroup;
    Series2: TPieSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FlatSpeedButton1Click(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGrafHoras: TfrmGrafHoras;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmGrafHoras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmGrafHoras.FlatSpeedButton1Click(Sender: TObject);
begin
  if DateEdit1.Date > DateEdit1.Date then
    raise exception.Create('Período Inválido !!')
  else
  begin
    qrGraph.Close;
    graf.Visible := False;
    graf.Title.Text[0] := 'Utilização: ' + DateEdit1.Text + ' a ' + DateEdit2.Text;
    graf.Title.Text[1] := 'devSoft Guardian 2.5';
    qrGraph.SQL.Clear;
    qrGraph.SQL.Add('select f.codigomicro, m.descricao, sum(f.horas)*24 horas');
    qrGraph.SQL.Add('from movimentofechado f, micro m');
    qrGraph.SQL.Add('where f.codigomicro=m.codigomicro and f.dhfinal >= :data1 and f.dhfinal < :data2');
    qrGraph.SQL.Add('group by f.codigomicro, m.descricao');
    if rgTipo.ItemIndex = 0 then
      graf.Series[0].Active := True
    else
      graf.Series[0].Active := False;
    graf.Series[1].Active := not graf.Series[0].Active;
    graf.Legend.Visible := graf.Series[1].Active;
    graf.View3DOptions.Orthogonal := graf.Series[0].Active;
    qrGraph.ParamByName('DATA1').AsDate := DateEdit1.Date;
    qrGraph.ParamByName('DATA2').AsDate := DateEdit2.Date+1;
    qrGraph.Open;
    graf.Visible := True;
    btnImprimir.Visible := True;
    btnCopiar.Visible := True;
  end;
end;

procedure TfrmGrafHoras.btnImprimirClick(Sender: TObject);
begin
  graf.Print;
end;

procedure TfrmGrafHoras.btnCopiarClick(Sender: TObject);
begin
  graf.CopyToClipboardMetafile(True);
end;

end.
