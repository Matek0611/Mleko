inherited CrossPaymentsFromPost: TCrossPaymentsFromPost
  Left = 384
  Top = 243
  Width = 1024
  Height = 598
  Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1008
    Height = 81
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 604
      Top = 10
      Width = 49
      Height = 13
      Caption = #1054#1087#1083#1072#1090#1072' '#1089':'
    end
    object Label2: TLabel
      Left = 804
      Top = 12
      Width = 55
      Height = 13
      Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086':'
    end
    object Flt_Post_buh: TcitDBComboEdit
      Left = 138
      Top = 6
      Width = 191
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 0
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblCaption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
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
      LLblRequiredFont.Style = [fsBold]
      Required = False
      TabOrder = 0
      Visible = True
      OnChange = Flt_Post_buhChange
      LocateKey = False
      KeyField = 'PostNo'
      Owner = 'CrossPaymentsFromPost'
      EntityCode = 'POST'
      EntityName = 'POST_BUH'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = True
    end
    object dtDateBeg: TDBDateTimeEditEh
      Left = 660
      Top = 8
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
      OnChange = dtDateBegChange
    end
    object dtDateEnd: TDBDateTimeEditEh
      Left = 866
      Top = 8
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
      OnChange = dtDateEndChange
    end
    object Flt_Post_Buh_Minus: TcitDBComboEdit
      Left = 138
      Top = 46
      Width = 191
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
      LLblCaption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
      LLblWidth = 130
      LLblFont.Charset = DEFAULT_CHARSET
      LLblFont.Color = clWindowText
      LLblFont.Height = -11
      LLblFont.Name = 'MS Sans Serif'
      LLblFont.Style = []
      LLblRequiredFont.Charset = DEFAULT_CHARSET
      LLblRequiredFont.Color = clWindowText
      LLblRequiredFont.Height = -11
      LLblRequiredFont.Name = 'MS Sans Serif'
      LLblRequiredFont.Style = [fsBold]
      Required = False
      TabOrder = 3
      Visible = True
      OnChange = Flt_Post_Buh_MinusChange
      LocateKey = False
      KeyField = 'PostNo'
      Owner = 'CrossPaymentsFromPost'
      EntityCode = 'POST'
      EntityName = 'POST_BUH'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = True
    end
    object CheckBoxPostPayment: TCheckBox
      Left = 376
      Top = 8
      Width = 185
      Height = 17
      Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1085#1099#1081' '#1085#1072#1073#1086#1088
      TabOrder = 4
    end
    object CheckBoxMinusPostPayment: TCheckBox
      Left = 376
      Top = 48
      Width = 185
      Height = 17
      Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1089#1090#1072#1094#1080#1086#1085#1072#1088#1085#1099#1081' '#1085#1072#1073#1086#1088
      TabOrder = 5
    end
  end
  object DBGridEh1: TDBGridEh [1]
    Left = 0
    Top = 81
    Width = 1008
    Height = 417
    Align = alClient
    DataSource = dsPaymentForPost
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 498
    Width = 1008
    Height = 61
    Align = alBottom
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 24
      Width = 94
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
    end
    object Label4: TLabel
      Left = 256
      Top = 28
      Width = 78
      Height = 13
      Caption = #1054#1090#1089#1088#1086#1095#1082#1072' '#1076#1085#1077#1081':'
    end
    object dbEditNaklNom: TDBEditEh
      Left = 112
      Top = 24
      Width = 121
      Height = 21
      DataField = 'NaklNo'
      DataSource = dsPaymentDelay
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object dbEditDayDelay: TDBEditEh
      Left = 344
      Top = 24
      Width = 49
      Height = 21
      DataField = 'Day_Delay_Ext'
      DataSource = dsPaymentDelay
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object Recalculation: TButton
      Left = 419
      Top = 22
      Width = 89
      Height = 25
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '
      TabOrder = 2
      OnClick = RecalculationClick
    end
    object CreateGraph: TButton
      Left = 532
      Top = 22
      Width = 121
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1075#1088#1072#1092#1080#1082
      TabOrder = 3
      OnClick = CreateGraphClick
    end
    object Button1: TButton
      Left = 684
      Top = 22
      Width = 161
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1085#1077' '#1091#1095#1080#1090#1099#1074#1072#1077#1084#1099#1093
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 876
      Top = 22
      Width = 173
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1091#1095#1080#1090#1099#1074#1072#1077#1084#1099#1093
      TabOrder = 5
      OnClick = Button2Click
    end
  end
  inherited ActionList: TActionList
    Left = 984
    Top = 8
  end
  object quPaymentForPost: TMSQuery
    SQLRefresh.Strings = (
      'select distinct * '
      ' from TmpCrossPaymentForPost '
      '  where DayPayment between :DateBegin and :DateEnd'
      'order by DayPayment')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct * '
      ' from TmpCrossPaymentForPost '
      '  where DayPayment between :DateBegin and :DateEnd'
      'order by DayPayment')
    AfterOpen = quPaymentForPostAfterOpen
    Left = 488
    Top = 144
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBegin'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end>
  end
  object dsPaymentForPost: TMSDataSource
    DataSet = quPaymentForPost
    Left = 488
    Top = 104
  end
  object spPaymentForPost: TMSStoredProc
    StoredProcName = 'spCrossPaymentsFromPost;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL spCrossPaymentsFromPost;1(:isPostNoMinus, ' +
        ':isPostNo, :isPostNoStat, :isPostNoMinusStat, :DateBegin, :DateE' +
        'nd, :SPID, :UserNo)}')
    Left = 632
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'isPostNoMinus'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'isPostNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'isPostNoStat'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'isPostNoMinusStat'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
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
  object quPaymentDelay: TMSQuery
    SQLInsert.Strings = (
      
        'insert into L_Delay_NaklP (NaklNo,SET_ARTICLE_GROUP_ID,Day_Delay' +
        ',Day_Delay_Ext)'
      '  values(:NaklNo,0,:Day_Delay,:Day_Delay_Ext)')
    SQLUpdate.Strings = (
      'declare'
      ' @cnt int'
      'select @cnt = count(*) from L_Delay_NaklP where NaklNo = :NaklNo'
      ''
      'if @cnt = 0'
      
        'insert into L_Delay_NaklP (NaklNo,SET_ARTICLE_GROUP_ID,Day_Delay' +
        ',Day_Delay_Ext)'
      '  values(:NaklNo,0,:Day_Delay,:Day_Delay_Ext)'
      ''
      'update L_Delay_NaklP'
      ' set Day_Delay_Ext = :Day_Delay_Ext'
      'where NaklNo = :NaklNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from L_Delay_NaklP')
    Left = 288
    Top = 200
    object quPaymentDelayNaklNo: TLargeintField
      FieldName = 'NaklNo'
    end
    object quPaymentDelaySET_ARTICLE_GROUP_ID: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID'
    end
    object quPaymentDelayDay_Delay: TIntegerField
      FieldName = 'Day_Delay'
    end
    object quPaymentDelayDay_Delay_Ext: TIntegerField
      FieldName = 'Day_Delay_Ext'
    end
  end
  object dsPaymentDelay: TMSDataSource
    DataSet = quPaymentDelay
    Left = 296
    Top = 136
  end
  object quPostName: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Name from Post where PostNo = :PostNo')
    Left = 824
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
        Value = 0
      end>
    object quPostNameName: TStringField
      FieldName = 'Name'
      Size = 30
    end
  end
  object InsInListPlusPostPayment: TMSStoredProc
    StoredProcName = 'InsInListPlusPostPayment'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL InsInListPlusPostPayment (:SPID, :UserNo)}')
    Left = 8
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
  object InsInListMinusPostPayment: TMSStoredProc
    StoredProcName = 'InsInListMinusPostPayment;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL InsInListMinusPostPayment;1(:SPID, :UserNo' +
        ')}')
    Left = 8
    Top = 40
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
