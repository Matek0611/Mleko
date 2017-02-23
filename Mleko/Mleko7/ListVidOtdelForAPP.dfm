object ListVidOtdelForAPPaForm: TListVidOtdelForAPPaForm
  Left = 676
  Top = 347
  Width = 552
  Height = 391
  Caption = #1054#1090#1076#1077#1083#1099' '#1091#1095#1080#1090#1099#1074#1072#1077#1084#1099#1077' '#1074' '#1072#1085#1072#1083#1080#1079#1077' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1088#1086#1076#1072#1078
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
    Top = 41
    Width = 536
    Height = 270
    Align = alClient
    DataSource = dsListVidOtdelForAPP
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
        FieldName = 'OtdelName'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1054#1090#1076#1077#1083
        Width = 426
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
    Top = 311
    Width = 536
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
    object Cancel: TButton
      Left = 389
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = CancelClick
    end
    object EdOtdelNo: TcitDBComboEdit
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
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblCaption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1076#1077#1083' :  '
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
      TabOrder = 2
      Visible = True
      LocateKey = False
      Owner = 'ListVidOtdelForAPPaForm'
      EntityCode = 'VIDOTDEL'
      multiselect = True
      OnSelectOk = EdOtdelNoSelectOk
      EditStyle = edSelect
      AutoTabControl = True
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 536
    Height = 41
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 13
      Width = 157
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1085#1072#1095#1072#1083#1100#1085#1072#1103
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 172
      Top = 8
      Width = 121
      Height = 21
      DataField = 'DataApp'
      DataSource = dsDateForAPP
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
  end
  object dsListVidOtdelForAPP: TMSDataSource
    DataSet = quListVidOtdelForAPP
    Left = 419
    Top = 2
  end
  object quListVidOtdelForAPP: TMSQuery
    SQLUpdate.Strings = (
      'update ListVidOtdelForAPP'
      ' set CheckPlus = :CheckPlus'
      'where OtdelNo = :OtdelNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select lmp.OtdelNo'
      '      ,p.OtdelName'
      '      ,lmp.CheckPlus'
      ' from ListVidOtdelForAPP lmp inner join'
      '      VidOtdel p on p.OtdelNo = lmp.OtdelNo')
    Left = 443
    Top = 2
    object quListVidOtdelForAPPOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
    end
    object quListVidOtdelForAPPOtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 30
    end
    object quListVidOtdelForAPPCheckPlus: TBooleanField
      FieldName = 'CheckPlus'
    end
  end
  object spInsInListVidOtdelForAPP: TMSStoredProc
    StoredProcName = 'InsInListVidOtdelForAPP;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL InsInListVidOtdelForAPP;1(:SPID, :UserNo)}')
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
  object quDateForAPP: TMSQuery
    SQLInsert.Strings = (
      'insert into DateForAPP (DataApp)'
      'values (:DataApp)')
    SQLUpdate.Strings = (
      'update DateForAPP'
      'set DataApp = :DataApp')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from DateForAPP')
    Left = 472
    object quDateForAPPDataApp: TDateTimeField
      FieldName = 'DataApp'
    end
  end
  object dsDateForAPP: TMSDataSource
    DataSet = quDateForAPP
    Left = 504
  end
end
