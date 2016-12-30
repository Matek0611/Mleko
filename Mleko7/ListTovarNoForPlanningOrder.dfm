object ListTovarNoForPlanningOrderaForm: TListTovarNoForPlanningOrderaForm
  Left = 770
  Top = 205
  Width = 617
  Height = 336
  Caption = #1058#1086#1074#1072#1088#1099' '#1074' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1080' '#1087#1088#1086#1076#1072#1078
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 601
    Height = 256
    Align = alClient
    DataSource = dsListTovarNoForPlanningOrdera
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
    OnKeyPress = DBGridEh1KeyPress
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NameTovar'
        Footers = <>
        ReadOnly = True
        Width = 426
      end
      item
        EditButtons = <>
        FieldName = 'IncrementRate'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'CheckPlus'
        Footers = <>
        Title.Caption = #1042#1099#1073#1088#1072#1090#1100
        Width = 74
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 256
    Width = 601
    Height = 41
    Align = alBottom
    TabOrder = 1
    object OK: TButton
      Left = 309
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = OKClick
    end
    object Jnvtyf: TButton
      Left = 389
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = JnvtyfClick
    end
    object EdTovarNo: TcitDBComboEdit
      Left = 125
      Top = 12
      Width = 156
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
      LLblCaption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088' :  '
      LLblWidth = 125
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
      TabOrder = 2
      Visible = True
      LocateKey = False
      Owner = 'ListTovarNoForPlanningOrder'
      EntityCode = 'Tovar'
      multiselect = True
      OnSelectOk = EdTovarNoSelectOk
      EditStyle = edSelect
      AutoTabControl = True
    end
  end
  object dsListTovarNoForPlanningOrdera: TMSDataSource
    DataSet = quListTovarNoForPlanningOrdera
    Left = 8
    Top = 48
  end
  object quListTovarNoForPlanningOrdera: TMSQuery
    SQLUpdate.Strings = (
      'update ListTovarNoForPlanningOrder'
      ' set  CheckPlus = :CheckPlus'
      '    , IncrementRate = :IncrementRate'
      'where TovarNo = :TovarNo'
      '  and UserNo = :UserNo')
    SQLRefresh.Strings = (
      'update ListTovarNoForPlanningOrder'
      ' set  CheckPlus = :CheckPlus'
      '    , IncrementRate = :IncrementRate'
      'where TovarNo = :TovarNo'
      '  and UserNo = :UserNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '  @UserNo int'
      ''
      'set @UserNo = :UserNo'
      ''
      'select lmp.TovarNo'
      '      ,p.NameTovar'
      '      ,lmp.IncrementRate'
      '      ,lmp.CheckPlus'
      '      ,@UserNo as UserNo'
      ' from ListTovarNoForPlanningOrder lmp inner join'
      '      Tovar p on p.TovarNo = lmp.TovarNo'
      '  where lmp.UserNo = @UserNo')
    Left = 32
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UserNo'
      end>
    object quListTovarNoForPlanningOrderaTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quListTovarNoForPlanningOrderaNameTovar: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      FieldName = 'NameTovar'
      Size = 30
    end
    object quListTovarNoForPlanningOrderaIncrementRate: TIntegerField
      DisplayLabel = #1055#1088#1080#1088#1086#1089#1090' %'
      FieldName = 'IncrementRate'
    end
    object quListTovarNoForPlanningOrderaCheckPlus: TBooleanField
      FieldName = 'CheckPlus'
    end
    object quListTovarNoForPlanningOrderaUserNo: TIntegerField
      FieldName = 'UserNo'
      ReadOnly = True
    end
  end
  object spInsInListTovarNoForPlanningOrder: TMSStoredProc
    StoredProcName = 'InsInListTovarNoForPlanningOrder'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL InsInListTovarNoForPlanningOrder (:SPID, :' +
        'UserNo)}')
    Left = 424
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
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
      end>
  end
end
