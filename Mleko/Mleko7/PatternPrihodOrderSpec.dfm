inherited PatternPrihodOrderSpecForm: TPatternPrihodOrderSpecForm
  Left = 893
  Top = 226
  Width = 508
  Height = 294
  Caption = 'PatternPrihodOrderSpecForm'
  PixelsPerInch = 96
  TextHeight = 13
  object gbPatternSpec: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 492
    Height = 215
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 488
      Height = 198
      Align = alClient
      DataSource = dsPatternSpec
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
      OnKeyDown = DBGridEh1KeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TovarNOPP'
          Footers = <>
          Title.Caption = #8470' '#1087'/'#1087
          Width = 37
        end
        item
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1053#1086#1084#1077#1088' '#1090#1086#1074#1072#1088#1072
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'NameTovar'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
          Width = 337
        end>
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 215
    Width = 492
    Height = 41
    Align = alBottom
    TabOrder = 1
    object EdTovar: TcitDBComboEdit
      Left = 104
      Top = 12
      Width = 151
      Height = 21
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
      LBtnWidth = 30
      LLblAlignment = laLeft
      LLblCaption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088'  :  '
      LLblWidth = 100
      LLblFont.Charset = DEFAULT_CHARSET
      LLblFont.Color = clWindowText
      LLblFont.Height = -11
      LLblFont.Name = 'MS Sans Serif'
      LLblFont.Style = []
      LLblRequiredFont.Charset = DEFAULT_CHARSET
      LLblRequiredFont.Color = clWindowText
      LLblRequiredFont.Height = -11
      LLblRequiredFont.Name = 'MS Sans Serif'
      LLblRequiredFont.Style = []
      Required = True
      TabOrder = 0
      Visible = True
      LocateKey = False
      Owner = 'PatternPrihodOrderSpec'
      EntityCode = 'TOVAR'
      multiselect = True
      OnSelectOk = EdTovarSelectOk
      OnIsSelect = EdTovarIsSelect
      EditStyle = edSelect
      AutoTabControl = True
    end
  end
  inherited ActionList: TActionList
    Top = 16
  end
  object dsPatternSpec: TMSDataSource
    DataSet = quPatternSpec
    Left = 304
    Top = 8
  end
  object quPatternSpec: TMSQuery
    SQLUpdate.Strings = (
      'update PrihodOrderShablon'
      ' set TovarNOPP = :TovarNOPP'
      'where NameShablon = :NameShablon'
      '  and TovarNo = :TovarNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  pos.TovarNOPP'
      '      , pos.TovarNo'
      '      , t.NameTovar'
      '      , pos.NameShablon'
      ' from PrihodOrderShablon pos left join'
      '      Tovar t on t.TovarNo = pos.TovarNo'
      '  where NameShablon = :NameShablon')
    Left = 336
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NameShablon'
      end>
    object quPatternSpecTovarNOPP: TIntegerField
      FieldName = 'TovarNOPP'
    end
    object quPatternSpecTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quPatternSpecNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 128
    end
    object quPatternSpecNameShablon: TStringField
      FieldName = 'NameShablon'
      Size = 30
    end
  end
  object spCreatePrihodOrderShablon: TMSStoredProc
    StoredProcName = 'CreatePrihodOrderShablon'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL CreatePrihodOrderShablon (:SPID, :UserNo, ' +
        ':NameShablon)}')
    Left = 312
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'SPID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UserNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NameShablon'
        ParamType = ptInput
        Size = 30
      end>
  end
end
