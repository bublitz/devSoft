unit untCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, DBCtrls, Buttons, DBBBtn, NavBtn, Grids,
  DBGrids, ComCtrls, DB, RxLookup, ToolEdit, RXDBCtrl;

type
  TfrmCliente = class(TForm)
    PageCad: TPageControl;
    TabGrid: TTabSheet;
    DBGrid1: TDBGrid;
    TabDetalhe: TTabSheet;
    Panel2: TPanel;
    DBNav: TDBNavigator;
    dbNavBtnAppend: TDBNavigationButton;
    dbNavBtnDelete: TDBNavigationButton;
    dbNavBtnEdit: TDBNavigationButton;
    dbNavBtnSave: TDBNavigationButton;
    dbNavBtnCancel: TDBNavigationButton;
    BitBtn1: TBitBtn;
    PanDados: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Panel3: TPanel;
    Label1: TLabel;
    EditPesq: TEdit;
    RdGrpOrdem: TRadioGroup;
    Label19: TLabel;
    DBComboBox1: TDBComboBox;
    SpeedButton1: TSpeedButton;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBDateEdit1: TDBDateEdit;
    SpeedButton2: TSpeedButton;
    procedure EditPesqChange(Sender: TObject);
    procedure RdGrpOrdemClick(Sender: TObject);
    procedure dbNavBtnAppendClick(Sender: TObject);
    procedure dbNavBtnSaveBeforeAction(Sender: TObject;
      var ActionIsDone: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCliente: TfrmCliente;

implementation

uses untDtModEst, untCrypt, untAniversario;

{$R *.DFM}

procedure TfrmCliente.EditPesqChange(Sender: TObject);
begin
  dmEst.tbCliente.Locate ('Nome', EditPesq.Text, [loCaseInsensitive, loPartialkey]);
end;

procedure TfrmCliente.RdGrpOrdemClick(Sender: TObject);
begin
  if RdGrpOrdem.ItemIndex = 0 then
    dmEst.tbCliente.IndexFieldNames := 'Nome'
  else
    dmEst.tbCliente.IndexFieldNames  := '';
end;
procedure TfrmCliente.dbNavBtnAppendClick(Sender: TObject);
begin
  Dbedit8.SetFocus;
  dbEdit1.Text := DateToStr(Date);
end;

procedure TfrmCliente.dbNavBtnSaveBeforeAction(Sender: TObject;
  var ActionIsDone: Boolean);
begin
  if vercpf(dmEst.tbClienteCPF.AsString) then
    ActionIsDone := False
  else
  begin
    ActionIsDone := True;
    DBEdit15.SetFocus;
  end;
end;

procedure TfrmCliente.SpeedButton1Click(Sender: TObject);
begin
  frmAniversario.ShowModal;
end;

end.
