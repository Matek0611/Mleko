inherited fmGetPercent: TfmGetPercent
  Left = 180
  Top = 165
  ActiveControl = cePercent
  BorderStyle = bsDialog
  Caption = '&'
  ClientHeight = 78
  ClientWidth = 192
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object cePercent: TCurrencyEdit [0]
    Left = 8
    Top = 8
    Width = 97
    Height = 21
    AutoSize = False
    DisplayFormat = '0.00'
    TabOrder = 0
  end
  object bbOk: TBitBtn [1]
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object bbCancel: TBitBtn [2]
    Left = 104
    Top = 40
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    Kind = bkCancel
  end
end
