inherited MlekoPropPlatRDlg: TMlekoPropPlatRDlg
  Left = 779
  Top = 191
  Caption = #1056#1072#1089#1093#1086#1076' '#1076#1077#1085#1077#1075
  ClientHeight = 554
  ClientWidth = 392
  DesignSize = (
    392
    554)
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TToolBar [0]
    Width = 392
    TabOrder = 0
  end
  inherited ButtonOK: TButton [1]
    Left = 157
    Top = 531
    TabOrder = 2
  end
  inherited ButtonCancel: TButton [2]
    Left = 237
    Top = 531
    TabOrder = 3
  end
  inherited ButtonApply: TButton [3]
    Left = 317
    Top = 531
    TabOrder = 4
  end
  inherited PageControl: TPageControl [4]
    Top = 3
    Width = 392
    Height = 526
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
        Left = 14
        Top = 469
        Width = 321
        Height = 21
        TabStop = False
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
        TabOrder = 15
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
        TabOrder = 7
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
        TabOrder = 8
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
        TabOrder = 9
        Text = 'p_VidrashodNo'
        Visible = True
        LocateKey = False
        EntityCode = 'VIDRASHOD'
        EntityName = 'VIDRASHOD'
        EditStyle = edSelect
        AutoTabControl = True
      end
      object p_OtdelNo: TcitDBComboEdit
        Left = 102
        Top = 180
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
        TabOrder = 6
        Text = 'p_OtdelNo'
        Visible = True
        DataSet = qu_otdelNo
        KeyFieldValue = '1'
        LocateKey = False
        KeyField = 'OtdelNo'
        TextField = 'OtdelName'
        OnSelectOk = p_OtdelNoSelectOk
        EditStyle = edCombo
        AutoTabControl = True
      end
      object p_Rate: TcitDBComboEdit
        Left = 135
        Top = 335
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
        TabOrder = 11
        Text = 'p_Rate'
        Visible = True
        OnChange = p_RateChange
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object p_l_code: TcitDBComboEdit
        Left = 104
        Top = 303
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
        TabOrder = 10
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
        Left = 104
        Top = 367
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
        TabOrder = 12
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
        Left = 137
        Top = 395
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
        TabOrder = 13
        Text = 'p_RateCurrencyAccounting'
        Visible = True
        OnChange = p_RateCurrencyAccountingChange
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
      object p_SummaCurrencyAccounting: TcitDBComboEdit
        Left = 139
        Top = 425
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
        TabOrder = 14
        Text = 'p_SummaCurrencyAccounting'
        Visible = True
        LocateKey = False
        EditStyle = edCalc
        AutoTabControl = True
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      ImageIndex = 1
      object p_SotrudNo: TcitDBComboEdit
        Left = 102
        Top = 1
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
        TabOrder = 0
        Text = 'p_SotrudNo'
        Visible = True
        LocateKey = False
        EntityCode = 'SOTRUD'
        EditStyle = edSelect
        AutoTabControl = True
      end
      object p_TipPlat: TcitDBComboEdit
        Left = 102
        Top = 36
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
        TabOrder = 1
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
        Left = 102
        Top = 72
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
        TabOrder = 2
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
      object p_our_firmNo: TcitDBComboEdit
        Left = 102
        Top = 142
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
        TabOrder = 4
        Visible = True
        DataSet = quOurFirm
        LocateKey = False
        KeyField = 'PostNo'
        TextField = 'Name'
        EditStyle = edCombo
        AutoTabControl = True
      end
      object p_is_econom: TcitDBComboEdit
        Left = 102
        Top = 107
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
        TabOrder = 3
        Text = 'p_OtdelNo'
        Visible = True
        DataSet = qu_econom
        KeyFieldValue = '1'
        LocateKey = False
        KeyField = 'id'
        TextField = 'name'
        EditStyle = edCombo
        AutoTabControl = True
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072
      ImageIndex = 2
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 111
        Height = 13
        Caption = #1055#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
      end
      object Label2: TLabel
        Left = 8
        Top = 40
        Width = 121
        Height = 13
        Caption = #1055#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1072#1103' '#1089#1091#1084#1084#1072
      end
      object Label3: TLabel
        Left = 8
        Top = 64
        Width = 178
        Height = 13
        Caption = #1055#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1072#1103' '#1089#1074#1086#1073#1086#1076#1085#1072#1103' '#1089#1091#1084#1084#1072
      end
      object DBText1: TDBText
        Left = 200
        Top = 64
        Width = 89
        Height = 17
        DataField = 'FreeSummaLoad'
        DataSource = dsLoad
      end
      object DBText2: TDBText
        Left = 200
        Top = 40
        Width = 65
        Height = 17
        DataField = 'SummaLoad'
        DataSource = dsLoad
      end
      object DBText3: TDBText
        Left = 200
        Top = 16
        Width = 65
        Height = 17
        DataField = 'DataLoad'
        DataSource = dsLoad
      end
      object Label4: TLabel
        Left = 8
        Top = 88
        Width = 164
        Height = 13
        Caption = #1055#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1090#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
      object DBText4: TDBText
        Left = 200
        Top = 88
        Width = 65
        Height = 17
        DataField = 'EntityTypeLoad'
        DataSource = dsLoad
      end
      object DBText5: TDBText
        Left = 200
        Top = 112
        Width = 201
        Height = 17
        DataField = 'AddressLoad'
        DataSource = dsLoad
      end
      object Label5: TLabel
        Left = 8
        Top = 112
        Width = 177
        Height = 13
        Caption = #1055#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1072#1076#1088#1077#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
      object Label6: TLabel
        Left = 8
        Top = 139
        Width = 120
        Height = 13
        Caption = #1055#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1085#1072#1073#1086#1088
      end
      object DBText6: TDBText
        Left = 200
        Top = 139
        Width = 201
        Height = 17
        DataField = 'GroupName'
        DataSource = dsLoad
      end
      object DBText7: TDBText
        Left = 201
        Top = 161
        Width = 201
        Height = 17
        DataField = 'DayDeley'
        DataSource = dsLoad
      end
      object Label7: TLabel
        Left = 9
        Top = 161
        Width = 134
        Height = 13
        Caption = #1055#1077#1088#1074#1086#1085#1072#1095#1072#1083#1100#1085#1072#1103' '#1086#1090#1089#1088#1086#1095#1082#1072
      end
    end
  end
  inherited ActionList: TActionList
    Left = 248
    Top = 57
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
      '  ,v.buhName as p_Buh_txt'
      '  ,v.buh as p_Buh_key'
      '  ,v.PostName as p_PostNo_txt'
      '  ,v.PostNo as p_PostNo_key'
      '  ,Convert(char,v.DateEntity,104) as p_DatePlat_txt'
      '  ,Convert(char,v.DateEntity,104) as p_DatePlat_key'
      '  ,:Summa as p_Summa_txt'
      '  ,:Summa as p_Summa_key'
      '  ,v.SotrudName as p_SotrudNo_txt'
      '  ,v.SotrudNo as p_SotrudNo_key'
      '  ,v.TipName as p_TipPlat_txt'
      '  ,v.Tip p_TipPlat_key'
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
      '  ,case when v.is_econom =1 then 1 else 0 end as p_is_econom_key'
      '  ,case when v.is_econom=1 then '#39#1044#1040#39
      '  else '#39#1053#1045#1058#39' end as p_is_econom_txt'
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
      '  from v_list_entity v'
      '  where v.table_key= @l_table_key '
      'else'
      'select '
      ' null as  p_Entity_type_key'
      ',null as  p_Entity_type_txt'
      ',@l_nom as p_Nom_txt'
      ',@l_nom as p_nom_key'
      ',null as p_Buh_txt'
      ',null as p_Buh_key'
      ',null as p_PostNo_txt'
      ',null as p_PostNo_key'
      ',Convert(char,@l_DatePlat,104) as p_DatePlat_txt'
      ',Convert(char,@l_DatePlat,104) as p_DatePlat_key'
      ',0 as p_Summa_txt'
      ',0 as p_Summa_key'
      ',null as p_SotrudNo_txt'
      ',null as p_SotrudNo_key'
      ',null as p_TipPlat_txt'
      ',null as p_TipPlat_key'
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
    Left = 56
    Top = 64
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
      ',v.TipName as p_TipPlat_txt'
      ',v.Tip p_TipPlat_key'
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
      ',case when v.is_econom =1 then 1 else 0 end as p_is_econom_key'
      ',case when v.is_econom=1 then '#39#1044#1040#39
      'else '#39#1053#1045#1058#39' end as p_is_econom_txt'
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
      'from v_list_entity v'
      'where v.table_key= :table_key')
    BeforeOpen = quUpdBegParamBeforeOpen
    Left = 88
    Top = 64
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'table_key'
      end>
  end
  inherited spUpd: TMSStoredProc
    StoredProcName = 'sp_EditEntity;1'
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditEntity;1(:p_Entity_type, :p_Nom, :p' +
        '_PostNo, :p_PostNoFirst, :p_DatePlat, :p_Summa, :p_Buh, :p_Sprav' +
        'ka, :p_TipPlat, :p_UserNo, :p_SotrudNo, :p_bank_invoice_id, :p_a' +
        'ctivity_type_id, :p_response_dept_id, :p_VidRashodNo, :p_OtdelNo' +
        ', :p_our_firmNo, :p_is_econom, :p_Pkey, :p_l_code, :p_Rate, :p_C' +
        'urrencyAccounting, :p_RateCurrencyAccounting, :p_SummaCurrencyAc' +
        'counting)}')
    Left = 280
    Top = 57
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
    StoredProcName = 'sp_AddEntity;1'
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_AddEntity;1(:p_Entity_type, :p_Nom, :p_' +
        'PostNo, :p_PostNoFirst, :p_DatePlat, :p_Summa, :p_Buh, :p_Spravk' +
        'a, :p_TipPlat, :p_UserNo, :p_SotrudNo, :p_bank_invoice_id, :p_ac' +
        'tivity_type_id, :p_response_dept_id, :p_VidRashodNo, :p_OtdelNo,' +
        ' :p_our_firmNo, :p_is_econom, :p_l_code, :p_Rate, :p_CurrencyAcc' +
        'ounting, :p_RateCurrencyAccounting, :p_SummaCurrencyAccounting, ' +
        ':p_Pkey)}')
    Left = 312
    Top = 57
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
    Left = 344
    Top = 72
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
    Left = 304
    Top = 144
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
    Left = 312
    Top = 40
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
    Left = 280
    Top = 40
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
    Left = 344
    Top = 40
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
    Left = 272
    Top = 144
    object quOurFirmname: TStringField
      FieldName = 'name'
      Origin = 'Post.name'
      Size = 10
    end
    object quOurFirmPostNo: TSmallintField
      FieldName = 'PostNo'
    end
  end
  object Seq_PlatR_Nom: TMSStoredProc
    StoredProcName = 'Seq_PlatR_Nom;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL Seq_PlatR_Nom;1(:id)}')
    Left = 56
    Top = 81
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInputOutput
      end>
  end
  object Seq_PlatP_Nom: TMSStoredProc
    StoredProcName = 'Seq_PlatP_Nom;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL Seq_PlatP_Nom;1(:id)}')
    Left = 56
    Top = 137
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInputOutput
      end>
  end
  object quEntityType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select code,Name from d_entity_type where code in ('#39'PLATP'#39','#39'PLAT' +
        'R'#39')')
    Left = 152
    Top = 104
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
  object quLoad: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare @Pkey bigint'
      '      , @EntityType char(5)'
      'set @Pkey = :Pkey'
      'set @EntityType = :EntityType'
      ''
      ''
      'if @EntityType = '#39'PLATP'#39' '
      ' select  DataLoad'
      '       , SummaLoad'
      '       , FreeSummaLoad'
      '       , EntityTypeLoad'
      '       , AddressLoad'
      '       , SetArticleGroupName as GroupName'
      '       , DayDeley'
      '  from PlatP '
      '   where pkey = @Pkey'
      ''
      'if @EntityType = '#39'PLATR'#39' '
      ' select  DataLoad'
      '       , SummaLoad'
      '       , FreeSummaLoad'
      '       , EntityTypeLoad'
      '       , AddressLoad '
      '       , SetArticleGroupName as GroupName'
      '       , DayDeley'
      '  from PlatR '
      '   where pkey = @Pkey')
    Left = 356
    Top = 179
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Pkey'
      end
      item
        DataType = ftUnknown
        Name = 'EntityType'
      end>
  end
  object dsLoad: TMSDataSource
    DataSet = quLoad
    Left = 356
    Top = 147
  end
  object qu_D_Currency: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      '--select * from d_Currency'
      'select L_Code,Name from d_Currency')
    Left = 252
    Top = 323
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
end
