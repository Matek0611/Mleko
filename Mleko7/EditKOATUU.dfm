inherited EditKOATUUForm: TEditKOATUUForm
  Left = 799
  Top = 358
  Width = 342
  Height = 368
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 326
    Height = 288
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 86
      Height = 13
      Caption = #1050#1086#1076' '#1090#1077#1088#1088#1080#1090#1086#1088#1080#1080' :'
    end
    object Label2: TLabel
      Left = 8
      Top = 44
      Width = 71
      Height = 13
      Caption = #1057#1090#1088#1072#1085#1072' ('#1088#1091#1089'.) :'
    end
    object Label3: TLabel
      Left = 8
      Top = 69
      Width = 71
      Height = 13
      Caption = #1056#1077#1075#1080#1086#1085' ('#1088#1091#1089'.) :'
    end
    object Label4: TLabel
      Left = 8
      Top = 96
      Width = 66
      Height = 13
      Caption = #1056#1072#1081#1086#1085' ('#1088#1091#1089'.) :'
    end
    object Label5: TLabel
      Left = 8
      Top = 120
      Width = 65
      Height = 13
      Caption = #1043#1086#1088#1086#1076' ('#1088#1091#1089'.) :'
    end
    object Label6: TLabel
      Left = 7
      Top = 150
      Width = 71
      Height = 13
      Caption = #1057#1090#1088#1072#1085#1072' ('#1072#1085#1075'.) :'
    end
    object Label7: TLabel
      Left = 7
      Top = 175
      Width = 71
      Height = 13
      Caption = #1056#1077#1075#1080#1086#1085' ('#1072#1085#1075'.) :'
    end
    object Label8: TLabel
      Left = 7
      Top = 202
      Width = 66
      Height = 13
      Caption = #1056#1072#1081#1086#1085' ('#1072#1085#1075'.) :'
    end
    object Label9: TLabel
      Left = 7
      Top = 226
      Width = 65
      Height = 13
      Caption = #1043#1086#1088#1086#1076' ('#1072#1085#1075'.) :'
    end
    object DBEditKOATUU_ID_CODE: TDBEdit
      Left = 101
      Top = 12
      Width = 121
      Height = 21
      DataField = 'KOATUU_ID_CODE'
      DataSource = dmDataModule.dsKOATUU
      TabOrder = 0
    end
    object DBEditKOATUU_L1_Name_Rus: TDBEdit
      Left = 101
      Top = 40
      Width = 212
      Height = 21
      DataField = 'KOATUU_L1_Name_Rus'
      DataSource = dmDataModule.dsKOATUU
      TabOrder = 1
    end
    object DBEditKOATUU_L2_Name_Rus: TDBEdit
      Left = 100
      Top = 66
      Width = 213
      Height = 21
      DataField = 'KOATUU_L2_Name_Rus'
      DataSource = dmDataModule.dsKOATUU
      TabOrder = 2
    end
    object DBEditKOATUU_L3_Name_Rus: TDBEdit
      Left = 100
      Top = 92
      Width = 212
      Height = 21
      DataField = 'KOATUU_L3_Name_Rus'
      DataSource = dmDataModule.dsKOATUU
      TabOrder = 3
    end
    object DBEditKOATUU_L4_Name_Rus: TDBEdit
      Left = 100
      Top = 119
      Width = 213
      Height = 21
      DataField = 'KOATUU_L4_Name_Rus'
      DataSource = dmDataModule.dsKOATUU
      TabOrder = 4
    end
    object DBEditKOATUU_L1_Name_En: TDBEdit
      Left = 100
      Top = 146
      Width = 212
      Height = 21
      DataField = 'KOATUU_L1_Name_En'
      DataSource = dmDataModule.dsKOATUU
      TabOrder = 5
    end
    object DBEditKOATUU_L2_Name_En: TDBEdit
      Left = 99
      Top = 172
      Width = 213
      Height = 21
      DataField = 'KOATUU_L2_Name_En'
      DataSource = dmDataModule.dsKOATUU
      TabOrder = 6
    end
    object DBEditKOATUU_L3_Name_En: TDBEdit
      Left = 99
      Top = 198
      Width = 212
      Height = 21
      DataField = 'KOATUU_L3_Name_En'
      DataSource = dmDataModule.dsKOATUU
      TabOrder = 7
    end
    object DBEditKOATUU_L4_Name_En: TDBEdit
      Left = 99
      Top = 225
      Width = 213
      Height = 21
      DataField = 'KOATUU_L4_Name_En'
      DataSource = dmDataModule.dsKOATUU
      TabOrder = 8
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 256
      Width = 97
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1085#1072
      DataField = 'Active'
      DataSource = dmDataModule.dsKOATUU
      TabOrder = 9
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 288
    Width = 326
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
