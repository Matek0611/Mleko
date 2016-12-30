inherited ExportTovarForScalesForm: TExportTovarForScalesForm
  Left = 868
  Top = 206
  Width = 579
  Height = 108
  Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1090#1086#1074#1072#1088#1072' '#1076#1083#1103' '#1074#1077#1089#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 120
    Top = 0
    Width = 132
    Height = 13
    Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072' '#1076#1083#1103' '#1074#1099#1075#1088#1091#1079#1082#1080':'
  end
  object cbDBLookupFilterVidTovar: TDBLookupComboboxEh [1]
    Left = 120
    Top = 16
    Width = 201
    Height = 21
    Hint = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072' '#1076#1083#1103' '#1074#1099#1075#1088#1091#1079#1082#1080' '
    EditButtons = <>
    KeyField = 'NameGroup'
    ListField = 'NameGroup'
    ListSource = dsFilterVidTovarForScales
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object bExportTovarForScales: TButton [2]
    Left = 8
    Top = 12
    Width = 105
    Height = 25
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1090#1086#1074#1072#1088
    TabOrder = 1
    OnClick = bExportTovarForScalesClick
  end
  object isExportSelectedVidTovar: TCheckBox [3]
    Left = 248
    Top = 46
    Width = 209
    Height = 17
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1080#1089#1087#1086#1083#1100#1079#1091#1103' '#1089#1087#1080#1089#1086#1082' '#1074#1080#1076#1086#1074
    TabOrder = 2
    OnClick = isExportSelectedVidTovarClick
  end
  object isExportAll: TCheckBox [4]
    Left = 8
    Top = 48
    Width = 97
    Height = 17
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074#1089#1077
    TabOrder = 3
    OnClick = isExportAllClick
  end
  object bSetListVidTovar: TButton [5]
    Left = 336
    Top = 10
    Width = 121
    Height = 25
    Caption = #1047#1072#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1074#1080#1076#1086#1074
    TabOrder = 4
    OnClick = bSetListVidTovarClick
  end
  object spExportTovarForScales: TMSStoredProc
    StoredProcName = 'sp_ExportTovarForScales;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_ExportTovarForScales;1(:Name, :ExportSe' +
        'lectVidTovForScales)}')
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'Name'
        ParamType = ptInput
        Size = 512
      end
      item
        DataType = ftBoolean
        Name = 'ExportSelectVidTovForScales'
        ParamType = ptInput
      end>
  end
  object quFilterVidTovarForScales: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct NameGroup '
      ' from work.dbo.V_TovarForScales'
      'order by NameGroup')
    Left = 80
    Top = 8
    object quFilterVidTovarForScalesNameGroup: TStringField
      FieldName = 'NameGroup'
      Size = 30
    end
  end
  object dsFilterVidTovarForScales: TMSDataSource
    DataSet = quFilterVidTovarForScales
    Left = 112
    Top = 8
  end
end
