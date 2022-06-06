unit untEdtCrono;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, DB, ExtCtrls, StdCtrls, DBCtrls;

type
  TfrmEdtCrono = class(TForm)
    DBGrCro: TRxDBGrid;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    Panel2: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LabV1: TLabel;
    LabP1: TLabel;
    LabP2: TLabel;
    LabV2: TLabel;
    DatNot: TDataSource;
    procedure TabCronoAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure DBGrCroGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrCroColEnter(Sender: TObject);
    procedure DBGrCroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  tam: array[0..3] of integer = ( 45, 15, 170, 100 );
  tit: array[0..3] of string  = ('Número','N','Descrição','Valor');

var
  frmEdtCrono: TfrmEdtCrono;


implementation

uses untDatMod, Funcoes, untEdtLinCro, untCalculo;

{$R *.DFM}

procedure TfrmEdtCrono.TabCronoAfterScroll(DataSet: TDataSet);
var
   campo: TField;
   v1, v2: real;
   c1, c2, c3, c4: integer;

begin
   campo := frmEdtCrono.DBGrCro.SelectedField;

   c1 := campo.Index - frmEdtCrono.RadioGroup1.ItemIndex;
   c2 := c1 + 1;

   c4 := DataSet.FieldCount - 1;
   c3 := c4 - 1;

   v1 := DatMod.TabCrono.Fields[ c3 ].AsFloat;
   v2 := DatMod.TabCrono.Fields[ c4 ].AsFloat;

   if c1 > 3 then
   begin
      LabV1.Caption := FloatToStrF( DatMod.TabCrono.Fields[ c1 ].AsFloat, ffCurrency, 15, 2 );
      LabP1.Caption := FloatToStrF( DatMod.TabCrono.Fields[ c2 ].AsFloat, ffNumber, 15, 2 ) + '%';
   end
   else
   begin
      LabV1.Caption := '';
      LabV2.Caption := '';
   end;

   LabV2.Caption := FloatToStrF( v1, ffCurrency, 15, 2 );
   LabP2.Caption := FloatToStrF( v2, ffNumber, 15, 2 ) + '%';

end;

procedure TfrmEdtCrono.FormShow(Sender: TObject);
var
   i, d, p, c: integer;

begin
   DBGrCro.DataSource := DatMod.DatCrono;
   DatMod.TabCrono.AfterScroll := TabCronoAfterScroll;

   DBGrCro.Columns.Clear;
   for i := 0 to 3 do
   begin
      DBGrCro.Columns.Add;
      DBGrCro.Columns.Items[i].Field := DatMod.TabCrono.Fields[i];
      DBGrCro.Columns[i].Width := tam[i];
      DBGrCro.Columns[i].Title.Caption := tit[i];
      DBGrCro.Columns[i].ReadOnly := True;
   end;
   DBGrCro.Columns[3].Title.Alignment := taRightJustify;

   c := 4 + RadioGroup1.ItemIndex;
   d := 0;
   DatMod.TabTPeri.FindKey( [DatMod.TabDadosGeraisTipoPeriodo.AsInteger ] );
   p := DatMod.TabTPeriDias.Value;

   for i := 4 to DatMod.TabDadosGeraisPerodos.Value+3 do
   begin
      DBGrCro.Columns.Add;
      //DatMod.TabCrono.Fields[c].DisplayFormat := ',#0.00';
      DBGrCro.Columns.Items[i].Field := DatMod.TabCrono.Fields[c];
      DBGrCro.Columns[i].Title.Caption := IntToStr(d+1) + ' - ' + IntToStr(d+p);
      DBGrCro.Columns[i].Title.Alignment := taCenter;
      d := d + p;
      c := c + 2;
   end;

   //DBGrCro.FixedCols := 1;

   DBGrCro.SetFocus;
   
end;

procedure TfrmEdtCrono.DBGrCroGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  nivel: Integer;
begin
  if Field.FieldName = 'Valor' then
    AFont.Style := AFont.Style + [fsBold];

  if Pos( Field.FieldName, 'Numero*Nivel*Valor' ) > 0 then
    AFont.Color := clRed;

  //else if Field.FieldName = 'Descricao' then
  //  Background := clYellow;

  nivel := myInt((Sender as TrxDBGrid).DataSource.DataSet.FieldByName('Nivel').AsString);
  if nivel > myInt(DatMod.TabDadosGeraisNivel.AsString) then
  begin
    Background := $00CFCFCF;
    AFont.Color := clRed;
  end;

end;

procedure TfrmEdtCrono.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DatMod.TabCrono.AfterScroll := nil;
end;

procedure TfrmEdtCrono.DBGrCroColEnter(Sender: TObject);
begin
   TabCronoAfterScroll( DBGrCro.DataSource.DataSet );
end;

procedure TfrmEdtCrono.DBGrCroKeyPress(Sender: TObject; var Key: Char);
var
   campo: TField;
   c1: string;

begin
   if key = #13 then
   begin
      campo := (Sender as TrxDBGrid).SelectedField;
      if Copy(campo.FieldName, 1, 3) = 'Per' then
      begin
         c1 := Copy(campo.FieldName, 5, 5 );
         frmEdtLinCro.DBEdtVl.DataField := 'PerV' + c1;
         frmEdtLinCro.DBEdtPc.DataField := 'PerP' + c1;

         if DatMod.TabCrono.State <> dsEdit then
            DatMod.TabCrono.Edit;

         frmEdtLinCro.valor := DatMod.TabCrono.FieldByName('Valor').AsFloat;
         if Copy(campo.FieldName, 1, 4) = 'PerV' then
            frmEdtLinCro.DBEdtVl.Enabled := True
         else
            frmEdtLinCro.DBEdtVl.Enabled := False;

         frmEdtLinCro.DBEdtPc.Enabled := not frmEdtLinCro.DBEdtVl.Enabled;

         if frmEdtLinCro.ShowModal = mrOk then
         begin
            DatMod.TabCrono.Post;
            DBGrCro.DataSource := DatNot;
            DatMod.TabCrono.AfterScroll := nil;
            CalcCrono;
            DatMod.TabCrono.AfterScroll := TabCronoAfterScroll;
            DBGrCro.DataSource := DatMod.DatCrono;
            DatMod.TabCrono.Refresh;
         end
         else
            DatMod.TabCrono.Cancel;
      end;
   end;
end;

end.

