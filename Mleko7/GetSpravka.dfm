inherited fmGetSpravka: TfmGetSpravka
  Left = 61
  Top = 155
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1082#1072
  ClientHeight = 155
  ClientWidth = 514
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 16
    Top = 8
    Width = 56
    Height = 13
    Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
  end
  object Bevel1: TBevel [1]
    Left = 8
    Top = 104
    Width = 497
    Height = 9
    Shape = bsBottomLine
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 56
    Width = 156
    Height = 13
    Caption = #1060#1086#1088#1084#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1085#1099#1093' '#1088#1072#1089#1095#1077#1090#1086#1074
  end
  object edDogovor: TEdit [3]
    Left = 16
    Top = 24
    Width = 489
    Height = 21
    TabOrder = 0
    Text = #1044#1086#1075#1086#1074#1086#1088' '#1082#1091#1087#1083#1080'-'#1087#1088#1086#1076#1072#1078#1080
  end
  object bbOk: TBitBtn [4]
    Left = 416
    Top = 120
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object cbForma: TComboBox [5]
    Left = 16
    Top = 80
    Width = 185
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = 'cbForma'
    Items.Strings = (
      #1095#1077#1088#1077#1079' '#1088'/'#1089
      #1085#1072#1083#1080#1095#1085#1099#1081' '#1088#1072#1089#1095#1077#1090)
  end
end
