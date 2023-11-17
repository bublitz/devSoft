unit unAtualizando;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Gauges;

type
  TfrmAtualizando = class(TForm)
    Gauge1: TGauge;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetMax(const Value: integer);
    procedure SetPosition(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property Max: integer write SetMax;
    property Position: integer write SetPosition;
  end;

implementation

{$R *.dfm}

procedure TfrmAtualizando.FormCreate(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
end;

procedure TfrmAtualizando.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Screen.Cursor := crDefault;
  Action := caFree;
end;

procedure TfrmAtualizando.SetMax(const Value: integer);
begin
  Gauge1.MaxValue := Value;
end;

procedure TfrmAtualizando.SetPosition(const Value: integer);
begin
  Gauge1.Progress := Value;
end;

end.
