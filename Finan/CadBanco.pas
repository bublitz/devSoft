unit CadBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, ExtCtrls, Buttons, StdCtrls, Grids, DBGrids, ComCtrls, DB;

type
  TFrmBanco = class(TForm)
    TabGrid: TTabSheet;
    DBGrdBan: TDBGrid;
    TabCad: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBText1: TDBText;
    SpBtnIncluir: TSpeedButton;
    SpBtnAlterar: TSpeedButton;
    SpBtnExcluir: TSpeedButton;
    SpBtnCancelar: TSpeedButton;
    SpBtnSalvar: TSpeedButton;
    DBNav: TDBNavigator;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    SpBtnFechar: TSpeedButton;
    PgCtrlBanco: TPageControl;
    procedure SpBtnFecharClick(Sender: TObject);
    procedure SwapButtons( Sender: TObject );
    procedure SpBtnIncluirClick(Sender: TObject);
    procedure SpBtnAlterarClick(Sender: TObject);
    procedure SpBtnSalvarClick(Sender: TObject);
    procedure SpBtnCancelarClick(Sender: TObject);
    procedure SpBtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmBanco: TFrmBanco;

implementation

{$R *.DFM}

uses DataMod, Funcoes;

procedure TFrmBanco.SwapButtons( Sender: TObject );
begin
   DBNav.Enabled := not DBNav.Enabled;
   SpBtnIncluir.Enabled := not SpBtnIncluir.Enabled;
   SpBtnAlterar.Enabled := not SpBtnAlterar.Enabled;
   SpBtnExcluir.Enabled := not SpBtnExcluir.Enabled;
   SpBtnCancelar.Enabled := not SpBtnCancelar.Enabled;
   SpBtnSalvar.Enabled := not SpBtnSalvar.Enabled;
   DBEdit1.Enabled := not DBEdit1.Enabled;
   DBEdit2.Enabled := not DBEdit2.Enabled;
   DBEdit3.Enabled := not DBEdit3.Enabled;
   TabGrid.Enabled := not TabGrid.Enabled;
   SpBtnFechar.Enabled := not SpBtnFechar.Enabled;
end;

procedure TFrmBanco.SpBtnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmBanco.SpBtnIncluirClick(Sender: TObject);
begin
   if Inclui( DatMod.TabBanco ) then begin
      SwapButtons( Sender );
      DBEdit1.SetFocus;
   end;
end;

procedure TFrmBanco.SpBtnAlterarClick(Sender: TObject);
begin
   SwapButtons( Sender );
   DatMod.TabBanco.Edit;
   DBEdit1.SetFocus;
end;

procedure TFrmBanco.SpBtnSalvarClick(Sender: TObject);
begin
   SwapButtons( Sender );
   if DatMod.TabBanco.State in [ dsInsert, dsEdit ] then
      DatMod.TabBanco.Post;
end;

procedure TFrmBanco.SpBtnCancelarClick(Sender: TObject);
begin
   SwapButtons( Sender );
   if DatMod.TabBanco.State in [ dsInsert, dsEdit ] then
      DatMod.TabBanco.Cancel;
end;

procedure TFrmBanco.SpBtnExcluirClick(Sender: TObject);
begin
   Exclui( DatMod.TabBanco );
end;

end.
