inherited frmMoneyCompensation: TfrmMoneyCompensation
  Left = 9
  Top = 72
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
          Title.Caption = #1054#1090#1076#1077#1083' '#1087#1088#1086#1076#1072#1078
        end
        item
          Color = 15658723
          EditButtons = <>
          FieldName = 'Agent'
          Footers = <>
          Tag = 1
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
          Title.Caption = #1042#1080#1076' '#1076#1086#1082'-'#1090#1072
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'DocNum'
          Footers = <>
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
          FieldName = 'Description'
          Footers = <>
          Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'Worker'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'Expense'
          Footers = <>
          Title.Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
        end
        item
          EditButtons = <>
          FieldName = '_Summa'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = '_FreeSumma'
          Footers = <>
          Visible = False
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
          #1044#1072#1090#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'='
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
          395)
        RowHeights = (
          18
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
      'USE WORK'
      ''
      'DECLARE'
      ''
      ' @p_date_beg SmallDateTime'
      ',@p_date_end SmallDateTime'
      ',@DateStart  SmallDateTime'
      ',@DisableExclusion bit'
      ',@OnlyTotals bit'
      ''
      '--SET @p_date_beg = '#39'01.03.2017'#39
      'SET @p_date_beg = '#39'01.01.1900'#39
      'SET @p_date_end = DATEADD(D, 1, GETDATE())'
      'SET @DateStart = '#39'01.01.2000'#39
      'SET @DisableExclusion = 0'
      'SET @OnlyTotals = 0'
      ''
      '--DROP TABLE #Selections'
      'BEGIN TRY  '
      'CREATE TABLE #Selections'
      '( '
      '  s_Depart int NULL'
      ', s_Agent int NULL'
      ', s_DocType int NULL'
      ', s_DocNum int NULL'
      ', s_DocDate int NULL'
      ', s_PayType int NULL'
      ', s_Worker int NULL'
      ', s_Expense int NULL'
      ');  '
      'END TRY  '
      'BEGIN CATCH'
      'TRUNCATE TABLE #Selections'
      'END CATCH; '
      ' '
      'INSERT INTO #Selections Values(-1, -1, -1, -1, -1, -1, -1, -1)'
      ''
      '--DROP TABLE #TempData'
      'BEGIN TRY  '
      'CREATE TABLE #TempData'
      '( '
      '_key int  identity(1,1),'
      '_Count int,'
      'ID int,'
      'pkey varchar(15)'
      ', Summa decimal(20, 4)'
      ', FreeSumma decimal(20, 4)'
      ', _Depart int'
      ', Depart varchar(30)'
      ', _Agent smallint NOT NULL'
      ', Agent varchar(30)'
      ', _DocType int'
      ', DocType varchar(1024)'
      ', DocNum int'
      ', _DocDate int'
      ', DocDate smalldatetime'
      ', _PayType smallint'
      ', PayType varchar(512)'
      ', _Worker int'
      ', Worker varchar(30)'
      ', _Expense int'
      ', Expense varchar(50)'
      ', Description varchar(200)'
      ', _Summa decimal(20, 4)'
      ', _FreeSumma decimal(20, 4)'
      ');  '
      'END TRY  '
      'BEGIN CATCH'
      'TRUNCATE TABLE #TempData'
      'END CATCH; '
      ''
      ''
      '--SELECT'
      '--  PostNo AS _Agent'
      '--, Summa'
      '--, FreeSumma'
      '-- FROM dbo.V_List_entity a'
      '--WHERE DateEntity between @p_date_beg and @p_date_end'
      '--and PostNo<>90'
      '--and ((a.tip not in '
      
        '--(select TipNo from ListMinusPaymentForJournalOfExpenses where ' +
        'CheckMinus = 1) or a.tip is not null ))'
      ''
      'SET NOCOUNT OFF;'
      '  declare '
      '    @Cnt int,'
      '    @PostNo int'
      '   ,@PostName varchar(40)'
      '   , @id int'
      '   , @pkey varchar(15)'
      ',  @_Summa decimal(20, 6)'
      ',  @_FreeSumma decimal(18, 6) '
      ', @Summa decimal(20, 4)'
      ', @FreeSumma decimal(20, 4)'
      ', @_Depart int'
      ', @Depart varchar(30)'
      ', @_Agent smallint'
      ', @Agent varchar(30)'
      ', @_DocType int'
      ', @DocType varchar(1024)'
      ', @DocNum int'
      ', @_DocDate int'
      ', @DocDate smalldatetime'
      ', @_PayType smallint'
      ', @PayType varchar(512)'
      ', @_Worker int'
      ', @Worker varchar(30)'
      ', @_Expense int'
      ', @Expense varchar(50)'
      ', @Description varchar(200)'
      #9'   '
      '  declare CS cursor scroll local for   '
      #9#9'SELECT'
      #9#9'distinct PostNo, PostName '
      #9#9' FROM dbo.V_List_entity a'
      #9#9'WHERE DateEntity between @p_date_beg and @p_date_end'
      #9#9'and ABS(isnull(FreeSumma, 0))>0.005'
      #9' and ((@DisableExclusion=1) or (not (PostNo in '
      #9' (select PostNo from ListMinusPostForDebit lmp where '
      #9#9' (PostNo = lmp.PostNo) and (lmp.CheckMinus=1)))))'
      #9'and'
      #9#9'  (EXISTS(SELECT 1 FROM #Selections WHERE s_Agent=-1) OR '
      #9#9'  (PostNo IN (SELECT s_Agent FROM #Selections)))'#9#9' '
      #9#9'and ((a.tip not in '
      
        #9#9'(select TipNo from ListMinusPaymentForJournalOfExpenses where ' +
        'CheckMinus = 1) or a.tip is not null ))'
      #9#9'--<order by #1>'
      #9#9'order by PostName'
      ''
      '  open CS;'
      '  while 1= 1 '
      '   begin'
      '     fetch next from CS '
      '      into @PostNo, @PostName'
      '      '
      '      SET @Cnt'#9#9#9'= 0  '
      '      SET @Summa'#9#9'= 0.0 '
      '      SET @FreeSumma'#9'= 0.0 '
      '      '
      '      if @@FETCH_STATUS <> 0 break'
      '       begin      '
      #9#9'  declare CS1 cursor scroll local for   '
      #9#9'SELECT'
      #9#9'    ID, pkey'
      #9#9#9', -factor_direction*Summa as Summa'
      #9#9#9', -factor_direction*FreeSumma as FreeSumma'#9#9'    '
      #9#9#9', otdelNo AS _Depart'
      #9#9#9', OtdelName AS Depart'
      #9#9#9', PostNo AS _Agent'
      #9#9#9', PostName AS Agent'
      #9#9#9', entity_type_id AS _DocType'
      #9#9#9', entity_type_name AS DocType'
      #9#9#9', Nom AS DocNum'
      #9#9#9', DateEntity as DocDate'
      #9#9#9', Tip AS _PayType'
      #9#9#9', TipName AS PayType'
      #9#9#9', SotrudNo AS _Worker'
      #9#9#9', SotrudName AS Worker'
      #9#9#9', VidNo AS _Expense'
      #9#9#9', VidName AS Expense'
      #9#9#9', Description'#9#9'   '
      #9#9' FROM dbo.V_List_entity a'
      #9#9'WHERE DateEntity between @p_date_beg and @p_date_end'
      #9#9'and (ABS(isnull(FreeSumma, 0))>0.005)'#9#9
      #9#9'and (PostNo=@PostNo)'
      #9#9'and'
      #9#9#9#9'  (EXISTS(SELECT 1 FROM #Selections WHERE s_Depart=-1) OR '
      #9#9#9#9'  (otdelNo IN (SELECT s_Depart FROM #Selections)))'
      #9#9#9#9'AND'
      #9#9#9#9'  (EXISTS(SELECT 1 FROM #Selections WHERE s_DocType=-1) OR '
      #9#9#9#9'  (entity_type_id IN (SELECT s_DocType FROM #Selections)))'
      #9#9#9#9'AND'
      #9#9#9#9'  (EXISTS(SELECT 1 FROM #Selections WHERE s_DocNum=-1) OR '
      #9#9#9#9'  (Nom IN (SELECT s_DocNum FROM #Selections)))'
      #9#9#9#9'AND'
      #9#9#9#9'  (EXISTS(SELECT 1 FROM #Selections WHERE s_DocDate=-1) OR '
      
        #9#9#9#9'  (datediff(d, @DateStart, DateEntity) IN (SELECT s_DocDate ' +
        'FROM #Selections)))'
      #9#9#9#9'AND'
      #9#9#9#9'  (EXISTS(SELECT 1 FROM #Selections WHERE s_PayType=-1) OR '
      #9#9#9#9'  (Tip IN (SELECT s_PayType FROM #Selections)))'
      #9#9#9#9'AND'
      #9#9#9#9'  (EXISTS(SELECT 1 FROM #Selections WHERE s_Worker=-1) OR '
      #9#9#9#9'  (SotrudNo IN (SELECT s_Worker FROM #Selections)))'
      #9#9#9#9'AND'
      #9#9#9#9'  (EXISTS(SELECT 1 FROM #Selections WHERE s_Expense=-1) OR '
      #9#9#9#9'  (VidNo IN (SELECT s_Expense FROM #Selections)))'#9#9
      #9#9'and ((a.tip not in '
      
        #9#9'(select TipNo from ListMinusPaymentForJournalOfExpenses where ' +
        'CheckMinus = 1)))'
      #9#9'--<order by #2>'
      #9#9'order by OtdelName, entity_type_name, DateEntity'
      #9#9
      #9#9'  open CS1;'
      #9#9'  while 1=1 '
      #9#9'   begin'
      #9#9#9' fetch next from CS1 '
      #9#9#9'  into @id, @pkey '
      #9#9#9#9'    , @_Summa  '
      #9#9#9#9'    , @_FreeSumma'
      #9#9#9#9#9', @_Depart '
      #9#9#9#9#9', @Depart '
      #9#9#9#9#9', @_Agent '
      #9#9#9#9#9', @Agent '
      #9#9#9#9#9', @_DocType '
      #9#9#9#9#9', @DocType '
      #9#9#9#9#9', @DocNum'
      #9#9#9#9#9', @DocDate '
      #9#9#9#9#9', @_PayType '
      #9#9#9#9#9', @PayType '
      #9#9#9#9#9', @_Worker '
      #9#9#9#9#9', @Worker '
      #9#9#9#9#9', @_Expense '
      #9#9#9#9#9', @Expense'
      #9#9#9#9#9', @Description '#9#9#9'  '
      #9#9'      '
      #9#9#9'  if @@FETCH_STATUS <> 0 break'
      #9#9#9'  '
      #9#9#9'  --SET @_DocDate = datediff(d, @DateStart, @DocDate) '
      #9#9#9#9'--IF'#9#9#9'  '
      #9#9#9#9
      #9#9#9#9'--  (EXISTS(SELECT 1 FROM #Selections WHERE s_Depart=-1) OR '
      #9#9#9#9'--  (@_Depart IN (SELECT s_Depart FROM #Selections)))'
      #9#9#9#9'--AND'
      
        #9#9#9#9'--  (EXISTS(SELECT 1 FROM #Selections WHERE s_DocType=-1) OR' +
        ' '
      #9#9#9#9'--  (@_DocType IN (SELECT s_DocType FROM #Selections)))'
      #9#9#9#9'--AND'
      #9#9#9#9'--  (EXISTS(SELECT 1 FROM #Selections WHERE s_DocNum=-1) OR '
      #9#9#9#9'--  (@DocNum IN (SELECT s_DocNum FROM #Selections)))'
      #9#9#9#9'--AND'
      
        #9#9#9#9'--  (EXISTS(SELECT 1 FROM #Selections WHERE s_DocDate=-1) OR' +
        ' '
      #9#9#9#9'--  (@_DocDate IN (SELECT s_DocDate FROM #Selections)))'
      #9#9#9#9'--AND'
      
        #9#9#9#9'--  (EXISTS(SELECT 1 FROM #Selections WHERE s_PayType=-1) OR' +
        ' '
      #9#9#9#9'--  (@_PayType IN (SELECT s_PayType FROM #Selections)))'
      #9#9#9#9'--AND'
      #9#9#9#9'--  (EXISTS(SELECT 1 FROM #Selections WHERE s_Worker=-1) OR '
      #9#9#9#9'--  (@_Worker IN (SELECT s_Worker FROM #Selections)))'
      #9#9#9#9'--AND'
      
        #9#9#9#9'--  (EXISTS(SELECT 1 FROM #Selections WHERE s_Expense=-1) OR' +
        ' '
      #9#9#9#9'--  (@_Expense IN (SELECT s_Expense FROM #Selections)))'
      #9#9#9#9#9#9#9'   '#9#9#9'  '
      #9#9#9'   begin'#9#9
      '               insert into #TempData ('
      #9#9#9#9#9#9#9'_Count'
      #9#9#9#9#9#9#9', ID'
      #9#9#9#9#9#9#9', pkey'
      #9#9#9#9#9#9#9', Summa'
      #9#9#9#9#9#9#9', FreeSumma               '
      #9#9#9#9#9#9#9', _Depart '
      #9#9#9#9#9#9#9', Depart '
      #9#9#9#9#9#9#9', _Agent '
      #9#9#9#9#9#9#9', Agent '
      #9#9#9#9#9#9#9', _DocType '
      #9#9#9#9#9#9#9', DocType '
      #9#9#9#9#9#9#9', DocNum'
      #9#9#9#9#9#9#9', _DocDate '
      #9#9#9#9#9#9#9', DocDate '
      #9#9#9#9#9#9#9', _PayType '
      #9#9#9#9#9#9#9', PayType '
      #9#9#9#9#9#9#9', _Worker '
      #9#9#9#9#9#9#9', Worker '
      #9#9#9#9#9#9#9', _Expense '
      #9#9#9#9#9#9#9', Expense'
      #9#9#9#9#9#9#9', Description'
      #9#9#9#9#9#9#9', _Summa'
      #9#9#9#9#9#9#9', _FreeSumma   '#9
      #9#9#9#9#9#9#9')  '
      #9#9#9#9'values   (     0, @id, @pkey '
      #9#9#9#9#9#9#9#9', @_Summa  '
      #9#9#9#9#9#9#9#9', @_FreeSumma'
      #9#9#9#9#9#9#9#9', @_Depart '
      #9#9#9#9#9#9#9#9', @Depart '
      #9#9#9#9#9#9#9#9', @_Agent '
      #9#9#9#9#9#9#9#9', @Agent '
      #9#9#9#9#9#9#9#9', @_DocType '
      #9#9#9#9#9#9#9#9', @DocType '
      #9#9#9#9#9#9#9#9', @DocNum'
      #9#9#9#9#9#9#9#9', datediff(d, @DateStart, @DocDate)  '
      #9#9#9#9#9#9#9#9', @DocDate '
      #9#9#9#9#9#9#9#9', @_PayType '
      #9#9#9#9#9#9#9#9', @PayType '
      #9#9#9#9#9#9#9#9', @_Worker '
      #9#9#9#9#9#9#9#9', @Worker '
      #9#9#9#9#9#9#9#9', @_Expense '
      #9#9#9#9#9#9#9#9', @Expense'
      #9#9#9#9#9#9#9#9', @Description'
      #9#9#9#9#9#9#9#9', 0'
      #9#9#9#9#9#9#9#9', 0 '#9#9#9#9#9#9#9#9#9
      #9#9#9#9')'
      #9#9#9#9'  SET @Cnt'#9#9#9'= @Cnt'#9#9#9'+ 1; '
      #9#9#9#9'  SET @Summa'#9#9'= @Summa'#9#9'+ @_Summa; '
      #9#9#9#9'  SET @FreeSumma'#9'= @FreeSumma'#9'+ @_FreeSumma;'#9#9#9'   '
      #9#9#9'   end'
      #9#9'   end'
      #9#9'   if (@Cnt > 0)'
      #9#9#9'insert into #TempData  '
      #9#9#9#9#9#9'  values  (  @Cnt,  NULL,  NULL '
      #9#9#9#9#9#9#9#9', @Summa  '
      #9#9#9#9#9#9#9#9', @FreeSumma'
      #9#9#9#9#9#9#9#9', NULL '
      #9#9#9#9#9#9#9#9', NULL '
      #9#9#9#9#9#9#9#9', @_Agent '
      #9#9#9#9#9#9#9#9', @Agent '
      #9#9#9#9#9#9#9#9', NULL '
      #9#9#9#9#9#9#9#9', NULL '
      #9#9#9#9#9#9#9#9', NULL '
      #9#9#9#9#9#9#9#9', NULL '
      #9#9#9#9#9#9#9#9', NULL '
      #9#9#9#9#9#9#9#9', NULL '
      #9#9#9#9#9#9#9#9', NULL '
      #9#9#9#9#9#9#9#9', NULL '
      #9#9#9#9#9#9#9#9', NULL '
      #9#9#9#9#9#9#9#9', NULL'
      #9#9#9#9#9#9#9#9', NULL'
      #9#9#9#9#9#9#9#9', NULL'
      #9#9#9#9#9#9#9#9', @Summa  '
      #9#9#9#9#9#9#9#9', @FreeSumma'#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'  '
      #9#9#9#9#9#9'   )'
      #9#9#9#9#9#9'   '#9#9'   '
      #9'  close CS1;'
      #9'  deallocate CS1;  '#9#9'   '
      '     end'
      '   end'
      '  close CS;'
      '  deallocate CS;  '
      '  '
      '  /*'
      '    s_Agent int NULL'
      ', s_DocType int NULL'
      ', s_DocNum int NULL'
      ', s_DocDate int NULL'
      ', s_PayType int NULL'
      ', s_Worker int NULL'
      ', s_Expense int NULL'
      '  */'
      '  '
      '  select * from #TempData'
      'WHERE'
      '  (@OnlyTotals = 0) or (_Count>0) '
      'order by _key')
    ReadOnly = True
    Filtered = True
    OnFilterRecord = quDebtFilterRecord
    Left = 536
    Top = 225
    object quDebt_key: TIntegerField
      FieldName = '_key'
    end
    object quDebt_Count: TIntegerField
      FieldName = '_Count'
    end
    object quDebtID: TIntegerField
      FieldName = 'ID'
    end
    object quDebtpkey: TStringField
      FieldName = 'pkey'
      Size = 15
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
    object quDebt_FreeSumma: TFloatField
      FieldName = '_FreeSumma'
    end
    object quDebt_DocDate: TIntegerField
      FieldName = '_DocDate'
    end
    object quDebt_Summa: TFloatField
      FieldName = '_Summa'
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
      '55534520574f524b'
      ''
      '4445434c415245'
      ''
      '2040705f646174655f62656720536d616c6c4461746554696d65'
      '2c40705f646174655f656e6420536d616c6c4461746554696d65'
      '2c404461746553746172742020536d616c6c4461746554696d65'
      '2c4044697361626c654578636c7573696f6e20626974'
      '2c404f6e6c79546f74616c7320626974'
      ''
      '2d2d5345542040705f646174655f626567203d202730312e30332e3230313727'
      '5345542040705f646174655f626567203d202730312e30312e3139303027'
      
        '5345542040705f646174655f656e64203d204441544541444428442c20312c20' +
        '47455444415445282929'
      '5345542040446174655374617274203d202730312e30312e3230303027'
      '534554204044697361626c654578636c7573696f6e203d2030'
      '53455420404f6e6c79546f74616c73203d2030'
      ''
      '2d2d44524f50205441424c45202353656c656374696f6e73'
      '424547494e205452592020'
      '435245415445205441424c45202353656c656374696f6e73'
      '2820'
      '2020735f44657061727420696e74204e554c4c'
      '2c20735f4167656e7420696e74204e554c4c'
      '2c20735f446f635479706520696e74204e554c4c'
      '2c20735f446f634e756d20696e74204e554c4c'
      '2c20735f446f634461746520696e74204e554c4c'
      '2c20735f5061795479706520696e74204e554c4c'
      '2c20735f576f726b657220696e74204e554c4c'
      '2c20735f457870656e736520696e74204e554c4c'
      '293b2020'
      '454e44205452592020'
      '424547494e204341544348'
      '5452554e43415445205441424c45202353656c656374696f6e73'
      '454e442043415443483b20'
      '20'
      
        '494e5345525420494e544f202353656c656374696f6e732056616c756573282d' +
        '312c202d312c202d312c202d312c202d312c202d312c202d312c202d3129'
      ''
      '2d2d44524f50205441424c45202354656d7044617461'
      '424547494e205452592020'
      '435245415445205441424c45202354656d7044617461'
      '2820'
      '5f6b657920696e7420206964656e7469747928312c31292c'
      '5f436f756e7420696e742c'
      '494420696e742c'
      '706b6579207661726368617228313529'
      '2c2053756d6d6120646563696d616c2832302c203429'
      '2c204672656553756d6d6120646563696d616c2832302c203429'
      '2c205f44657061727420696e74'
      '2c20446570617274207661726368617228333029'
      '2c205f4167656e7420736d616c6c696e74204e4f54204e554c4c'
      '2c204167656e74207661726368617228333029'
      '2c205f446f635479706520696e74'
      '2c20446f63547970652076617263686172283130323429'
      '2c20446f634e756d20696e74'
      '2c205f446f634461746520696e74'
      '2c20446f634461746520736d616c6c6461746574696d65'
      '2c205f5061795479706520736d616c6c696e74'
      '2c205061795479706520766172636861722835313229'
      '2c205f576f726b657220696e74'
      '2c20576f726b6572207661726368617228333029'
      '2c205f457870656e736520696e74'
      '2c20457870656e7365207661726368617228353029'
      '2c204465736372697074696f6e20766172636861722832303029'
      '2c205f53756d6d6120646563696d616c2832302c203429'
      '2c205f4672656553756d6d6120646563696d616c2832302c203429'
      '293b2020'
      '454e44205452592020'
      '424547494e204341544348'
      '5452554e43415445205441424c45202354656d7044617461'
      '454e442043415443483b20'
      ''
      ''
      '2d2d53454c454354'
      '2d2d2020506f73744e6f204153205f4167656e74'
      '2d2d2c2053756d6d61'
      '2d2d2c204672656553756d6d61'
      '2d2d2046524f4d2064626f2e565f4c6973745f656e746974792061'
      
        '2d2d57484552452044617465456e74697479206265747765656e2040705f6461' +
        '74655f62656720616e642040705f646174655f656e64'
      '2d2d616e6420506f73744e6f3c3e3930'
      '2d2d616e64202828612e746970206e6f7420696e20'
      
        '2d2d2873656c656374205469704e6f2066726f6d204c6973744d696e75735061' +
        '796d656e74466f724a6f75726e616c4f66457870656e73657320776865726520' +
        '436865636b4d696e7573203d203129206f7220612e746970206973206e6f7420' +
        '6e756c6c202929'
      ''
      '534554204e4f434f554e54204f46463b'
      '20206465636c61726520'
      '2020202040436e7420696e742c'
      '2020202040506f73744e6f20696e74'
      '2020202c40506f73744e616d65207661726368617228343029'
      '2020202c2040696420696e74'
      '2020202c2040706b6579207661726368617228313529'
      '2c2020405f53756d6d6120646563696d616c2832302c203629'
      '2c2020405f4672656553756d6d6120646563696d616c2831382c20362920'
      '2c204053756d6d6120646563696d616c2832302c203429'
      '2c20404672656553756d6d6120646563696d616c2832302c203429'
      '2c20405f44657061727420696e74'
      '2c2040446570617274207661726368617228333029'
      '2c20405f4167656e7420736d616c6c696e74'
      '2c20404167656e74207661726368617228333029'
      '2c20405f446f635479706520696e74'
      '2c2040446f63547970652076617263686172283130323429'
      '2c2040446f634e756d20696e74'
      '2c20405f446f634461746520696e74'
      '2c2040446f634461746520736d616c6c6461746574696d65'
      '2c20405f5061795479706520736d616c6c696e74'
      '2c20405061795479706520766172636861722835313229'
      '2c20405f576f726b657220696e74'
      '2c2040576f726b6572207661726368617228333029'
      '2c20405f457870656e736520696e74'
      '2c2040457870656e7365207661726368617228353029'
      '2c20404465736372697074696f6e20766172636861722832303029'
      '09202020'
      
        '20206465636c61726520435320637572736f72207363726f6c6c206c6f63616c' +
        '20666f72202020'
      '090953454c454354'
      '090964697374696e637420506f73744e6f2c20506f73744e616d6520'
      '09092046524f4d2064626f2e565f4c6973745f656e746974792061'
      
        '090957484552452044617465456e74697479206265747765656e2040705f6461' +
        '74655f62656720616e642040705f646174655f656e64'
      
        '0909616e64204142532869736e756c6c284672656553756d6d612c203029293e' +
        '302e303035'
      
        '0920616e642028284044697361626c654578636c7573696f6e3d3129206f7220' +
        '286e6f742028506f73744e6f20696e20'
      
        '09202873656c65637420506f73744e6f2066726f6d204c6973744d696e757350' +
        '6f7374466f724465626974206c6d7020776865726520'
      
        '09092028506f73744e6f203d206c6d702e506f73744e6f2920616e6420286c6d' +
        '702e436865636b4d696e75733d312929292929'
      '09616e64'
      
        '09092020284558495354532853454c45435420312046524f4d202353656c6563' +
        '74696f6e7320574845524520735f4167656e743d2d3129204f5220'
      
        '0909202028506f73744e6f20494e202853454c45435420735f4167656e742046' +
        '524f4d202353656c656374696f6e73292929090920'
      '0909616e64202828612e746970206e6f7420696e20'
      
        '09092873656c656374205469704e6f2066726f6d204c6973744d696e75735061' +
        '796d656e74466f724a6f75726e616c4f66457870656e73657320776865726520' +
        '436865636b4d696e7573203d203129206f7220612e746970206973206e6f7420' +
        '6e756c6c202929'
      '09092d2d3c6f726465722062792023313e'
      '09096f7264657220627920506f73744e616d65'
      ''
      '20206f70656e2043533b'
      '20207768696c6520313d203120'
      '202020626567696e'
      '20202020206665746368206e6578742066726f6d20435320'
      '202020202020696e746f2040506f73744e6f2c2040506f73744e616d65'
      '202020202020'
      '2020202020205345542040436e740909093d20302020'
      '202020202020534554204053756d6d6109093d20302e3020'
      '20202020202053455420404672656553756d6d61093d20302e3020'
      '202020202020'
      
        '202020202020696620404046455443485f535441545553203c3e203020627265' +
        '616b'
      '20202020202020626567696e202020202020'
      
        '090920206465636c6172652043533120637572736f72207363726f6c6c206c6f' +
        '63616c20666f72202020'
      '090953454c454354'
      '09092020202049442c20706b6579'
      
        '0909092c202d666163746f725f646972656374696f6e2a53756d6d6120617320' +
        '53756d6d61'
      
        '0909092c202d666163746f725f646972656374696f6e2a4672656553756d6d61' +
        '206173204672656553756d6d61090920202020'
      '0909092c206f7464656c4e6f204153205f446570617274'
      '0909092c204f7464656c4e616d6520415320446570617274'
      '0909092c20506f73744e6f204153205f4167656e74'
      '0909092c20506f73744e616d65204153204167656e74'
      '0909092c20656e746974795f747970655f6964204153205f446f6354797065'
      '0909092c20656e746974795f747970655f6e616d6520415320446f6354797065'
      '0909092c204e6f6d20415320446f634e756d'
      '0909092c2044617465456e7469747920617320446f6344617465'
      '0909092c20546970204153205f50617954797065'
      '0909092c205469704e616d652041532050617954797065'
      '0909092c20536f747275644e6f204153205f576f726b6572'
      '0909092c20536f747275644e616d6520415320576f726b6572'
      '0909092c205669644e6f204153205f457870656e7365'
      '0909092c205669644e616d6520415320457870656e7365'
      '0909092c204465736372697074696f6e0909202020'
      '09092046524f4d2064626f2e565f4c6973745f656e746974792061'
      
        '090957484552452044617465456e74697479206265747765656e2040705f6461' +
        '74655f62656720616e642040705f646174655f656e64'
      
        '0909616e6420284142532869736e756c6c284672656553756d6d612c20302929' +
        '3e302e303035290909'
      '0909616e642028506f73744e6f3d40506f73744e6f29'
      '0909616e64'
      
        '090909092020284558495354532853454c45435420312046524f4d202353656c' +
        '656374696f6e7320574845524520735f4465706172743d2d3129204f5220'
      
        '090909092020286f7464656c4e6f20494e202853454c45435420735f44657061' +
        '72742046524f4d202353656c656374696f6e73292929'
      '09090909414e44'
      
        '090909092020284558495354532853454c45435420312046524f4d202353656c' +
        '656374696f6e7320574845524520735f446f63547970653d2d3129204f5220'
      
        '09090909202028656e746974795f747970655f696420494e202853454c454354' +
        '20735f446f63547970652046524f4d202353656c656374696f6e73292929'
      '09090909414e44'
      
        '090909092020284558495354532853454c45435420312046524f4d202353656c' +
        '656374696f6e7320574845524520735f446f634e756d3d2d3129204f5220'
      
        '090909092020284e6f6d20494e202853454c45435420735f446f634e756d2046' +
        '524f4d202353656c656374696f6e73292929'
      '09090909414e44'
      
        '090909092020284558495354532853454c45435420312046524f4d202353656c' +
        '656374696f6e7320574845524520735f446f63446174653d2d3129204f5220'
      
        '09090909202028646174656469666628642c20404461746553746172742c2044' +
        '617465456e746974792920494e202853454c45435420735f446f634461746520' +
        '46524f4d202353656c656374696f6e73292929'
      '09090909414e44'
      
        '090909092020284558495354532853454c45435420312046524f4d202353656c' +
        '656374696f6e7320574845524520735f506179547970653d2d3129204f5220'
      
        '0909090920202854697020494e202853454c45435420735f5061795479706520' +
        '46524f4d202353656c656374696f6e73292929'
      '09090909414e44'
      
        '090909092020284558495354532853454c45435420312046524f4d202353656c' +
        '656374696f6e7320574845524520735f576f726b65723d2d3129204f5220'
      
        '09090909202028536f747275644e6f20494e202853454c45435420735f576f72' +
        '6b65722046524f4d202353656c656374696f6e73292929'
      '09090909414e44'
      
        '090909092020284558495354532853454c45435420312046524f4d202353656c' +
        '656374696f6e7320574845524520735f457870656e73653d2d3129204f5220'
      
        '090909092020285669644e6f20494e202853454c45435420735f457870656e73' +
        '652046524f4d202353656c656374696f6e732929290909'
      '0909616e64202828612e746970206e6f7420696e20'
      
        '09092873656c656374205469704e6f2066726f6d204c6973744d696e75735061' +
        '796d656e74466f724a6f75726e616c4f66457870656e73657320776865726520' +
        '436865636b4d696e7573203d2031292929'
      '09092d2d3c6f726465722062792023323e'
      
        '09096f72646572206279204f7464656c4e616d652c20656e746974795f747970' +
        '655f6e616d652c2044617465456e74697479'
      '0909'
      '090920206f70656e204353313b'
      '090920207768696c6520313d3120'
      '0909202020626567696e'
      '090909206665746368206e6578742066726f6d2043533120'
      '0909092020696e746f204069642c2040706b657920'
      '09090909202020202c20405f53756d6d612020'
      '09090909202020202c20405f4672656553756d6d61'
      '09090909092c20405f44657061727420'
      '09090909092c204044657061727420'
      '09090909092c20405f4167656e7420'
      '09090909092c20404167656e7420'
      '09090909092c20405f446f635479706520'
      '09090909092c2040446f635479706520'
      '09090909092c2040446f634e756d'
      '09090909092c2040446f634461746520'
      '09090909092c20405f5061795479706520'
      '09090909092c20405061795479706520'
      '09090909092c20405f576f726b657220'
      '09090909092c2040576f726b657220'
      '09090909092c20405f457870656e736520'
      '09090909092c2040457870656e7365'
      '09090909092c20404465736372697074696f6e200909092020'
      '0909202020202020'
      
        '0909092020696620404046455443485f535441545553203c3e20302062726561' +
        '6b'
      '0909092020'
      
        '09090920202d2d53455420405f446f6344617465203d20646174656469666628' +
        '642c20404461746553746172742c2040446f63446174652920'
      '090909092d2d49460909092020'
      '09090909'
      
        '090909092d2d2020284558495354532853454c45435420312046524f4d202353' +
        '656c656374696f6e7320574845524520735f4465706172743d2d3129204f5220'
      
        '090909092d2d202028405f44657061727420494e202853454c45435420735f44' +
        '65706172742046524f4d202353656c656374696f6e73292929'
      '090909092d2d414e44'
      
        '090909092d2d2020284558495354532853454c45435420312046524f4d202353' +
        '656c656374696f6e7320574845524520735f446f63547970653d2d3129204f52' +
        '20'
      
        '090909092d2d202028405f446f635479706520494e202853454c45435420735f' +
        '446f63547970652046524f4d202353656c656374696f6e73292929'
      '090909092d2d414e44'
      
        '090909092d2d2020284558495354532853454c45435420312046524f4d202353' +
        '656c656374696f6e7320574845524520735f446f634e756d3d2d3129204f5220'
      
        '090909092d2d20202840446f634e756d20494e202853454c45435420735f446f' +
        '634e756d2046524f4d202353656c656374696f6e73292929'
      '090909092d2d414e44'
      
        '090909092d2d2020284558495354532853454c45435420312046524f4d202353' +
        '656c656374696f6e7320574845524520735f446f63446174653d2d3129204f52' +
        '20'
      
        '090909092d2d202028405f446f634461746520494e202853454c45435420735f' +
        '446f63446174652046524f4d202353656c656374696f6e73292929'
      '090909092d2d414e44'
      
        '090909092d2d2020284558495354532853454c45435420312046524f4d202353' +
        '656c656374696f6e7320574845524520735f506179547970653d2d3129204f52' +
        '20'
      
        '090909092d2d202028405f5061795479706520494e202853454c45435420735f' +
        '506179547970652046524f4d202353656c656374696f6e73292929'
      '090909092d2d414e44'
      
        '090909092d2d2020284558495354532853454c45435420312046524f4d202353' +
        '656c656374696f6e7320574845524520735f576f726b65723d2d3129204f5220'
      
        '090909092d2d202028405f576f726b657220494e202853454c45435420735f57' +
        '6f726b65722046524f4d202353656c656374696f6e73292929'
      '090909092d2d414e44'
      
        '090909092d2d2020284558495354532853454c45435420312046524f4d202353' +
        '656c656374696f6e7320574845524520735f457870656e73653d2d3129204f52' +
        '20'
      
        '090909092d2d202028405f457870656e736520494e202853454c45435420735f' +
        '457870656e73652046524f4d202353656c656374696f6e73292929'
      '090909090909092020200909092020'
      '090909202020626567696e0909'
      
        '202020202020202020202020202020696e7365727420696e746f202354656d70' +
        '446174612028'
      '090909090909095f436f756e74'
      '090909090909092c204944'
      '090909090909092c20706b6579'
      '090909090909092c2053756d6d61'
      
        '090909090909092c204672656553756d6d612020202020202020202020202020' +
        '20'
      '090909090909092c205f44657061727420'
      '090909090909092c2044657061727420'
      '090909090909092c205f4167656e7420'
      '090909090909092c204167656e7420'
      '090909090909092c205f446f635479706520'
      '090909090909092c20446f635479706520'
      '090909090909092c20446f634e756d'
      '090909090909092c205f446f634461746520'
      '090909090909092c20446f634461746520'
      '090909090909092c205f5061795479706520'
      '090909090909092c205061795479706520'
      '090909090909092c205f576f726b657220'
      '090909090909092c20576f726b657220'
      '090909090909092c205f457870656e736520'
      '090909090909092c20457870656e7365'
      '090909090909092c204465736372697074696f6e'
      '090909090909092c205f53756d6d61'
      '090909090909092c205f4672656553756d6d6120202009'
      '09090909090909292020'
      
        '0909090976616c756573202020282020202020302c204069642c2040706b6579' +
        '20'
      '09090909090909092c20405f53756d6d612020'
      '09090909090909092c20405f4672656553756d6d61'
      '09090909090909092c20405f44657061727420'
      '09090909090909092c204044657061727420'
      '09090909090909092c20405f4167656e7420'
      '09090909090909092c20404167656e7420'
      '09090909090909092c20405f446f635479706520'
      '09090909090909092c2040446f635479706520'
      '09090909090909092c2040446f634e756d'
      
        '09090909090909092c20646174656469666628642c2040446174655374617274' +
        '2c2040446f6344617465292020'
      '09090909090909092c2040446f634461746520'
      '09090909090909092c20405f5061795479706520'
      '09090909090909092c20405061795479706520'
      '09090909090909092c20405f576f726b657220'
      '09090909090909092c2040576f726b657220'
      '09090909090909092c20405f457870656e736520'
      '09090909090909092c2040457870656e7365'
      '09090909090909092c20404465736372697074696f6e'
      '09090909090909092c2030'
      '09090909090909092c203020090909090909090909'
      '0909090929'
      '0909090920205345542040436e740909093d2040436e740909092b20313b20'
      
        '090909092020534554204053756d6d6109093d204053756d6d6109092b20405f' +
        '53756d6d613b20'
      
        '09090909202053455420404672656553756d6d61093d20404672656553756d6d' +
        '61092b20405f4672656553756d6d613b090909202020'
      '090909202020656e64'
      '0909202020656e64'
      '09092020206966202840436e74203e203029'
      '090909696e7365727420696e746f202354656d70446174612020'
      
        '090909090909202076616c756573202028202040436e742c20204e554c4c2c20' +
        '204e554c4c20'
      '09090909090909092c204053756d6d612020'
      '09090909090909092c20404672656553756d6d61'
      '09090909090909092c204e554c4c20'
      '09090909090909092c204e554c4c20'
      '09090909090909092c20405f4167656e7420'
      '09090909090909092c20404167656e7420'
      '09090909090909092c204e554c4c20'
      '09090909090909092c204e554c4c20'
      '09090909090909092c204e554c4c20'
      '09090909090909092c204e554c4c20'
      '09090909090909092c204e554c4c20'
      '09090909090909092c204e554c4c20'
      '09090909090909092c204e554c4c20'
      '09090909090909092c204e554c4c20'
      '09090909090909092c204e554c4c20'
      '09090909090909092c204e554c4c'
      '09090909090909092c204e554c4c'
      '09090909090909092c204e554c4c'
      '09090909090909092c204053756d6d612020'
      
        '09090909090909092c20404672656553756d6d61090909090909090909090909' +
        '090909092020'
      '09090909090920202029'
      '0909090909092020200909202020'
      '092020636c6f7365204353313b'
      '0920206465616c6c6f63617465204353313b20200909202020'
      '2020202020656e64'
      '202020656e64'
      '2020636c6f73652043533b'
      '20206465616c6c6f636174652043533b2020'
      '2020'
      '20202f2a'
      '20202020735f4167656e7420696e74204e554c4c'
      '2c20735f446f635479706520696e74204e554c4c'
      '2c20735f446f634e756d20696e74204e554c4c'
      '2c20735f446f634461746520696e74204e554c4c'
      '2c20735f5061795479706520696e74204e554c4c'
      '2c20735f576f726b657220696e74204e554c4c'
      '2c20735f457870656e736520696e74204e554c4c'
      '20202a2f'
      '2020'
      '202073656c656374202a2066726f6d202354656d7044617461'
      '5748455245'
      
        '202028404f6e6c79546f74616c73203d203029206f7220285f436f756e743e30' +
        '2920'
      '6f72646572206279205f6b6579')
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
    Capacity = 28
    Macros = <>
    Left = 136
    Top = 321
    InternalVer = 1
    StrData = (
      ''
      '7cc4e0f2e020e4eeeaf3ece5edf2e03a2032302e30332e323031377c'
      'caeeecefe5edf1e0f6e8ff20e4e5ede5e6edfbf520f1f0e5e4f1f2e2'
      
        'cef1edeee2edfbe520e4e0ededfbe520e2fbe2eee4fff2f1ff20e220f2e0e1eb' +
        'e8f6f320e220f6e5edf2f0e520f4eef0ecfb2e'
      
        'd0e5e4e0eaf2eef020e7ede0f7e5ede8e920f4e8ebfcf2f0e02028e220eff0e0' +
        'e2eeec20e2e5f0f5ede5ec20f3e3ebf320f4eef0ecfb29'
      
        'efeee7e2eeebffe5f220e7e0e4e0f2fc20ede0e1eef020e7ede0f7e5ede8e920' +
        'e4ebff20f1eeeef2e2e5f2f1f2e2f3fef9e8f520f1f2eeebe1f6eee22c'
      
        'eaeef2eef0fbe520e1f3e4f3f220f3f7e8f2fbe2e0f2fcf1ff20eff0e820efee' +
        'f1f2f0eee5ede8e820f2e0e1ebe8f6fb2e'
      
        'd1f3ecece8f0eee2e0ede8e520f1f2e0f2e5e920f0e0f1f5eee4eee220e820e4' +
        'eef5eee4eee220e2fbefeeebedffe5f2f1ff20'
      
        'eef2e4e5ebfcedee20efee20eae0e6e4eeecf320eaeeedf2f0e0e3e5edf2f32e' +
        '20c8f2eee3eee2e0ff20f1f2f0eeeae02c20e220eaeef2eef0eee9'
      
        'e2fbe2eee4e8f2f1ff20f2eeebfceaee20e8ecff20eaeeedf2f0e0e3e5edf2e0' +
        '2c20f1f3ececfb20e4eeeaf3ece5edf2e020e820f1f3ececfb20e4eeebe3e02c'
      
        'eef2ece5f7e0e5f2f1ff20f6e2e5f2eeec2e20d1eef0f2e8f0eee2eae020f1f2' +
        'f0eeea2028f1ede0f7e0ebe020efee20eef2e4e5ebf320eff0eee4e0e62c20'
      
        'e7e0f2e5ec20efee20e2e8e4f320e4eeeaf3ece5edf2e02c20e7e0f2e5ec20ef' +
        'ee20e4e0f2e520e4eeeaf3ece5edf2e02920e2fbefeeebedffe5f2f1ff20'
      'f2e0eae6e520e2edf3f2f0e820e4e0ededfbf520eaeeedf2f0e0e3e5edf2e02e'
      
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
      '')
  end
end
