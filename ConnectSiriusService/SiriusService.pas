// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.0.12:9001/SIRIUS_Service/?singleWsdl
// Encoding : utf-8
// Version  : 1.0
// (18.05.2012 9:33:28 - 1.33.2.5)
// ************************************************************************ //

unit SiriusService;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"

  MyData               = class;                 { "http://schemas.datacontract.org/2004/07/SIRIUS" }
  Header               = class;                 { "http://tempuri.org/"[H] }



  // ************************************************************************ //
  // Namespace : http://schemas.datacontract.org/2004/07/SIRIUS
  // ************************************************************************ //
  MyData = class(TRemotable)
  private
    FA: Double;
    FB: Double;
  published
    property A: Double read FA write FA;
    property B: Double read FB write FB;
  end;



  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // Serializtn: [xoSimpleTypeWrapper]
  // ************************************************************************ //
  Header = class(TSOAPHeader)
  private
    FValue: WideString;
  published
    property Value: WideString read FValue write FValue;
  end;


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // soapAction: http://tempuri.org/ISIRIUS_Service/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : BasicHttpBinding_ISIRIUS_Service
  // service   : SIRIUS_Service
  // port      : BasicHttpBinding_ISIRIUS_Service
  // URL       : http://192.168.0.12:9001/SIRIUS_Service/SIRIUS_Service
  // ************************************************************************ //
  ISIRIUS_Service = interface(IInvokable)
  ['{4962AE6B-5AF1-C6DD-E290-164EACAD15F1}']
    function  Add_data_in_double(const a: Double; const b: Double): string{Double}; stdcall;
    function  Add_data_in_double_DATA_CONTRACT(const data: MyData): Double; stdcall;
    function  Add_data_in_double_MessageOutput(const A: Double; const B: Double): Double; stdcall;
    function  Send_Mail(const mailbox_one: WideString; const mailbox_two: WideString; const mailbox_three: WideString; const Subject_mailbox: WideString; const Body_mailbox: WideString; const file_patch: WideString): WideString; stdcall;
  end;

function GetISIRIUS_Service(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ISIRIUS_Service;


implementation

function GetISIRIUS_Service(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ISIRIUS_Service;
const
  defWSDL = 'http://192.168.0.12:9001/SIRIUS_Service/?singleWsdl';
  defURL  = 'http://192.168.0.12:9001/SIRIUS_Service/SIRIUS_Service';
  defSvc  = 'SIRIUS_Service';
  defPrt  = 'BasicHttpBinding_ISIRIUS_Service';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ISIRIUS_Service);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(ISIRIUS_Service), 'http://tempuri.org/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ISIRIUS_Service), 'http://tempuri.org/ISIRIUS_Service/%operationName%');
  RemClassRegistry.RegisterXSClass(MyData, 'http://schemas.datacontract.org/2004/07/SIRIUS', 'MyData');
  RemClassRegistry.RegisterXSClass(Header, 'http://tempuri.org/', 'Header');
  RemClassRegistry.RegisterSerializeOptions(Header, [xoSimpleTypeWrapper]);

end.