inherited fmSelectNakl: TfmSelectNakl
  Left = 697
  Top = 230
  HorzScrollBar.Visible = False
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1042#1099#1073#1086#1088' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
  ClientHeight = 138
  ClientWidth = 216
  OldCreateOrder = True
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
    object cbOtdel: TCheckBox
      Left = 16
      Top = 64
      Width = 97
      Height = 17
      Caption = #1055#1086' '#1086#1090#1076#1077#1083#1091
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = cbOtdelClick
    end
  end
  object bbOK: TBitBtn [2]
    Left = 16
    Top = 108
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
    Top = 108
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
