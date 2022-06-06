unit untPesqServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Grids, DBGrids, Buttons, DB;

type
  TfrmPesqServ = class(TForm)
    DBGrid1: TDBGrid;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure EditPesqChange(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesqServ: TfrmPesqServ;

implementation

uses untDatMod, untEditOrcam;

{$R *.DFM}

procedure TfrmPesqServ.EditPesqChange(Sender: TObject);
begin
   DatMod.TabServicos.Locate( 'Descricao', EditPesq.Text, [loPartialKey,loCaseInsensitive]);
end;

procedure TfrmPesqServ.RdGrpOrdemClick(Sender: TObject);
begin
   if RdGrpOrdem.ItemIndex = 0 then
      DatMod.TabServicos.IndexName := 'IndDescricao'
   else
      DatMod.TabServicos.IndexName := '';
end;

procedure TfrmPesqServ.FormShow(Sender: TObject);
begin
  if frmEditOrcam.cod_serv <> '' then
    DatMod.TabServicos.FindKey([ frmEditOrcam.cod_serv ] );
end;

end.
