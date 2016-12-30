inherited fmSelectPodotchet: TfmSelectPodotchet
  Left = 490
  Top = 98
  Width = 220
  Height = 174
  Caption = #1055#1086#1076#1086#1090#1095#1077#1090
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 8
    Top = 0
    Width = 193
    Height = 105
  end
  object GroupBox1: TGroupBox [1]
    Left = 16
    Top = 8
    Width = 177
    Height = 89
    TabOrder = 0
    object cbDate: TCheckBox
      Left = 16
      Top = 16
      Width = 97
      Height = 17
      Caption = #1055#1086' '#1076#1072#1090#1077
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = cbDateClick
    end
    object cbSotrud: TCheckBox
      Left = 16
      Top = 40
      Width = 113
      Height = 17
      Caption = #1055#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = cbSotrudClick
    end
    object cbPost: TCheckBox
      Left = 16
      Top = 64
      Width = 113
      Height = 17
      Caption = #1055#1086' '#1087#1072#1088#1090#1085#1077#1088#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = cbPostClick
    end
  end
  object bbOK: TBitBtn [2]
    Left = 16
    Top = 112
    Width = 81
    Height = 25
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Kind = bkOK
  end
  object bbCancel: TBitBtn [3]
    Left = 112
    Top = 112
    Width = 81
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Kind = bkCancel
  end
end
