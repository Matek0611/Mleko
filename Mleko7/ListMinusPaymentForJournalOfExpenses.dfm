object ListMinusPaymentForJournalOfExpensesaForm: TListMinusPaymentForJournalOfExpensesaForm
  Left = 770
  Top = 205
  Width = 552
  Height = 336
  Caption = #1055#1083#1072#1090#1077#1078#1080' '#1085#1077' '#1091#1095#1080#1090#1099#1074#1072#1077#1084#1099#1077' '#1074' '#1078#1091#1088#1085#1072#1083#1077' '#1088#1072#1089#1093#1086#1076#1086#1074
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
    Width = 536
    Height = 256
    Align = alClient
    DataSource = dsListMinusPaymentForJournalOfExpensesa
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
        FieldName = 'Name'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1058#1080#1087' '#1087#1083#1072#1090#1077#1078#1072
        Width = 426
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
    Top = 256
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
    object Jnvtyf: TButton
      Left = 389
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = JnvtyfClick
    end
    object EdTipNo: TcitDBComboEdit
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
      LLblCaption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1058#1080#1087' '#1087#1083#1072#1090#1077#1078#1072' :  '
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
      Owner = 'ListMinusPaymentForJournalOfExpenses'
      EntityCode = 'D_PLAT_TYPE'
      EntityName = 'PLAT_TYPE'
      multiselect = True
      OnSelectOk = EdTipNoSelectOk
      EditStyle = edSelect
      AutoTabControl = True
    end
  end
  object dsListMinusPaymentForJournalOfExpensesa: TMSDataSource
    DataSet = quListMinusPaymentForJournalOfExpensesa
  end
  object quListMinusPaymentForJournalOfExpensesa: TMSQuery
    SQLUpdate.Strings = (
      'update ListMinusPaymentForJournalOfExpenses'
      ' set CheckMinus = :CheckMinus'
      'where TipNo = :TipNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select lmp.TipNo'
      '      ,p.Name'
      '      ,lmp.CheckMinus'
      ' from ListMinusPaymentForJournalOfExpenses lmp inner join'
      '      d_PLat_Type p on p.Id = lmp.TipNo')
    Left = 24
    object quListMinusPaymentForJournalOfExpensesaTipNo: TSmallintField
      FieldName = 'TipNo'
    end
    object quListMinusPaymentForJournalOfExpensesaName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object quListMinusPaymentForJournalOfExpensesaCheckMinus: TBooleanField
      FieldName = 'CheckMinus'
    end
  end
  object spInsInListMinusPaymentForJournalOfExpenses: TMSStoredProc
    StoredProcName = 'InsInListMinusPaymentForJournalOfExpenses'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL InsInListMinusPaymentForJournalOfExpenses ' +
        '(:SPID, :UserNo)}')
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
