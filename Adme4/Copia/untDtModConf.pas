unit untDtModConf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBDatabase, IBCustomDataSet, IBTable;

type
  TdmConf = class(TDataModule)
    dsUser: TDataSource;
    dtBase: TIBDatabase;
    IBTrans: TIBTransaction;
    tbUser: TIBTable;
    tbUserCODIGOEMPRESA: TIntegerField;
    tbUserMATRICULA: TIBStringField;
    tbUserNOME: TIBStringField;
    tbUserUSERNAME: TIBStringField;
    tbUserSENHA: TIBStringField;
    tbUserDIREITOS: TIBStringField;
    tbUserNIVEL: TIBStringField;
    dsEmpresa: TDataSource;
    tbEmpresa: TIBTable;
    tbUserNOMEEMPRESA: TIBStringField;
    tbEmpresaCODIGOEMPRESA: TIntegerField;
    tbEmpresaNOME: TIBStringField;
    tbEmpresaENDERECO: TIBStringField;
    tbEmpresaBAIRRO: TIBStringField;
    tbEmpresaCIDADE: TIBStringField;
    tbEmpresaCEP: TIBStringField;
    tbEmpresaUF: TIBStringField;
    tbEmpresaFONE: TIBStringField;
    tbEmpresaFAX: TIBStringField;
    tbEmpresaCNPJ: TIBStringField;
    tbEmpresaIE: TIBStringField;
    tbEmpresaEMAIL: TIBStringField;
    tbEmpresaCOMISSAO: TFloatField;
    tbEmpresaMARGEM: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tbUserAfterScroll(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConf: TdmConf;

implementation

uses untConfUser;

{$R *.DFM}

procedure TdmConf.DataModuleCreate(Sender: TObject);
begin
  dtBase.Connected := False;
  dtBase.DatabaseName := ExtractFilePath(Application.ExeName)+'Dados\ADME.GDB';
  dtBase.Connected := True;
  IBTrans.Active := True;
  tbUser.Open;
  tbEmpresa.Open;
end;

procedure TdmConf.tbUserAfterScroll(DataSet: TDataSet);
var
  i: integer;
  d: string;

begin
  try
    with frmConfUser do
    begin
      //altsenha := False;
      edtSenha.Text := '';
      d := dmConf.tbUserDIREITOS.Value;
      if Length(d) > 10 then
        for i := 1 to 11 do
          if d[i] = 'X' then
            chkLstEstoque.Checked[i-1] := True
          else
            chkLstEstoque.Checked[i-1] := False;
    end;
  except
  end;
end;

procedure TdmConf.DataModuleDestroy(Sender: TObject);
begin
 { if ibtrans.InTransaction then
    ibtrans.Commit;}
end;

end.
