unit untTeste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids;

type
  TfrmTeste = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTeste: TfrmTeste;

implementation

uses untDM;

{$R *.dfm}

end.
