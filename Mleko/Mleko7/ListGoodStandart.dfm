inherited ListGoodStandartForm: TListGoodStandartForm
  Left = 1011
  Top = 243
  Width = 388
  Height = 217
  Caption = 'object DBGridEh1: TDBGridEh'
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh: TDBGridEh [0]
    Left = 0
    Top = 0
    Width = 372
    Height = 179
    Align = alClient
    DataSource = dsSetGoodStandartes
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
    OnCellClick = DBGridEhCellClick
    OnExit = DBGridEhExit
    Columns = <
      item
        EditButtons = <>
        FieldName = 'StandartName'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1090#1072#1085#1076#1072#1088#1090#1072
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'is_chesk'
        Footers = <>
        ReadOnly = False
        Title.Alignment = taCenter
        Title.Caption = 'V'
        OnUpdateData = DBGridEhColumns1UpdateData
      end>
  end
  object dsSetGoodStandartes: TMSDataSource
    DataSet = quSetGoodStandartes
    Left = 64
    Top = 8
  end
  object quSetGoodStandartes: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select g.StandartName'
      '      ,Case when l.id is null then cast(0 as bit)'
      '       else cast(1 as bit) end as is_chesk'
      '      ,g.StandartNo'
      '      ,isnull(l.TovarNo,:p_TovarNo1) as TovarNo'
      ' from GoodStandarts g left outer join'
      
        '      l_GoodStandart l on l.Standart_id = g.StandartNo and l.Tov' +
        'arNo = :p_TovarNo'
      '  where g.Active = 1')
    Left = 96
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_TovarNo1'
      end
      item
        DataType = ftUnknown
        Name = 'p_TovarNo'
      end>
    object quSetGoodStandartesStandartName: TStringField
      FieldName = 'StandartName'
      Size = 50
    end
    object quSetGoodStandartesis_chesk: TBooleanField
      FieldName = 'is_chesk'
      ReadOnly = True
    end
    object quSetGoodStandartesStandartNo: TIntegerField
      FieldName = 'StandartNo'
      ReadOnly = True
    end
    object quSetGoodStandartesTovarNo: TIntegerField
      FieldName = 'TovarNo'
      ReadOnly = True
    end
  end
  object spGoodStandartes: TMSStoredProc
    StoredProcName = 'sp_SetGoodStandart'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_SetGoodStandart (:p_TovarNo, :p_Standar' +
        't_id, :p_Check)}')
    Left = 128
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_TovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Standart_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Check'
        ParamType = ptInput
      end>
  end
end
