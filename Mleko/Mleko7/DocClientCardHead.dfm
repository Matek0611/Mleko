inherited DocClientCardHeadForm: TDocClientCardHeadForm
  Left = 932
  Top = 245
  Width = 629
  Caption = #1050#1072#1088#1090#1086#1095#1082#1080' '#1082#1083#1080#1077#1085#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Width = 613
  end
  inherited ToolBar: TToolBar
    Width = 613
    object tbCreate: TToolButton
      Left = 0
      Top = 0
      Caption = 'tbCreate'
      ImageIndex = 0
      OnClick = tbCreateClick
    end
    object tbEdit: TToolButton
      Left = 23
      Top = 0
      Caption = 'tbEdit'
      ImageIndex = 1
      OnClick = tbEditClick
    end
    object tdDel: TToolButton
      Left = 46
      Top = 0
      Caption = 'tdDel'
      ImageIndex = 2
      OnClick = tdDelClick
    end
    object tbRefresh: TToolButton
      Left = 69
      Top = 0
      Caption = 'tbRefresh'
      ImageIndex = 3
      OnClick = tbRefreshClick
    end
    object tbClose: TToolButton
      Left = 92
      Top = 0
      Caption = 'tbClose'
      ImageIndex = 45
      OnClick = tbCloseClick
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 328
    Width = 613
    Height = 41
    Align = alBottom
    TabOrder = 2
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 29
    Width = 613
    Height = 299
    Align = alClient
    TabOrder = 3
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 611
      Height = 297
      Align = alClient
      DataSource = dsDocClientCardHead
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
      OnDrawColumnCell = DBGridEh1DrawColumnCell
    end
  end
  inherited ActionList: TActionList
    Top = 32
  end
  object quDocClientCardHead: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  *'
      
        '      , (select Name from Post where PostNo = dcch.PostNo) as Po' +
        'stName'
      
        '      , (select SotrudName from Sotrud where SotrudNo = dcch.Sot' +
        'rudNo) as SotrudName'
      
        '      , (select UserName from Users where UserNo = dcch.UserNo) ' +
        'as UserName'
      ' from DocClientCardHead dcch'
      'where &_where'
      'order by DocDate')
    Left = 264
    Top = 80
    MacroData = <
      item
        Name = '_where'
        Value = '1=1'
      end>
    object quDocClientCardHeadid: TIntegerField
      DisplayLabel = #8470
      DisplayWidth = 5
      FieldName = 'id'
    end
    object quDocClientCardHeadDocDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DocDate'
    end
    object quDocClientCardHeadPostNo: TIntegerField
      DisplayLabel = #8470' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'PostNo'
    end
    object quDocClientCardHeadPostName: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'PostName'
      Size = 30
    end
    object quDocClientCardHeadSotrudName: TStringField
      DisplayLabel = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      FieldName = 'SotrudName'
      Size = 30
    end
    object quDocClientCardHeadUserName: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'UserName'
    end
    object quDocClientCardHeadNotSignatureOtdel: TStringField
      DisplayLabel = #1053#1077' '#1087#1086#1076#1087#1080#1089#1072#1083#1080' '#1086#1090#1076#1077#1083#1099
      DisplayWidth = 50
      FieldName = 'NotSignatureOtdel'
      Size = 256
    end
    object quDocClientCardHeadUserNo: TIntegerField
      FieldName = 'UserNo'
      Visible = False
    end
    object quDocClientCardHeadSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
      Visible = False
    end
    object quDocClientCardHeadPrint3: TBooleanField
      FieldName = 'Print3'
      Visible = False
    end
    object quDocClientCardHeadTTN: TBooleanField
      FieldName = 'TTN'
      Visible = False
    end
    object quDocClientCardHeadIsApp: TBooleanField
      FieldName = 'IsApp'
      Visible = False
    end
  end
  object dsDocClientCardHead: TMSDataSource
    DataSet = quDocClientCardHead
    Left = 232
    Top = 80
  end
end
