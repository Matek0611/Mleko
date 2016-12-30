inherited fmSelectPlat: TfmSelectPlat
  Left = 245
  Top = 152
  HorzScrollBar.Visible = False
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1042#1099#1073#1086#1088' '#1087#1083#1072#1090#1077#1078#1077#1081
  ClientHeight = 123
  ClientWidth = 212
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 8
    Top = 0
    Width = 201
    Height = 81
  end
  object GroupBox1: TGroupBox [1]
    Left = 16
    Top = 8
    Width = 185
    Height = 65
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
    object cbPost: TCheckBox
      Left = 16
      Top = 40
      Width = 97
      Height = 17
      Caption = #1055#1086' '#1087#1072#1088#1090#1085#1077#1088#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = cbPostClick
    end
  end
  object bbOK: TBitBtn [2]
    Left = 8
    Top = 88
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
    Left = 104
    Top = 88
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
