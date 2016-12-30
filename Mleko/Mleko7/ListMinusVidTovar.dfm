object ListMinusVidTovaraForm: TListMinusVidTovaraForm
  Left = 900
  Top = 282
  Width = 482
  Height = 336
  Caption = 'ListMinusVidTovaraForm'
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
    Width = 466
    Height = 257
    Align = alClient
    DataSource = dsListMinusVidTovara
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
        FieldName = 'VidName'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
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
    Width = 466
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
    object EdVidTovar: TcitDBComboEdit
      Left = 125
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
      LLblCaption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1080#1076' '#1090#1086#1074#1072#1088#1072'  :  '
      LLblWidth = 120
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
      Owner = 'ListMinusVidTovara'
      EntityCode = 'VidTov'
      multiselect = True
      OnSelectOk = EdVidTovarSelectOk
      EditStyle = edSelect
      AutoTabControl = True
    end
  end
  object dsListMinusVidTovara: TMSDataSource
    DataSet = quListMinusVidTovara
  end
  object quListMinusVidTovara: TMSQuery
    SQLUpdate.Strings = (
      'update ListMinusVidTovar'
      ' set CheckMinus = :CheckMinus'
      'where VidNo = :VidNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select lmv.VidNo'
      '      ,vt.VidName'
      '      ,lmv.CheckMinus'
      ' from ListMinusVidTovar lmv inner join'
      '      VidTov vt on vt.VidNo = lmv.VidNo')
    Left = 24
    object quListMinusVidTovaraVidNo: TSmallintField
      FieldName = 'VidNo'
    end
    object quListMinusVidTovaraVidName: TStringField
      FieldName = 'VidName'
      Size = 30
    end
    object quListMinusVidTovaraCheckMinus: TBooleanField
      FieldName = 'CheckMinus'
    end
  end
  object spInsInListMinusVidTovar: TMSStoredProc
    StoredProcName = 'InsInListMinusVidTovar'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL InsInListMinusVidTovar (:SPID, :UserNo)}')
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
