inherited EditDocPlatDlg: TEditDocPlatDlg
  Left = 325
  Top = 104
  Caption = #1056#1072#1089#1093#1086#1076' '#1076#1077#1085#1077#1075
  ClientHeight = 580
  ClientWidth = 1165
  DesignSize = (
    1165
    580)
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TToolBar [0]
    Width = 1165
    TabOrder = 0
  end
  inherited PageControl: TPageControl [1]
    Top = 113
    Width = 1165
    Height = 431
    Align = alTop
    MultiLine = True
    TabOrder = 1
    inherited TabSheet1: TTabSheet
      object p_Nom: TcitDBComboEdit
        Left = 102
        Top = 32
        Width = 110
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
        LLblCaption = #1053#1086#1084#1077#1088
        LLblWidth = 95
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
        Required = True
        TabOrder = 1
        Text = 'p_Nom'
        Visible = True
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object p_PostNo: TcitDBComboEdit
        Left = 102
        Top = 93
        Width = 226
        Height = 21
        Color = clYellow
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
        LLblCaption = #1060#1080#1088#1084#1072
        LLblWidth = 95
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
        Required = True
        TabOrder = 3
        Text = 'p_PostNo'
        Visible = True
        LocateKey = False
        EntityCode = 'POST'
        EditStyle = edSelect
        AutoTabControl = True
      end
      object p_DatePlat: TcitDBComboEdit
        Left = 102
        Top = 124
        Width = 110
        Height = 21
        Color = clYellow
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
        LLblCaption = #1044#1072#1090#1072' '#1086#1090#1095
        LLblWidth = 95
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
        Required = True
        TabOrder = 4
        Text = 'p_DatePlat'
        Visible = True
        LocateKey = False
        EditStyle = edDate
        AutoTabControl = True
      end
      object p_Summa: TcitDBComboEdit
        Left = 102
        Top = 154
        Width = 110
        Height = 21
        Color = clYellow
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
        LLblCaption = #1057#1091#1084#1084#1072
        LLblWidth = 95
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
        Required = True
        TabOrder = 5
        Text = 'p_Summa '
        Visible = True
        OnChange = p_SummaChange
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object p_Buh: TcitDBComboEdit
        Left = 102
        Top = 62
        Width = 226
        Height = 21
        Color = clYellow
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
        LLblCaption = #1060#1086#1088#1084#1072' '#1086#1087#1083#1072#1090#1099
        LLblWidth = 95
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
        Required = True
        TabOrder = 2
        Text = 'p_Buh'
        Visible = True
        DataSet = quBuh
        LocateKey = False
        KeyField = 'buh'
        TextField = 'Buh_type_name'
        OnSelectOk = p_BuhSelectOk
        EditStyle = edCombo
        AutoTabControl = True
      end
      object p_Spravka: TcitDBComboEdit
        Left = 8
        Top = 304
        Width = 321
        Height = 21
        TabStop = False
        Color = clYellow
        Enabled = True
        OwnesLButton = True
        OwnesLLabel = True
        LBtnAlignment = baLeft
        LBtnFlat = False
        LBtnDown = False
        LBtnGroupIndex = 0
        LBtnAllowAllUp = False
        LBtnGlyphKind = gkDots
        LBtnShortCut1 = 115
        LBtnShortCut2 = 40
        LBtnWidth = 25
        LLblAlignment = laTop
        LLblCaption = #1054#1087#1080#1089#1072#1085#1080#1077
        LLblWidth = 95
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
        TabOrder = 14
        Text = 'p_Spravka'
        Visible = True
        LocateKey = False
        AutoTabControl = True
      end
      object p_Entity_Type: TcitDBComboEdit
        Left = 102
        Top = 1
        Width = 226
        Height = 21
        Color = clYellow
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
        LLblCaption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        LLblWidth = 95
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
        Required = True
        TabOrder = 0
        Visible = True
        DataSet = quEntityType
        LocateKey = False
        KeyField = 'code'
        TextField = 'Name'
        OnSelectOk = p_Entity_TypeSelectOk
        EditStyle = edCombo
        AutoTabControl = True
      end
      object p_response_dept_id: TcitDBComboEdit
        Left = 102
        Top = 207
        Width = 226
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
        LLblCaption = #1062#1060#1054
        LLblWidth = 95
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
        Required = True
        TabOrder = 6
        Text = 'p_response_dept_id'
        Visible = True
        LocateKey = False
        KeyField = 'id'
        TextField = 'Name'
        EntityCode = 'D_RESPONSE_DEPT'
        EditStyle = edSelect
        AutoTabControl = True
      end
      object p_activity_type_id: TcitDBComboEdit
        Left = 102
        Top = 236
        Width = 226
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
        LLblCaption = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085
        LLblWidth = 95
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
        Required = True
        TabOrder = 7
        Text = 'p_activity_type_id'
        Visible = True
        LocateKey = False
        KeyField = 'id'
        TextField = 'Name'
        EntityCode = 'D_ACTIVITY_TYPE'
        EditStyle = edSelect
        AutoTabControl = True
      end
      object p_VidrashodNo: TcitDBComboEdit
        Left = 102
        Top = 264
        Width = 226
        Height = 21
        Color = clYellow
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
        LLblCaption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093
        LLblWidth = 95
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
        Required = True
        TabOrder = 8
        Text = 'p_VidrashodNo'
        Visible = True
        LocateKey = False
        EntityCode = 'VIDRASHOD'
        EntityName = 'VIDRASHOD'
        EditStyle = edSelect
        AutoTabControl = True
      end
      object p_Rate: TcitDBComboEdit
        Left = 511
        Top = 31
        Width = 79
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
        LLblCaption = #1050#1091#1088#1089' '#1074#1072#1083#1102#1090#1099' '#1087#1083#1072#1090#1077#1078#1072
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
        Required = True
        TabOrder = 10
        Text = 'p_Rate'
        Visible = True
        OnChange = p_RateChange
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object p_l_code: TcitDBComboEdit
        Left = 481
        Top = -1
        Width = 110
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
        LLblCaption = #1042#1072#1083#1102#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
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
        LLblRequiredFont.Style = [fsBold]
        Required = True
        TabOrder = 9
        Text = 'p_l_code'
        Visible = True
        OnChange = p_l_codeChange
        OnExit = p_l_codeExit
        DataSet = qu_D_Currency
        KeyFieldValue = 'USD'
        LocateKey = False
        KeyField = 'l_code'
        TextField = 'Name'
        EditStyle = edCombo
        AutoTabControl = True
      end
      object p_CurrencyAccounting: TcitDBComboEdit
        Left = 480
        Top = 60
        Width = 110
        Height = 21
        Enabled = False
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
        LLblCaption = #1042#1072#1083#1102#1090#1072' '#1091#1095#1077#1090#1072
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
        LLblRequiredFont.Style = [fsBold]
        Required = True
        ReadOnly = True
        TabOrder = 11
        Text = 'p_CurrencyAccounting'
        Visible = True
        DataSet = qu_D_Currency
        LocateKey = False
        KeyField = 'l_code'
        TextField = 'Name'
        EditStyle = edCombo
        AutoTabControl = True
      end
      object p_RateCurrencyAccounting: TcitDBComboEdit
        Left = 511
        Top = 90
        Width = 79
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
        LLblCaption = #1050#1091#1088#1089' '#1074#1072#1083#1102#1090#1099' '#1091#1095#1077#1090#1072
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
        Required = True
        TabOrder = 12
        Text = 'p_RateCurrencyAccounting'
        Visible = True
        OnChange = p_RateCurrencyAccountingChange
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object p_SummaCurrencyAccounting: TcitDBComboEdit
        Left = 511
        Top = 121
        Width = 78
        Height = 21
        Enabled = False
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
        LLblCaption = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083#1102#1090#1077' '#1091#1095#1077#1090#1072
        LLblWidth = 135
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
        Required = True
        TabOrder = 13
        Text = 'p_SummaCurrencyAccounting'
        Visible = True
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object p_SotrudNo: TcitDBComboEdit
        Left = 469
        Top = 150
        Width = 120
        Height = 21
        Color = clYellow
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
        LLblCaption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        LLblWidth = 95
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
        TabOrder = 15
        Text = 'p_SotrudNo'
        Visible = True
        LocateKey = False
        EntityCode = 'SOTRUD'
        EditStyle = edSelect
        AutoTabControl = True
      end
      object p_TipPlat: TcitDBComboEdit
        Left = 469
        Top = 180
        Width = 119
        Height = 21
        Color = clYellow
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
        LLblCaption = #1058#1080#1087
        LLblWidth = 95
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
        TabOrder = 16
        Text = 'p_TipPlat'
        Visible = True
        DataSet = quPlatType
        LocateKey = False
        KeyField = 'ID'
        TextField = 'Name'
        EditStyle = edCombo
        AutoTabControl = True
      end
      object p_bank_invoice_id: TcitDBComboEdit
        Left = 469
        Top = 209
        Width = 118
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
        LLblCaption = #1041#1072#1085#1082'-'#1080#1081' '#1089#1095#1077#1090
        LLblWidth = 95
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
        TabOrder = 17
        Text = 'Bank_Name'
        Visible = True
        DataSet = quBankInvoice
        KeyFieldValue = '1'
        LocateKey = False
        KeyField = 'ID'
        TextField = 'Bank_Name'
        EditStyle = edCombo
        AutoTabControl = True
      end
      object p_is_econom: TcitDBComboEdit
        Left = 469
        Top = 238
        Width = 117
        Height = 21
        Color = clYellow
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
        LLblCaption = #1059#1095#1077#1090
        LLblWidth = 95
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
        TabOrder = 18
        Text = 'p_is_econom'
        Visible = True
        DataSet = qu_econom
        KeyFieldValue = '1'
        LocateKey = False
        KeyField = 'id'
        TextField = 'name'
        EditStyle = edCombo
        AutoTabControl = True
      end
      object p_our_firmNo: TcitDBComboEdit
        Left = 468
        Top = 270
        Width = 118
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
        LLblCaption = #1053#1072#1096#1072' '#1092#1080#1088#1084#1072
        LLblWidth = 95
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
        Required = True
        TabOrder = 19
        Visible = True
        DataSet = quOurFirm
        LocateKey = False
        KeyField = 'PostNo'
        TextField = 'Name'
        EditStyle = edCombo
        AutoTabControl = True
      end
      object GroupBox4: TGroupBox
        Left = 628
        Top = 3
        Width = 313
        Height = 113
        Caption = #1055#1086#1076#1087#1080#1089#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 20
        object DBGridEhSignature: TDBGridEh
          Left = 2
          Top = 15
          Width = 309
          Height = 96
          Align = alClient
          DataSource = dsListUserForVidDoc
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGridEhSignatureDrawColumnCell
          OnGetCellParams = DBGridEhSignatureGetCellParams
        end
      end
      object cbIsDocSignature: TCheckBox
        Left = 951
        Top = 16
        Width = 97
        Height = 17
        Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100
        TabOrder = 21
        OnClick = cbIsDocSignatureClick
      end
      object p_OtdelNo: TcitDBComboEdit
        Left = 102
        Top = 181
        Width = 226
        Height = 21
        Color = clYellow
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
        LLblCaption = #1054#1090#1076#1077#1083
        LLblWidth = 95
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
        Required = True
        TabOrder = 22
        Text = 'p_OtdelNo'
        Visible = True
        LocateKey = False
        EntityCode = 'VIDOTDEL'
        EntityName = 'VIDOTDEL'
        OnSelectOk = p_OtdelNoSelectOk
        EditStyle = edSelect
        AutoTabControl = True
      end
      object GroupBox1: TGroupBox
        Left = 628
        Top = 124
        Width = 189
        Height = 113
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 23
        object DBGridEhDocControl: TDBGridEh
          Left = 2
          Top = 15
          Width = 185
          Height = 96
          Align = alClient
          DataSource = dsListUserForControlDoc
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGridEhDocControlDrawColumnCell
          OnGetCellParams = DBGridEhDocControlGetCellParams
        end
      end
      object cbIsDocControl: TCheckBox
        Left = 831
        Top = 136
        Width = 97
        Height = 17
        Caption = #1050#1086#1085#1090#1088#1086#1083#1100
        TabOrder = 24
        OnClick = cbIsDocControlClick
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 24
    Width = 1165
    Height = 89
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 13
      Top = 9
      Width = 91
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object Label2: TLabel
      Left = 12
      Top = 27
      Width = 77
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
    end
    object Label3: TLabel
      Left = 13
      Top = 45
      Width = 65
      Height = 13
      Caption = #1058#1080#1087' '#1087#1083#1072#1090#1077#1078#1072
    end
    object Label4: TLabel
      Left = 14
      Top = 63
      Width = 37
      Height = 13
      Caption = #1057#1086#1079#1076#1072#1083
    end
    object DBText1: TDBText
      Left = 107
      Top = 9
      Width = 65
      Height = 17
      DataField = 'PlatNo'
      DataSource = dsV_DocPlatHead
    end
    object DBText2: TDBText
      Left = 104
      Top = 27
      Width = 57
      Height = 17
      DataField = 'DocDate'
      DataSource = dsV_DocPlatHead
    end
    object DBText3: TDBText
      Left = 104
      Top = 45
      Width = 129
      Height = 17
      DataField = 'EntityName'
      DataSource = dsV_DocPlatHead
    end
    object DBText4: TDBText
      Left = 62
      Top = 64
      Width = 171
      Height = 17
      DataField = 'UserName'
      DataSource = dsV_DocPlatHead
    end
  end
  inherited ButtonOK: TButton [3]
    Left = 930
    Top = 549
    TabOrder = 3
  end
  inherited ButtonCancel: TButton [4]
    Left = 1010
    Top = 549
    TabOrder = 4
  end
  inherited ButtonApply: TButton [5]
    Left = 1090
    Top = 549
    TabOrder = 5
  end
  object bbConductingDoc: TBitBtn [6]
    Left = 8
    Top = 549
    Width = 137
    Height = 25
    Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
    ModalResult = 1
    TabOrder = 6
    OnClick = bbConductingDocClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
      44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
      00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
      33833F333383F33300003333AA463362A433333333383F333833F33300003333
      6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
      33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
      6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
      000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
      333383333333F3330000333333322AAA4333333333333833333F333300003333
      333322A4333333333333338333F333330000333333344A433333333333333338
      3F333333000033333336A24333333333333333833F333333000033333336AA43
      33333333333333833F3333330000333333336663333333333333333888333333
      0000}
    NumGlyphs = 2
  end
  inherited ActionList: TActionList
    Left = 1112
    Top = 49
  end
  inherited quAddBegParam: TMSQuery
    SQL.Strings = (
      'declare '
      '@l_DatePlat smallDateTime'
      ',@l_Entity_type char(5)'
      ',@l_nom int'
      ',@l_table_key bigint'
      ''
      'set @l_DatePlat= :p_date_plat'
      'set @l_Entity_type= :p_Entity_type'
      'set @l_table_key = :table_key'
      'set @l_nom = :nom'
      ''
      'if @l_table_key>0 '
      '  select '
      '   isnull(@l_Entity_type,v.Entity_type) as  p_Entity_type_key'
      
        '  ,isnull((select max(name) from d_entity_type where code=@l_Ent' +
        'ity_type),v.Entity_type_Name) as  p_Entity_type_txt'
      '  ,@l_nom as p_Nom_txt'
      '  ,@l_nom as p_nom_key'
      '  ,isnull(v.buhName,'#39#1050#1072#1089#1089#1072#39') as p_Buh_txt'
      '  ,isnull(v.buh,1) as p_Buh_key'
      '  ,v.PostName as p_PostNo_txt'
      '  ,v.PostNo as p_PostNo_key'
      '  ,Convert(char,v.DateEntity,104) as p_DatePlat_txt'
      '  ,Convert(char,v.DateEntity,104) as p_DatePlat_key'
      '  ,:Summa as p_Summa_txt'
      '  ,:Summa as p_Summa_key'
      '  ,v.SotrudName as p_SotrudNo_txt'
      '  ,v.SotrudNo as p_SotrudNo_key'
      '  ,isnull(v.TipName,'#39#1055#1083#1072#1090#1077#1078#39') as p_TipPlat_txt'
      '  ,isnull(v.Tip,1) p_TipPlat_key'
      '  ,v.Activity_Type_Name as p_activity_type_id_txt'
      '  ,v.Activity_Type_id as p_activity_type_id_key'
      '  ,v.Response_dept_id as p_response_dept_id_key'
      '  ,v.Response_dept_name as p_response_dept_id_txt'
      '  ,v.Bank_name as p_Bank_invoice_id_txt'
      '  ,v.Bank_invoice_id as p_Bank_invoice_id_key'
      '  ,v.VidName as p_VidrashodNo_txt'
      '  ,v.VidNo as p_VidrashodNo_key'
      '  ,v.Description p_Spravka_txt'
      '  ,v.Description p_Spravka_key'
      '  ,v.OtdelName as p_otdelNo_txt'
      '  ,v.OtdelNo as p_otdelNo_key'
      
        '  ,case when v.is_econom = 1 then 1 else 0 end as p_is_econom_ke' +
        'y'
      
        '  ,case when v.is_econom = 1 then '#39#1044#1040#39'  else '#39#1053#1045#1058#39' end as p_is_e' +
        'conom_txt'
      '  ,OurFirmName as p_our_firmNo_txt'
      '  ,OurFirmNo as p_our_firmNo_key'
      '  ,CurrencyHead as p_l_code_key'
      '  ,CurrencyHeadName as p_l_code_txt'
      '  ,:Rate as p_Rate_txt'
      '  ,:Rate as p_Rate_key'
      
        '  ,isnull (CurrencyAccountingName,(select c.Name from D_CURRENCY' +
        ' c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsAc' +
        'tive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0)) as p_Curre' +
        'ncyAccounting_txt'
      
        '  ,isnull (CurrencyAccounting,(select c.l_code from D_CURRENCY c' +
        ' inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActi' +
        've = 1 and ce.CurrencyId = c.ID and c.isTrash = 0)) as p_Currenc' +
        'yAccounting_key'
      
        '  ,isnull (RateCurrencyAccounting,(select ce.Rate from D_CURRENC' +
        'Y c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsA' +
        'ctive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0)) as p_Rate' +
        'CurrencyAccounting_txt'
      
        '  ,isnull (RateCurrencyAccounting,(select ce.Rate from D_CURRENC' +
        'Y c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsA' +
        'ctive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0)) as p_Rate' +
        'CurrencyAccounting_key'
      ''
      
        '  ,isnull (SummaCurrencyAccounting,round(v.Summa*Rate/isnull(Rat' +
        'eCurrencyAccounting,(select ce.Rate from D_CURRENCY c inner join' +
        ' CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ' +
        'ce.CurrencyId = c.ID and c.isTrash = 0)),2)) as p_SummaCurrencyA' +
        'ccounting_txt'
      
        '  ,isnull (SummaCurrencyAccounting,round(v.Summa*Rate/isnull(Rat' +
        'eCurrencyAccounting,(select ce.Rate from D_CURRENCY c inner join' +
        ' CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ' +
        'ce.CurrencyId = c.ID and c.isTrash = 0)),2)) as p_SummaCurrencyA' +
        'ccounting_key'
      ''
      '  from V_List_entity_Doc v'
      '  where v.table_key= @l_table_key '
      'else'
      'select '
      ' null as  p_Entity_type_key'
      ',null as  p_Entity_type_txt'
      ',@l_nom as p_Nom_txt'
      ',@l_nom as p_nom_key'
      ','#39#1050#1072#1089#1089#1072#39' as p_Buh_txt'
      ',1 as p_Buh_key'
      ',null as p_PostNo_txt'
      ',null as p_PostNo_key'
      ',Convert(char,@l_DatePlat,104) as p_DatePlat_txt'
      ',Convert(char,@l_DatePlat,104) as p_DatePlat_key'
      ',0 as p_Summa_txt'
      ',0 as p_Summa_key'
      ',null as p_SotrudNo_txt'
      ',null as p_SotrudNo_key'
      ','#39#1055#1083#1072#1090#1077#1078#39' as p_TipPlat_txt'
      ',1 as p_TipPlat_key'
      ',null as p_activity_type_id_txt'
      ',null as p_activity_type_id_key'
      ',null as p_Bank_invoice_id_txt'
      ',null as p_Bank_invoice_id_key'
      ',null as p_VidrashodNo_txt'
      ',null as p_VidrashodNo_key'
      ',null as p_OtdelNo_txt'
      ',null as p_OtdelNo_key'
      ',null as p_Spravka_txt'
      ',null as p_Spravka_key'
      ',null as p_our_firmNo_txt'
      ',null as p_our_firmNo_key'
      ',null as p_is_econom_txt'
      ',null as p_is_econom_key'
      ',null as p_response_dept_id_key'
      ',null as p_response_dept_id_txt'
      ',null as p_CurrencyHead_key'
      ',null as p_CurrencyHead_txt'
      ',0 as p_Rate_txt'
      ',0 as p_Rate_key'
      
        ',(select c.Name from D_CURRENCY c inner join CurrencyExchange ce' +
        ' on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.ID' +
        ' and c.isTrash = 0) as p_CurrencyAccounting_txt'
      
        ',(select c.l_code from D_CURRENCY c inner join CurrencyExchange ' +
        'ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.' +
        'ID and c.isTrash = 0) as p_CurrencyAccounting_key'
      ''
      
        ',(select ce.Rate from D_CURRENCY c inner join CurrencyExchange c' +
        'e on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.I' +
        'D and c.isTrash = 0) as p_RateCurrencyAccounting_txt'
      
        ',(select ce.Rate from D_CURRENCY c inner join CurrencyExchange c' +
        'e on c.IsDefault = 1 and ce.IsActive = 1 and ce.CurrencyId = c.I' +
        'D and c.isTrash = 0) as p_RateCurrencyAccounting_key'
      ''
      ',0 as p_SummaCurrencyAccounting_txt'
      ',0 as p_SummaCurrencyAccounting_key')
    FetchRows = 1
    BeforeOpen = quAddBegParamBeforeOpen
    Left = 8
    Top = 496
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'p_date_plat'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_Entity_type'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'table_key'
      end
      item
        DataType = ftUnknown
        Name = 'nom'
      end
      item
        DataType = ftUnknown
        Name = 'Summa'
      end
      item
        DataType = ftUnknown
        Name = 'Summa'
      end
      item
        DataType = ftUnknown
        Name = 'Rate'
      end
      item
        DataType = ftUnknown
        Name = 'Rate'
      end>
  end
  inherited quUpdBegParam: TMSQuery
    SQL.Strings = (
      'select '
      ' v.Entity_type as  p_Entity_type_key'
      ',v.Entity_type_Name as  p_Entity_type_txt'
      ',v.nom as p_Nom_txt'
      ',v.nom as p_nom_key'
      ',v.buhName as p_Buh_txt'
      ',v.buh as p_Buh_key'
      ',v.PostName as p_PostNo_txt'
      ',v.PostNo as p_PostNo_key'
      ',Convert(char,v.DateEntity,104) as p_DatePlat_txt'
      ',Convert(char,v.DateEntity,104) as p_DatePlat_key'
      ',v.Summa as p_Summa_txt'
      ',v.Summa as p_Summa_key'
      ',v.SotrudName as p_SotrudNo_txt'
      ',v.SotrudNo as p_SotrudNo_key'
      ',isnull(v.TipName,'#39#1055#1083#1072#1090#1077#1078#39') as p_TipPlat_txt'
      ',isnull(v.Tip,1) as p_TipPlat_key'
      ',v.Activity_Type_Name as p_activity_type_id_txt'
      ',v.Activity_Type_id as p_activity_type_id_key'
      ',v.Response_dept_id as p_response_dept_id_key'
      ',v.Response_dept_name as p_response_dept_id_txt'
      ',v.Bank_name as p_Bank_invoice_id_txt'
      ',v.Bank_invoice_id as p_Bank_invoice_id_key'
      ',v.VidName as p_VidrashodNo_txt'
      ',v.VidNo as p_VidrashodNo_key'
      ',v.Description p_Spravka_txt'
      ',v.Description p_Spravka_key'
      ',v.OtdelName as p_otdelNo_txt'
      ',v.OtdelNo as p_otdelNo_key'
      ',case when v.is_econom = 1 then 1 else 0 end as p_is_econom_key'
      
        ',case when v.is_econom = 1 then '#39#1044#1040#39' else '#39#1053#1045#1058#39' end as p_is_econ' +
        'om_txt'
      ',OurFirmName as p_our_firmNo_txt'
      ',OurFirmNo as p_our_firmNo_key'
      ',CurrencyHead as p_l_code_key'
      ',CurrencyHeadName as p_l_code_txt'
      ',Rate as p_Rate_txt'
      ',Rate as p_Rate_key'
      
        ',isnull (CurrencyAccountingName,(select c.Name from D_CURRENCY c' +
        ' inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActi' +
        've = 1 and ce.CurrencyId = c.ID and c.isTrash = 0)) as p_Currenc' +
        'yAccounting_txt'
      
        ',isnull (CurrencyAccounting,(select c.l_code from D_CURRENCY c i' +
        'nner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive' +
        ' = 1 and ce.CurrencyId = c.ID and c.isTrash = 0)) as p_CurrencyA' +
        'ccounting_key'
      
        ',isnull (RateCurrencyAccounting,(select ce.Rate from D_CURRENCY ' +
        'c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsAct' +
        'ive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0)) as p_RateCu' +
        'rrencyAccounting_txt'
      
        ',isnull (RateCurrencyAccounting,(select ce.Rate from D_CURRENCY ' +
        'c inner join CurrencyExchange ce on c.IsDefault = 1 and ce.IsAct' +
        'ive = 1 and ce.CurrencyId = c.ID and c.isTrash = 0)) as p_RateCu' +
        'rrencyAccounting_key'
      
        ',isnull (SummaCurrencyAccounting,round(v.Summa*Rate/isnull(RateC' +
        'urrencyAccounting,(select ce.Rate from D_CURRENCY c inner join C' +
        'urrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce' +
        '.CurrencyId = c.ID and c.isTrash = 0)),2)) as p_SummaCurrencyAcc' +
        'ounting_txt'
      
        ',isnull (SummaCurrencyAccounting,round(v.Summa*Rate/isnull(RateC' +
        'urrencyAccounting,(select ce.Rate from D_CURRENCY c inner join C' +
        'urrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce' +
        '.CurrencyId = c.ID and c.isTrash = 0)),2)) as p_SummaCurrencyAcc' +
        'ounting_key'
      'from V_List_entity_Doc v'
      'where v.table_key= :table_key')
    BeforeOpen = quUpdBegParamBeforeOpen
    Left = 40
    Top = 496
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'table_key'
      end>
  end
  inherited spUpd: TMSStoredProc
    StoredProcName = 'sp_EditEntityDoc;1'
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditEntityDoc;1(:p_Entity_type, :p_Nom,' +
        ' :p_PostNo, :p_PostNoFirst, :p_DatePlat, :p_Summa, :p_Buh, :p_Sp' +
        'ravka, :p_TipPlat, :p_UserNo, :p_SotrudNo, :p_bank_invoice_id, :' +
        'p_activity_type_id, :p_response_dept_id, :p_VidRashodNo, :p_Otde' +
        'lNo, :p_our_firmNo, :p_is_econom, :p_Pkey, :p_l_code, :p_Rate, :' +
        'p_CurrencyAccounting, :p_RateCurrencyAccounting, :p_SummaCurrenc' +
        'yAccounting)}')
    Left = 80
    Top = 465
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'p_Entity_type'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftInteger
        Name = 'p_Nom'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_PostNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_PostNoFirst'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'p_DatePlat'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_Summa'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_Buh'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_Spravka'
        ParamType = ptInput
        Size = 200
      end
      item
        DataType = ftSmallint
        Name = 'p_TipPlat'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_UserNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_SotrudNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_bank_invoice_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_activity_type_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_response_dept_id'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_VidRashodNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_OtdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_our_firmNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_is_econom'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'p_Pkey'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_l_code'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftFloat
        Name = 'p_Rate'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_CurrencyAccounting'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftFloat
        Name = 'p_RateCurrencyAccounting'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_SummaCurrencyAccounting'
        ParamType = ptInput
      end>
  end
  inherited spAdd: TMSStoredProc
    StoredProcName = 'sp_AddEntityDoc;1'
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_AddEntityDoc;1(:p_Entity_type, :p_Nom, ' +
        ':p_PostNo, :p_PostNoFirst, :p_DatePlat, :p_Summa, :p_Buh, :p_Spr' +
        'avka, :p_TipPlat, :p_UserNo, :p_SotrudNo, :p_bank_invoice_id, :p' +
        '_activity_type_id, :p_response_dept_id, :p_VidRashodNo, :p_Otdel' +
        'No, :p_our_firmNo, :p_is_econom, :p_l_code, :p_Rate, :p_Currency' +
        'Accounting, :p_RateCurrencyAccounting, :p_SummaCurrencyAccountin' +
        'g, :p_Pkey)}')
    AfterPost = spAddAfterPost
    Left = 112
    Top = 465
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'p_Entity_type'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftInteger
        Name = 'p_Nom'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_PostNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_PostNoFirst'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'p_DatePlat'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_Summa'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_Buh'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_Spravka'
        ParamType = ptInput
        Size = 200
      end
      item
        DataType = ftSmallint
        Name = 'p_TipPlat'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_UserNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_SotrudNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_bank_invoice_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_activity_type_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_response_dept_id'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_VidRashodNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_OtdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_our_firmNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_is_econom'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_l_code'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftFloat
        Name = 'p_Rate'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_CurrencyAccounting'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftFloat
        Name = 'p_RateCurrencyAccounting'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_SummaCurrencyAccounting'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'p_Pkey'
        ParamType = ptInputOutput
      end>
  end
  object quBuh: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_buh_type')
    Left = 80
    Top = 200
    object quBuhbuh: TSmallintField
      FieldName = 'buh'
    end
    object quBuhBuh_type_name: TStringField
      FieldName = 'Buh_type_name'
    end
  end
  object quPlatType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_plat_type')
    Left = 440
    Top = 312
    object quPlatTypeID: TSmallintField
      FieldName = 'ID'
      ReadOnly = True
    end
    object quPlatTypeName: TStringField
      DisplayWidth = 30
      FieldName = 'Name'
      Size = 512
    end
  end
  object quBankInvoice: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_bank_invoice')
    Left = 440
    Top = 344
    object quBankInvoiceid: TAutoIncField
      DisplayWidth = 1
      FieldName = 'id'
      ReadOnly = True
    end
    object quBankInvoiceinvoice_num: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 20
      FieldName = 'invoice_num'
    end
    object quBankInvoiceBank_Name: TStringField
      DisplayLabel = #1041#1072#1085#1082
      DisplayWidth = 20
      FieldName = 'Bank_Name'
      Size = 512
    end
    object quBankInvoiceDescription: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 20
      FieldName = 'Description'
      Size = 1024
    end
  end
  object qu_otdelNo: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from vidotdel order by OtdelName')
    Left = 72
    Top = 312
    object qu_otdelNoOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
      Visible = False
    end
    object qu_otdelNoOtdelName: TStringField
      DisplayWidth = 20
      FieldName = 'OtdelName'
      Size = 30
    end
  end
  object qu_econom: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select 0 as id, '#39#1053#1045#1058#39' as name'
      'union all'
      'select 1 as id, '#39#1044#1040#39' as name')
    Left = 440
    Top = 376
    object qu_economid: TIntegerField
      DisplayWidth = 3
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object qu_economname: TStringField
      DisplayWidth = 10
      FieldName = 'name'
      ReadOnly = True
      Size = 3
    end
  end
  object quOurFirm: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select p.name,p.PostNo '
      'from Post p,d_our_firm o'
      'where p.PostNo=o.PostNo')
    Left = 536
    Top = 400
    object quOurFirmname: TStringField
      FieldName = 'name'
      Origin = 'Post.name'
      Size = 10
    end
    object quOurFirmPostNo: TSmallintField
      FieldName = 'PostNo'
    end
  end
  object Seq_DocPlatR_Nom: TMSStoredProc
    StoredProcName = 'Seq_DocPlatR_Nom;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL Seq_DocPlatR_Nom;1(:id)}')
    Left = 40
    Top = 465
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInputOutput
        Value = 1
      end>
  end
  object Seq_DocPlatP_Nom: TMSStoredProc
    StoredProcName = 'Seq_DocPlatP_Nom;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL Seq_DocPlatP_Nom;1(:id)}')
    Left = 8
    Top = 465
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInputOutput
        Value = 3
      end>
  end
  object quEntityType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  code'
      '      , case when code = '#39'PLATP'#39' Then '#39#1055#1088#1080#1093#1086#1076' '#1076#1077#1085#1077#1075#39
      '             when code = '#39'PLATR'#39' Then '#39#1056#1072#1089#1093#1086#1076' '#1076#1077#1085#1077#1075#39' '
      '        end as Name '
      ' from d_entity_type where code in ('#39'PLATP'#39','#39'PLATR'#39')')
    Left = 72
    Top = 136
    object quEntityTypecode: TStringField
      DisplayWidth = 8
      FieldName = 'code'
      Size = 64
    end
    object quEntityTypeName: TStringField
      DisplayWidth = 40
      FieldName = 'Name'
      Size = 256
    end
  end
  object qu_D_Currency: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      '--select * from d_Currency'
      'select L_Code,Name from d_Currency')
    Left = 452
    Top = 139
    object qu_D_CurrencyName: TStringField
      DisplayWidth = 30
      FieldName = 'Name'
      Size = 100
    end
    object qu_D_CurrencyL_Code: TStringField
      DisplayWidth = 5
      FieldName = 'L_Code'
      Size = 3
    end
  end
  object quListUserForVidDoc: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      '      , Case when l.id is null then cast(0 as bit)'
      '        else cast(1 as bit) end as is_signature'
      ' from ListUserForVidDoc u left join'
      
        '      l_doc_signature l on l.UserNo = u.UserNo and l.IdVidDoc = ' +
        'u.IdVidDoc and l.DocId = :Id'
      '  where u.IdVidDoc = :IdVidDoc'
      '    and Active = 1')
    BeforeOpen = quListUserForVidDocBeforeOpen
    Left = 888
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id'
      end
      item
        DataType = ftUnknown
        Name = 'IdVidDoc'
      end>
    object quListUserForVidDocId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object quListUserForVidDocIdVidDoc: TIntegerField
      FieldName = 'IdVidDoc'
      Visible = False
    end
    object quListUserForVidDocOtdelNo: TIntegerField
      FieldName = 'OtdelNo'
      Visible = False
    end
    object quListUserForVidDocUserNo: TIntegerField
      FieldName = 'UserNo'
      Visible = False
    end
    object quListUserForVidDocActive: TBooleanField
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'Active'
      Visible = False
    end
    object quListUserForVidDocOtdel: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      FieldKind = fkLookup
      FieldName = 'Otdel'
      LookupDataSet = dmDataModule.quOtdel
      LookupKeyFields = 'OtdelNo'
      LookupResultField = 'OtdelName'
      KeyFields = 'OtdelNo'
      ReadOnly = True
      Lookup = True
    end
    object quListUserForVidDocUser: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'User'
      LookupDataSet = dmDataModule.quUsers
      LookupKeyFields = 'UserNo'
      LookupResultField = 'UserName'
      KeyFields = 'UserNo'
      ReadOnly = True
      Lookup = True
    end
    object quListUserForVidDocis_signature: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'is_signature'
      ReadOnly = True
    end
  end
  object dsListUserForVidDoc: TMSDataSource
    DataSet = quListUserForVidDoc
    Left = 912
    Top = 225
  end
  object dsV_DocPlatHead: TMSDataSource
    DataSet = quV_DocPlatHead
    Left = 1048
    Top = 40
  end
  object quV_DocPlatHead: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      '/*'
      'select  *'
      
        '      , (select Name from Post where PostNo = v.PostNo) as PostN' +
        'ame'
      
        '      , (select UserName from Users where UserNo = v.UserNo) as ' +
        'UserName'
      '      , case when v.EntityType = '#39'PLATR'#39' then '#39#1056#1072#1089#1093#1086#1076' '#1076#1077#1085#1077#1075#39
      '             when v.EntityType = '#39'PLATP'#39' then '#39#1055#1088#1080#1093#1086#1076' '#1076#1077#1085#1077#1075#39
      '        end as EntityName'
      ' from V_DocPlatHead v'
      '  where pkey = :pkey'
      '*/'
      ''
      'declare @pkey BigInt'
      ''
      'set @pkey = :pkey'
      ''
      'select *'
      
        '      , (select Name from Post where PostNo = u.PostNo) as PostN' +
        'ame'
      
        '      , (select UserName from Users where UserNo = u.UserNo) as ' +
        'UserName'
      '      , case when u.EntityType = '#39'PLATR'#39' then '#39#1056#1072#1089#1093#1086#1076' '#1076#1077#1085#1077#1075#39
      '             when u.EntityType = '#39'PLATP'#39' then '#39#1055#1088#1080#1093#1086#1076' '#1076#1077#1085#1077#1075#39
      '        end as EntityName'
      
        ' from (SELECT        PlatNo AS PlatNo, DocDate, '#39'PLATP'#39' AS Entit' +
        'yType, DatePlat, Summa, pkey as table_key, UserNo, SotrudNo, Pos' +
        'tNo, isnull(IsApp,0) as IsApp, NotSignatureOtdel'
      '        FROM            DocPlatP'
      '       UNION ALL'
      
        '       SELECT        PlatNo AS PlatNo, DocDate, '#39'PLATR'#39' AS Entit' +
        'yType, DatePlat, summa, pkey as table_key, UserNo, SotrudNo, Pos' +
        'tNo, isnull(IsApp,0) as IsApp, NotSignatureOtdel'
      '        FROM            DocPlatR) u'
      '  where u.table_key = @pkey')
    Left = 1016
    Top = 40
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'pkey'
      end>
    object quV_DocPlatHeadPlatNo: TIntegerField
      FieldName = 'PlatNo'
      ReadOnly = True
    end
    object quV_DocPlatHeadDocDate: TDateTimeField
      FieldName = 'DocDate'
      ReadOnly = True
    end
    object quV_DocPlatHeadEntityType: TStringField
      FieldName = 'EntityType'
      ReadOnly = True
      Size = 5
    end
    object quV_DocPlatHeadDatePlat: TDateTimeField
      FieldName = 'DatePlat'
      ReadOnly = True
    end
    object quV_DocPlatHeadSumma: TFloatField
      FieldName = 'Summa'
      ReadOnly = True
    end
    object quV_DocPlatHeadtable_key: TLargeintField
      FieldName = 'table_key'
      ReadOnly = True
    end
    object quV_DocPlatHeadUserNo: TSmallintField
      FieldName = 'UserNo'
      ReadOnly = True
    end
    object quV_DocPlatHeadSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
      ReadOnly = True
    end
    object quV_DocPlatHeadPostNo: TSmallintField
      FieldName = 'PostNo'
      ReadOnly = True
    end
    object quV_DocPlatHeadIsApp: TBooleanField
      FieldName = 'IsApp'
      ReadOnly = True
    end
    object quV_DocPlatHeadPostName: TStringField
      FieldName = 'PostName'
      ReadOnly = True
      Size = 30
    end
    object quV_DocPlatHeadUserName: TStringField
      FieldName = 'UserName'
      ReadOnly = True
    end
    object quV_DocPlatHeadEntityName: TStringField
      FieldName = 'EntityName'
      ReadOnly = True
      Size = 12
    end
    object quV_DocPlatHeadNotSignatureOtdel: TStringField
      FieldName = 'NotSignatureOtdel'
      ReadOnly = True
      Size = 256
    end
  end
  object quListUserForControlDoc: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      '     , Case when l.id is null then cast(0 as bit)'
      
        '                              else cast(1 as bit) end as is_cont' +
        'rol'
      ' from ListUserForControlDoc u left join'
      
        '      l_doc_control l on l.UserNo = u.UserNo and l.IdVidDoc = u.' +
        'IdVidDoc and l.DocId = :Id'
      '  where u.IdVidDoc = :IdVidDoc'
      '    and Active = 1')
    BeforeOpen = quListUserForControlDocBeforeOpen
    Left = 888
    Top = 338
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id'
      end
      item
        DataType = ftUnknown
        Name = 'IdVidDoc'
      end>
    object quListUserForControlDocUser: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'User'
      LookupDataSet = dmDataModule.quUsers
      LookupKeyFields = 'UserNo'
      LookupResultField = 'UserName'
      KeyFields = 'UserNo'
      ReadOnly = True
      Lookup = True
    end
    object quListUserForControlDocis_control: TBooleanField
      Alignment = taCenter
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'is_control'
      ReadOnly = True
    end
    object quListUserForControlDocId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object quListUserForControlDocIdVidDoc: TIntegerField
      FieldName = 'IdVidDoc'
      Visible = False
    end
    object quListUserForControlDocUserNo: TIntegerField
      FieldName = 'UserNo'
      Visible = False
    end
    object quListUserForControlDocActive: TBooleanField
      FieldName = 'Active'
      Visible = False
    end
    object quListUserForControlDocid_1: TIntegerField
      FieldName = 'id_1'
      ReadOnly = True
      Visible = False
    end
    object quListUserForControlDocUserNo_1: TIntegerField
      FieldName = 'UserNo_1'
      Visible = False
    end
    object quListUserForControlDocDocId: TIntegerField
      FieldName = 'DocId'
      Visible = False
    end
    object quListUserForControlDocIdVidDoc_1: TIntegerField
      FieldName = 'IdVidDoc_1'
      Visible = False
    end
  end
  object dsListUserForControlDoc: TMSDataSource
    DataSet = quListUserForControlDoc
    Left = 912
    Top = 338
  end
end
