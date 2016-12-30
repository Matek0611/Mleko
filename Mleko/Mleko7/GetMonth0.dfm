inherited fmGetMonth: TfmGetMonth
  Left = 217
  Top = 101
  ActiveControl = bbOk
  BorderStyle = bsDialog
  Caption = #1044#1072#1090#1072
  ClientHeight = 101
  ClientWidth = 249
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 8
    Top = 64
    Width = 233
    Height = 9
    Shape = bsTopLine
  end
  object seYear: TSpinEdit [1]
    Left = 136
    Top = 16
    Width = 65
    Height = 22
    EditorEnabled = False
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 1998
  end
  object cbMonth: TComboBox [2]
    Left = 16
    Top = 16
    Width = 97
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      #1071#1085#1074#1072#1088#1100
      #1060#1077#1074#1088#1072#1083#1100
      #1052#1072#1088#1090
      #1040#1087#1088#1077#1083#1100
      #1052#1072#1081
      #1048#1102#1085#1100
      #1048#1102#1083#1100
      #1040#1074#1075#1091#1089#1090
      #1057#1077#1085#1090#1103#1073#1088#1100
      #1054#1082#1090#1103#1073#1088#1100
      #1053#1086#1103#1073#1088#1100
      #1044#1077#1082#1072#1073#1088#1100)
  end
  object bbOk: TBitBtn [3]
    Left = 64
    Top = 72
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkOK
  end
  object bbCancel: TBitBtn [4]
    Left = 160
    Top = 72
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    Kind = bkCancel
  end
end
