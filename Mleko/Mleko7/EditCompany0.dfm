inherited fmEditCompay: TfmEditCompay
  Left = 1013
  Top = 178
  ActiveControl = deNameCompany
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
  ClientHeight = 118
  ClientWidth = 369
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 77
    Width = 369
    Height = 41
    Align = alBottom
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 152
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
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 369
    Height = 77
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 19
      Height = 13
      Caption = #1050#1086#1076
    end
    object Label2: TLabel
      Left = 72
      Top = 8
      Width = 76
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object Label3: TLabel
      Left = 304
      Top = 8
      Width = 20
      Height = 13
      Caption = '& '#1079'/'#1087
    end
    object deCompanyNo: TDBEdit
      Left = 16
      Top = 24
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'CompanyNo'
      DataSource = dmDataModule.dsCompany
      ReadOnly = True
      TabOrder = 0
    end
    object deNameCompany: TDBEdit
      Left = 72
      Top = 24
      Width = 217
      Height = 21
      AutoSelect = False
      AutoSize = False
      DataField = 'NameCompany'
      DataSource = dmDataModule.dsCompany
      TabOrder = 1
    end
    object dePercentSalary: TDBEdit
      Left = 304
      Top = 24
      Width = 49
      Height = 21
      DataField = 'PercentSalary'
      DataSource = dmDataModule.dsCompany
      TabOrder = 2
    end
    object DBCheckBox1: TDBCheckBox
      Left = 16
      Top = 48
      Width = 89
      Height = 17
      Caption = #1057#1087#1088#1103#1090#1072#1090#1100
      DataField = 'Visible'
      DataSource = dmDataModule.dsCompany
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
end
