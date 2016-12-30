inherited fmEditSotrud: TfmEditSotrud
  Left = 825
  Top = 217
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
  ClientHeight = 246
  ClientWidth = 266
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 266
    Height = 62
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 266
    Height = 205
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 52
      Width = 31
      Height = 13
      Caption = #1054#1090#1076#1077#1083
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 55
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103' :'
    end
    object Label1: TLabel
      Left = 8
      Top = 96
      Width = 64
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100': '
    end
    object Label4: TLabel
      Left = 8
      Top = 144
      Width = 72
      Height = 13
      Caption = #1055#1086#1076#1095#1080#1085#1103#1077#1090#1089#1103' :'
    end
    object deSotrudName: TDBEdit
      Left = 8
      Top = 24
      Width = 249
      Height = 21
      AutoSelect = False
      DataField = 'SotrudName'
      DataSource = dmDataModule.dsSotrud
      TabOrder = 0
    end
    object DBLookupComboBox1: TcxDBLookupComboBox
      Left = 8
      Top = 68
      DataBinding.DataField = 'SotrudOtdel'
      DataBinding.DataSource = dmDataModule.dsSotrud
      Properties.KeyFieldNames = 'OtdelNo'
      Properties.ListColumns = <
        item
          FieldName = 'OtdelName'
        end>
      Properties.ListSource = dmDataModule.dsOtdel
      TabOrder = 1
      Width = 241
    end
    object DBCheckBox1: TDBCheckBox
      Left = 8
      Top = 184
      Width = 97
      Height = 17
      Caption = #1057#1087#1088#1103#1090#1072#1090#1100
      DataField = 'Visible'
      DataSource = dmDataModule.dsSotrud
      TabOrder = 2
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object cxDBLookupComboBoxSotrudLevelInPepsico: TcxDBLookupComboBox
      Left = 8
      Top = 112
      DataBinding.DataField = 'SotrudLevelInPepsico'
      DataBinding.DataSource = dmDataModule.dsSotrud
      Properties.KeyFieldNames = 'Level'
      Properties.ListColumns = <
        item
          FieldName = 'LevelName'
        end>
      Properties.ListSource = dmDataModule.dsVidSotrudInPepsico
      TabOrder = 3
      Width = 241
    end
    object deParentSotrudName: TDBEdit
      Left = 8
      Top = 161
      Width = 249
      Height = 21
      AutoSelect = False
      DataField = 'ParentSotrudName'
      DataSource = dmDataModule.dsSotrud
      TabOrder = 4
      OnDblClick = deParentSotrudNameDblClick
      OnExit = deParentSotrudNameExit
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 205
    Width = 266
    Height = 41
    Align = alBottom
    TabOrder = 2
    object bbOk: TBitBtn
      Left = 100
      Top = 8
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
      Left = 183
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
