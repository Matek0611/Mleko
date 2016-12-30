inherited fmHKey: TfmHKey
  Left = 113
  Top = 102
  BorderStyle = bsDialog
  Caption = #1053#1072#1079#1085#1072#1095#1077#1085#1080#1077' '#1075#1086#1088#1103#1095#1080#1093' '#1082#1083#1072#1074#1080#1096
  ClientHeight = 272
  ClientWidth = 427
  KeyPreview = True
  OldCreateOrder = True
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 64
    Top = 224
    Width = 88
    Height = 13
    Caption = #1043#1086#1088#1103#1095#1072#1103' '#1082#1083#1072#1074#1080#1096#1072
  end
  object HotKey1: THotKey [1]
    Left = 168
    Top = 224
    Width = 121
    Height = 19
    HotKey = 0
    InvalidKeys = []
    Modifiers = []
    TabOrder = 0
  end
  object BitBtn1: TBitBtn [2]
    Left = 304
    Top = 224
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object ListView1: TListView [3]
    Left = 8
    Top = 8
    Width = 409
    Height = 185
    Columns = <
      item
        Caption = #1055#1091#1085#1082#1090' '#1084#1077#1085#1102
        Width = 200
      end
      item
        Caption = #1043#1086#1088#1103#1095#1072#1103' '#1082#1083#1072#1074#1080#1096#1072
        Width = 200
      end>
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
    OnClick = ListView1Click
  end
end
