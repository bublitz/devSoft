unit untAtuIns;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids;

type
  TfrmAtuIns = class(TForm)
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtuIns: TfrmAtuIns;

implementation

uses untDatMod;

{$R *.DFM}

end.
