unit untTipoPeri;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBGrids, Grids;

type
  TfrmTipoPeri = class(TForm)
    DBGrdPeri: TDBGrid;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmTipoPeri: TfrmTipoPeri;

implementation

uses untDatMod;

{$R *.DFM}

end.
