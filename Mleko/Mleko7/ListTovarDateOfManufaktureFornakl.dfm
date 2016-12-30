inherited ListTovarDateOfManufaktureForNaklForm: TListTovarDateOfManufaktureForNaklForm
  Left = 657
  Top = 295
  Width = 848
  Height = 327
  Caption = #1058#1086#1074#1072#1088' '#1087#1086' '#1076#1072#1090#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 247
    Width = 832
    Height = 41
    Align = alBottom
    TabOrder = 0
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 832
    Height = 247
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 830
      Height = 245
      Align = alClient
      DataSource = dsl_DspecForTovarDateOfManufacture
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 3
    end
  end
  object qul_DspecForTovarDateOfManufacture: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select   *'
      
        '       , (select NameTovar from Tovar where TovarNo = l.TovarNo)' +
        ' as TovarName '
      ' from l_DspecForTovarDateOfManufacture l'
      '  where TovarNo = :TovarNo'
      'order by CreateDate')
    Left = 480
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TovarNo'
      end>
    object qul_DspecForTovarDateOfManufactureTovarNo: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #1040#1088#1090#1080#1082#1091#1083
      FieldName = 'TovarNo'
    end
    object qul_DspecForTovarDateOfManufactureDateBeg: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1080#1079#1074'.'
      DisplayWidth = 12
      FieldName = 'DateBeg'
    end
    object qul_DspecForTovarDateOfManufactureKolAll: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086
      DisplayWidth = 15
      FieldName = 'KolAll'
    end
    object qul_DspecForTovarDateOfManufactureKolDate: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #1044#1074#1080#1078#1077#1085#1080#1077
      DisplayWidth = 15
      FieldName = 'KolDate'
    end
    object qul_DspecForTovarDateOfManufactureKolEnd: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #1050#1086#1085#1077#1095#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086'.'
      DisplayWidth = 15
      FieldName = 'KolEnd'
    end
    object qul_DspecForTovarDateOfManufactureOstBeg: TFloatField
      DisplayLabel = #1054#1089#1090'. '#1088#1077#1072#1083'. '#1085#1072#1095'.'
      FieldName = 'OstBeg'
    end
    object qul_DspecForTovarDateOfManufactureOstEnd: TFloatField
      DisplayLabel = #1054#1089#1090'. '#1088#1077#1072#1083'. '#1082#1086#1085'.'
      FieldName = 'OstEnd'
    end
    object qul_DspecForTovarDateOfManufactureTovarName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 50
      FieldName = 'TovarName'
      ReadOnly = True
      Size = 128
    end
    object qul_DspecForTovarDateOfManufactureCreateDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072'/'#1074#1088#1077#1084#1103' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
      FieldName = 'CreateDate'
    end
    object qul_DspecForTovarDateOfManufactureIdDspec: TLargeintField
      Alignment = taLeftJustify
      DisplayLabel = 'Id'
      FieldName = 'IdDspec'
    end
  end
  object dsl_DspecForTovarDateOfManufacture: TMSDataSource
    DataSet = qul_DspecForTovarDateOfManufacture
    Left = 480
    Top = 8
  end
end
