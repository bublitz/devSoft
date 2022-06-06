unit untEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TFlatEditUnit, TFlatListBoxUnit, TFlatMemoUnit, Mask, ToolEdit,
  RXDBCtrl, Psock, NMsmtp, DB;

type
  TfrmEmail = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TFlatEdit;
    Edit2: TFlatEdit;
    ListBox1: TFlatListBox;
    Label4: TLabel;
    Memo1: TFlatMemo;
    Button6: TButton;
    Button4: TButton;
    Button5: TButton;
    Label5: TLabel;
    DBDateEdit2: TDBDateEdit;
    Label6: TLabel;
    OpenDialog1: TOpenDialog;
    NMSMTP1: TNMSMTP;
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmail: TfrmEmail;

implementation

uses untDtMod;

{$R *.DFM}

procedure TfrmEmail.Button6Click(Sender: TObject);
begin
  //Enviar e-mail
  NMSMTP1.Connect;
  if NMSMTP1.Connected then
  begin
    NMSMTP1.PostMessage.FromAddress := dtMod.tbEmpresaEmail.value; //e-mail endereço proprietario
    NMSMTP1.PostMessage.Subject := Edit2.Text; //Assunto do envio
    NMSMTP1.PostMessage.ToAddress.Add(Edit1.Text); //e-mail para outra pessoa
    NMSMTP1.PostMessage.Attachments.AddStrings(Listbox1.Items); //Atachar documento
    NMSMTP1.PostMessage.Body.Assign(Memo1.Lines); //Texto de envio
    NMSMTP1.SendMail; //Enviar e-mail
  end
  else
    showmessage('não conectado');
end;


procedure TfrmEmail.Button4Click(Sender: TObject);
begin
  If OpenDialog1.Execute then
    ListBox1.Items.Add(OpenDialog1.FileName);
end;

procedure TfrmEmail.Button5Click(Sender: TObject);
begin
  //ListBox1.Items.Delete(ListBox1.ItemIndex);
end;

end.
