inherited EditEmployee: TEditEmployee
  Left = 788
  Top = 212
  Width = 372
  Height = 424
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 356
    Height = 336
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 12
      Top = 28
      Width = 49
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object Label2: TLabel
      Left = 15
      Top = 62
      Width = 22
      Height = 13
      Caption = #1048#1084#1103
    end
    object Label3: TLabel
      Left = 16
      Top = 96
      Width = 47
      Height = 13
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    end
    object Label4: TLabel
      Left = 16
      Top = 160
      Width = 38
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object Label5: TLabel
      Left = 16
      Top = 185
      Width = 96
      Height = 13
      Caption = #1054#1073#1083#1072#1089#1100' '#1074#1080#1076#1080#1084#1086#1089#1090#1080
    end
    object Label6: TLabel
      Left = 16
      Top = 219
      Width = 44
      Height = 13
      Caption = #1059#1088#1086#1074#1077#1085#1100
    end
    object Label7: TLabel
      Left = 16
      Top = 128
      Width = 31
      Height = 13
      Caption = #1051#1086#1075#1080#1085
    end
    object Label8: TLabel
      Left = 19
      Top = 245
      Width = 64
      Height = 13
      Caption = #1050#1086#1076' '#1084#1072#1096#1080#1085#1099
    end
    object Label9: TLabel
      Left = 16
      Top = 280
      Width = 85
      Height = 13
      Caption = #1050#1086#1076' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
    end
    object Label10: TLabel
      Left = 16
      Top = 310
      Width = 80
      Height = 13
      Caption = #1050#1086#1076' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    end
    object DBEditEhLastName: TDBEditEh
      Left = 73
      Top = 24
      Width = 256
      Height = 21
      DataField = 'LastName'
      DataSource = Employee0.dsEmployee
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object DBEditEhName: TDBEditEh
      Left = 73
      Top = 56
      Width = 256
      Height = 21
      DataField = 'Name'
      DataSource = Employee0.dsEmployee
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object DBEditEhMiddleName: TDBEditEh
      Left = 73
      Top = 88
      Width = 256
      Height = 21
      DataField = 'MiddleName'
      DataSource = Employee0.dsEmployee
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object DBEditEhPassword: TDBEditEh
      Left = 72
      Top = 152
      Width = 257
      Height = 21
      DataField = 'Password'
      DataSource = Employee0.dsEmployee
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
    object DBEditEhScopeName: TDBEditEh
      Left = 120
      Top = 182
      Width = 209
      Height = 21
      DataField = 'ScopeName'
      DataSource = Employee0.dsEmployeeScope
      EditButtons = <>
      TabOrder = 5
      Visible = True
    end
    object DBEditEhScopeLevel: TDBEditEh
      Left = 72
      Top = 214
      Width = 57
      Height = 21
      DataField = 'ScopeLevel'
      DataSource = Employee0.dsEmployeeScope
      EditButtons = <>
      TabOrder = 6
      Visible = True
    end
    object DBEditEhLogin: TDBEditEh
      Left = 73
      Top = 121
      Width = 256
      Height = 21
      DataField = 'Login'
      DataSource = Employee0.dsEmployee
      EditButtons = <>
      TabOrder = 3
      Visible = True
    end
    object DBEditEhEmploeeCarsNo: TDBEditEh
      Left = 89
      Top = 242
      Width = 121
      Height = 21
      DataField = 'EmploeeCarsNo'
      DataSource = Employee0.dsEmployee
      EditButtons = <>
      TabOrder = 7
      Visible = True
      OnDblClick = DBEditEhEmploeeCarsNoDblClick
      OnEnter = DBEditEhEmploeeCarsNoEnter
    end
    object DBEditEhEmployeePostNo: TDBEditEh
      Left = 112
      Top = 275
      Width = 121
      Height = 21
      DataField = 'EmployeePostNo'
      DataSource = Employee0.dsEmployee
      EditButtons = <>
      TabOrder = 8
      Visible = True
      OnDblClick = DBEditEhEmployeePostNoDblClick
      OnEnter = DBEditEhEmployeePostNoEnter
    end
    object DBEditEhEmployeeSotrudNo: TDBEditEh
      Left = 104
      Top = 304
      Width = 121
      Height = 21
      DataField = 'EmployeeSotrudNo'
      DataSource = Employee0.dsEmployee
      EditButtons = <>
      TabOrder = 9
      Visible = True
      OnDblClick = DBEditEhEmployeeSotrudNoDblClick
      OnEnter = DBEditEhEmployeeSotrudNoEnter
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 336
    Width = 356
    Height = 50
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 24
      Top = 13
      Width = 121
      Height = 25
      Caption = 'OK'
      ModalResult = 1
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
      Left = 200
      Top = 13
      Width = 121
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = bbCancelClick
      Kind = bkCancel
    end
  end
end
