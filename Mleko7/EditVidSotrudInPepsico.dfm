inherited EditVidSotrudInPepsicoForm: TEditVidSotrudInPepsicoForm
  Left = 840
  Top = 300
  Width = 524
  Height = 236
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1090#1088#1091#1082#1090#1091#1088#1099' '#1090#1086#1088#1075#1086#1074#1086#1081' '#1082#1086#1084#1072#1085#1076#1099' Pepsico'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 508
    Height = 156
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 44
      Height = 13
      Caption = #1059#1088#1086#1074#1077#1085#1100
    end
    object Label2: TLabel
      Left = 8
      Top = 48
      Width = 114
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1088#1086#1074#1085#1103
    end
    object Label3: TLabel
      Left = 8
      Top = 88
      Width = 109
      Height = 13
      Caption = #1040#1073#1073#1088#1080#1074#1080#1072#1090#1091#1088#1072' '#1091#1088#1086#1074#1085#1103
    end
    object DBEditLevel: TDBEdit
      Left = 61
      Top = 12
      Width = 35
      Height = 21
      DataField = 'Level'
      DataSource = dmDataModule.dsVidSotrudInPepsico
      TabOrder = 0
    end
    object DBEditLevelName: TDBEdit
      Left = 132
      Top = 48
      Width = 229
      Height = 21
      DataField = 'LevelName'
      DataSource = dmDataModule.dsVidSotrudInPepsico
      TabOrder = 1
    end
    object DBCheckBoxActive: TDBCheckBox
      Left = 8
      Top = 120
      Width = 73
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1077#1085
      DataField = 'Active'
      DataSource = dmDataModule.dsVidSotrudInPepsico
      TabOrder = 2
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBEditSubLevelAbb: TDBEdit
      Left = 128
      Top = 88
      Width = 233
      Height = 21
      DataField = 'SubLevelAbb'
      DataSource = dmDataModule.dsVidSotrudInPepsico
      TabOrder = 3
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 156
    Width = 508
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 177
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
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
      Left = 260
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
