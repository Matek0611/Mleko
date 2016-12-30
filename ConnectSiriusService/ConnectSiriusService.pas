unit ConnectSiriusService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InvokeRegistry, TypInfo, WebServExp, WSDLBind, XMLSchema,
  WSDLIntf, SOAPPasInv, SOAPHTTPPasInv, WSDLPub, SOAPHTTPDisp,
  WebBrokerSOAP, DB, DBClient, SOAPConn, SOAPDomConv, OPToSOAPDomConv,
  SOAPHTTPTrans, Rio, SOAPHTTPClient, StdCtrls;

type
  TForm1 = class(TForm)
    HTTPRIO1: THTTPRIO;
    Test: TButton;
    Mail1: TEdit;
    Mail2: TEdit;
    Mail3: TEdit;
    Topic: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure TestClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses SiriusService;

{$R *.dfm}



procedure TForm1.TestClick(Sender: TObject);
var
  service: ISIRIUS_Service;
begin
  // получаем интерфейс
  service := GetISIRIUS_Service();
  // вызываем процедуру сервиса
  with service do
   begin
     send_mail(Mail1.Text,Mail2.Text,Mail3.Text,Topic.Text,Message.Text,Dir.Text); 
   end;

//  Send_Mail('vinnichenko_ar@mail.ru','0','0','123','456','a');
//    ShowMessage(Send_Mail('vinnichenko_ar@mail.ru','0','0','123','456','a'));
//     ShowMessage(inttostr(Add_data_in_double(2,3)));

end;





end.
