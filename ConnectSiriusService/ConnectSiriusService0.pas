unit ConnectSiriusService0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, InvokeRegistry, TypInfo, WebServExp, WSDLBind, XMLSchema,
  WSDLIntf, SOAPPasInv, SOAPHTTPPasInv, WSDLPub, SOAPHTTPDisp,
  WebBrokerSOAP, DB, DBClient, SOAPConn, SOAPDomConv, OPToSOAPDomConv,
  SOAPHTTPTrans, Rio, SOAPHTTPClient, StdCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

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
    Message: TEdit;
    Dir: TEdit;
    Number1: TEdit;
    Number2: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Number3: TEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
  service : ISIRIUS_Service;
  Number11 : Double;
  Number22 : Double;
begin
  // получаем интерфейс
  service := GetISIRIUS_Service();
  Number11 := strtofloat(Number1.Text);
  Number22 := strtofloat(Number2.Text);
  // вызываем процедуру сервиса
  with service do
   begin
//     send_mail(Mail1.Text,Mail2.Text,Mail3.Text,Topic.Text,Message.Text,Dir.Text);

     Number3.Text := Add_data_in_double(Number11,Number22);
//     Add_data_in_double(strtoint(Number1.Text),strtoint(Number2.Text));
//     Number3.Text := Add_data_in_double(5,5.0);

//     Add_data_in_double_MessageOutput (strtoint(Number1.Text),strtoint(Number2.Text));
//     ShowMessage(inttostr(Add_data_in_double(strtoint(Number1.Text),strtoint(Number2.Text))));
   end;

//  Send_Mail('vinnichenko_ar@mail.ru','0','0','123','456','d:\Temp_Send_MailAll\1345\1');
//    ShowMessage(Send_Mail('vinnichenko_ar@mail.ru','0','0','123','456','a'));
//     ShowMessage(inttostr(Add_data_in_double(2,3)));

end;





end.
