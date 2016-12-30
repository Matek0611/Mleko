object ListMinusVidRashodForClearBaseForm: TListMinusVidRashodForClearBaseForm
  Left = 851
  Top = 222
  Width = 498
  Height = 336
  Caption = 'ListMinusVidRashodForClearBaseForm'
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
    Width = 482
    Height = 257
    Align = alClient
    DataSource = dsListMinusVidRashodForClearBase
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
        FieldName = 'VidRashodName'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
        Width = 349
      end
      item
        EditButtons = <>
        FieldName = 'CheckMinus'
        Footers = <>
        Title.Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100
        Width = 74
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 257
    Width = 482
    Height = 41
    Align = alBottom
    TabOrder = 1
    object OK: TButton
      Left = 329
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = OKClick
    end
    object Jnvtyf: TButton
      Left = 405
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = JnvtyfClick
    end
    object EdVidRashodNo: TcitDBComboEdit
      Left = 150
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
      LLblCaption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1072#1090#1100#1102' '#1088#1072#1089#1093#1086#1076#1086#1074' :  '
      LLblWidth = 150
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
      Owner = 'ListMinusVidRashodForClearBase'
      EntityCode = 'VidRashod'
      multiselect = True
      OnSelectOk = EdVidRashodNoSelectOk
      EditStyle = edSelect
      AutoTabControl = True
    end
  end
  object dsListMinusVidRashodForClearBase: TMSDataSource
    DataSet = quListMinusVidRashodForClearBase
  end
  object quListMinusVidRashodForClearBase: TMSQuery
    SQLUpdate.Strings = (
      'update ListMinusVidRashForClearBase'
      ' set CheckMinus = :CheckMinus'
      'where VidRashNo = :VidRashNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select lmp.VidRashNo'
      '      ,p.VidRashodName'
      '      ,lmp.CheckMinus'
      ' from ListMinusVidRashForClearBase lmp inner join'
      '      VidRashod p on p.VidRashodNo = lmp.VidRashNo')
    Left = 24
    object quListMinusVidRashodForClearBaseVidRashNo: TSmallintField
      FieldName = 'VidRashNo'
    end
    object quListMinusVidRashodForClearBaseVidRashodName: TStringField
      FieldName = 'VidRashodName'
      Size = 50
    end
    object quListMinusVidRashodForClearBaseCheckMinus: TBooleanField
      FieldName = 'CheckMinus'
    end
  end
  object spInsInListMinusVidRashodForClearBase: TMSStoredProc
    StoredProcName = 'InsInListMinusVidRashForClearBase;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL InsInListMinusVidRashForClearBase;1(:SPID,' +
        ' :UserNo)}')
    Left = 424
    Top = 232
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
      end>
  end
end
