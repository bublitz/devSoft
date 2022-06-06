unit untCompServico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, RXLookup, DBCtrls, Buttons, Mask, db, ToolEdit, CurrEdit;

type
  TfrmCompServico = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RxLookupEdit1: TRxLookupEdit;
    Edit1: TRxCalcEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    inclui: boolean;
  end;

var
  frmCompServico: TfrmCompServico;

implementation

uses untDatMod, untCalculo, untMain;

{$R *.DFM}

procedure TfrmCompServico.FormShow(Sender: TObject);
begin
   with DatMod.QryServ do begin
      Close;
      SQL.Clear;
      SQL.Add('select * from servicos');
      SQL.Add('where CodigoServico <> :CodSer');
      SQL.Add('order by CodigoServico');
      ParamByName('CodSer').AsString := DatMod.TabServicosCodigoServico.AsString;
      Open;
   end;
   if not inclui then
      if not DatMod.QryServ.Locate( 'CodigoServico',
          DatMod.QryCServ.FieldByName('CodigoServComp').Value, [loPartialKey,loCaseInsensitive]) then
      else begin
         RxLookupEdit1.Text := DatMod.QryCServ.FieldByName('Descricao').Value;
         Edit1.Text := DatMod.QryCServ.FieldByName('Quantidade').asString;
      end;
   RxLookupEdit1.Enabled := inclui;
   if inclui then RxLookupEdit1.SetFocus
   else Edit1.SetFocus;
end;

end.
