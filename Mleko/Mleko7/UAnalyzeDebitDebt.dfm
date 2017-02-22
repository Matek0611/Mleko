inherited frmAnalyzeDebitDebt: TfrmAnalyzeDebitDebt
  Left = 267
  Top = 119
  Width = 1013
  Height = 604
  Caption = #1040#1085#1072#1083#1080#1079' '#1076#1077#1073#1080#1090#1086#1088#1089#1082#1086#1081' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 505
    Width = 997
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnRefresh: TButton
      Left = 136
      Top = 8
      Width = 107
      Height = 25
      Action = acRefresh
      TabOrder = 0
    end
    object btnExportToExcel: TButton
      Left = 280
      Top = 8
      Width = 129
      Height = 25
      Action = acExportToExcel
      TabOrder = 1
    end
  end
  object Panel3: TPanel [1]
    Left = 0
    Top = 0
    Width = 997
    Height = 505
    Align = alClient
    TabOrder = 1
    object spl3: TSplitter
      Left = 1
      Top = 138
      Width = 995
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object dbgDebts: TDBGridEh
      Left = 1
      Top = 142
      Width = 995
      Height = 362
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
      OnKeyDown = dbgDebtsKeyDown
      OnKeyPress = dbgDebtsKeyPress
      OnTitleBtnClick = dbgDebtsTitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'OtdelName'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1054#1090#1076#1077#1083' '#1087#1088#1086#1076#1072#1078
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'VidName'
          Footers = <>
          Tag = 1
          Title.Alignment = taCenter
          Title.Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
          Title.TitleButton = True
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'SotrudName'
          Footers = <>
          Tag = 2
          Title.Alignment = taCenter
          Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
          Title.TitleButton = True
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'BuhName'
          Footers = <>
          Tag = 3
          Title.Alignment = taCenter
          Title.Caption = #1041#1091#1093'. '#1090#1080#1087
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'AgentName'
          Footers = <>
          Tag = 4
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          Title.TitleButton = True
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'Summa'
          Footer.DisplayFormat = '0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Tag = -1
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'SummaDolg'
          Footer.DisplayFormat = '0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Tag = -1
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072' '#1076#1086#1083#1075#1072
          Title.TitleButton = True
          Width = 80
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'DateNakl'
          Footers = <>
          Tag = 8
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083'.'
          Title.TitleButton = True
          Width = 100
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'DateOpl'
          Footers = <>
          Tag = 9
          Title.Alignment = taCenter
          Title.Caption = #1044#1072#1090#1072' '#1086#1087#1083'.'
          Title.TitleButton = True
          Width = 100
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'DayExp'
          Footers = <>
          Tag = 10
          Title.Alignment = taCenter
          Title.Caption = #1044#1083#1080#1090'. '#1087#1088'.'
          Title.TitleButton = True
          Width = 50
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'NomNakl'
          Footers = <>
          Tag = 5
          Title.Alignment = taCenter
          Title.Caption = #1053#1086#1084'. '#1085#1072#1082#1083'.'
          Title.TitleButton = True
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'PostAddress'
          Footers = <>
          Tag = 6
          Title.Alignment = taCenter
          Title.Caption = #1040#1076#1088#1077#1089
          Title.TitleButton = True
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'DocTypeName'
          Footers = <>
          Tag = 7
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087' '#1076#1086#1082'-'#1090#1072
          Title.TitleButton = True
          Width = 100
        end>
    end
    object pnlControls: TPanel
      Left = 1
      Top = 1
      Width = 995
      Height = 137
      Align = alTop
      BevelInner = bvLowered
      Constraints.MaxHeight = 200
      Constraints.MinHeight = 100
      TabOrder = 1
      DesignSize = (
        995
        137)
      object spl1: TSplitter
        Left = 308
        Top = 2
        Width = 4
        Height = 133
        Beveled = True
      end
      object spl2: TSplitter
        Left = 449
        Top = 2
        Width = 4
        Height = 133
        Beveled = True
      end
      object vleDate: TValueListEditor
        Tag = 1
        Left = 2
        Top = 2
        Width = 306
        Height = 133
        Hint = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099' '#1074#1088#1091#1095#1085#1091#1102' '#1080#1083#1080' '#1080#1079' '#1076#1080#1072#1083#1086#1075#1072
        Align = alLeft
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
          177)
      end
      object vleSelections: TValueListEditor
        Left = 453
        Top = 2
        Width = 538
        Height = 133
        Anchors = [akLeft, akTop, akRight, akBottom]
        FixedCols = 1
        PopupMenu = pmSelections
        Strings.Strings = (
          #1054#1090#1076#1077#1083#1099' '#1087#1088#1086#1076#1072#1078'='
          #1042#1080#1076#1099' '#1090#1086#1074#1072#1088#1072'='
          #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'='
          #1041#1091#1093'. '#1090#1080#1087#1099'='
          #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099'='
          #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081'='
          #1040#1076#1088#1077#1089#1072'='
          #1058#1080#1087#1099' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'='
          #1044#1072#1090#1099' '#1085#1072#1082#1083#1072#1076#1085#1086#1081'='
          #1044#1072#1090#1099' '#1086#1087#1083#1072#1090#1099'='
          #1044#1083#1080#1090'. '#1087#1088#1086#1089#1088#1086#1095#1082#1080'=')
        TabOrder = 1
        TitleCaptions.Strings = (
          #1055#1072#1088#1072#1084#1077#1090#1088
          #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103)
        OnDblClick = vleSelectionsDblClick
        OnEditButtonClick = vleSelectionsEditButtonClick
        ColWidths = (
          123
          392)
        RowHeights = (
          18
          18
          18
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
        Left = 312
        Top = 2
        Width = 137
        Height = 133
        Align = alLeft
        Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086
        PopupMenu = pmExpansion
        TabOrder = 2
        object clbExpansions: TCheckListBox
          Left = 2
          Top = 15
          Width = 133
          Height = 116
          OnClickCheck = clbExpansionsClickCheck
          Align = alClient
          ItemHeight = 13
          Items.Strings = (
            #1054#1090#1076#1077#1083#1091' '#1087#1088#1086#1076#1072#1078
            #1042#1080#1076#1091' '#1090#1086#1074#1072#1088#1072
            #1057#1086#1090#1088#1091#1076#1085#1080#1082#1091
            #1041#1091#1093'. '#1090#1080#1087#1091
            #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
            #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
            #1040#1076#1088#1077#1089#1091
            #1058#1080#1087#1091' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            #1044#1072#1090#1077' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
            #1044#1072#1090#1077' '#1086#1087#1083#1072#1090#1099
            #1044#1083#1080#1090'. '#1087#1088#1086#1089#1088#1086#1095#1082#1080)
          PopupMenu = pmExpansion
          TabOrder = 0
        end
      end
    end
  end
  object sbStatus: TStatusBar [2]
    Left = 0
    Top = 546
    Width = 997
    Height = 19
    Panels = <
      item
        Text = #1047#1072#1087#1080#1089#1077#1081':'
        Width = 120
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
  end
  object dsDebt: TMSDataSource
    DataSet = quDebt
    Left = 376
    Top = 185
  end
  object quDebt: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '-- Source file is: D:\?ieia\Iie aieoiaiou\SQL Server Management ' +
        'Studio\Projects\NR_MyDesign_02.sql'
      '-- Param file is: D:\Projects\MyProgs\DBUtils\Work_02-3.prm'
      ''
      'USE WORK'
      ''
      'DECLARE'
      ''
      '@p_SectorId int'
      ',@p_is_exp int'
      ',@p_is_only_firm int'
      ',@p_date_beg SmallDateTime'
      ',@p_date_end SmallDateTime'
      ',@p_our_firm int'
      ',@p_is_expr_tovar int'
      ', @VeryOldDay int'
      ', @DateStart date'
      ''
      'SET @p_date_beg = '#39'01.01.1900'#39
      'SET @p_date_end = '#39'22.02.2017'#39
      'SET @DateStart = '#39'01.01.2000'#39
      'SET @VeryOldDay = -10000'
      ''
      'BEGIN TRY  '
      'CREATE TABLE #Expansions'
      '( '
      '--  ID Int Identity(1,1),'
      '  e_OtdelNo int NULL'
      ', e_VidNo int NULL'
      ', e_SotrudNo int NULL'
      ', e_Buh int NULL'
      ', e_PostNo int NULL'
      ', e_NaklNo int NULL'
      ', e_AddressID int NULL'
      ', e_DOC_TYPE_ID int NULL'
      ', e_DayNakl int NULL'
      ', e_DayOpl int NULL'
      ', e_DayExp int NULL'
      ');  '
      'END TRY  '
      'BEGIN CATCH'
      'TRUNCATE TABLE #Expansions'
      'END CATCH; '
      ' '
      'INSERT INTO #Expansions Values(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)'
      ''
      'BEGIN TRY  '
      'CREATE TABLE #Selections'
      '( '
      '--  ID Int Identity(1,1),'
      '  s_OtdelNo int NULL'
      ', s_VidNo int NULL'
      ', s_SotrudNo int NULL'
      ', s_Buh int NULL'
      ', s_PostNo int NULL'
      ', s_NaklNo int NULL'
      ', s_AddressID int NULL'
      ', s_DOC_TYPE_ID int NULL'
      ', s_DayNakl int NULL'
      ', s_DayOpl int NULL'
      ', s_DayExp int NULL'
      ');  '
      'END TRY  '
      'BEGIN CATCH'
      'TRUNCATE TABLE #Selections'
      'END CATCH; '
      ' '
      
        'INSERT INTO #Selections Values(-1, -1, -1, -1, -1, -1, -1, -1, -' +
        '1, -1, @VeryOldDay)'
      ''
      'BEGIN TRY  '
      'CREATE TABLE #AllTypes'
      '( '
      '--  ID Int Identity(1,1),'
      '  a_OtdelNo varchar(20)'
      ', a_VidNo varchar(20)'
      ', a_SotrudNo varchar(20)'
      ', a_Buh varchar(20)'
      ', a_PostNo varchar(20)'
      ', a_NaklNo varchar(20)'
      ', a_AddressID varchar(20)'
      ', a_DOC_TYPE_ID varchar(20)'
      ', a_DayNakl varchar(20)'
      ', a_DayOpl varchar(20)'
      ', a_DayExp varchar(20)'
      ');  '
      'END TRY  '
      'BEGIN CATCH'
      'TRUNCATE TABLE #AllTypes'
      'END CATCH; '
      ' '
      'INSERT INTO #AllTypes Values('
      #39#1042#1089#1077' '#1086#1090#1076#1077#1083#1099#39', '#39#1042#1089#1077' '#1074#1080#1076#1099#39', '#39#1042#1089#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080#39', '
      #39#1042#1089#1077' '#1073#1091#1093'. '#1090#1080#1087#1099#39', '#39#1042#1089#1077' '#1082'/'#1072#1075#1077#1085#1090#1099#39', '#39#1042#1089#1077' '#1085#1072#1082#1083'.'#39', '#39#1042#1089#1077' '#1072#1076#1088#1077#1089#1072#39', '
      #39#1042#1089#1077' '#1076#1086#1082'-'#1090#1099#39', '#39#1042#1089#1077' '#1076#1072#1090#1099' '#1085#1072#1082#1083'.'#39', '#39#1042#1089#1077' '#1076#1072#1090#1099' '#1086#1087#1083'.'#39', '#39#1042#1089#1077' '#1087#1088'.'#39')'
      ''
      'SELECT'
      
        '  (CASE WHEN (T4.OtdelNo = -1) THEN (select a_OtdelNo from #AllT' +
        'ypes) ELSE '
      '  --CAST(T4.OtdelNo as varchar(20))'
      '  (SELECT OtdelName from VidOtdel where OtdelNo = T4.OtdelNo) '
      '  END) AS OtdelName'
      
        ', (CASE WHEN (T4.VidNo = -1) THEN (select a_VidNo from #AllTypes' +
        ') ELSE '
      '--CAST(T4.VidNo as varchar(20)) END)'
      '(select VidName from VidTov where VidNo = T4.VidNo) '
      'END) AS VidName'
      
        ', (CASE WHEN (T4.SotrudNo = -1) THEN (select a_SotrudNo from #Al' +
        'lTypes) ELSE '
      '--CAST(T4.SotrudNo as varchar(20)) '
      '(select SotrudName from Sotrud where SotrudNo = T4.SotrudNo)'
      'END) AS SotrudName'
      
        ', (CASE WHEN (T4.Buh = -1) THEN (select a_Buh from #AllTypes) EL' +
        'SE '
      '--CAST(T4.Buh as varchar(20))'
      '(select Buh_type_name from d_buh_type where Buh = T4.Buh) '
      'END) AS BuhName'
      
        ', (CASE WHEN (T4.PostNo = -1) THEN (select a_PostNo from #AllTyp' +
        'es) ELSE '
      '(select Name from Post where PostNo = T4.PostNo) '
      '--CAST(T4.PostNo as varchar(20)) '
      'END) AS AgentName'
      ', (select Nom from NaklR nr where (nr.NaklNo = T4.NaklNo) '
      '--and (nr.NomReturn is NULL)'
      ') as _NomNakl '
      
        ', (CASE WHEN (T4.NaklNo = -1) THEN (select a_NaklNo from #AllTyp' +
        'es) ELSE '
      '--CAST(T4.NaklNo as varchar(20))'
      'CAST('
      '(select Nom from NaklR nr where (nr.NaklNo = T4.NaklNo)) '
      '--and (nr.NomReturn is NULL)'
      'as varchar(20))  '
      'END) AS NomNakl'
      
        ', (CASE WHEN (T4.AddressID = -1) THEN (select a_AddressID from #' +
        'AllTypes) ELSE '
      '--CAST(T4.AddressID as varchar(20)) '
      '(select Address from AddressPost where ID = T4.AddressID)  '
      'END) AS PostAddress'
      
        ', (CASE WHEN (T4.DOC_TYPE_ID = -1) THEN (select a_DOC_TYPE_ID fr' +
        'om #AllTypes) ELSE '
      '--CAST(T4.DOC_TYPE_ID as varchar(20)) '
      '(select d.name from d_doc_type d where ID = T4.DOC_TYPE_ID)  '
      'END) AS DocTypeName'
      ', T4.Summa AS Summa'
      ', T4.SummaDolg AS SummaDolg'
      ', T4.DayNakl as _DateNakl'
      
        ', (CASE WHEN (T4.DayNakl = -1) THEN (select a_DayNakl from #AllT' +
        'ypes) ELSE '
      '--CAST(T4.DayNakl as varchar(20))'
      'CONVERT(varchar(12), DATEADD(dd, T4.DayNakl, @DateStart), 104) '
      'END) AS DateNakl'
      ', T4.DayOpl as _DateOpl'
      
        ', (CASE WHEN (T4.DayOpl = -1) THEN (select a_DayOpl from #AllTyp' +
        'es) ELSE '
      '--CAST(T4.DayOpl as varchar(20)) END)'
      'CONVERT(varchar(12), DATEADD(dd, T4.DayOpl, @DateStart), 104) '
      'END) AS DateOpl'
      ', T4.DayExp as _DayExp'
      
        ', (CASE WHEN (T4.DayExp = @VeryOldDay) THEN (select a_DayExp fro' +
        'm #AllTypes) ELSE '
      'CAST(T4.DayExp as varchar(20)) END) AS DayExp'
      ''
      'FROM ('
      'SELECT'
      '  T3.OtdelNo AS OtdelNo'
      ', T3.VidNo AS VidNo'
      ', T3.SotrudNo AS SotrudNo'
      ', T3.Buh AS Buh'
      ', T3.PostNo AS PostNo'
      ', T3.NaklNo AS NaklNo'
      ', T3.AddressID AS AddressID'
      ', T3.DOC_TYPE_ID AS DOC_TYPE_ID'
      ', SUM(T3.Summa) AS Summa'
      ', SUM(T3.SummaDolg) AS SummaDolg'
      ', T3.DayNakl AS DayNakl'
      ', T3.DayOpl AS DayOpl'
      ', T3.DayExp AS DayExp'
      ''
      'FROM ('
      'SELECT'
      
        '  (CASE WHEN (1 IN (SELECT e_OtdelNo FROM #Expansions)) THEN T2.' +
        'OtdelNo ELSE -1 END) AS OtdelNo'
      
        ', (CASE WHEN (1 IN (SELECT e_VidNo FROM #Expansions)) THEN T2.Vi' +
        'dNo ELSE -1 END) AS VidNo'
      
        ', (CASE WHEN (1 IN (SELECT e_SotrudNo FROM #Expansions)) THEN T2' +
        '.SotrudNo ELSE -1 END) AS SotrudNo'
      
        ', (CASE WHEN (1 IN (SELECT e_Buh FROM #Expansions)) THEN T2.Buh ' +
        'ELSE -1 END) AS Buh'
      
        ', (CASE WHEN (1 IN (SELECT e_PostNo FROM #Expansions)) THEN T2.P' +
        'ostNo ELSE -1 END) AS PostNo'
      
        ', (CASE WHEN (1 IN (SELECT e_NaklNo FROM #Expansions)) THEN T2.N' +
        'aklNo ELSE -1 END) AS NaklNo'
      
        ', (CASE WHEN (1 IN (SELECT e_AddressID FROM #Expansions)) THEN T' +
        '2.AddressID ELSE -1 END) AS AddressID'
      
        ', (CASE WHEN (1 IN (SELECT e_DOC_TYPE_ID FROM #Expansions)) THEN' +
        ' T2.DOC_TYPE_ID ELSE -1 END) AS DOC_TYPE_ID'
      ', T2.Summa AS Summa'
      ', T2.SummaDolg AS SummaDolg'
      
        ', (CASE WHEN (1 IN (SELECT e_DayNakl FROM #Expansions)) THEN T2.' +
        'DayNakl ELSE -1 END) AS DayNakl'
      
        ', (CASE WHEN (1 IN (SELECT e_DayOpl FROM #Expansions)) THEN T2.D' +
        'ayOpl ELSE -1 END) AS DayOpl'
      
        ', (CASE WHEN (1 IN (SELECT e_DayExp FROM #Expansions)) THEN T2.D' +
        'ayExp ELSE @VeryOldDay END) AS DayExp'
      ''
      'FROM ('
      'SELECT * FROM ('
      'select '
      '  nr.OtdelNo'
      ', h3.VidNo '
      ', nr.SotrudNo'
      ', nr.Buh'
      ', nr.PostNo'
      ', h3.NaklNo '
      ', ap.ID as AddressID '
      ', h3.DOC_TYPE_ID'
      ', h3.Summa'
      ', h3.SummaDolg'
      ', datediff(d, @DateStart, nr.DateNakl) as DayNakl'
      ', datediff(d, @DateStart, nr.DateOpl) as DayOpl'
      ', datediff(dd, nr.DateOpl, @p_date_end) as DayExp'
      ''
      'from'
      'Naklr nr with (nolock) inner join'
      ' ('
      'select '
      '     h2.NaklNo'
      '     , h2.VidNo'
      '     , h2.DOC_TYPE_ID'
      ',  CAST(SUM(SummaDolg) as decimal(18, 2)) as SummaDolg '
      ', CAST(SUM(Summa) as decimal(18, 2)) as Summa'
      'from ('
      'select'
      '        t.VidNo'
      '      , h1.NaklNo '
      '     , ds.DOC_TYPE_ID'
      '     , (ds.PaymentPrice*ds.QTY) as Summa'
      
        '     , (ds.PaymentPrice*ds.QTY)*h1.SummaDolg/h1.Summa as SummaDo' +
        'lg'
      '     --, t.NameTovarShort'
      '     from NaklR h1 with (nolock)          '
      
        '    --left join l_post_set_artgroup_delay ld on ld.set_article_g' +
        'roup_id = h1.set_article_group_id and ld.postno = h1.postno and ' +
        'ld.BUH = h1.Buh'
      
        #9'left join DSPEC ds on (ds.NaklNo = h1.NaklNo) and (ds.DOC_TYPE_' +
        'ID=12) --?anoiaiay oiaa?iay iaeeaaiay'
      #9'left join Tovar t on (t.TovarNo = ds.ARTICLE_ID)'
      
        '     where (h1.vidnaklno=1 and h1.SummaDolg>0) --and (h1.NaklNo=' +
        '401149)'
      '     and (h1.DateNakl between @p_date_beg and @p_date_end)'
      '     ) h2'
      '     group by      '
      '     h2.NaklNo'
      '     , h2.VidNo'
      '     , h2.DOC_TYPE_ID'
      '     ) h3'
      '     on nr.NaklNo=h3.NaklNo'
      '     left outer join Post p on p.PostNo=nr.PostNo '
      
        '     left outer join AddressPost ap on ap.AddressNo=nr.AddressNo' +
        ' and ap.PostNo=nr.PostNo'
      '     where not h3.SummaDolg is NULL  '
      ') AS T1'
      ''
      'WHERE'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_OtdelNo=-1) OR (Otde' +
        'lNo IN (SELECT s_OtdelNo FROM #Selections)))'
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_VidNo=-1) OR (VidNo ' +
        'IN (SELECT s_VidNo FROM #Selections)))'
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_SotrudNo=-1) OR (Sot' +
        'rudNo IN (SELECT s_SotrudNo FROM #Selections)))'
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_Buh=-1) OR (Buh IN (' +
        'SELECT s_Buh FROM #Selections)))'
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_PostNo=-1) OR (PostN' +
        'o IN (SELECT s_PostNo FROM #Selections)))'
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_NaklNo=-1) OR (NaklN' +
        'o IN (SELECT s_NaklNo FROM #Selections)))'
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_AddressID=-1) OR (Ad' +
        'dressID IN (SELECT s_AddressID FROM #Selections)))'
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_DOC_TYPE_ID=-1) OR (' +
        'DOC_TYPE_ID IN (SELECT s_DOC_TYPE_ID FROM #Selections)))'
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_DayNakl=-1) OR (DayN' +
        'akl IN (SELECT s_DayNakl FROM #Selections)))'
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_DayOpl=-1) OR (DayOp' +
        'l IN (SELECT s_DayOpl FROM #Selections)))'
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_DayExp=@VeryOldDay) ' +
        'OR (DayExp IN (SELECT s_DayExp FROM #Selections)))'
      ') AS T2'
      ') AS T3'
      'GROUP BY'
      '  T3.OtdelNo'
      ', T3.VidNo'
      ', T3.SotrudNo'
      ', T3.Buh'
      ', T3.PostNo'
      ', T3.NaklNo'
      ', T3.AddressID'
      ', T3.DOC_TYPE_ID'
      ', T3.DayNakl'
      ', T3.DayOpl'
      ', T3.DayExp'
      ') AS T4'
      ''
      'ORDER BY OtdelName, VidName, SotrudName, _NomNakl')
    BeforeOpen = quDebtBeforeOpen
    Left = 536
    Top = 225
    object quDebtOtdelName: TStringField
      FieldName = 'OtdelName'
      ReadOnly = True
      Size = 30
    end
    object quDebtVidName: TStringField
      FieldName = 'VidName'
      ReadOnly = True
      Size = 30
    end
    object quDebtSotrudName: TStringField
      FieldName = 'SotrudName'
      ReadOnly = True
      Size = 30
    end
    object quDebtBuhName: TStringField
      FieldName = 'BuhName'
      ReadOnly = True
    end
    object quDebtAgentName: TStringField
      FieldName = 'AgentName'
      ReadOnly = True
      Size = 30
    end
    object quDebt_NomNakl: TIntegerField
      FieldName = '_NomNakl'
      ReadOnly = True
    end
    object quDebtNomNakl: TStringField
      FieldName = 'NomNakl'
      ReadOnly = True
    end
    object quDebtPostAddress: TStringField
      FieldName = 'PostAddress'
      ReadOnly = True
      Size = 256
    end
    object quDebtDocTypeName: TStringField
      FieldName = 'DocTypeName'
      ReadOnly = True
      Size = 256
    end
    object quDebtSumma: TFloatField
      FieldName = 'Summa'
      ReadOnly = True
    end
    object quDebtSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      ReadOnly = True
    end
    object quDebt_DateNakl: TIntegerField
      FieldName = '_DateNakl'
      ReadOnly = True
    end
    object quDebtDateNakl: TStringField
      FieldName = 'DateNakl'
      ReadOnly = True
    end
    object quDebt_DateOpl: TIntegerField
      FieldName = '_DateOpl'
      ReadOnly = True
    end
    object quDebtDateOpl: TStringField
      FieldName = 'DateOpl'
      ReadOnly = True
    end
    object quDebt_DayExp: TIntegerField
      FieldName = '_DayExp'
      ReadOnly = True
    end
    object quDebtDayExp: TStringField
      FieldName = 'DayExp'
      ReadOnly = True
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
    Capacity = 285
    Macros = <>
    Left = 456
    Top = 257
    InternalVer = 1
    StrData = (
      ''
      
        '2d2d20536f757263652066696c652069733a20443a5c3f696569615c49696520' +
        '6169656f6961696f755c53514c20536572766572204d616e6167656d656e7420' +
        '53747564696f5c50726f6a656374735c4e525f4d7944657369676e5f30322e73' +
        '716c'
      
        '2d2d20506172616d2066696c652069733a20443a5c50726f6a656374735c4d79' +
        '50726f67735c44425574696c735c576f726b5f30322d332e70726d'
      ''
      '55534520574f524b'
      ''
      '4445434c415245'
      ''
      '40705f536563746f72496420696e74'
      '2c40705f69735f65787020696e74'
      '2c40705f69735f6f6e6c795f6669726d20696e74'
      '2c40705f646174655f62656720536d616c6c4461746554696d65'
      '2c40705f646174655f656e6420536d616c6c4461746554696d65'
      '2c40705f6f75725f6669726d20696e74'
      '2c40705f69735f657870725f746f76617220696e74'
      '2c2040566572794f6c6444617920696e74'
      '2c20404461746553746172742064617465'
      ''
      '5345542040705f646174655f626567203d202730312e30312e3139303027'
      '5345542040705f646174655f656e64203d202732322e30322e3230313727'
      '5345542040446174655374617274203d202730312e30312e3230303027'
      '5345542040566572794f6c64446179203d202d3130303030'
      ''
      '424547494e205452592020'
      '435245415445205441424c452023457870616e73696f6e73'
      '2820'
      '2d2d2020494420496e74204964656e7469747928312c31292c'
      '2020655f4f7464656c4e6f20696e74204e554c4c'
      '2c20655f5669644e6f20696e74204e554c4c'
      '2c20655f536f747275644e6f20696e74204e554c4c'
      '2c20655f42756820696e74204e554c4c'
      '2c20655f506f73744e6f20696e74204e554c4c'
      '2c20655f4e616b6c4e6f20696e74204e554c4c'
      '2c20655f41646472657373494420696e74204e554c4c'
      '2c20655f444f435f545950455f494420696e74204e554c4c'
      '2c20655f4461794e616b6c20696e74204e554c4c'
      '2c20655f4461794f706c20696e74204e554c4c'
      '2c20655f44617945787020696e74204e554c4c'
      '293b2020'
      '454e44205452592020'
      '424547494e204341544348'
      '5452554e43415445205441424c452023457870616e73696f6e73'
      '454e442043415443483b20'
      '20'
      
        '494e5345525420494e544f2023457870616e73696f6e732056616c7565732831' +
        '2c20312c20312c20312c20312c20312c20312c20312c20312c20312c203129'
      ''
      '424547494e205452592020'
      '435245415445205441424c45202353656c656374696f6e73'
      '2820'
      '2d2d2020494420496e74204964656e7469747928312c31292c'
      '2020735f4f7464656c4e6f20696e74204e554c4c'
      '2c20735f5669644e6f20696e74204e554c4c'
      '2c20735f536f747275644e6f20696e74204e554c4c'
      '2c20735f42756820696e74204e554c4c'
      '2c20735f506f73744e6f20696e74204e554c4c'
      '2c20735f4e616b6c4e6f20696e74204e554c4c'
      '2c20735f41646472657373494420696e74204e554c4c'
      '2c20735f444f435f545950455f494420696e74204e554c4c'
      '2c20735f4461794e616b6c20696e74204e554c4c'
      '2c20735f4461794f706c20696e74204e554c4c'
      '2c20735f44617945787020696e74204e554c4c'
      '293b2020'
      '454e44205452592020'
      '424547494e204341544348'
      '5452554e43415445205441424c45202353656c656374696f6e73'
      '454e442043415443483b20'
      '20'
      
        '494e5345525420494e544f202353656c656374696f6e732056616c756573282d' +
        '312c202d312c202d312c202d312c202d312c202d312c202d312c202d312c202d' +
        '312c202d312c2040566572794f6c6444617929'
      ''
      '424547494e205452592020'
      '435245415445205441424c452023416c6c5479706573'
      '2820'
      '2d2d2020494420496e74204964656e7469747928312c31292c'
      '2020615f4f7464656c4e6f207661726368617228323029'
      '2c20615f5669644e6f207661726368617228323029'
      '2c20615f536f747275644e6f207661726368617228323029'
      '2c20615f427568207661726368617228323029'
      '2c20615f506f73744e6f207661726368617228323029'
      '2c20615f4e616b6c4e6f207661726368617228323029'
      '2c20615f416464726573734944207661726368617228323029'
      '2c20615f444f435f545950455f4944207661726368617228323029'
      '2c20615f4461794e616b6c207661726368617228323029'
      '2c20615f4461794f706c207661726368617228323029'
      '2c20615f446179457870207661726368617228323029'
      '293b2020'
      '454e44205452592020'
      '424547494e204341544348'
      '5452554e43415445205441424c452023416c6c5479706573'
      '454e442043415443483b20'
      '20'
      '494e5345525420494e544f2023416c6c54797065732056616c75657328'
      
        '27c2f1e520eef2e4e5ebfb272c2027c2f1e520e2e8e4fb272c2027c2f1e520f1' +
        'eef2f0f3e4ede8eae8272c20'
      
        '27c2f1e520e1f3f52e20f2e8effb272c2027c2f1e520ea2fe0e3e5edf2fb272c' +
        '2027c2f1e520edeeec2e20ede0eaeb2e272c2027c2f1e520e0e4f0e5f1e0272c' +
        '20'
      
        '27c2f1e520e4eeea2df2fb272c2027c2f1e520e4e0f2fb20ede0eaeb2e272c20' +
        '27c2f1e520e4e0f2fb20eeefeb2e272c2027c2f1e520eff02e2729'
      ''
      '53454c454354'
      
        '20202843415345205748454e202854342e4f7464656c4e6f203d202d31292054' +
        '48454e202873656c65637420615f4f7464656c4e6f2066726f6d2023416c6c54' +
        '797065732920454c534520'
      
        '20202d2d434153542854342e4f7464656c4e6f20617320766172636861722832' +
        '302929'
      
        '20202853454c454354204f7464656c4e616d652066726f6d205669644f746465' +
        '6c207768657265204f7464656c4e6f203d2054342e4f7464656c4e6f2920'
      '2020454e4429204153204f7464656c4e616d65'
      
        '2c202843415345205748454e202854342e5669644e6f203d202d312920544845' +
        '4e202873656c65637420615f5669644e6f2066726f6d2023416c6c5479706573' +
        '2920454c534520'
      
        '2d2d434153542854342e5669644e6f2061732076617263686172283230292920' +
        '454e4429'
      
        '2873656c656374205669644e616d652066726f6d20566964546f762077686572' +
        '65205669644e6f203d2054342e5669644e6f2920'
      '454e4429204153205669644e616d65'
      
        '2c202843415345205748454e202854342e536f747275644e6f203d202d312920' +
        '5448454e202873656c65637420615f536f747275644e6f2066726f6d2023416c' +
        '6c54797065732920454c534520'
      
        '2d2d434153542854342e536f747275644e6f2061732076617263686172283230' +
        '292920'
      
        '2873656c65637420536f747275644e616d652066726f6d20536f747275642077' +
        '6865726520536f747275644e6f203d2054342e536f747275644e6f29'
      '454e442920415320536f747275644e616d65'
      
        '2c202843415345205748454e202854342e427568203d202d3129205448454e20' +
        '2873656c65637420615f4275682066726f6d2023416c6c54797065732920454c' +
        '534520'
      '2d2d434153542854342e42756820617320766172636861722832302929'
      
        '2873656c656374204275685f747970655f6e616d652066726f6d20645f627568' +
        '5f7479706520776865726520427568203d2054342e4275682920'
      '454e4429204153204275684e616d65'
      
        '2c202843415345205748454e202854342e506f73744e6f203d202d3129205448' +
        '454e202873656c65637420615f506f73744e6f2066726f6d2023416c6c547970' +
        '65732920454c534520'
      
        '2873656c656374204e616d652066726f6d20506f737420776865726520506f73' +
        '744e6f203d2054342e506f73744e6f2920'
      
        '2d2d434153542854342e506f73744e6f20617320766172636861722832302929' +
        '20'
      '454e4429204153204167656e744e616d65'
      
        '2c202873656c656374204e6f6d2066726f6d204e616b6c52206e722077686572' +
        '6520286e722e4e616b6c4e6f203d2054342e4e616b6c4e6f2920'
      '2d2d616e6420286e722e4e6f6d52657475726e206973204e554c4c29'
      '29206173205f4e6f6d4e616b6c20'
      
        '2c202843415345205748454e202854342e4e616b6c4e6f203d202d3129205448' +
        '454e202873656c65637420615f4e616b6c4e6f2066726f6d2023416c6c547970' +
        '65732920454c534520'
      '2d2d434153542854342e4e616b6c4e6f20617320766172636861722832302929'
      '4341535428'
      
        '2873656c656374204e6f6d2066726f6d204e616b6c52206e7220776865726520' +
        '286e722e4e616b6c4e6f203d2054342e4e616b6c4e6f292920'
      '2d2d616e6420286e722e4e6f6d52657475726e206973204e554c4c29'
      '6173207661726368617228323029292020'
      '454e4429204153204e6f6d4e616b6c'
      
        '2c202843415345205748454e202854342e416464726573734944203d202d3129' +
        '205448454e202873656c65637420615f4164647265737349442066726f6d2023' +
        '416c6c54797065732920454c534520'
      
        '2d2d434153542854342e41646472657373494420617320766172636861722832' +
        '30292920'
      
        '2873656c65637420416464726573732066726f6d2041646472657373506f7374' +
        '207768657265204944203d2054342e416464726573734944292020'
      '454e442920415320506f737441646472657373'
      
        '2c202843415345205748454e202854342e444f435f545950455f4944203d202d' +
        '3129205448454e202873656c65637420615f444f435f545950455f4944206672' +
        '6f6d2023416c6c54797065732920454c534520'
      
        '2d2d434153542854342e444f435f545950455f49442061732076617263686172' +
        '283230292920'
      
        '2873656c65637420642e6e616d652066726f6d20645f646f635f747970652064' +
        '207768657265204944203d2054342e444f435f545950455f4944292020'
      '454e442920415320446f63547970654e616d65'
      '2c2054342e53756d6d612041532053756d6d61'
      '2c2054342e53756d6d61446f6c672041532053756d6d61446f6c67'
      '2c2054342e4461794e616b6c206173205f446174654e616b6c'
      
        '2c202843415345205748454e202854342e4461794e616b6c203d202d31292054' +
        '48454e202873656c65637420615f4461794e616b6c2066726f6d2023416c6c54' +
        '797065732920454c534520'
      
        '2d2d434153542854342e4461794e616b6c206173207661726368617228323029' +
        '29'
      
        '434f4e564552542876617263686172283132292c20444154454144442864642c' +
        '2054342e4461794e616b6c2c2040446174655374617274292c203130342920'
      '454e442920415320446174654e616b6c'
      '2c2054342e4461794f706c206173205f446174654f706c'
      
        '2c202843415345205748454e202854342e4461794f706c203d202d3129205448' +
        '454e202873656c65637420615f4461794f706c2066726f6d2023416c6c547970' +
        '65732920454c534520'
      
        '2d2d434153542854342e4461794f706c20617320766172636861722832302929' +
        '20454e4429'
      
        '434f4e564552542876617263686172283132292c20444154454144442864642c' +
        '2054342e4461794f706c2c2040446174655374617274292c203130342920'
      '454e442920415320446174654f706c'
      '2c2054342e446179457870206173205f446179457870'
      
        '2c202843415345205748454e202854342e446179457870203d2040566572794f' +
        '6c6444617929205448454e202873656c65637420615f4461794578702066726f' +
        '6d2023416c6c54797065732920454c534520'
      
        '434153542854342e446179457870206173207661726368617228323029292045' +
        '4e442920415320446179457870'
      ''
      '46524f4d2028'
      '53454c454354'
      '202054332e4f7464656c4e6f204153204f7464656c4e6f'
      '2c2054332e5669644e6f204153205669644e6f'
      '2c2054332e536f747275644e6f20415320536f747275644e6f'
      '2c2054332e42756820415320427568'
      '2c2054332e506f73744e6f20415320506f73744e6f'
      '2c2054332e4e616b6c4e6f204153204e616b6c4e6f'
      '2c2054332e41646472657373494420415320416464726573734944'
      '2c2054332e444f435f545950455f494420415320444f435f545950455f4944'
      '2c2053554d2854332e53756d6d61292041532053756d6d61'
      '2c2053554d2854332e53756d6d61446f6c67292041532053756d6d61446f6c67'
      '2c2054332e4461794e616b6c204153204461794e616b6c'
      '2c2054332e4461794f706c204153204461794f706c'
      '2c2054332e44617945787020415320446179457870'
      ''
      '46524f4d2028'
      '53454c454354'
      
        '20202843415345205748454e20283120494e202853454c45435420655f4f7464' +
        '656c4e6f2046524f4d2023457870616e73696f6e732929205448454e2054322e' +
        '4f7464656c4e6f20454c5345202d3120454e4429204153204f7464656c4e6f'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f566964' +
        '4e6f2046524f4d2023457870616e73696f6e732929205448454e2054322e5669' +
        '644e6f20454c5345202d3120454e4429204153205669644e6f'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f536f74' +
        '7275644e6f2046524f4d2023457870616e73696f6e732929205448454e205432' +
        '2e536f747275644e6f20454c5345202d3120454e442920415320536f74727564' +
        '4e6f'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f427568' +
        '2046524f4d2023457870616e73696f6e732929205448454e2054322e42756820' +
        '454c5345202d3120454e442920415320427568'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f506f73' +
        '744e6f2046524f4d2023457870616e73696f6e732929205448454e2054322e50' +
        '6f73744e6f20454c5345202d3120454e442920415320506f73744e6f'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f4e616b' +
        '6c4e6f2046524f4d2023457870616e73696f6e732929205448454e2054322e4e' +
        '616b6c4e6f20454c5345202d3120454e4429204153204e616b6c4e6f'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f416464' +
        '7265737349442046524f4d2023457870616e73696f6e732929205448454e2054' +
        '322e41646472657373494420454c5345202d3120454e44292041532041646472' +
        '6573734944'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f444f43' +
        '5f545950455f49442046524f4d2023457870616e73696f6e732929205448454e' +
        '2054322e444f435f545950455f494420454c5345202d3120454e442920415320' +
        '444f435f545950455f4944'
      '2c2054322e53756d6d612041532053756d6d61'
      '2c2054322e53756d6d61446f6c672041532053756d6d61446f6c67'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f446179' +
        '4e616b6c2046524f4d2023457870616e73696f6e732929205448454e2054322e' +
        '4461794e616b6c20454c5345202d3120454e4429204153204461794e616b6c'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f446179' +
        '4f706c2046524f4d2023457870616e73696f6e732929205448454e2054322e44' +
        '61794f706c20454c5345202d3120454e4429204153204461794f706c'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f446179' +
        '4578702046524f4d2023457870616e73696f6e732929205448454e2054322e44' +
        '617945787020454c53452040566572794f6c6444617920454e44292041532044' +
        '6179457870'
      ''
      '46524f4d2028'
      '53454c454354202a2046524f4d2028'
      '73656c65637420'
      '20206e722e4f7464656c4e6f'
      '2c2068332e5669644e6f20'
      '2c206e722e536f747275644e6f'
      '2c206e722e427568'
      '2c206e722e506f73744e6f'
      '2c2068332e4e616b6c4e6f20'
      '2c2061702e49442061732041646472657373494420'
      '2c2068332e444f435f545950455f4944'
      '2c2068332e53756d6d61'
      '2c2068332e53756d6d61446f6c67'
      
        '2c20646174656469666628642c20404461746553746172742c206e722e446174' +
        '654e616b6c29206173204461794e616b6c'
      
        '2c20646174656469666628642c20404461746553746172742c206e722e446174' +
        '654f706c29206173204461794f706c'
      
        '2c2064617465646966662864642c206e722e446174654f706c2c2040705f6461' +
        '74655f656e642920617320446179457870'
      ''
      '66726f6d'
      
        '4e616b6c72206e72207769746820286e6f6c6f636b2920696e6e6572206a6f69' +
        '6e'
      '2028'
      '73656c65637420'
      '202020202068322e4e616b6c4e6f'
      '20202020202c2068322e5669644e6f'
      '20202020202c2068322e444f435f545950455f4944'
      
        '2c2020434153542853554d2853756d6d61446f6c672920617320646563696d61' +
        '6c2831382c203229292061732053756d6d61446f6c6720'
      
        '2c20434153542853554d2853756d6d612920617320646563696d616c2831382c' +
        '203229292061732053756d6d61'
      '66726f6d2028'
      '73656c656374'
      '2020202020202020742e5669644e6f'
      '2020202020202c2068312e4e616b6c4e6f20'
      '20202020202c2064732e444f435f545950455f4944'
      
        '20202020202c202864732e5061796d656e7450726963652a64732e5154592920' +
        '61732053756d6d61'
      
        '20202020202c202864732e5061796d656e7450726963652a64732e515459292a' +
        '68312e53756d6d61446f6c672f68312e53756d6d612061732053756d6d61446f' +
        '6c67'
      '20202020202d2d2c20742e4e616d65546f76617253686f7274'
      
        '202020202066726f6d204e616b6c52206831207769746820286e6f6c6f636b29' +
        '20202020202020202020'
      
        '202020202d2d6c656674206a6f696e206c5f706f73745f7365745f6172746772' +
        '6f75705f64656c6179206c64206f6e206c642e7365745f61727469636c655f67' +
        '726f75705f6964203d2068312e7365745f61727469636c655f67726f75705f69' +
        '6420616e64206c642e706f73746e6f203d2068312e706f73746e6f20616e6420' +
        '6c642e425548203d2068312e427568'
      
        '096c656674206a6f696e204453504543206473206f6e202864732e4e616b6c4e' +
        '6f203d2068312e4e616b6c4e6f2920616e64202864732e444f435f545950455f' +
        '49443d313229202d2d3f616e6f6961696179206f6961613f6961792069616565' +
        '6161696179'
      
        '096c656674206a6f696e20546f7661722074206f6e2028742e546f7661724e6f' +
        '203d2064732e41525449434c455f494429'
      
        '20202020207768657265202868312e7669646e616b6c6e6f3d3120616e642068' +
        '312e53756d6d61446f6c673e3029202d2d616e64202868312e4e616b6c4e6f3d' +
        '34303131343929'
      
        '2020202020616e64202868312e446174654e616b6c206265747765656e204070' +
        '5f646174655f62656720616e642040705f646174655f656e6429'
      '202020202029206832'
      '202020202067726f7570206279202020202020'
      '202020202068322e4e616b6c4e6f'
      '20202020202c2068322e5669644e6f'
      '20202020202c2068322e444f435f545950455f4944'
      '202020202029206833'
      '20202020206f6e206e722e4e616b6c4e6f3d68332e4e616b6c4e6f'
      
        '20202020206c656674206f75746572206a6f696e20506f73742070206f6e2070' +
        '2e506f73744e6f3d6e722e506f73744e6f20'
      
        '20202020206c656674206f75746572206a6f696e2041646472657373506f7374' +
        '206170206f6e2061702e416464726573734e6f3d6e722e416464726573734e6f' +
        '20616e642061702e506f73744e6f3d6e722e506f73744e6f'
      
        '20202020207768657265206e6f742068332e53756d6d61446f6c67206973204e' +
        '554c4c2020'
      '29204153205431'
      ''
      '5748455245'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f4f7464656c4e6f3d2d3129204f5220284f746465' +
        '6c4e6f20494e202853454c45435420735f4f7464656c4e6f2046524f4d202353' +
        '656c656374696f6e73292929'
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f5669644e6f3d2d3129204f5220285669644e6f20' +
        '494e202853454c45435420735f5669644e6f2046524f4d202353656c65637469' +
        '6f6e73292929'
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f536f747275644e6f3d2d3129204f522028536f74' +
        '7275644e6f20494e202853454c45435420735f536f747275644e6f2046524f4d' +
        '202353656c656374696f6e73292929'
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f4275683d2d3129204f52202842756820494e2028' +
        '53454c45435420735f4275682046524f4d202353656c656374696f6e73292929'
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f506f73744e6f3d2d3129204f522028506f73744e' +
        '6f20494e202853454c45435420735f506f73744e6f2046524f4d202353656c65' +
        '6374696f6e73292929'
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f4e616b6c4e6f3d2d3129204f5220284e616b6c4e' +
        '6f20494e202853454c45435420735f4e616b6c4e6f2046524f4d202353656c65' +
        '6374696f6e73292929'
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f4164647265737349443d2d3129204f5220284164' +
        '6472657373494420494e202853454c45435420735f4164647265737349442046' +
        '524f4d202353656c656374696f6e73292929'
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f444f435f545950455f49443d2d3129204f522028' +
        '444f435f545950455f494420494e202853454c45435420735f444f435f545950' +
        '455f49442046524f4d202353656c656374696f6e73292929'
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f4461794e616b6c3d2d3129204f5220284461794e' +
        '616b6c20494e202853454c45435420735f4461794e616b6c2046524f4d202353' +
        '656c656374696f6e73292929'
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f4461794f706c3d2d3129204f5220284461794f70' +
        '6c20494e202853454c45435420735f4461794f706c2046524f4d202353656c65' +
        '6374696f6e73292929'
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f4461794578703d40566572794f6c644461792920' +
        '4f52202844617945787020494e202853454c45435420735f4461794578702046' +
        '524f4d202353656c656374696f6e73292929'
      '29204153205432'
      '29204153205433'
      '47524f5550204259'
      '202054332e4f7464656c4e6f'
      '2c2054332e5669644e6f'
      '2c2054332e536f747275644e6f'
      '2c2054332e427568'
      '2c2054332e506f73744e6f'
      '2c2054332e4e616b6c4e6f'
      '2c2054332e416464726573734944'
      '2c2054332e444f435f545950455f4944'
      '2c2054332e4461794e616b6c'
      '2c2054332e4461794f706c'
      '2c2054332e446179457870'
      '29204153205434'
      ''
      
        '4f52444552204259204f7464656c4e616d652c205669644e616d652c20536f74' +
        '7275644e616d652c205f4e6f6d4e616b6c')
  end
  object quSession: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT'
      '  (CASE WHEN EXISTS('
      #9'SELECT 1 FROM e_Session_params'
      #9'WHERE '
      #9'  UserNo = :UserNo and '
      #9'  owner_name = :OwnerName  and '
      #9'  param_name = :ParamName and '
      #9'  SPID=:SPID)'
      #9'THEN 1 ELSE 0 END) AS ParamValue')
    BeforeOpen = quDebtBeforeOpen
    Left = 672
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'UserNo'
        Value = 0
      end
      item
        DataType = ftString
        Name = 'OwnerName'
      end
      item
        DataType = ftString
        Name = 'ParamName'
      end
      item
        DataType = ftInteger
        Name = 'SPID'
        Value = 0
      end>
    object quSessionParamValue: TIntegerField
      FieldName = 'ParamValue'
      ReadOnly = True
    end
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
  end
  object pmDate: TPopupMenu
    Left = 200
    Top = 57
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
    Left = 560
    Top = 272
  end
end
