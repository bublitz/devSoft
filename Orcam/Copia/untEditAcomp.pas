unit untEditAcomp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, ExtCtrls;

type
  TfrmEditAcomp = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditAcomp: TfrmEditAcomp;

implementation

uses untDatMod, untCalculo;

{$R *.DFM}

procedure TfrmEditAcomp.Button1Click(Sender: TObject);
begin
   CalcInsCrono( 1 );
end;

end.
