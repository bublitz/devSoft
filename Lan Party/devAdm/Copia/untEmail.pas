unit untEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, StdCtrls, Buttons, IdMessage, HTTPApp, HTTPProd,
  IdAntiFreezeBase, IdAntiFreeze, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP;

type
  TfrmEmail = class(TForm)
    PnConfigura: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btArquivo: TSpeedButton;
    edTexto: TEdit;
    edAssunto: TEdit;
    gbConfigura: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edHost: TEdit;
    edUsuario: TEdit;
    edSenha: TMaskEdit;
    edConta: TEdit;
    edPorta: TMaskEdit;
    Splitter1: TSplitter;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    IdSMTP1: TIdSMTP;
    IdAntiFreeze1: TIdAntiFreeze;
    PP1: TPageProducer;
    IdMessage1: TIdMessage;
    btnEnvia: TSpeedButton;
    procedure btArquivoClick(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmail: TfrmEmail;

implementation

uses untDatModPrinc;

{$R *.dfm}

procedure TfrmEmail.btArquivoClick(Sender: TObject);
begin
{  If OpenDialog1.Execute then
  begin
    edTexto.Text:= OpenDialog1.FileName;
    //Zera o memo
    //Memo1.Clear;
    //Associa o arquivo Texto/HTML com o objeto
    //Memo1
    //Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;
procedure TfrmEmail.btnEnviaClick(Sender: TObject);
begin
   if dmPrinc.sqlClienteRECEBEMILHAGEM.Value = 'T' then
   begin
  //Configura o Cliente SMTP
  IdSMTP1.UserId:= edUsuario.Text;
  IdSMTP1.Password:= edSenha.Text;
  IdSMTP1.Host:= edHost.Text;
  IdSMTP1.Port:= StrToInt(edPorta.Text);
  //Atribui o conteúdo do objeto Memo1 ao objeto
  //PP1.HTML.DOC
  PP1.HTMLDoc:= Memo1.Lines;
  //Abre a Tabela de Emails
  dmPrinc.sqlCliente.Open;
  dmPrinc.sqlCliente.First;
  //Conecta ao Servidor
  IdSMTP1.Connect;

  Try
    //Atribui o conteudo do edAssunto ao IdMessage
    IdMessage1.Subject:= edAssunto.Text;
    IdMessage1.From.Text:= edConta.Text;
    //While not (Table1.Eof) do
    begin
      //Atribui o conteudo do campo EMAIL ao IdMessage
      IdMessage1.Recipients.EMailAddresses:=
      dmPrinc.sqlCliente.FieldByName ('e_MAIL').Value;

      IdMessage1.ReceiptRecipient.Address:=
      dmPrinc.sqlCliente.FieldByName ('e_Mail').Value;

      //Atribui o conteudo do PP1 ao IdMessage
      IdMessage1.Body.Text:= PP1.Content;
      //Envia Mensagem
      //IdSMTP1.Send(IdMessage1);

      //Próximo Registro
      dmPrinc.sqlCliente.Next;
    end;
    Application.MessageBox(
        'Emails enviados com sucesso!',
        'Mailing.Net', mb_Ok);
    Finally
      IdSMTP1.Disconnect;
    end;
    IdMessage1.Body.Text:= PP1.Content;}
end;

procedure TfrmEmail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
