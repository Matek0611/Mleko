inherited fmEditCars: TfmEditCars
  Left = 1026
  Top = 181
  Width = 342
  Height = 357
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1040#1074#1090#1086#1084#1086#1073#1080#1083#1103
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 326
    Height = 277
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 0
    object Label1: TLabel
      Left = 51
      Top = 18
      Width = 19
      Height = 13
      Caption = #1050#1086#1076
    end
    object Label2: TLabel
      Left = 8
      Top = 42
      Width = 62
      Height = 13
      Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
    end
    object Label3: TLabel
      Left = 22
      Top = 66
      Width = 48
      Height = 13
      Caption = #1042#1086#1076#1080#1090#1077#1083#1100
    end
    object Label4: TLabel
      Left = 37
      Top = 92
      Width = 33
      Height = 13
      Caption = #1052#1072#1088#1082#1072
    end
    object Label5: TLabel
      Left = 36
      Top = 116
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object Label6: TLabel
      Left = 33
      Top = 140
      Width = 37
      Height = 13
      Caption = #1060#1080#1088#1084#1072
    end
    object Label7: TLabel
      Left = 39
      Top = 164
      Width = 31
      Height = 13
      Caption = #1054#1050#1055#1054
    end
    object Label8: TLabel
      Left = 6
      Top = 185
      Width = 114
      Height = 13
      Caption = #1043#1088#1091#1079#1086#1087#1086#1076#1098#1084#1085#1086#1089#1090#1100' ('#1082#1075'.)'
    end
    object Label9: TLabel
      Left = 9
      Top = 257
      Width = 74
      Height = 13
      Caption = #1054#1073#1098#1077#1084' ('#1084'/'#1082#1091#1073')'
    end
    object deCarsNo: TDBEdit
      Left = 76
      Top = 14
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'CarsNo'
      DataSource = dmDataModule.dsCars
      ReadOnly = True
      TabOrder = 0
    end
    object deCarsName: TDBEdit
      Left = 76
      Top = 38
      Width = 249
      Height = 21
      AutoSelect = False
      DataField = 'CarsName'
      DataSource = dmDataModule.dsCars
      TabOrder = 1
    end
    object deCarsDriver: TDBEdit
      Left = 76
      Top = 62
      Width = 249
      Height = 21
      AutoSelect = False
      DataField = 'CarsDriver'
      DataSource = dmDataModule.dsCars
      TabOrder = 2
    end
    object deCarsType: TDBEdit
      Left = 76
      Top = 88
      Width = 249
      Height = 21
      AutoSelect = False
      DataField = 'CarsType'
      DataSource = dmDataModule.dsCars
      TabOrder = 3
    end
    object deCarsNomer: TDBEdit
      Left = 76
      Top = 112
      Width = 249
      Height = 21
      AutoSelect = False
      DataField = 'CarsNomer'
      DataSource = dmDataModule.dsCars
      TabOrder = 4
    end
    object deCarsFirma: TDBEdit
      Left = 76
      Top = 136
      Width = 249
      Height = 21
      AutoSelect = False
      DataField = 'CarsFirma'
      DataSource = dmDataModule.dsCars
      TabOrder = 5
    end
    object deCarsOKPO: TDBEdit
      Left = 76
      Top = 160
      Width = 249
      Height = 21
      AutoSelect = False
      DataField = 'CarsOKPO'
      DataSource = dmDataModule.dsCars
      TabOrder = 6
    end
    object DBCheckBox1: TDBCheckBox
      Left = 28
      Top = 233
      Width = 69
      Height = 17
      Caption = #1057#1087#1088#1103#1090#1072#1090#1100
      DataField = 'Visible'
      DataSource = dmDataModule.dsCars
      TabOrder = 7
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object EDMol: TcitDBEdit
      Left = 77
      Top = 206
      Width = 197
      Height = 21
      DataField = 'Name'
      DataSource = DSPost
      DontPushIfDisabled = False
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 115
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblCaption = #1052#1054#1051
      LLblWidth = 30
      LLblFont.Charset = DEFAULT_CHARSET
      LLblFont.Color = clWindowText
      LLblFont.Height = -11
      LLblFont.Name = 'MS Sans Serif'
      LLblFont.Style = []
      LLblRequiredFont.Charset = DEFAULT_CHARSET
      LLblRequiredFont.Color = clWindowText
      LLblRequiredFont.Height = -11
      LLblRequiredFont.Name = 'MS Sans Serif'
      LLblRequiredFont.Style = [fsBold]
      Required = False
      ReadOnly = True
      TabOrder = 8
      Text = 'EDMol'
      Visible = True
      OnExit = EDMolExit
      OnPushButton = EDMolPushButton
    end
    object DBCheckBox2: TDBCheckBox
      Left = 100
      Top = 233
      Width = 89
      Height = 17
      Caption = #1053#1072#1096' '#1074#1086#1076#1080#1090#1077#1083#1100
      DataField = 'is_our'
      DataSource = dmDataModule.dsCars
      TabOrder = 9
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBNumberEditEhVolume: TDBNumberEditEh
      Left = 88
      Top = 254
      Width = 57
      Height = 21
      DataField = 'Volume'
      DataSource = dmDataModule.dsCars
      EditButtons = <>
      Increment = 0.050000000000000000
      TabOrder = 10
      Visible = True
    end
    object DBNumberEditEhCapacity: TDBNumberEditEh
      Left = 128
      Top = 184
      Width = 57
      Height = 21
      DataField = 'Capacity'
      DataSource = dmDataModule.dsCars
      EditButtons = <>
      TabOrder = 11
      Visible = True
    end
    object DBCheckBox3: TDBCheckBox
      Left = 200
      Top = 234
      Width = 97
      Height = 17
      Caption = #1053#1072#1096#1072' '#1084#1072#1096#1080#1085#1072
      DataField = 'Our_Car'
      DataSource = dmDataModule.dsCars
      TabOrder = 12
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox4: TDBCheckBox
      Left = 151
      Top = 255
      Width = 106
      Height = 17
      Caption = #1056#1077#1092#1088#1077#1078#1080#1088#1072#1090#1086#1088
      DataField = 'is_Refrigerator'
      DataSource = dmDataModule.dsCars
      TabOrder = 13
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 277
    Width = 326
    Height = 41
    Align = alBottom
    TabOrder = 1
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
  object TPost: TMSTable
    TableName = 'Post'
    MasterFields = 'MOLPostNo'
    MasterSource = dmDataModule.dsCars
    Connection = dmDataModule.DB
    IndexFieldNames = 'PostNo'
    Left = 8
    Top = 141
  end
  object DSPost: TDataSource
    DataSet = TPost
    Left = 9
    Top = 229
  end
end
