inherited AddressPostActiveForm: TAddressPostActiveForm
  Left = 583
  Top = 222
  Width = 512
  Height = 393
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1072#1082#1090#1080#1074#1072#1094#1080#1080' '#1072#1076#1088#1077#1089#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 496
    Height = 354
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 494
      Height = 352
      Align = alClient
      DataSource = dsL_AddressPostActive
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
    end
  end
  object quL_AddressPostActive: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select   (select address from AddressPost where id = IdAddress) ' +
        'as Address'
      #9'   , DateBeg'
      #9'   , UserNoBeg'
      
        #9'   , (select UserName from Users where UserNo = UserNoBeg) as U' +
        'serNameBeg'
      #9'   , DateEnd'
      #9'   , UserNoEnd'
      
        #9'   , (select UserName from Users where UserNo = UserNoEnd) as U' +
        'serNameEnd'
      ''
      ' from L_AddressPostActive'
      '  where IdAddress = :IdAddress')
    Left = 144
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdAddress'
      end>
    object quL_AddressPostActiveAddress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 50
      FieldName = 'Address'
      ReadOnly = True
      Size = 256
    end
    object quL_AddressPostActiveDateBeg: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1072#1082#1090#1080#1074#1072#1094#1080#1080
      FieldName = 'DateBeg'
    end
    object quL_AddressPostActiveUserNoBeg: TIntegerField
      FieldName = 'UserNoBeg'
    end
    object quL_AddressPostActiveUserNameBeg: TStringField
      DisplayLabel = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1074#1096#1080#1081' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1072#1083#1100
      FieldName = 'UserNameBeg'
      ReadOnly = True
    end
    object quL_AddressPostActiveDateEnd: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1077#1072#1082#1090#1080#1074#1072#1094#1080#1080
      FieldName = 'DateEnd'
    end
    object quL_AddressPostActiveUserNoEnd: TIntegerField
      FieldName = 'UserNoEnd'
    end
    object quL_AddressPostActiveUserNameEnd: TStringField
      DisplayLabel = #1044#1077#1072#1082#1090#1080#1074#1080#1088#1086#1074#1072#1074#1096#1080#1081' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'UserNameEnd'
      ReadOnly = True
    end
  end
  object dsL_AddressPostActive: TMSDataSource
    DataSet = quL_AddressPostActive
    Left = 112
    Top = 32
  end
end
