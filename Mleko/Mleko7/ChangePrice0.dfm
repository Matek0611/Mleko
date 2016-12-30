inherited fmChangePrice: TfmChangePrice
  Width = 236
  Height = 128
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1094#1077#1085#1099
  PixelsPerInch = 96
  TextHeight = 13
  object Lb_ChangePriceInInst: TLabel [0]
    Left = 0
    Top = 0
    Width = 169
    Height = 41
    AutoSize = False
    Caption = 
      #1047#1072#1076#1072#1081#1090#1077' '#1076#1080#1072#1087#1072#1079#1086#1085' (+/-) '#13#10#1042#1093#1086#1076#1103#1097#1077#1081' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1086#1081' '#1094#1077#1085#1099#13#10#1042' '#1075#1088#1080#1074#1085#1072#1093' ' +
      '('#1086#1090' 0,01 '#1076#1086' 0,99)'
    Transparent = True
  end
  object DBNumberEditEhChangePriceInInst: TDBNumberEditEh [1]
    Left = 176
    Top = 11
    Width = 33
    Height = 21
    DataField = 'DeltaPriceInInst'
    DataSource = ds_ChangePrice
    EditButton.Style = ebsUpDownEh
    EditButton.Width = 1
    EditButtons = <>
    Increment = 0.010000000000000000
    MaxValue = 0.990000000000000000
    TabOrder = 0
    Visible = True
  end
  object bbOk: TBitBtn [2]
    Left = 20
    Top = 57
    Width = 75
    Height = 25
    Caption = #1054#1050
    TabOrder = 1
    OnClick = bbOkClick
    Kind = bkOK
  end
  object bbCancel: TBitBtn [3]
    Left = 116
    Top = 57
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = bbCancelClick
    Kind = bkCancel
  end
  object ds_ChangePrice: TDataSource
    DataSet = qu_ChangePrice
    Left = 48
  end
  object qu_ChangePrice: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO DeltaPrice'
      '  (DeltaPriceInInst)'
      'VALUES'
      '  (:DeltaPriceInInst)')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select DeltaPriceInInst from DeltaPrice')
    Left = 104
    object qu_ChangePriceDeltaPriceInInst: TFloatField
      FieldName = 'DeltaPriceInInst'
    end
  end
end
