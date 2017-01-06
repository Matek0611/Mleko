inherited fmEditUser: TfmEditUser
  Left = 885
  Top = 188
  ActiveControl = deName
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  ClientHeight = 190
  ClientWidth = 379
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 379
    Height = 149
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 5
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 22
      Height = 13
      Caption = #1048#1084#1103
    end
    object Label2: TLabel
      Left = 152
      Top = 8
      Width = 62
      Height = 13
      Caption = #1050#1086#1076' '#1076#1086#1089#1090#1091#1087#1072
    end
    object Label3: TLabel
      Left = 232
      Top = 8
      Width = 38
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object deName: TDBEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      AutoSelect = False
      DataField = 'UserName'
      DataSource = fmUsers.dsUsers
      TabOrder = 0
    end
    object deCodeAccess: TDBEdit
      Left = 152
      Top = 24
      Width = 25
      Height = 21
      DataField = 'CodeAccess'
      DataSource = fmUsers.dsUsers
      TabOrder = 1
    end
    object edPassword: TEdit
      Left = 232
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'edPassword'
    end
    object dcbPostEdit: TDBCheckBox
      Left = 16
      Top = 56
      Width = 217
      Height = 17
      Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1055#1072#1088#1090#1085#1077#1088#1086#1074
      DataField = 'EditPost'
      DataSource = fmUsers.dsUsers
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object dcbEditPriceInInst: TDBCheckBox
      Left = 16
      Top = 97
      Width = 321
      Height = 17
      Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1042#1093#1086#1076#1103#1097#1091#1102' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1091#1102' '#1094#1077#1085#1091
      DataField = 'ChangePriceInInst'
      DataSource = fmUsers.dsUsers
      TabOrder = 4
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox1: TDBCheckBox
      Left = 16
      Top = 121
      Width = 321
      Height = 17
      Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1086#1075#1086' '#1090#1080#1087#1072' '#1050#1072#1089#1089#1072
      DataField = 'ChangeBuhType'
      DataSource = fmUsers.dsUsers
      TabOrder = 5
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 16
      Top = 77
      Width = 233
      Height = 17
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1076#1072#1085#1085#1099#1093
      DataField = 'RequiredData'
      DataSource = fmUsers.dsUsers
      TabOrder = 6
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 149
    Width = 379
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 163
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = bbOkClick
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
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
    object BitBtn1: TBitBtn
      Left = 32
      Top = 8
      Width = 105
      Height = 25
      Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1084#1077#1085#1102
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
end
