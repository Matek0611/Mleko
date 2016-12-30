inherited Employee0: TEmployee0
  Left = 489
  Top = 185
  Width = 1003
  Height = 505
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074' '#1076#1083#1103' '#1088#1072#1073#1086#1090#1099' '#1089' '#1090#1077#1088#1084#1080#1085#1072#1083#1072#1084#1080
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 987
    Height = 357
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 985
      Height = 355
      Align = alClient
      DataSource = dsEmployee
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
      OnKeyDown = DBGridEh1KeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'EmployeeNo'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        end
        item
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Title.Caption = #1048#1084#1103
        end
        item
          EditButtons = <>
          FieldName = 'LastName'
          Footers = <>
          Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        end
        item
          EditButtons = <>
          FieldName = 'MiddleName'
          Footers = <>
          Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        end
        item
          EditButtons = <>
          FieldName = 'Login'
          Footers = <>
          Title.Caption = #1051#1086#1075#1080#1085
        end
        item
          EditButtons = <>
          FieldName = 'Password'
          Footers = <>
          Title.Caption = #1055#1072#1088#1086#1083#1100
        end
        item
          EditButtons = <>
          FieldName = 'Trash'
          Footers = <>
          Title.Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090
        end>
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 357
    Width = 987
    Height = 110
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 1
    object Label3: TLabel
      Left = 312
      Top = 45
      Width = 334
      Height = 20
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1082#1083#1072#1074#1080#1096#1072'   Enter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 312
      Top = 77
      Width = 259
      Height = 20
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1082#1083#1072#1074#1080#1096#1072'   Del'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 312
      Top = 13
      Width = 266
      Height = 20
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1082#1083#1072#1074#1080#1096#1072'   Ins'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbExit: TBitBtn
      Left = 680
      Top = 24
      Width = 265
      Height = 73
      Caption = #1042#1099#1093#1086#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
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
    object StaticText1: TStaticText
      Left = 16
      Top = 16
      Width = 241
      Height = 73
      Alignment = taCenter
      AutoSize = False
      Caption = 
        #1044#1083#1103' '#1090#1086#1075#1086','#1095#1090#1086#1073#1099' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1083#1080' '#1091#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1091#1089#1090#1072 +
        #1085#1086#1074#1080#1090#1100' '#1082#1091#1088#1089#1086#1088' '#1085#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1091#1102#1097#1091#1102' '#1079#1072#1087#1080#1089#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Transparent = False
    end
  end
  inherited ActionList: TActionList
    Left = 0
    Top = 40
  end
  object dsEmployee: TDataSource
    DataSet = quEmployee
    Left = 40
    Top = 40
  end
  object quEmployee: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from Employee')
    Left = 72
    Top = 40
    object quEmployeeEmployeeNo: TIntegerField
      FieldName = 'EmployeeNo'
      ReadOnly = True
    end
    object quEmployeeName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 50
    end
    object quEmployeeLastName: TStringField
      FieldName = 'LastName'
      FixedChar = True
      Size = 50
    end
    object quEmployeeMiddleName: TStringField
      FieldName = 'MiddleName'
      FixedChar = True
      Size = 50
    end
    object quEmployeeLogin: TStringField
      FieldName = 'Login'
      FixedChar = True
      Size = 50
    end
    object quEmployeePassword: TStringField
      FieldName = 'Password'
      FixedChar = True
      Size = 50
    end
    object quEmployeeTrash: TBooleanField
      FieldName = 'Trash'
    end
    object quEmployeeEmployeePostNo: TSmallintField
      FieldName = 'EmployeePostNo'
    end
    object quEmployeeEmployeeSotrudNo: TSmallintField
      FieldName = 'EmployeeSotrudNo'
    end
    object quEmployeeEmployeeSetArticleGroupId: TLargeintField
      FieldName = 'EmployeeSetArticleGroupId'
    end
    object quEmployeeTabletId: TIntegerField
      FieldName = 'TabletId'
    end
    object quEmployeeEmploeeScopeNo: TIntegerField
      FieldName = 'EmploeeScopeNo'
    end
    object quEmployeeEmploeeCarsNo: TSmallintField
      FieldName = 'EmploeeCarsNo'
    end
  end
  object quEmployeeScope: TMSQuery
    SQLDelete.Strings = (
      'DELETE FROM EmployeeScope'
      'WHERE'
      '  EmployeeNo = :Old_EmployeeNo')
    SQLUpdate.Strings = (
      'UPDATE EmployeeScope'
      'SET'
      
        '  EmployeeNo = :EmployeeNo, ScopeName = :ScopeName, ScopeLevel =' +
        ' :ScopeLevel'
      'WHERE'
      '  EmployeeNo = :Old_EmployeeNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from EmployeeScope where EmployeeNo = :EmployeeNo')
    Left = 152
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EmployeeNo'
      end>
    object quEmployeeScopeScopeNo: TIntegerField
      FieldName = 'ScopeNo'
      ReadOnly = True
    end
    object quEmployeeScopeEmployeeNo: TIntegerField
      FieldName = 'EmployeeNo'
    end
    object quEmployeeScopeScopeName: TStringField
      FieldName = 'ScopeName'
      FixedChar = True
      Size = 50
    end
    object quEmployeeScopeScopeLevel: TIntegerField
      FieldName = 'ScopeLevel'
    end
  end
  object dsEmployeeScope: TDataSource
    DataSet = quEmployeeScope
    Left = 120
    Top = 40
  end
end
