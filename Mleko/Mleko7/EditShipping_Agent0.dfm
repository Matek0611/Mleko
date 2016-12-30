inherited fmEditShipping_Agent: TfmEditShipping_Agent
  Left = 267
  Top = 335
  Width = 358
  Height = 144
  Caption = #1069#1082#1089#1087#1077#1076#1080#1090#1086#1088
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 350
    Height = 76
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 0
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
      Width = 60
      Height = 13
      Caption = #1069#1082#1089#1087#1077#1076#1080#1090#1086#1088
    end
    object deShipping_AgentNo: TDBEdit
      Left = 16
      Top = 24
      Width = 41
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'Shipping_AgentNo'
      DataSource = dmDataModule.dsShipping_Agent
      ReadOnly = True
      TabOrder = 0
    end
    object deShipping_AgentName: TDBEdit
      Left = 72
      Top = 24
      Width = 249
      Height = 21
      AutoSelect = False
      DataField = 'Shipping_AgentName'
      DataSource = dmDataModule.dsShipping_Agent
      TabOrder = 1
    end
    object DBCheckBox2: TDBCheckBox
      Left = 70
      Top = 48
      Width = 89
      Height = 17
      Caption = #1057#1087#1088#1103#1090#1072#1090#1100
      DataField = 'Visible'
      DataSource = dmDataModule.dsShipping_Agent
      TabOrder = 2
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 76
    Width = 350
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
  object DBCheckBox1: TDBCheckBox [2]
    Left = 166
    Top = 48
    Width = 92
    Height = 17
    Caption = #1053#1072#1096' '#1074#1086#1076#1080#1090#1077#1083#1100
    DataField = 'is_our'
    DataSource = dmDataModule.dsShipping_Agent
    TabOrder = 2
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
end
