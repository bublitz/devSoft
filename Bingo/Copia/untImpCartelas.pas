unit untImpCartelas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComObj;

type
  TfrmImpCartelas = class(TForm)
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpCartelas: TfrmImpCartelas;

implementation

uses Funcoes, untDatMod;

{$R *.DFM}

procedure TfrmImpCartelas.BitBtn1Click(Sender: TObject);
var
   MSWord: variant;
   i: integer;
   numcart, dez: string;

begin
   try
      MSWord := CreateOleObject( 'Word.Basic' );
   except
      ShowMessage( 'Não consegui executar Microsoft Word.' );
      exit;
   end;
   MSWord.AppShow;
//   MSWord.AppMinimize;
   MSWord.FileNew;
   MSWord.TableInsertTable( 1, 26, 1 );   // 1, Colunas, Linhas
   MSWord.Insert('NumeroCartela'); MSWord.NextCell;
   for i := 1 to 25 do begin
      MSWord.Insert('Dez'+StrZero(i,2,0)); MSWord.NextCell;
   end;

   DatMod.TabCartelas.Last; //Tirar depois
   
   numcart := DatMod.TabCartelas.FieldByName('Numero').AsString;
   MSWord.Insert( numcart ); MSWord.NextCell;

   for I := 1 to 25 do
   begin
      dez := Copy(DatMod.TabCartelas.FieldByName('Dezenas').AsString, i*2-1, 2 );
      MSWord.Insert( dez ); MSWord.NextCell;
   end;

   MSWord.FileSaveAs(ExtractFilePath(Application.ExeName)+'Dados.doc', 0 );
   MSWord.FileClose(1); //Fecha salvando

   MSWord.AppClose;

end;

end.
