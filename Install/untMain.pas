unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TfrmPrincipal = class(TForm)
    Img3: TImage;
    lblsigla: TLabel;
    lbltitulo: TLabel;
    lblversao: TLabel;
    Image25: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image3: TImage;
    Button1: TButton;
    Button2: TButton;
    Shape1: TShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untInstala;

{$R *.dfm}

end.
