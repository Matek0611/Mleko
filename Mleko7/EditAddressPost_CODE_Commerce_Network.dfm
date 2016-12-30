inherited EditAddressPost_CODE_Commerce_NetworkForm: TEditAddressPost_CODE_Commerce_NetworkForm
  Left = 799
  Top = 358
  Width = 363
  Height = 204
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1086#1088#1075#1086#1074#1086#1081' '#1089#1077#1090#1080
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 347
    Height = 124
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 51
      Height = 13
      Caption = #1050#1086#1076' '#1089#1077#1090#1080' :'
    end
    object Label8: TLabel
      Left = 7
      Top = 45
      Width = 111
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' ('#1088#1091#1089'.) :'
    end
    object Label9: TLabel
      Left = 7
      Top = 69
      Width = 111
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' ('#1072#1085#1075'.) :'
    end
    object DBEditAddressPost_CODE_Commerce_Network_ID_CODE: TDBEdit
      Left = 117
      Top = 12
      Width = 121
      Height = 21
      DataField = 'Code'
      DataSource = dmDataModule.dsAddressPost_CODE_Commerce_Network
      TabOrder = 0
    end
    object DBEditAddressPost_CODE_Commerce_Network_L3_Name_En: TDBEdit
      Left = 115
      Top = 41
      Width = 212
      Height = 21
      DataField = 'DescriptionRUS'
      DataSource = dmDataModule.dsAddressPost_CODE_Commerce_Network
      TabOrder = 1
    end
    object DBEditAddressPost_CODE_Commerce_Network_L4_Name_En: TDBEdit
      Left = 115
      Top = 68
      Width = 213
      Height = 21
      DataField = 'Description'
      DataSource = dmDataModule.dsAddressPost_CODE_Commerce_Network
      TabOrder = 2
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 99
      Width = 97
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1085#1072
      DataField = 'Active'
      DataSource = dmDataModule.dsAddressPost_CODE_Commerce_Network
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 124
    Width = 347
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 77
      Top = 8
      Width = 81
      Height = 25
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 0
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
    object bbCancel: TBitBtn
      Left = 173
      Top = 8
      Width = 81
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
