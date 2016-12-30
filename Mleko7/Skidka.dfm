inherited fmSkid: TfmSkid
  Left = 154
  Top = 129
  ActiveControl = ceSkid
  BorderStyle = bsDialog
  Caption = #1057#1082#1080#1076#1082#1072
  ClientHeight = 93
  ClientWidth = 240
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object ceSkid: TCurrencyEdit [0]
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00'
    MaxValue = 100.000000000000000000
    MinValue = -100.000000000000000000
    TabOrder = 0
  end
  object bbOK: TBitBtn [1]
    Left = 152
    Top = 8
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object bbCancel: TBitBtn [2]
    Left = 152
    Top = 56
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    Kind = bkCancel
  end
  object rgSkidka: TRadioGroup [3]
    Left = 8
    Top = 32
    Width = 121
    Height = 49
    ItemIndex = 0
    Items.Strings = (
      #1053#1072' '#1074#1077#1089#1100' '#1090#1086#1074#1072#1088
      #1053#1072' '#1086#1076#1080#1085' '#1090#1086#1074#1072#1088)
    TabOrder = 1
  end
end
