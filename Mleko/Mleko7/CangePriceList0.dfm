inherited ChangePriceList: TChangePriceList
  Left = 722
  Top = 217
  Width = 452
  Height = 111
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072'/'#1042#1099#1075#1088#1091#1079#1082#1072' '#1087#1088#1072#1081#1089' '#1083#1080#1089#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  object bb_ExportPriceList: TBitBtn [0]
    Left = 8
    Top = 24
    Width = 105
    Height = 25
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1094#1077#1085#1099
    TabOrder = 0
    OnClick = bb_ExportPriceListClick
  end
  object cbDBLookupFilterPrice: TDBLookupComboboxEh [1]
    Left = 120
    Top = 28
    Width = 201
    Height = 21
    EditButtons = <>
    KeyField = 'NameGroup'
    ListField = 'NameGroup'
    TabOrder = 1
    Visible = True
  end
  object bb_ImportPriceList: TBitBtn [2]
    Left = 328
    Top = 24
    Width = 97
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1094#1077#1085#1099
    TabOrder = 2
  end
  object od_PriceList: TOpenDialog
    Left = 48
  end
  object quFilterPrice: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct NameGroup '
      ' from work.dbo.V_PriceForVeb'
      'order by NameGroup')
    Left = 96
  end
  object qu_ChangePriceList: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  '#39#1053#1086#1084#1077' '#1090#1086#1074#1072#1088#1072#39' as TovarNo'
      '      , '#39#1062#1077#1085#1072' 1'#39' as Price'
      '      , '#39#1062#1077#1085#1072' 2'#39' as Price1'
      '      , '#39#1062#1077#1085#1072' 3'#39' as Price2'
      '      , '#39#1062#1077#1085#1072' 4'#39' as Price3'
      '      , '#39#1062#1077#1085#1072' 5'#39' as Price4'
      '      , '#39#1062#1077#1085#1072' '#1061#1072#1088#1090#1086#1088#1075#39' as Price5'
      '      , '#39#1062#1077#1085#1072' '#1056#1077#1075#1080#1086#1085'1'#39' as Price6'
      '      , '#39#1062#1077#1085#1072' '#1056#1077#1075#1080#1086#1085'2'#39' as Price7'
      '      , '#39#1062#1077#1085#1072' '#1060#1086#1079#1080#39' as Price8'
      '      , '#39#1062#1077#1085#1072' '#1040#1058#1041#39' as Price13'
      '      , '#39#1062#1077#1085#1072' '#1053#1086#1074#1072#1103'2'#39' as Price14'
      '      , '#39#1062#1077#1085#1072' '#1053#1086#1074#1072#1103'3'#39' as Price15'
      '      , '#39#1062#1077#1085#1072' '#1052#1086#1088#1086#1079#1086#1074#1099#39' as Price9'
      '      , '#39#1062#1077#1085#1072' '#1089#1072#1081#1090#1072#39' as PriceVeb'
      '      , '#39#1062#1077#1085#1072' '#1053#1086#1074#1072#1103'4'#39' as Price10'
      '      , '#39#1062#1077#1085#1072' '#1074#1093#1086#1076#1085#1072#1103' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1072#39' as PriceInInst'
      '      , '#39#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072#39' as NameTovar'
      '      , '#39#1058#1080#1087' '#1090#1086#1074#1072#1088#1072#39' as NameGroup'
      'union all      '
      'select  convert(varchar,TovarNo) as TovarNo'
      '      , Price'
      '      , Price1'
      '      , Price2'
      '      , Price3'
      '      , Price4'
      '      , Price5'
      '      , Price6'
      '      , Price7'
      '      , Price8'
      '      , Price13'
      '      , Price14'
      '      , Price15'
      '      , Price9'
      '      , Price10'
      '      , PriceVeb'
      '      , PriceInInst'
      '      , NameTovar'
      '      , NameGroup'
      '  from  work.dbo.V_PriceForVeb'
      '   where NameGroup = isnull(:NameGroup, NameGroup)'
      '/*'
      'select  TovarNo'
      '      , Price'
      '      , Price1'
      '      , Price2'
      '      , Price3'
      '      , Price4'
      '      , Price5'
      '      , Price6'
      '      , Price7'
      '      , Price8'
      '      , Price13'
      '      , Price14'
      '      , Price15'
      '      , Price9'
      '      , Price10'
      '      , PriceVeb'
      '      , PriceInInst'
      '      , NameTovar'
      '      , NameGroup'
      '  from  work.dbo.V_PriceForVeb '
      '   where NameGroup = isnull(:NameGroup, NameGroup)'
      '*/')
    Left = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'NameGroup'
      end>
    object qu_ChangePriceListPrice: TStringField
      FieldName = 'Price'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice1: TStringField
      FieldName = 'Price1'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice2: TStringField
      FieldName = 'Price2'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice3: TStringField
      FieldName = 'Price3'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice4: TStringField
      FieldName = 'Price4'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice5: TStringField
      FieldName = 'Price5'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice6: TStringField
      FieldName = 'Price6'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice7: TStringField
      FieldName = 'Price7'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice8: TStringField
      FieldName = 'Price8'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice13: TStringField
      FieldName = 'Price13'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice14: TStringField
      FieldName = 'Price14'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice15: TStringField
      FieldName = 'Price15'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice9: TStringField
      FieldName = 'Price9'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPrice10: TStringField
      FieldName = 'Price10'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPriceVeb: TStringField
      FieldName = 'PriceVeb'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListPriceInInst: TStringField
      FieldName = 'PriceInInst'
      ReadOnly = True
      Size = 10
    end
    object qu_ChangePriceListNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 128
    end
    object qu_ChangePriceListNameGroup: TStringField
      FieldName = 'NameGroup'
      Size = 30
    end
    object qu_ChangePriceListTovarNo: TStringField
      FieldName = 'TovarNo'
      ReadOnly = True
      Size = 30
    end
  end
end
