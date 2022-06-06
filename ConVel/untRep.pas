unit untRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, DB, Provider, SqlExpr, DBClient, DBLocal,
  DBLocalS;

type
  TfrmRep = class(TForm)
    QuickRep1: TQuickRep;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRep: TfrmRep;

implementation

uses untDatMod, untDataMod;

{$R *.dfm}

end.
