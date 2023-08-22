unit untSorteio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ComCtrls, StdCtrls, Lcd99, ExtCtrls, Buttons;

type
  TfrmSorteio = class(TForm)
    Bevel1: TBevel;
    BtnFechar: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    Label2: TLabel;
    LabDez: TLabel;
    GroupBox1: TGroupBox;
    LBoxBoa: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BuscaDezena(Sender: TObject; dezena, value: integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSorteio: TfrmSorteio;
  Numbers: array[ 0..89 ] of TLCD99;
  dezsort: array[ 1..90 ] of integer;
  cartelas: array[ 1..100 ] of integer;
  numdezenas: integer;
  dezenas: string;

implementation

uses Funcoes, untDatMod;

{$R *.DFM}

procedure TfrmSorteio.FormCreate(Sender: TObject);
var
   lin, col, i : integer;
begin
   for i := 0 to 89 do begin
      lin := i div 10;
      col := i mod 10;
      Numbers[i] := TLCD99.Create(Self);
      with Numbers[i] do begin
         Parent := Self;
         DigitNum := 2;
         OnColor := clMaroon;
         Top := lin*55 + 15;
         Left := col*55 + 15;
         Height := 40;
         Width := 35;
         Value := StrZero( i+1, 2, 0 );
      end;
   end;
end;

procedure TfrmSorteio.BtnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSorteio.FormShow(Sender: TObject);
var
   i, v: byte;
   d: string;
begin
   Edit1.Text := '';
   Edit1.SetFocus;
   Memo1.Lines.Clear;
   LBoxBoa.Items.Clear;
   numdezenas := 0;
   Clear( dezsort );
   Clear( cartelas );
   Caption := DatMod.TabSorteio.FieldByName('Descricao').AsString;
   dezenas := AllTrim(DatMod.TabSorteio.FieldByName('Dezenas').AsString);

   for i := 0 to 89 do
      Numbers[i].OnColor := clMaroon;

   for i := 1 to 90 do begin
      d := Copy(DatMod.TabSorteio.FieldByName('Dezenas').AsString, i*2-1, 2 );
      if d > '' then v := StrToInt( d ) else v := 0;
      if v > 0 then begin
         Numbers[v-1].OnColor := clLime;
         Memo1.Lines[0] := d + '-' + Memo1.Lines[0];
         inc(numdezenas);
         dezsort[ numdezenas ] := v;
         BuscaDezena( Sender, v, 1 );
      end;
   end;
   Memo1.SelStart := 0;
   Memo1.SelLength := 0;
end;

procedure TfrmSorteio.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if ( Ord(key) < 48 ) or ( Ord(key) > 57 ) then
      Key := #0;
end;

procedure TfrmSorteio.BitBtn1Click(Sender: TObject);
var
   num: integer;

begin
   num := StrToInt( Edit1.Text ) - 1;
   if ( num >= 0 ) and ( num <= 89 ) then begin
      if Numbers[ num ].OnColor = clMaroon then begin
         Numbers[ num ].OnColor := clLime;
         Memo1.Lines[0] := StrZero( num+1, 2, 0 ) + '-' + Memo1.Lines[0];
         inc(numdezenas);
         LabDez.Caption := 'Dezenas: ' + inttostr(numdezenas);
         Memo1.SelStart := 0;
         Memo1.SelLength := 0;
         dezenas := dezenas + StrZero( num+1, 2, 0 );
         DatMod.TabSorteio.Edit;
         DatMod.TabSorteio.FieldByName('Dezenas').Value := dezenas;
         DatMod.TabSorteio.Post;
         dezsort[ numdezenas ] := num+1;
         LBoxBoa.Items.Clear;
         BuscaDezena( Sender, num+1, 1 );
      end;
   end else
      ShowMessage( 'Número inválido !!' );
   Edit1.SelectAll;
   Edit1.SetFocus;
end;

procedure TfrmSorteio.BitBtn2Click(Sender: TObject);
var
   num: integer;

begin
   if numdezenas > 0 then begin
      Edit1.Text := Copy( Memo1.Lines[0], 1, 2 );
      num := StrToInt( Copy( Memo1.Lines[0], 1, 2 ) );
      Numbers[ num-1 ].OnColor := clMaroon;
      dezsort[ numdezenas ] := 0;
      LBoxBoa.Items.Clear;
      dec(numdezenas);
      LabDez.Caption := 'Dezenas: ' + inttostr(numdezenas);
      Memo1.SelStart := 0;
      Memo1.SelLength := 3;
      Memo1.ClearSelection;
      dezenas := Copy( dezenas, 1, numdezenas*2 );
      DatMod.TabSorteio.Edit;
      DatMod.TabSorteio.FieldByName('Dezenas').Value := dezenas;
      DatMod.TabSorteio.Post;
      BuscaDezena( Sender, num, -1 );
   end;
   Edit1.SelectAll;
   Edit1.SetFocus;
end;

procedure TfrmSorteio.BuscaDezena(Sender: TObject; dezena, value: integer);
var
   cardez: string;
   q: integer;
begin
   DatMod.TabCartelas.First;
   while not DatMod.TabCartelas.Eof do begin
      cardez := DatMod.TabCartelas.FieldByName('Dezenas').AsString;
      for q := 1 to 25 do
         if dezena = StrToInt(Copy(cardez , q*2-1, 2 )) then
            cartelas[ DatMod.TabCartelas.RecNo ] := cartelas[ DatMod.TabCartelas.RecNo ] + value;
         if cartelas[ DatMod.TabCartelas.RecNo ] = 24 then
            LBoxBoa.Items.Add(DatMod.TabCartelas.FieldByName('Numero').AsString);
      DatMod.TabCartelas.Next;
   end;
end;

end.

