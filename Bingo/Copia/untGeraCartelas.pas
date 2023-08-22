unit untGeraCartelas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, mxarrays, Gauges, Buttons;

type
  TfrmGeraCartelas = class(TForm)
    LstVw: TListView;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Gauge1: TGauge;
    LabP: TLabel;
    procedure GeraNumeros(Sender: TObject);
    procedure MostraNumeros(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure GravaNumeros(Sender: TObject);
    function CartelaOk(Sender: TObject): boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraCartelas: TfrmGeraCartelas;
  dez: array [ 1..25 ] of integer;

implementation

uses Funcoes, untDatMod;

{$R *.DFM}

procedure TfrmGeraCartelas.GeraNumeros(Sender: TObject);
var
   i, d, w, v, c: Integer;

begin
   Application.ProcessMessages;
   Clear( dez );
   i := 1;
   c := 1;
   while c <= 81 do begin
      d := Random( 2 ) + 2;
      w := 0;
      while w < d do begin
         v := Random(10) + c;
         if Find( dez, v ) = -1 then begin
            dez[i] := v;
            inc(i);
            inc(w);
         end;
         if i > 25 then begin
            w := d;
            c := 90;
         end;
      end;
      c := c + 10;
   end;
   while i <= 25 do begin
      v := Random(89) + 1;
      if Find( dez, v ) = -1 then begin
         dez[i] := v;
         inc(i);
      end;
   end;
end;

procedure TfrmGeraCartelas.MostraNumeros(Sender: TObject);
var i: integer;
   ListItem: TListItem;

begin
   LstVw.Items.Clear;
   Sort( dez );
   for I := 1 to 25 do begin
      ListItem := LstVw.Items.Add;
      ListItem.Caption := inttostr(dez[i]);
   end;
end;

procedure TfrmGeraCartelas.FormShow(Sender: TObject);
begin
   Randomize;
end;

procedure TfrmGeraCartelas.BitBtn1Click(Sender: TObject);
var i, t: longint;
begin
   t := StrToInt( Edit1.Text );
   Gauge1.MaxValue := t;
   Gauge1.Progress := 0;
   i := 0;
   while i < t do begin
      GeraNumeros(Sender);
      MostraNumeros(Sender);
      if CartelaOk(Sender) then begin
         GravaNumeros(Sender);
         Inc( i );
      end;
      Gauge1.Progress := i;
      LabP.Caption := IntToStr( i );
   end;
end;

function TfrmGeraCartelas.CartelaOk(Sender: TObject): boolean;
var num, i, t, v: integer;
    ok: boolean;
begin
   DatMod.TabCartelas.First;
   ok := true;
   repeat
      num := 0;
      for i := 1 to 25 do begin
         v := StrToInt(Copy(DatMod.TabCartelas.FieldByName('Dezenas').AsString, i*2-1, 2 ));
         for t := 1 to 25 do
            if v = dez[ t ] then
               Inc(num)
      end;
      DatMod.TabCartelas.Next;
      if num > 10 then
         ok := false;
   until DatMod.TabCartelas.Eof;
   cartelaok := ok;
end;

procedure TfrmGeraCartelas.GravaNumeros(Sender: TObject);
var
   dezenas: string;
   i, numCartela: integer;

begin
   dezenas := '';
   for i := 1 to 25 do
       dezenas := dezenas + StrZero( dez[i], 2 , 0 );
   DatMod.TabCartelas.Last;
   numCartela := DatMod.TabCartelas.FieldByName('Numero').Value + 1;
   DatMod.TabCartelas.Insert;
   DatMod.TabCartelas.FieldByName('Numero').Value := numCartela;
   DatMod.TabCartelas.FieldByName('Dezenas').Value := dezenas;
   DatMod.TabCartelas.Post;
end;

end.

