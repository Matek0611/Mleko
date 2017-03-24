inherited frmMoneyCompensation: TfrmMoneyCompensation
  Left = 136
  Top = 68
  Width = 1014
  Height = 707
  Caption = #1050#1086#1084#1087#1077#1085#1089#1072#1094#1080#1103' '#1076#1077#1085#1077#1078#1085#1099#1093' '#1089#1088#1077#1076#1089#1090#1074
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel [0]
    Left = 0
    Top = 608
    Width = 998
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      998
      41)
    object btnRefresh: TButton
      Left = 80
      Top = 8
      Width = 130
      Height = 25
      Action = acRefresh
      TabOrder = 0
    end
    object btnExportToExcel: TButton
      Left = 232
      Top = 8
      Width = 140
      Height = 25
      Action = acExportToExcel
      TabOrder = 1
    end
    object btnSettings: TButton
      Left = 384
      Top = 8
      Width = 130
      Height = 25
      Action = acGetSettingsDlg
      TabOrder = 2
      Visible = False
    end
    object btnHelp: TButton
      Left = 736
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1055#1086#1084#1086#1097#1100
      TabOrder = 3
      OnClick = btnHelpClick
    end
    object btnSetExPayTypes: TButton
      Left = 832
      Top = 8
      Width = 153
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1048#1089#1082#1083#1102#1095'. '#1090#1080#1087#1099' '#1087#1083#1072#1090#1077#1078#1077#1081
      TabOrder = 4
      OnClick = btnSetExPayTypesClick
    end
    object cbxOnlyTotals: TCheckBox
      Left = 584
      Top = 16
      Width = 129
      Height = 17
      Caption = #1055#1086#1082#1072#1079'. '#1090#1086#1083#1100#1082#1086' '#1080#1090#1086#1075#1080
      TabOrder = 5
      OnClick = cbxOnlyTotalsClick
    end
  end
  object Panel3: TPanel [1]
    Left = 0
    Top = 0
    Width = 998
    Height = 608
    Align = alClient
    TabOrder = 1
    object spl3: TSplitter
      Left = 1
      Top = 161
      Width = 996
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object dbgDebts: TDBGridEh
      Left = 1
      Top = 165
      Width = 996
      Height = 442
      Align = alClient
      DataSource = dsDebt
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      ReadOnly = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 3
      OnGetCellParams = dbgDebtsGetCellParams
      OnKeyDown = dbgDebtsKeyDown
      OnKeyPress = dbgDebtsKeyPress
      OnTitleBtnClick = dbgDebtsTitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Depart'
          Footers = <>
          Tag = 1
          Title.Caption = #1054#1090#1076#1077#1083' '#1087#1088#1086#1076#1072#1078
          Width = 100
        end
        item
          Color = 15658723
          EditButtons = <>
          FieldName = 'Agent'
          Footers = <>
          Tag = 2
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          Title.Color = 15658723
          Title.TitleButton = True
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'DocType'
          Footers = <>
          Tag = 3
          Title.Caption = #1042#1080#1076' '#1076#1086#1082'-'#1090#1072
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'DocNum'
          Footers = <>
          Tag = 4
          Title.Caption = #1053#1086#1084'. '#1076#1086#1082'-'#1090#1072
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'DocDate'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1076#1086#1082'-'#1090#1072
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'PayType'
          Footers = <>
          Tag = 5
          Title.Caption = #1058#1080#1087' '#1087#1083#1072#1090#1077#1078#1072
          Width = 200
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'Summa'
          Footer.Color = 12903679
          Footer.DisplayFormat = '0.00'
          Footer.FieldName = '_Summa'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Tag = -1
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 80
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'FreeSumma'
          Footer.Color = 12903679
          Footer.DisplayFormat = '0.00'
          Footer.FieldName = '_FreeSumma'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Tag = -2
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072' '#1076#1086#1083#1075#1072
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'CurrencyHead'
          Footers = <>
          Title.Caption = #1042#1072#1083'. '#1087#1083#1072#1090'.'
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'Description'
          Footers = <>
          Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'Worker'
          Footers = <>
          Tag = 6
          Title.Alignment = taCenter
          Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'Expense'
          Footers = <>
          Tag = 7
          Title.Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
          Title.TitleButton = True
        end>
    end
    object pnlControls: TPanel
      Left = 1
      Top = 1
      Width = 996
      Height = 160
      Align = alTop
      BevelInner = bvLowered
      Constraints.MaxHeight = 200
      Constraints.MinHeight = 100
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 273
        Top = 2
        Width = 4
        Height = 156
        Beveled = True
        Visible = False
      end
      object Splitter2: TSplitter
        Left = 449
        Top = 2
        Width = 4
        Height = 156
        Beveled = True
      end
      object vleSelections: TValueListEditor
        Left = 453
        Top = 2
        Width = 541
        Height = 156
        Align = alClient
        FixedCols = 1
        PopupMenu = pmSelections
        Strings.Strings = (
          #1054#1090#1076#1077#1083#1099' '#1087#1088#1086#1076#1072#1078'='
          #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099'='
          #1042#1080#1076#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'='
          #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'='
          #1058#1080#1087#1099' '#1087#1083#1072#1090#1077#1078#1072'='
          #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'='
          #1057#1090#1072#1090#1100#1080' '#1088#1072#1089#1093#1086#1076#1086#1074'=')
        TabOrder = 0
        TitleCaptions.Strings = (
          #1055#1072#1088#1072#1084#1077#1090#1088
          #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103)
        OnDblClick = vleSelectionsDblClick
        OnEditButtonClick = vleSelectionsEditButtonClick
        OnKeyUp = vleSelectionsKeyUp
        ColWidths = (
          123
          412)
        RowHeights = (
          18
          18
          18
          18
          18
          18
          18
          18)
      end
      object gbxExpansions: TGroupBox
        Left = 277
        Top = 2
        Width = 172
        Height = 156
        Align = alLeft
        Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086
        PopupMenu = pmExpansion
        TabOrder = 1
        Visible = False
        object clbExpansions: TCheckListBox
          Left = 2
          Top = 15
          Width = 168
          Height = 139
          OnClickCheck = clbExpansionsClickCheck
          Align = alClient
          ItemHeight = 13
          Items.Strings = (
            #1054#1090#1076#1077#1083#1091' '#1087#1088#1086#1076#1072#1078
            #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
            #1042#1080#1076#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            #1044#1072#1090#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            #1058#1080#1087#1091' '#1087#1083#1072#1090#1077#1078#1072
            #1057#1086#1090#1088#1091#1076#1085#1080#1082#1091
            #1057#1090#1072#1090#1100#1077' '#1088#1072#1089#1093#1086#1076#1086#1074)
          PopupMenu = pmExpansion
          TabOrder = 0
          OnDblClick = clbExpansionsDblClick
        end
      end
      object pnlLeft: TPanel
        Left = 2
        Top = 2
        Width = 271
        Height = 156
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 2
        Visible = False
        object vleDate: TValueListEditor
          Left = 2
          Top = 2
          Width = 267
          Height = 152
          Hint = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099' '#1074#1088#1091#1095#1085#1091#1102' '#1080#1083#1080' '#1080#1079' '#1076#1080#1072#1083#1086#1075#1072
          Align = alClient
          DefaultRowHeight = 22
          FixedCols = 1
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goRowSelect, goThumbTracking]
          ParentShowHint = False
          PopupMenu = pmDate
          ShowHint = True
          Strings.Strings = (
            #1044#1072#1090#1072' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103'=')
          TabOrder = 0
          TitleCaptions.Strings = (
            #1055#1072#1088#1072#1084#1077#1090#1088
            #1044#1072#1090#1072)
          OnSelectCell = vleDateSelectCell
          ColWidths = (
            123
            138)
        end
      end
    end
  end
  object sbStatus: TStatusBar [2]
    Left = 0
    Top = 649
    Width = 998
    Height = 19
    Panels = <
      item
        Text = #1047#1072#1087#1080#1089#1077#1081':'
        Width = 180
      end
      item
        Text = #1042#1089#1077#1075#1086':'
        Width = 120
      end
      item
        Text = '0%'
        Width = 70
      end
      item
        Alignment = taRightJustify
        Width = 80
      end
      item
        Width = 50
      end>
  end
  inherited ActionList: TActionList
    Top = 200
    object acRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' - F5'
      ShortCut = 116
      OnExecute = acRefreshExecute
    end
    object acExportToExcel: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel - F2'
      ShortCut = 113
      OnExecute = acExportToExcelExecute
    end
    object acGetSettingsDlg: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' - F4'
      ShortCut = 115
      OnExecute = acGetSettingsDlgExecute
    end
    object acToggleSettingsVisibility: TAction
      Caption = 'acToggleSettingsVisibility'
      ShortCut = 24659
      OnExecute = acToggleSettingsVisibilityExecute
    end
  end
  object dsDebt: TMSDataSource
    DataSet = quDebt
    Left = 384
    Top = 281
  end
  object quDebt: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'use work'
      ''
      'DECLARE'
      ''
      ' @p_date_beg SmallDateTime'
      ',@p_date_end SmallDateTime'
      ',@DateStart  SmallDateTime'
      ',@DisableExclusion bit'
      ',@OnlyTotals bit'
      ''
      '--SET @p_date_beg = '#39'01.01.2000'#39
      'SET @DateStart = '#39'01.01.2000'#39
      'SET @p_date_end = DATEADD(D, 1, GETDATE())'
      'SET @DisableExclusion = 0'
      'SET @OnlyTotals = 0'
      ''
      'SET @DateStart = '
      '(select MIN(_Date) as MinDate from ('
      'select MIN(DatePlat) as _Date  from PlatP'
      'union '
      'select MIN(DatePlat) as _Date  from PlatR'
      'union '
      'select MIN(DateNakl) as _Date  from NaklR'
      'union '
      'select MIN(DateNakl) as _Date  from NaklP'
      ') D )'
      ''
      'SET @p_date_beg = @DateStart'
      ''
      'declare'
      '@_PlatR int,'
      '@_PlatP int,'
      '@_NaklP int,'
      '@_NaklR int'
      ''
      
        'set @_PlatR = (select ID from [dbo].[D_ENTITY_TYPE] t where t.co' +
        'de = '#39'PLATR'#39')'
      
        'set @_PlatP = (select ID from [dbo].[D_ENTITY_TYPE] t where t.co' +
        'de = '#39'PLATP'#39')'
      
        'set @_NaklP = (select ID from [dbo].[D_ENTITY_TYPE] t where t.co' +
        'de = '#39'NAKLP'#39')'
      
        'set @_NaklR = (select ID from [dbo].[D_ENTITY_TYPE] t where t.co' +
        'de = '#39'NAKLR'#39')'
      ' '
      'SELECT * FROM ( '
      'SELECT'
      '  _Count  '
      ', Summa'
      ', FreeSumma'
      ', 0 as _Summa'
      ', 0 as _FreeSumma    '
      ', Agent'
      ', _Agent'
      ',  ID'
      ',  _Depart'
      ',  Depart'
      ',  _DocType'
      ',  DocType'
      ',  DocNum'
      ',  DocDate'
      ',  _Worker'
      ',  Worker'
      ',  _PayType'
      ',  PayType'#9
      ',  _Expense'
      ',  Expense'
      ',  Description'
      ', CurrencyHead   '
      'FROM ('
      'SELECT'
      '0 as _Count'
      ', -factor_direction*Summa as Summa'
      ', -factor_direction*FreeSumma as FreeSumma'
      ',  p.PostNo as _Agent'
      ',  p.Name as Agent'
      ',  T1.ID as ID '#9'    '
      ', T1.otdelNo as _Depart'
      ', vid.OtdelName as Depart'
      ', entity_type_id AS _DocType'
      ', ent.description as DocType'
      ', Nom AS DocNum'
      ', DateEntity as DocDate'
      ', T1.SotrudNo as _Worker'
      ', sot.SotrudName AS Worker'#9
      ', Tip AS _PayType'
      ', ISNULL((case '
      #9'when entity_type_id = @_PlatP then d_p.Name '
      #9'when entity_type_id = @_PlatR then d_r.Name '
      #9'else NULL end), '#39#39') as PayType'#9
      ', VidNo AS _Expense'
      ', ISNULL(( case '
      #9'when entity_type_id in (@_PlatR, @_PlatP) then'
      #9'vras.VidRashodName else'
      #9'vnak.VidNaklName end), '#39#39') as Expense'
      ', T1.Description'
      ', CurrencyHead '
      'FROM ('
      'SELECT  '
      'PlatNo AS ID, '
      'Summa, '
      'SummaDolg AS FreeSumma,'
      'otdelNo,'
      'PostNo,'
      '@_PlatR AS entity_type_id,'
      'Nom, '
      'DatePlat AS DateEntity, '
      'SotrudNo,'
      'VidRashodNo AS VidNo, '
      '1 AS factor_direction,'
      'CurrencyHead,'
      'TipPlat as Tip,'
      'Spravka as Description '
      'from PlatR WITH (nolock)'
      'UNION ALL'
      ''
      'SELECT  '
      'PlatNo AS ID, '
      'Summa, '
      'SummaDolg AS FreeSumma,'
      'otdelNo,'
      'PostNo,'
      '@_PlatP AS entity_type_id,'
      'Nom, '
      'DatePlat AS DateEntity, '
      'SotrudNo,'
      'VidRashodNo AS VidNo, '
      '-1 AS factor_direction,'
      'CurrencyHead,'
      'TipPlat as Tip,'
      'Spravka as Description '
      'from PlatP WITH (nolock)'
      'UNION ALL'
      ''
      'SELECT  '
      'NaklNo AS ID, '
      'Summa, '
      'SummaDolg AS FreeSumma,'
      'otdelNo,'
      'PostNo,'
      '@_NaklP AS entity_type_id,'
      'Nom, '
      'DateNakl AS DateEntity, '
      'NULL as SotrudNo,'
      'VidNaklNo AS VidNo, '
      '-1 AS factor_direction,'
      'CurrencyHead,'
      'NULL as Tip,'
      'NULL as Description '
      'from NaklP WITH (nolock)'
      'UNION ALL'
      ''
      'SELECT  '
      'NaklNo AS ID, '
      
        'CASE WHEN vidnaklno = 3 THEN - 1 * abs(Summa) ELSE summa END AS ' +
        'Summa, '
      'SummaDolg AS FreeSumma,'
      'otdelNo,'
      'PostNo,'
      '@_NaklR AS entity_type_id,'
      'Nom, '
      'DateNakl AS DateEntity, '
      'SotrudNo,'
      'VidNaklNo AS VidNo, '
      '1 AS factor_direction,'
      'CurrencyHead,'
      'NULL as Tip,'
      'NULL as Description '
      'from NaklR WITH (nolock)'
      ') T1'
      'INNER JOIN D_ENTITY_TYPE ent on (ent.ID=T1.entity_type_id)'
      'INNER JOIN Post p on (p.PostNo=T1.PostNo)'
      'LEFT OUTER JOIN VidOtdel vid on (vid.OtdelNo=T1.OtdelNo)'
      'LEFT OUTER JOIN Sotrud sot on (sot.SotrudNo=T1.SotrudNo)'
      'LEFT OUTER JOIN VidRashod vras on (vras.VidRashodNo=T1.VidNo)'
      'LEFT OUTER JOIN vidnakl vnak on (vnak.vidnaklNo=T1.VidNo)'
      'LEFT OUTER JOIN d_PLat_Type d_p on (d_p.ID=T1.Tip)'
      'LEFT OUTER JOIN d_PlatR_Tip d_r on (d_r.ID=T1.Tip)'
      'where '
      '--<Conditions 1>'
      '  (1=1)'
      ') L1'
      '    where'
      '    (@OnlyTotals=0) and'
      '--<Selections 1>'
      '  (1=1)'#9
      ''
      'UNION ALL'
      ''
      'SELECT'
      '  Post_Count as _Count  '
      ', Post_Summa as Summa'
      ', Post_FreeSumma as FreeSumma '
      ', Post_Summa as _Summa'
      ', Post_FreeSumma as _FreeSumma   '
      ', p.Name as Agent'
      ', _Agent'
      ', NULL as DocID'
      ', NULL as _Depart'
      ', NULL as Depart'
      ', NULL AS _DocType'
      ', NULL as DocType'
      ', NULL AS DocNum'
      ', NULL as DocDate'
      ', NULL as_Worker'
      ', NULL AS Worker'#9
      ', NULL AS _PayType'
      ', NULL as PayType'#9
      ', NULL AS _Expense'
      ', NULL as Expense'
      ', NULL as Description'
      ', NULL as CurrencyHead  '
      ''
      'FROM (  '#9' '
      'SELECT'
      '  _Agent,'
      '  COUNT(_Agent) as Post_Count,'
      '  SUM(Summa) as Post_Summa,'
      '  SUM(FreeSumma) as Post_FreeSumma'#9
      'FROM ('
      'SELECT * FROM ('
      'SELECT'
      'PostNo as _Agent,'
      '  T1.ID as ID '
      ', -factor_direction*Summa as Summa'
      ', -factor_direction*FreeSumma as FreeSumma'#9#9'    '
      ', T1.otdelNo as _Depart'
      ', entity_type_id AS _DocType'
      ', Nom AS DocNum'
      ', DateEntity as DocDate'
      ', Tip AS _PayType'
      ', VidNo AS _Expense'
      'FROM ('
      'SELECT  '
      'PlatNo AS ID, '
      'Summa, '
      'SummaDolg AS FreeSumma,'
      'otdelNo,'
      'PostNo,'
      '@_PlatR AS entity_type_id,'
      'Nom, '
      'DatePlat AS DateEntity, '
      'SotrudNo,'
      'VidRashodNo AS VidNo, '
      '1 AS factor_direction,'
      'CurrencyHead,'
      'TipPlat as Tip,'
      'Spravka as Description '
      'from PlatR WITH (nolock)'
      'UNION ALL'
      ''
      'SELECT  '
      'PlatNo AS ID, '
      'Summa, '
      'SummaDolg AS FreeSumma,'
      'otdelNo,'
      'PostNo,'
      '@_PlatP AS entity_type_id,'
      'Nom, '
      'DatePlat AS DateEntity, '
      'SotrudNo,'
      'VidRashodNo AS VidNo, '
      '-1 AS factor_direction,'
      'CurrencyHead,'
      'TipPlat as Tip,'
      'Spravka as Description '
      'from PlatP WITH (nolock)'
      'UNION ALL'
      ''
      'SELECT  '
      'NaklNo AS ID, '
      'Summa, '
      'SummaDolg AS FreeSumma,'
      'otdelNo,'
      'PostNo,'
      '@_NaklP AS entity_type_id,'
      'Nom, '
      'DateNakl AS DateEntity, '
      'NULL as SotrudNo,'
      'VidNaklNo AS VidNo, '
      '-1 AS factor_direction,'
      'CurrencyHead,'
      'NULL as Tip,'
      'NULL as Description '
      'from NaklP WITH (nolock)'
      'UNION ALL'
      ''
      'SELECT  '
      'NaklNo AS ID, '
      
        'CASE WHEN vidnaklno = 3 THEN - 1 * abs(Summa) ELSE summa END AS ' +
        'Summa, '
      'SummaDolg AS FreeSumma,'
      'otdelNo,'
      'PostNo,'
      '@_NaklR AS entity_type_id,'
      'Nom, '
      'DateNakl AS DateEntity, '
      'SotrudNo,'
      'VidNaklNo AS VidNo, '
      '1 AS factor_direction,'
      'CurrencyHead,'
      'NULL as Tip,'
      'NULL as Description '
      'from NaklR WITH (nolock)'
      ') T1'
      'where '
      '--<Conditions 2>'
      '  (2=2)'
      '    ) L1'
      '    where '
      '--<Selections 2>'
      '  (2=2)'
      '    '
      ') T2'
      'GROUP BY _Agent'
      ') T3'
      'INNER JOIN Post p on (p.PostNo=T3._Agent)'
      ') T4'
      'ORDER BY Agent, _Count, DocType, DocDate')
    ReadOnly = True
    Filtered = True
    OnFilterRecord = quDebtFilterRecord
    Left = 536
    Top = 225
    object quDebt_Count: TIntegerField
      FieldName = '_Count'
    end
    object quDebtID: TIntegerField
      FieldName = 'ID'
    end
    object quDebtSumma: TFloatField
      FieldName = 'Summa'
    end
    object quDebtFreeSumma: TFloatField
      FieldName = 'FreeSumma'
    end
    object quDebt_Depart: TIntegerField
      FieldName = '_Depart'
    end
    object quDebtDepart: TStringField
      FieldName = 'Depart'
      Size = 30
    end
    object quDebt_Agent: TSmallintField
      FieldName = '_Agent'
    end
    object quDebtAgent: TStringField
      FieldName = 'Agent'
      Size = 30
    end
    object quDebt_DocType: TIntegerField
      FieldName = '_DocType'
    end
    object quDebtDocType: TStringField
      FieldName = 'DocType'
      Size = 1024
    end
    object quDebtDocNum: TIntegerField
      FieldName = 'DocNum'
    end
    object quDebtDocDate: TDateTimeField
      FieldName = 'DocDate'
    end
    object quDebt_PayType: TSmallintField
      FieldName = '_PayType'
    end
    object quDebtPayType: TStringField
      FieldName = 'PayType'
      Size = 512
    end
    object quDebt_Worker: TIntegerField
      FieldName = '_Worker'
    end
    object quDebtWorker: TStringField
      FieldName = 'Worker'
      Size = 30
    end
    object quDebt_Expense: TIntegerField
      FieldName = '_Expense'
    end
    object quDebtExpense: TStringField
      FieldName = 'Expense'
      Size = 50
    end
    object quDebtDescription: TStringField
      FieldName = 'Description'
      Size = 200
    end
    object quDebtCurrencyHead: TStringField
      FieldName = 'CurrencyHead'
      Size = 5
    end
    object quDebt_Summa: TFloatField
      FieldName = '_Summa'
    end
    object quDebt_FreeSumma: TFloatField
      FieldName = '_FreeSumma'
    end
  end
  object dlgSaveExportToExcel: TSaveDialog
    DefaultExt = '.xls'
    Filter = 'Excel (*.xls)|*.xls'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 440
    Top = 464
  end
  object sthSource: TStrHolder
    Capacity = 356
    Macros = <>
    Left = 456
    Top = 257
    InternalVer = 1
    StrData = (
      ''
      '75736520776f726b'
      ''
      '4445434c415245'
      ''
      '2040705f646174655f62656720536d616c6c4461746554696d65'
      '2c40705f646174655f656e6420536d616c6c4461746554696d65'
      '2c404461746553746172742020536d616c6c4461746554696d65'
      '2c4044697361626c654578636c7573696f6e20626974'
      '2c404f6e6c79546f74616c7320626974'
      ''
      '2d2d5345542040705f646174655f626567203d202730312e30312e3230303027'
      '5345542040446174655374617274203d202730312e30312e3230303027'
      
        '5345542040705f646174655f656e64203d204441544541444428442c20312c20' +
        '47455444415445282929'
      '534554204044697361626c654578636c7573696f6e203d2030'
      '53455420404f6e6c79546f74616c73203d2030'
      ''
      '5345542040446174655374617274203d20'
      
        '2873656c656374204d494e285f4461746529206173204d696e44617465206672' +
        '6f6d2028'
      
        '73656c656374204d494e2844617465506c617429206173205f44617465202066' +
        '726f6d20506c617450'
      '756e696f6e20'
      
        '73656c656374204d494e2844617465506c617429206173205f44617465202066' +
        '726f6d20506c617452'
      '756e696f6e20'
      
        '73656c656374204d494e28446174654e616b6c29206173205f44617465202066' +
        '726f6d204e616b6c52'
      '756e696f6e20'
      
        '73656c656374204d494e28446174654e616b6c29206173205f44617465202066' +
        '726f6d204e616b6c50'
      '2920442029'
      ''
      '5345542040705f646174655f626567203d2040446174655374617274'
      ''
      '6465636c617265'
      '405f506c61745220696e742c'
      '405f506c61745020696e742c'
      '405f4e616b6c5020696e742c'
      '405f4e616b6c5220696e74'
      ''
      
        '73657420405f506c617452203d202873656c6563742049442066726f6d205b64' +
        '626f5d2e5b445f454e544954595f545950455d207420776865726520742e636f' +
        '6465203d2027504c4154522729'
      
        '73657420405f506c617450203d202873656c6563742049442066726f6d205b64' +
        '626f5d2e5b445f454e544954595f545950455d207420776865726520742e636f' +
        '6465203d2027504c4154502729'
      
        '73657420405f4e616b6c50203d202873656c6563742049442066726f6d205b64' +
        '626f5d2e5b445f454e544954595f545950455d207420776865726520742e636f' +
        '6465203d20274e414b4c502729'
      
        '73657420405f4e616b6c52203d202873656c6563742049442066726f6d205b64' +
        '626f5d2e5b445f454e544954595f545950455d207420776865726520742e636f' +
        '6465203d20274e414b4c522729'
      '20'
      '53454c454354202a2046524f4d202820'
      '53454c454354'
      '20205f436f756e742020'
      '2c2053756d6d61'
      '2c204672656553756d6d61'
      '2c2030206173205f53756d6d61'
      '2c2030206173205f4672656553756d6d6120202020'
      '2c204167656e74'
      '2c205f4167656e74'
      '2c20204944'
      '2c20205f446570617274'
      '2c2020446570617274'
      '2c20205f446f6354797065'
      '2c2020446f6354797065'
      '2c2020446f634e756d'
      '2c2020446f6344617465'
      '2c20205f576f726b6572'
      '2c2020576f726b6572'
      '2c20205f50617954797065'
      '2c20205061795479706509'
      '2c20205f457870656e7365'
      '2c2020457870656e7365'
      '2c20204465736372697074696f6e'
      '2c2043757272656e637948656164202020'
      '46524f4d2028'
      '53454c454354'
      '30206173205f436f756e74'
      
        '2c202d666163746f725f646972656374696f6e2a53756d6d612061732053756d' +
        '6d61'
      
        '2c202d666163746f725f646972656374696f6e2a4672656553756d6d61206173' +
        '204672656553756d6d61'
      '2c2020702e506f73744e6f206173205f4167656e74'
      '2c2020702e4e616d65206173204167656e74'
      '2c202054312e4944206173204944200920202020'
      '2c2054312e6f7464656c4e6f206173205f446570617274'
      '2c207669642e4f7464656c4e616d6520617320446570617274'
      '2c20656e746974795f747970655f6964204153205f446f6354797065'
      '2c20656e742e6465736372697074696f6e20617320446f6354797065'
      '2c204e6f6d20415320446f634e756d'
      '2c2044617465456e7469747920617320446f6344617465'
      '2c2054312e536f747275644e6f206173205f576f726b6572'
      '2c20736f742e536f747275644e616d6520415320576f726b657209'
      '2c20546970204153205f50617954797065'
      '2c2049534e554c4c28286361736520'
      
        '097768656e20656e746974795f747970655f6964203d20405f506c6174502074' +
        '68656e20645f702e4e616d6520'
      
        '097768656e20656e746974795f747970655f6964203d20405f506c6174522074' +
        '68656e20645f722e4e616d6520'
      '09656c7365204e554c4c20656e64292c20272729206173205061795479706509'
      '2c205669644e6f204153205f457870656e7365'
      '2c2049534e554c4c2828206361736520'
      
        '097768656e20656e746974795f747970655f696420696e2028405f506c617452' +
        '2c20405f506c61745029207468656e'
      '09767261732e566964526173686f644e616d6520656c7365'
      
        '09766e616b2e5669644e616b6c4e616d6520656e64292c202727292061732045' +
        '7870656e7365'
      '2c2054312e4465736372697074696f6e'
      '2c2043757272656e63794865616420'
      '46524f4d2028'
      '53454c4543542020'
      '506c61744e6f2041532049442c20'
      '53756d6d612c20'
      '53756d6d61446f6c67204153204672656553756d6d612c'
      '6f7464656c4e6f2c'
      '506f73744e6f2c'
      '405f506c61745220415320656e746974795f747970655f69642c'
      '4e6f6d2c20'
      '44617465506c61742041532044617465456e746974792c20'
      '536f747275644e6f2c'
      '566964526173686f644e6f204153205669644e6f2c20'
      '3120415320666163746f725f646972656374696f6e2c'
      '43757272656e6379486561642c'
      '546970506c6174206173205469702c'
      '53707261766b61206173204465736372697074696f6e20'
      '66726f6d20506c617452205749544820286e6f6c6f636b29'
      '554e494f4e20414c4c'
      ''
      '53454c4543542020'
      '506c61744e6f2041532049442c20'
      '53756d6d612c20'
      '53756d6d61446f6c67204153204672656553756d6d612c'
      '6f7464656c4e6f2c'
      '506f73744e6f2c'
      '405f506c61745020415320656e746974795f747970655f69642c'
      '4e6f6d2c20'
      '44617465506c61742041532044617465456e746974792c20'
      '536f747275644e6f2c'
      '566964526173686f644e6f204153205669644e6f2c20'
      '2d3120415320666163746f725f646972656374696f6e2c'
      '43757272656e6379486561642c'
      '546970506c6174206173205469702c'
      '53707261766b61206173204465736372697074696f6e20'
      '66726f6d20506c617450205749544820286e6f6c6f636b29'
      '554e494f4e20414c4c'
      ''
      '53454c4543542020'
      '4e616b6c4e6f2041532049442c20'
      '53756d6d612c20'
      '53756d6d61446f6c67204153204672656553756d6d612c'
      '6f7464656c4e6f2c'
      '506f73744e6f2c'
      '405f4e616b6c5020415320656e746974795f747970655f69642c'
      '4e6f6d2c20'
      '446174654e616b6c2041532044617465456e746974792c20'
      '4e554c4c20617320536f747275644e6f2c'
      '5669644e616b6c4e6f204153205669644e6f2c20'
      '2d3120415320666163746f725f646972656374696f6e2c'
      '43757272656e6379486561642c'
      '4e554c4c206173205469702c'
      '4e554c4c206173204465736372697074696f6e20'
      '66726f6d204e616b6c50205749544820286e6f6c6f636b29'
      '554e494f4e20414c4c'
      ''
      '53454c4543542020'
      '4e616b6c4e6f2041532049442c20'
      
        '43415345205748454e207669646e616b6c6e6f203d2033205448454e202d2031' +
        '202a206162732853756d6d612920454c53452073756d6d6120454e4420415320' +
        '53756d6d612c20'
      '53756d6d61446f6c67204153204672656553756d6d612c'
      '6f7464656c4e6f2c'
      '506f73744e6f2c'
      '405f4e616b6c5220415320656e746974795f747970655f69642c'
      '4e6f6d2c20'
      '446174654e616b6c2041532044617465456e746974792c20'
      '536f747275644e6f2c'
      '5669644e616b6c4e6f204153205669644e6f2c20'
      '3120415320666163746f725f646972656374696f6e2c'
      '43757272656e6379486561642c'
      '4e554c4c206173205469702c'
      '4e554c4c206173204465736372697074696f6e20'
      '66726f6d204e616b6c52205749544820286e6f6c6f636b29'
      '29205431'
      
        '494e4e4552204a4f494e20445f454e544954595f5459504520656e74206f6e20' +
        '28656e742e49443d54312e656e746974795f747970655f696429'
      
        '494e4e4552204a4f494e20506f73742070206f6e2028702e506f73744e6f3d54' +
        '312e506f73744e6f29'
      
        '4c454654204f55544552204a4f494e205669644f7464656c20766964206f6e20' +
        '287669642e4f7464656c4e6f3d54312e4f7464656c4e6f29'
      
        '4c454654204f55544552204a4f494e20536f7472756420736f74206f6e202873' +
        '6f742e536f747275644e6f3d54312e536f747275644e6f29'
      
        '4c454654204f55544552204a4f494e20566964526173686f642076726173206f' +
        '6e2028767261732e566964526173686f644e6f3d54312e5669644e6f29'
      
        '4c454654204f55544552204a4f494e207669646e616b6c20766e616b206f6e20' +
        '28766e616b2e7669646e616b6c4e6f3d54312e5669644e6f29'
      
        '4c454654204f55544552204a4f494e20645f504c61745f5479706520645f7020' +
        '6f6e2028645f702e49443d54312e54697029'
      
        '4c454654204f55544552204a4f494e20645f506c6174525f54697020645f7220' +
        '6f6e2028645f722e49443d54312e54697029'
      '776865726520'
      '2d2d3c436f6e646974696f6e7320313e'
      '202028313d3129'
      '29204c31'
      '202020207768657265'
      '2020202028404f6e6c79546f74616c733d302920616e64'
      '2d2d3c53656c656374696f6e7320313e'
      '202028313d312909'
      ''
      '554e494f4e20414c4c'
      ''
      '53454c454354'
      '2020506f73745f436f756e74206173205f436f756e742020'
      '2c20506f73745f53756d6d612061732053756d6d61'
      '2c20506f73745f4672656553756d6d61206173204672656553756d6d6120'
      '2c20506f73745f53756d6d61206173205f53756d6d61'
      
        '2c20506f73745f4672656553756d6d61206173205f4672656553756d6d612020' +
        '20'
      '2c20702e4e616d65206173204167656e74'
      '2c205f4167656e74'
      '2c204e554c4c20617320446f634944'
      '2c204e554c4c206173205f446570617274'
      '2c204e554c4c20617320446570617274'
      '2c204e554c4c204153205f446f6354797065'
      '2c204e554c4c20617320446f6354797065'
      '2c204e554c4c20415320446f634e756d'
      '2c204e554c4c20617320446f6344617465'
      '2c204e554c4c2061735f576f726b6572'
      '2c204e554c4c20415320576f726b657209'
      '2c204e554c4c204153205f50617954797065'
      '2c204e554c4c206173205061795479706509'
      '2c204e554c4c204153205f457870656e7365'
      '2c204e554c4c20617320457870656e7365'
      '2c204e554c4c206173204465736372697074696f6e'
      '2c204e554c4c2061732043757272656e6379486561642020'
      ''
      '46524f4d202820200920'
      '53454c454354'
      '20205f4167656e742c'
      '2020434f554e54285f4167656e742920617320506f73745f436f756e742c'
      '202053554d2853756d6d612920617320506f73745f53756d6d612c'
      
        '202053554d284672656553756d6d612920617320506f73745f4672656553756d' +
        '6d6109'
      '46524f4d2028'
      '53454c454354202a2046524f4d2028'
      '53454c454354'
      '506f73744e6f206173205f4167656e742c'
      '202054312e494420617320494420'
      
        '2c202d666163746f725f646972656374696f6e2a53756d6d612061732053756d' +
        '6d61'
      
        '2c202d666163746f725f646972656374696f6e2a4672656553756d6d61206173' +
        '204672656553756d6d61090920202020'
      '2c2054312e6f7464656c4e6f206173205f446570617274'
      '2c20656e746974795f747970655f6964204153205f446f6354797065'
      '2c204e6f6d20415320446f634e756d'
      '2c2044617465456e7469747920617320446f6344617465'
      '2c20546970204153205f50617954797065'
      '2c205669644e6f204153205f457870656e7365'
      '46524f4d2028'
      '53454c4543542020'
      '506c61744e6f2041532049442c20'
      '53756d6d612c20'
      '53756d6d61446f6c67204153204672656553756d6d612c'
      '6f7464656c4e6f2c'
      '506f73744e6f2c'
      '405f506c61745220415320656e746974795f747970655f69642c'
      '4e6f6d2c20'
      '44617465506c61742041532044617465456e746974792c20'
      '536f747275644e6f2c'
      '566964526173686f644e6f204153205669644e6f2c20'
      '3120415320666163746f725f646972656374696f6e2c'
      '43757272656e6379486561642c'
      '546970506c6174206173205469702c'
      '53707261766b61206173204465736372697074696f6e20'
      '66726f6d20506c617452205749544820286e6f6c6f636b29'
      '554e494f4e20414c4c'
      ''
      '53454c4543542020'
      '506c61744e6f2041532049442c20'
      '53756d6d612c20'
      '53756d6d61446f6c67204153204672656553756d6d612c'
      '6f7464656c4e6f2c'
      '506f73744e6f2c'
      '405f506c61745020415320656e746974795f747970655f69642c'
      '4e6f6d2c20'
      '44617465506c61742041532044617465456e746974792c20'
      '536f747275644e6f2c'
      '566964526173686f644e6f204153205669644e6f2c20'
      '2d3120415320666163746f725f646972656374696f6e2c'
      '43757272656e6379486561642c'
      '546970506c6174206173205469702c'
      '53707261766b61206173204465736372697074696f6e20'
      '66726f6d20506c617450205749544820286e6f6c6f636b29'
      '554e494f4e20414c4c'
      ''
      '53454c4543542020'
      '4e616b6c4e6f2041532049442c20'
      '53756d6d612c20'
      '53756d6d61446f6c67204153204672656553756d6d612c'
      '6f7464656c4e6f2c'
      '506f73744e6f2c'
      '405f4e616b6c5020415320656e746974795f747970655f69642c'
      '4e6f6d2c20'
      '446174654e616b6c2041532044617465456e746974792c20'
      '4e554c4c20617320536f747275644e6f2c'
      '5669644e616b6c4e6f204153205669644e6f2c20'
      '2d3120415320666163746f725f646972656374696f6e2c'
      '43757272656e6379486561642c'
      '4e554c4c206173205469702c'
      '4e554c4c206173204465736372697074696f6e20'
      '66726f6d204e616b6c50205749544820286e6f6c6f636b29'
      '554e494f4e20414c4c'
      ''
      '53454c4543542020'
      '4e616b6c4e6f2041532049442c20'
      
        '43415345205748454e207669646e616b6c6e6f203d2033205448454e202d2031' +
        '202a206162732853756d6d612920454c53452073756d6d6120454e4420415320' +
        '53756d6d612c20'
      '53756d6d61446f6c67204153204672656553756d6d612c'
      '6f7464656c4e6f2c'
      '506f73744e6f2c'
      '405f4e616b6c5220415320656e746974795f747970655f69642c'
      '4e6f6d2c20'
      '446174654e616b6c2041532044617465456e746974792c20'
      '536f747275644e6f2c'
      '5669644e616b6c4e6f204153205669644e6f2c20'
      '3120415320666163746f725f646972656374696f6e2c'
      '43757272656e6379486561642c'
      '4e554c4c206173205469702c'
      '4e554c4c206173204465736372697074696f6e20'
      '66726f6d204e616b6c52205749544820286e6f6c6f636b29'
      '29205431'
      '776865726520'
      '2d2d3c436f6e646974696f6e7320323e'
      '202028323d3229'
      '2020202029204c31'
      '20202020776865726520'
      '2d2d3c53656c656374696f6e7320323e'
      '202028323d3229'
      '20202020'
      '29205432'
      '47524f5550204259205f4167656e74'
      '29205433'
      
        '494e4e4552204a4f494e20506f73742070206f6e2028702e506f73744e6f3d54' +
        '332e5f4167656e7429'
      '29205434'
      
        '4f52444552204259204167656e742c205f436f756e742c20446f63547970652c' +
        '20446f6344617465')
  end
  object pmExpansion: TPopupMenu
    Left = 376
    Top = 65
    object mnuSet_All_Exp_False: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1074#1089#1077
      OnClick = mnuSet_All_Exp_FalseClick
    end
    object mnuSet_All_Exp_True: TMenuItem
      Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1074#1089#1077
      OnClick = mnuSet_All_Exp_TrueClick
    end
    object mnuShowHide: TMenuItem
      Caption = #1057#1082#1088#1099#1090#1100'/'#1087#1086#1082#1072#1079#1072#1090#1100
      OnClick = mnuShowHideClick
    end
  end
  object pmDate: TPopupMenu
    Left = 192
    Top = 209
    object mnuSetDefaultDates: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1072#1090#1099' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      OnClick = mnuSetDefaultDatesClick
    end
  end
  object pmSelections: TPopupMenu
    Left = 632
    Top = 57
    object mnuDeleteAllSelections: TMenuItem
      Caption = #1059#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1074#1099#1073#1086#1088#1099
      OnClick = mnuDeleteAllSelectionsClick
    end
  end
  object quTest: TMSQuery
    Connection = dmDataModule.DB
    Left = 536
    Top = 312
  end
  object sthHelp: TStrHolder
    Capacity = 60
    Macros = <>
    Left = 136
    Top = 321
    InternalVer = 1
    StrData = (
      ''
      
        '7cc4e0f2e020e4eeeaf3ece5edf2e03a2032342e30332e323031373b20c2e5f0' +
        'f1e8ff20312e327c'
      'c8f1f2eef0e8ff'
      '32342e30332e32303137'
      
        '20c7e020f1f7e5f220efeeebedeee3ee20efe5f0e5efe8f1fbe2e0ede8ff20eb' +
        'eee3e8eae820efeef1f2f0eee5ede8ff20e7e0eff0eef1e020e820ede5eaeef2' +
        'eef0fbf520eff0eee3f0e0ececedfbf520f2f0feeaeee2'
      
        'f1eaeef0eef1f2fc20e2fbefeeebede5ede8ff20e7e0eff0eef1e020efeee2fb' +
        'f1e8ebe0f1fc20e22032302d343020f0e0e720efee20f1f0e0e2ede5ede8fe20' +
        'f1ee20f1eaeef0eef1f2fcfe20e2fbefeeebede5ede8ff20e8f1f5eee4edeee3' +
        'ee20e7e0eff0eef1e02020'
      ''
      '32322e30332e32303137'
      
        '20c7e020f1f7e5f220eeeff2e8ece0ebfcedeee3ee20efeef1f2f0eee5ede8ff' +
        '20e7e0eff0eef1e020e2f0e5ecff20e5e3ee20eee1f0e0e1eef2eae820f3ece5' +
        'edfcf8e5edee20e220332d3420f0e0e7e020'
      
        '20c8f1eff0e0e2ebe5ed20e1e0e320f120e4e0f2eee920e820e2fbe2eee4eeec' +
        '20ede0eaebe0e4edfbf5'
      '20'
      '32312e30332e32303137'
      
        '202b20d4e8ebfcf2f0e0f6e8ff20efee20f1f2eeebe1f6f32022d1f2e0f2fcff' +
        '20f0e0f1f5eee4eee2222e20c2e5f0f1e8ff20312e31'
      '20'
      '32302e30332e32303137'
      '202b20cfe5f0e2fbe920e2fbeff3f1ea2e20c2e5f0f1e8ff20312e30'
      ''
      '5bcfeeebedeee520eeefe8f1e0ede8e55d'
      'caeeecefe5edf1e0f6e8ff20e4e5ede5e6edfbf520f1f0e5e4f1f2e2'
      
        'cef1edeee2edfbe520e4e0ededfbe520e2fbe2eee4fff2f1ff20e220f2e0e1eb' +
        'e8f6f320e220f1f0e5e4ede5e920f7e0f1f2e820f4eef0ecfb2e'
      
        'd0e5e4e0eaf2eef020e7ede0f7e5ede8e920f4e8ebfcf2f0e02028e220e2e5f0' +
        'f5ede5e920f7e0f1f2e820f4eef0ecfb29'
      
        'efeee7e2eeebffe5f220e7e0e4e0f2fc20ede0e1eef020e7ede0f7e5ede8e920' +
        'e4ebff20f1eeeef2e2e5f2f1f2e2f3fef9e8f520f1f2eeebe1f6eee22c'
      
        'eaeef2eef0fbe520e1f3e4f3f220f3f7e8f2fbe2e0f2fcf1ff20eff0e820efee' +
        'f1f2f0eee5ede8e820f2e0e1ebe8f6fb2e'
      
        'c4ebff20f1f2f0eeeae820f4e8ebfcf2f0e02022cef2e4e5ebfb20eff0eee4e0' +
        'e62220f3f1f2e0ede0e2ebe8e2e0e5f2f1ff20e7ede0f7e5ede8e520efee20'
      'f3eceeebf7e0ede8fe2022cff0eef7e8e92dc4c4d1222e'
      
        'c4eeefeeebede8f2e5ebfcede0ff20f4e8ebfcf2f0e0f6e8ff20efee20f1f2ee' +
        'ebe1f6f32022d1f2e0f2fcff20f0e0f1f5eee4eee22220eceee6e5f220e1fbf2' +
        'fc'
      
        'e2fbefeeebede5ede020f120efeeeceef9fcfe20e4e8e0ebeee3e02c20e2fbe7' +
        'fbe2e0e5eceee3ee20efee20ede0e6e0f2e8fe20ede020e7e0e3eeebeee2eeea'
      
        'f1f2eeebe1f6e02e20cae0e6e4fbe920fdebe5ece5edf220f1efe8f1eae020e2' +
        '20fdf2eeec20e4e8e0ebeee3e520eceee6e5f220e1fbf2fc20e2eaebfef7e5ed' +
        '20'
      
        'e8ebe820e2fbeaebfef7e5ed20e4ebff20f4e8ebfcf2f0e0f6e8e82c20fdebe5' +
        'ece5edf2fb20f1efe8f1eae020eceee3f3f220f1eef0f2e8f0eee2e0f2fcf1ff'
      
        'f120efeeeceef9fcfe20eaeeece0ede420eaeeedf2e5eaf1f2edeee3ee20ece5' +
        'edfe2c20e2eee7eceee6e5ed20f2e0eae6e520efeee8f1ea20e7e0e4e0ededee' +
        'e3ee'
      
        'fdebe5ece5edf2e020e820e2eaebfef7e5ede8e52fe2fbeaebfef7e5ede8e520' +
        'e2f1e5f520fdebe5ece5edf2eee220e2fbf8e52fede8e6e520f2e5eaf3f9e5e3' +
        'ee2e'
      
        'd1f3ecece8f0eee2e0ede8e520f1f2e0f2e5e920f0e0f1f5eee4eee220e820ef' +
        'f0e8f5eee4eee220e2fbefeeebedffe5f2f1ff20'
      
        'eef2e4e5ebfcedee20efee20eae0e6e4eeecf320eaeeedf2f0e0e3e5edf2f32e' +
        '20cff0e820fdf2eeec20e4e0ededfbe520eff0e8f5eee4eee220e1e5f0f3f2f1' +
        'ff20'
      
        'f1ee20f1e2eee8ec20e7ede0eaeeec20e8e720f4eef0ecfb2022c6f3f0ede0eb' +
        '20f0e0f1f5eee4eee2222c20e020e4e0ededfbe520f0e0f1f5eee4eee220e1e5' +
        'f0f3f2f1ff'
      
        'e8e720f2eee920e6e520f4eef0ecfb20f120eee1f0e0f2edfbec20e7ede0eaee' +
        'ec2e20c8f2eee3eee2e0ff20f1f2f0eeeae02c20e220eaeef2eef0eee9'
      
        'e2fbe2eee4e8f2f1ff20f2eeebfceaee20e8ecff20eaeeedf2f0e0e3e5edf2e0' +
        '2c20f1f3ececfb20e4eeeaf3ece5edf2eee220e820f1f3ececfb20e4eeebe3ee' +
        'e22c'
      
        'eef2ece5f7e0e5f2f1ff20f6e2e5f2eeec2e20d1eef0f2e8f0eee2eae020f1f2' +
        'f0eeea2028f1ede0f7e0ebe020efee20e2e8e4f320e4eeeaf3ece5edf2e02c20'
      
        'e7e0f2e5ec20efee20e4e0f2e520e4eeeaf3ece5edf2e02920e2fbefeeebedff' +
        'e5f2f1ff20f2e0eae6e520e2edf3f2f0e820e4e0ededfbf5'
      'eaeeedf2f0e0e3e5edf2e02e'
      
        'c220e8f2eee3eee2eee920f1f2f0eeeae520e220eaeeedf6e520f2e0e1ebe8f6' +
        'fb20efeeeae0e7fbe2e0fef2f1ff20f1f3ececfb20e4e0ededfbf520e8e720'
      
        'f1eeeef2e2e5f2f1f2e2f3fef9e8f520f1f2eeebe1f6eee220e820e8f2eee3ee' +
        'e2fbf520f1f2f0eeea2c20eef2edeef1fff9e8f5f1ff20ea20eae0e6e4eeecf3' +
        '20'
      'eaeeedf2f0e0e3e5edf2f32e'
      
        'caedeeefeae02022cee1edeee2e8f2fc2220eff0eee8e7e2eee4e8f220e2fbe1' +
        'eef0eaf320e4e0ededfbf520e8e720e1e0e7fb20e4e0ededfbf520e220'
      
        'f1eeeef2e2e5f2f1f2e2e8e820f120e2fbe1f0e0ededfbece820e7ede0f7e5ed' +
        'e8ffece820f4e8ebfcf2f0e020e820efeeeae0e720e4e0ededfbf520ede020f4' +
        'eef0ece52e20'
      
        'd7e5eae1eeeaf128436865636b426f78292022cfeeeae0e72e20f2eeebfceaee' +
        '20e8f2eee3e82220f0e0e1eef2e0e5f220eae0ea20eaedeeefeae02c20'
      
        'f22ee52e20eee1f0e0e1eef2eae020e4e0ededfbf520ede0f1f2f3efe0e5f220' +
        'f1f0e0e7f320efeef1ebe520ede0e6e0f2e8ff2c20e820e4e0e5f220'
      
        'e2eee7eceee6edeef1f2fc20efeeeae0e7e0f2fc20f2eeebfceaee20e8f2eee3' +
        'eee2fbe520f1f2f0eeeae82028e0ede0ebeee3e8f7edee20'
      
        '22f1e2eef0e0f7e8e2e0ede8fe2220e4e0ededfbf520efee20eaeeedf2f0e0e3' +
        'e5edf2f3292e'
      
        'caedeeefeae02022c8f1eaebfef72e20f2e8effb20efebe0f2e5e6e5e92220ef' +
        'eee7e2eeebffe5f220e7e0e4e0f2fc20f1efe8f1eeea20f2e8efeee220efebe0' +
        'f2e5e6e5e92c'
      
        'ede520f3f7e8f2fbe2e0e5ecfbf520eff0e820efeef1f2f0eee5ede8e820f2e0' +
        'e1ebe8f6fb2e'
      
        'caedeeefeae02022c2fbe3f0f3e7e8f2fc20e220457863656c2220efeee7e2ee' +
        'ebffe5f220f1eef5f0e0ede8f2fc20e4e0ededfbe520f2e0e1ebe8f6fb20e220' +
        '457863656c'
      'f4e0e9ebe520f120f0e0f1f8e8f0e5ede8e5ec20222e786c73222e'
      
        'caedeeefeae02022cfeeeceef9fc2220efeeeae0e7fbe2e0e5f220fdf2eef220' +
        'f2e5eaf1f22e'
      '20')
  end
  object sthFields: TStrHolder
    Capacity = 28
    Macros = <>
    Left = 304
    Top = 361
    InternalVer = 1
    StrData = (
      ''
      '6f7464656c4e6f203d205f446570617274'
      '4f7464656c4e616d65203d20446570617274'
      '506f73744e6f203d205f4167656e74'
      '506f73744e616d65203d204167656e74'
      '656e746974795f747970655f6964203d205f446f6354797065'
      '656e746974795f747970655f6e616d65203d20446f6354797065'
      '4e6f6d203d20446f634e756d'
      '44617465456e74697479203d20446f6344617465'
      '546970203d205f50617954797065'
      '5469704e616d65203d2050617954797065'
      '536f747275644e6f203d205f576f726b6572'
      '536f747275644e616d65203d20576f726b6572'
      '5669644e6f203d205f457870656e7365'
      '5669644e616d65203d20457870656e7365'
      '4465736372697074696f6e203d204465736372697074696f6e09')
  end
  object sthConditions: TStrHolder
    Capacity = 8
    Macros = <>
    Left = 400
    Top = 369
    InternalVer = 1
    StrData = (
      ''
      
        '2844617465456e74697479206265747765656e2040705f646174655f62656720' +
        '616e642040705f646174655f656e642920616e64'
      
        '2028284044697361626c654578636c7573696f6e3d3129206f7220286e6f7420' +
        '2854312e506f73744e6f20696e20'
      
        '202873656c65637420506f73744e6f2066726f6d204c6973744d696e7573506f' +
        '7374466f724465626974206c6d7020776865726520'
      
        '09202854312e506f73744e6f203d206c6d702e506f73744e6f2920616e642028' +
        '6c6d702e436865636b4d696e75733d31292929292920616e6409'
      
        '09284142532869736e756c6c284672656553756d6d612c203029293e302e3030' +
        '352920616e64'
      
        '20202020282854312e746970206973206e756c6c29206f72202854312e746970' +
        '206e6f7420696e20'
      
        '202020202873656c656374205469704e6f2066726f6d204c6973744d696e7573' +
        '5061796d656e74466f724a6f75726e616c4f66457870656e7365732077686572' +
        '6520436865636b4d696e7573203d2031292929')
  end
end
