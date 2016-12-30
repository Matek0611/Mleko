object Form1: TForm1
  Left = 394
  Top = 181
  Width = 485
  Height = 340
  Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077' '#1089' '#1089#1077#1088#1074#1080#1089#1086#1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 48
    Width = 58
    Height = 13
    Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 1'
  end
  object Label2: TLabel
    Left = 16
    Top = 74
    Width = 58
    Height = 13
    Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 2'
  end
  object Label3: TLabel
    Left = 15
    Top = 106
    Width = 58
    Height = 13
    Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 3'
  end
  object Label4: TLabel
    Left = 16
    Top = 141
    Width = 71
    Height = 13
    Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072
  end
  object Label5: TLabel
    Left = 16
    Top = 176
    Width = 58
    Height = 13
    Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077
  end
  object Label6: TLabel
    Left = 16
    Top = 205
    Width = 67
    Height = 13
    Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091
  end
  object Test: TButton
    Left = 24
    Top = 256
    Width = 417
    Height = 25
    Caption = #1058#1077#1089#1090
    TabOrder = 0
    OnClick = TestClick
  end
  object Mail1: TEdit
    Left = 119
    Top = 40
    Width = 178
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object Mail2: TEdit
    Left = 119
    Top = 72
    Width = 178
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object Mail3: TEdit
    Left = 119
    Top = 104
    Width = 178
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object Topic: TEdit
    Left = 119
    Top = 136
    Width = 178
    Height = 21
    TabOrder = 4
  end
  object TEdit
    Left = 119
    Top = 168
    Width = 322
    Height = 21
    TabOrder = 5
  end
  object TEdit
    Left = 119
    Top = 200
    Width = 322
    Height = 21
    TabOrder = 6
  end
  object HTTPRIO1: THTTPRIO
    WSDLLocation = 'http://192.168.0.12:9001/SIRIUS_Service/?singleWsdl'
    Service = 'SIRIUS_Service'
    Port = 'BasicHttpBinding_ISIRIUS_Service'
    HTTPWebNode.Agent = 'Borland SOAP 1.2'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts, soAutoCheckAccessPointViaUDDI]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
  end
end
