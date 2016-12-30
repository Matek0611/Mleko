inherited fmSelectExpedition: TfmSelectExpedition
  Left = 1046
  Top = 278
  Width = 220
  Height = 183
  Caption = #1042#1099#1073#1086#1088' '#1093#1086#1076#1086#1082
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
    object cbCars: TCheckBox
      Left = 16
      Top = 40
      Width = 113
      Height = 17
      Caption = #1055#1086' '#1072#1074#1090#1086#1084#1086#1073#1080#1083#1102
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = cbCarsClick
    end
    object cbShipping_Agent: TCheckBox
      Left = 16
      Top = 64
      Width = 113
      Height = 17
      Caption = #1055#1086' '#1101#1082#1089#1087#1077#1076#1080#1090#1086#1088#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = cbShipping_AgentClick
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
