unit untCadCartela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ComCtrls, Buttons;

type
  TfrmCadCartelas = class(TForm)
    DBGridCartela: TDBGrid;
    ListView: TListView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure MontaCartela(Sender: TObject);
    procedure DBGridCartelaEnter(Sender: TObject);
    procedure DBGridCartelaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridCartelaCellClick(Column: TColumn);
    procedure DBGridCartelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCartelas: TfrmCadCartelas;

implementation

uses untDatMod, untCad, Funcoes;

{$R *.DFM}

procedure TfrmCadCartelas.MontaCartela(Sender: TObject);
var
  I: integer;
  ListItem: TListItem;

begin
  with ListView do
  Items.Clear;
  begin
    for I := 1 to 25 do
    begin
      ListItem := ListView.Items.Add;
      ListItem.Caption := Copy(DatMod.TabCartelas.FieldByName('Dezenas').AsString, i*2-1, 2 );
    end;
  end;
end;

procedure TfrmCadCartelas.DBGridCartelaEnter(Sender: TObject);
begin
    MontaCartela(Sender);
end;

procedure TfrmCadCartelas.DBGridCartelaKeyPress(Sender: TObject;
  var Key: Char);
begin
    MontaCartela(Sender);
end;

procedure TfrmCadCartelas.FormShow(Sender: TObject);
begin
    MontaCartela(Sender);
end;

procedure TfrmCadCartelas.BitBtn1Click(Sender: TObject);
var
   numCartela: longint;
   i: byte;
   dezenas: string;

begin
   frmCad.Caption := 'Nova Cartela';
   frmCad.Label1.Caption := 'Nº da Cartela';
   frmCad.Edit1.Text := '';
   if frmCad.ShowModal = mrOk then begin
      numCartela := StrToInt( frmCad.Edit1.Text );
      if DatMod.TabCartelas.FindKey([ numCartela ] ) then
         ShowMessage( 'Cartela já Cadastrada!!'#13#13'Operação Abortada' )
      else begin
         DatMod.TabCartelas.Insert;
         DatMod.TabCartelas.FieldByName('Numero').Value := numCartela;
         DatMod.TabCartelas.Post;
         dezenas := '';
         frmCad.Caption := 'Cartela Nº ' + IntToStr(numCartela);
         for i := 1 to 25 do begin
            frmCad.Label1.Caption := IntToStr(i)+'ª Dezena';
            frmCad.Edit1.Text := '';
            if frmCad.ShowModal = mrOk then
               dezenas := dezenas + StrZero( StrToInt( frmCad.Edit1.Text ), 2 , 0 )
            else
               break;
         end;
         DatMod.TabCartelas.Edit;
         DatMod.TabCartelas.FieldByName('Dezenas').Value := dezenas;
         DatMod.TabCartelas.Post;
      end;
   end;
   MontaCartela(Sender);
end;

procedure TfrmCadCartelas.DBGridCartelaCellClick(Column: TColumn);
begin
    MontaCartela(frmCadCartelas);
end;

procedure TfrmCadCartelas.DBGridCartelaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    MontaCartela(Sender);
end;

procedure TfrmCadCartelas.BitBtn2Click(Sender: TObject);
var
   i: byte;
   dezenas: string;
   ok: boolean;

begin
   dezenas := '';
   ok := true;
   frmCad.Caption := 'Cartela Nº ' + DatMod.TabCartelas.FieldByName('Numero').AsString;
   for i := 1 to 25 do begin
       frmCad.Label1.Caption := IntToStr(i)+'ª Dezena';
       frmCad.Edit1.Text := Copy(DatMod.TabCartelas.FieldByName('Dezenas').AsString, i*2-1, 2 );
       if frmCad.ShowModal = mrOk then
          dezenas := dezenas + StrZero( StrToInt( frmCad.Edit1.Text ), 2 , 0 )
       else begin
          ok := false;
          break;
       end;
   end;
   if ok then begin
      DatMod.TabCartelas.Edit;
      DatMod.TabCartelas.FieldByName('Dezenas').Value := dezenas;
      DatMod.TabCartelas.Post;
   end;
   MontaCartela(Sender);

end;

end.
