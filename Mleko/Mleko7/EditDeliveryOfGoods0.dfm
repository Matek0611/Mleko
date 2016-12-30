inherited fmEditDeliveryOfGoods: TfmEditDeliveryOfGoods
  Left = 832
  Top = 332
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1086#1089#1090#1072#1074#1082#1072
  ClientHeight = 120
  ClientWidth = 266
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 266
    Height = 81
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 76
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object deTipName: TDBEdit
      Left = 8
      Top = 24
      Width = 249
      Height = 21
      AutoSelect = False
      DataField = 'DeliveryGoodsName'
      DataSource = dmDataModule.dsDeliveryOfGoods
      TabOrder = 0
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 48
      Width = 97
      Height = 17
      Caption = #1057#1087#1088#1103#1090#1072#1090#1100
      DataField = 'Visible'
      DataSource = dmDataModule.dsDeliveryOfGoods
      TabOrder = 1
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 8
      Top = 64
      Width = 233
      Height = 17
      Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1074' '#1086#1090#1095#1077#1090#1077' '#1085#1091#1083#1077#1074#1099#1093' '#1086#1089#1090#1072#1090#1082#1086#1074
      DataField = 'NoVisibleOfOtchetZero'
      DataSource = dmDataModule.dsDeliveryOfGoods
      TabOrder = 2
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object bbOk: TBitBtn [1]
    Left = 48
    Top = 88
    Width = 71
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object bbCancel: TBitBtn [2]
    Left = 139
    Top = 88
    Width = 71
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    Kind = bkCancel
  end
end
