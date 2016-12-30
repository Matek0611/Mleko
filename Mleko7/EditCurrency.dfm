inherited EditCurrencyForm: TEditCurrencyForm
  Left = 792
  Top = 318
  Width = 400
  Height = 284
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1072#1083#1102#1090#1099
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 204
    Width = 384
    Height = 41
    Align = alBottom
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 144
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
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 384
    Height = 204
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 116
      Height = 13
      Caption = #1063#1080#1089#1083#1086#1074#1086#1081' '#1082#1086#1076' '#1074#1072#1083#1102#1090#1099':'
    end
    object Label2: TLabel
      Left = 8
      Top = 46
      Width = 124
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1074#1072#1083#1102#1090#1099': '
    end
    object Label3: TLabel
      Left = 8
      Top = 77
      Width = 122
      Height = 13
      Caption = #1041#1091#1082#1074#1077#1085#1085#1099#1081' '#1082#1086#1076' '#1074#1072#1083#1102#1090#1099':'
    end
    object Label4: TLabel
      Left = 8
      Top = 108
      Width = 150
      Height = 13
      Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    end
    object isTrash: TDBCheckBoxEh
      Left = 8
      Top = 160
      Width = 97
      Height = 17
      Caption = #1059#1076#1072#1083#1077#1085#1072
      DataField = 'isTrash'
      DataSource = dmDataModule.dsCurrency
      TabOrder = 0
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object IsDefault: TDBCheckBoxEh
      Left = 8
      Top = 137
      Width = 150
      Height = 17
      Caption = #1042#1072#1083#1102#1090#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      DataField = 'IsDefault'
      DataSource = dmDataModule.dsCurrency
      TabOrder = 1
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = IsDefaultClick
    end
    object DBEditEh1: TDBEditEh
      Left = 173
      Top = 12
      Width = 60
      Height = 21
      DataField = 'ID'
      DataSource = dmDataModule.dsCurrency
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object DBEditEh2: TDBEditEh
      Left = 173
      Top = 42
      Width = 196
      Height = 21
      DataField = 'NAME'
      DataSource = dmDataModule.dsCurrency
      EditButtons = <>
      TabOrder = 3
      Visible = True
    end
    object DBEditEh3: TDBEditEh
      Left = 173
      Top = 72
      Width = 60
      Height = 21
      DataField = 'L_CODE'
      DataSource = dmDataModule.dsCurrency
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
    object DBEditEh4: TDBEditEh
      Left = 173
      Top = 102
      Width = 60
      Height = 21
      DataField = 'SHORT_NAME'
      DataSource = dmDataModule.dsCurrency
      EditButtons = <>
      TabOrder = 5
      Visible = True
    end
    object DBCheckBoxEh1: TDBCheckBoxEh
      Left = 8
      Top = 184
      Width = 97
      Height = 17
      Caption = #1050#1088#1086#1089#1089' '#1074#1072#1083#1102#1090#1072
      DataField = 'isCrossCurrency'
      DataSource = dmDataModule.dsCurrency
      TabOrder = 6
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = DBCheckBoxEh1Click
    end
  end
end
