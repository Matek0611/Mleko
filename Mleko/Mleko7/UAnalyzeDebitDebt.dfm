inherited frmAnalyzeDebitDebt: TfrmAnalyzeDebitDebt
  Left = 15
  Top = 51
  Width = 1014
  Height = 707
  Caption = #1040#1085#1072#1083#1080#1079' '#1076#1077#1073#1080#1090#1086#1088#1089#1082#1086#1081' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
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
    object btnRefresh: TButton
      Left = 88
      Top = 8
      Width = 130
      Height = 25
      Action = acRefresh
      TabOrder = 0
    end
    object btnExportToExcel: TButton
      Left = 272
      Top = 8
      Width = 140
      Height = 25
      Action = acExportToExcel
      TabOrder = 1
    end
    object btnSettings: TButton
      Left = 448
      Top = 8
      Width = 130
      Height = 25
      Action = acGetSettingsDlg
      TabOrder = 2
      Visible = False
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
      Top = 138
      Width = 996
      Height = 4
      Cursor = crVSplit
      Align = alTop
      Beveled = True
    end
    object dbgDebts: TDBGridEh
      Left = 1
      Top = 142
      Width = 996
      Height = 465
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
          Color = 14737359
          EditButtons = <>
          FieldName = 'OtdelName'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1054#1090#1076#1077#1083' '#1087#1088#1086#1076#1072#1078
          Title.Color = 14737359
          Title.TitleButton = True
          Width = 100
        end
        item
          Color = 14737359
          EditButtons = <>
          FieldName = 'VidName'
          Footers = <>
          Tag = 1
          Title.Alignment = taCenter
          Title.Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
          Title.Color = 14737359
          Title.TitleButton = True
          Width = 150
        end
        item
          Color = 14737359
          EditButtons = <>
          FieldName = 'SotrudName'
          Footers = <>
          Tag = 2
          Title.Alignment = taCenter
          Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
          Title.Color = 14737359
          Title.TitleButton = True
          Width = 100
        end
        item
          Color = 14737359
          EditButtons = <>
          FieldName = 'BuhName'
          Footers = <>
          Tag = 3
          Title.Alignment = taCenter
          Title.Caption = #1041#1091#1093'. '#1090#1080#1087
          Title.Color = 14737359
          Title.TitleButton = True
          Width = 80
        end
        item
          Color = 14737359
          EditButtons = <>
          FieldName = 'AgentName'
          Footers = <>
          Tag = 4
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          Title.Color = 14737359
          Title.TitleButton = True
          Width = 150
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'Summa'
          Footer.DisplayFormat = '0.00'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtStaticText
          Footers = <>
          Tag = -1
          Title.Alignment = taCenter
          Title.Caption = #1057#1091#1084#1084#1072
          Title.TitleButton = True
          Width = 80
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'SummaDolg'
          Footer.DisplayFormat = '0.00'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtStaticText
          Footers = <>
          Tag = -2
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
          Color = 14737359
          EditButtons = <>
          FieldName = 'DayExp'
          Footers = <>
          Tag = 10
          Title.Alignment = taCenter
          Title.Caption = #1044#1083#1080#1090'. '#1087#1088'.'
          Title.Color = 14737359
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
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'CurHd'
          Footers = <>
          Tag = 11
          Title.Alignment = taCenter
          Title.Caption = #1042#1072#1083'. '#1086#1087#1083'.'
          Width = 50
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'CurAc'
          Footers = <>
          Tag = 12
          Title.Alignment = taCenter
          Title.Caption = #1042#1072#1083'. '#1091#1095'.'
          Width = 50
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'SumAc'
          Footer.DisplayFormat = '0.00'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtStaticText
          Footers = <>
          Tag = -3
          Title.Caption = #1057#1091#1084#1084#1072' '#1074' '#1042#1059
          Title.TitleButton = True
          Width = 80
        end
        item
          DisplayFormat = '0.00'
          EditButtons = <>
          FieldName = 'SumDAc'
          Footer.DisplayFormat = '0.00'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtStaticText
          Footers = <>
          Tag = -4
          Title.Caption = #1057#1091#1084#1084#1072' '#1076#1086#1083#1075#1072' '#1074' '#1042#1059
          Title.TitleButton = True
          Width = 80
        end>
    end
    object pnlControls: TPanel
      Left = 1
      Top = 1
      Width = 996
      Height = 137
      Align = alTop
      BevelInner = bvLowered
      Constraints.MaxHeight = 200
      Constraints.MinHeight = 100
      TabOrder = 1
      DesignSize = (
        996
        137)
      object Splitter1: TSplitter
        Left = 273
        Top = 2
        Width = 4
        Height = 133
        Beveled = True
      end
      object Splitter2: TSplitter
        Left = 449
        Top = 2
        Width = 4
        Height = 133
        Beveled = True
      end
      object vleSelections: TValueListEditor
        Left = 453
        Top = 2
        Width = 539
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
          #1044#1083#1080#1090'. '#1087#1088#1086#1089#1088#1086#1095#1082#1080'='
          #1042#1072#1083#1102#1090#1099' '#1086#1087#1083#1072#1090#1099'='
          #1042#1072#1083#1102#1090#1099' '#1091#1095#1077#1090#1072'=')
        TabOrder = 0
        TitleCaptions.Strings = (
          #1055#1072#1088#1072#1084#1077#1090#1088
          #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103)
        OnDblClick = vleSelectionsDblClick
        OnEditButtonClick = vleSelectionsEditButtonClick
        ColWidths = (
          123
          393)
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
          18
          18
          18)
      end
      object gbxExpansions: TGroupBox
        Left = 277
        Top = 2
        Width = 172
        Height = 133
        Align = alLeft
        Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086
        PopupMenu = pmExpansion
        TabOrder = 1
        object clbExpansions: TCheckListBox
          Left = 2
          Top = 15
          Width = 168
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
            #1044#1083#1080#1090'. '#1087#1088#1086#1089#1088#1086#1095#1082#1080
            #1042#1072#1083#1102#1090#1077' '#1086#1087#1083#1072#1090#1099
            #1042#1072#1083#1102#1090#1077' '#1091#1095#1077#1090#1072)
          PopupMenu = pmExpansion
          TabOrder = 0
          OnDblClick = clbExpansionsDblClick
        end
      end
      object pnlLeft: TPanel
        Left = 2
        Top = 2
        Width = 271
        Height = 133
        Align = alLeft
        BevelInner = bvLowered
        TabOrder = 2
        object vleDate: TValueListEditor
          Left = 2
          Top = 2
          Width = 267
          Height = 129
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
    Left = 376
    Top = 185
  end
  object quDebt: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
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
      ', @DisableExclusion bit'
      ', @UseColnPrice bit'
      ', @DisableZeroSumAcn int'
      ''
      'SET @p_date_beg = '#39'01.01.1900'#39
      'SET @p_date_end = '#39'08.03.2017'#39
      'SET @DateStart = '#39'01.01.2000'#39
      'SET @VeryOldDay = -10000'
      'SET @DisableExclusion = 0'
      'SET @DisableZeroSumAcn = 0'
      'SET @UseColnPrice = 0'
      ''
      '--DROP TABLE #Expansions'
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
      ', e_CurHd_ID int NULL '
      ', e_CurAc_ID int NULL '
      ');  '
      'END TRY  '
      'BEGIN CATCH'
      'TRUNCATE TABLE #Expansions'
      'END CATCH; '
      ' '
      
        'INSERT INTO #Expansions Values(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ' +
        '1, 1)'
      ''
      '--DROP TABLE #Selections'
      'BEGIN TRY  '
      'CREATE TABLE #Selections'
      '( '
      '  --ID Int Identity(1,1),'
      '  s_OtdelNo smallint NULL'
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
      ', s_CurHd_ID int NULL '
      ', s_CurAc_ID int NULL '
      ');  '
      'END TRY  '
      'BEGIN CATCH'
      'TRUNCATE TABLE #Selections'
      'END CATCH; '
      ' '
      
        'INSERT INTO #Selections Values(-1, -1, -1, -1, -1, -1, -1, -1, -' +
        '1, -1, -10000, -1, -1)'
      ''
      '--DROP TABLE #AllTypes'
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
      ', a_CurHd_ID varchar(20)'
      ', a_CurAc_ID varchar(20)'
      ');  '
      'END TRY  '
      'BEGIN CATCH'
      'TRUNCATE TABLE #AllTypes'
      'END CATCH; '
      ' '
      
        'INSERT INTO #AllTypes Values('#39'a_OtdelNo'#39', '#39'a_VidNo'#39', '#39'a_SotrudNo' +
        #39', '#39'a_Buh'#39', '#39'a_PostNo'#39', '#39'a_NaklNo'#39', '#39'a_AddressID'#39', '#39'a_DOC_TYPE_I' +
        'D'#39', '#39'a_DayNakl'#39', '#39'a_DayOpl'#39', '#39'a_DayExp'#39', '#39'a_CurHd_ID'#39', '#39'a_CurAc_' +
        'ID'#39')'
      ''
      'SELECT'
      'T4.OtdelNo as _OtdelName'
      
        ',  (CASE WHEN (T4.OtdelNo = -1) THEN (select a_OtdelNo from #All' +
        'Types) ELSE '
      '  --CAST(T4.OtdelNo as varchar(20))'
      '  (SELECT OtdelName from VidOtdel where OtdelNo = T4.OtdelNo) '
      '  END) AS OtdelName'
      ', T4.VidNo as _VidName'
      
        ', (CASE WHEN (T4.VidNo = -1) THEN (select a_VidNo from #AllTypes' +
        ') ELSE '
      '--CAST(T4.VidNo as varchar(20)) END)'
      '(select VidName from VidTov where VidNo = T4.VidNo) '
      'END) AS VidName'
      ', T4.SotrudNo as _SotrudName'
      
        ', (CASE WHEN (T4.SotrudNo = -1) THEN (select a_SotrudNo from #Al' +
        'lTypes) ELSE '
      '--CAST(T4.SotrudNo as varchar(20)) '
      '(select SotrudName from Sotrud where SotrudNo = T4.SotrudNo)'
      'END) AS SotrudName'
      ', T4.Buh as _BuhName'
      
        ', (CASE WHEN (T4.Buh = -1) THEN (select a_Buh from #AllTypes) EL' +
        'SE '
      '--CAST(T4.Buh as varchar(20))'
      '(select Buh_type_name from d_buh_type where Buh = T4.Buh) '
      'END) AS BuhName'
      ', T4.PostNo as _AgentName'
      
        ', (CASE WHEN (T4.PostNo = -1) THEN (select a_PostNo from #AllTyp' +
        'es) ELSE '
      '(select Name from Post where PostNo = T4.PostNo) '
      '--CAST(T4.PostNo as varchar(20)) '
      'END) AS AgentName'
      
        ', (CASE WHEN (T4.Nom = -1) THEN (select a_NaklNo from #AllTypes)' +
        ' ELSE '
      '   CAST(T4.Nom as varchar(20)) END) AS NomNakl'
      ', T4.Nom AS _NomNakl'
      ', T4.AddressID as _PostAddress'
      
        ', (CASE WHEN (T4.AddressID = -1) THEN (select a_AddressID from #' +
        'AllTypes) ELSE '
      '--CAST(T4.AddressID as varchar(20)) '
      '(select Address from AddressPost where ID = T4.AddressID)  '
      'END) AS PostAddress'
      ', T4.DOC_TYPE_ID as _DocTypeName'
      
        ', (CASE WHEN (T4.DOC_TYPE_ID = -1) THEN (select a_DOC_TYPE_ID fr' +
        'om #AllTypes) ELSE '
      '--CAST(T4.DOC_TYPE_ID as varchar(20)) '
      '(select d.name from d_doc_type d where ID = T4.DOC_TYPE_ID)  '
      'END) AS DocTypeName'
      ', CONVERT(FLOAT, T4.Summa) AS Summa'
      ', CONVERT(FLOAT, T4.SummaDolg) AS SummaDolg'
      ', CONVERT(FLOAT, T4.SumAc) AS SumAc'
      ', CONVERT(FLOAT, T4.SumDAc) AS SumDAc'
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
      ', T4.CurHd_ID as _CurHd'
      
        ', (CASE WHEN (T4.CurHd_ID = -1) THEN (select a_CurHd_ID from #Al' +
        'lTypes) ELSE '
      
        '(select d.L_CODE from D_CURRENCY d where d.ID = T4.CurHd_ID) END' +
        ') as CurHd  '
      ', T4.CurAc_ID as _CurAc'
      
        ', (CASE WHEN (T4.CurAc_ID = -1) THEN (select a_CurAc_ID from #Al' +
        'lTypes) ELSE '
      
        '(select d.L_CODE from D_CURRENCY d where d.ID = T4.CurAc_ID) END' +
        ') as CurAc '
      ''
      'FROM ( '
      'SELECT'
      '  T3.OtdelNo AS OtdelNo'
      ', T3.VidNo AS VidNo'
      ', T3.SotrudNo AS SotrudNo'
      ', T3.Buh AS Buh'
      ', T3.PostNo AS PostNo'
      '--, T3.NaklNo AS NaklNo'
      ', T3.Nom AS Nom'
      ', T3.AddressID AS AddressID'
      ', T3.DOC_TYPE_ID AS DOC_TYPE_ID'
      ', CONVERT(FLOAT, SUM(T3.Summa)) AS Summa'
      ', CONVERT(FLOAT, SUM(T3.SummaDolg)) AS SummaDolg'
      ', CONVERT(FLOAT, SUM(T3.SumAc)) AS SumAc'
      ', CONVERT(FLOAT, SUM(T3.SumDAc)) AS SumDAc'
      ', T3.DayNakl AS DayNakl'
      ', T3.DayOpl AS DayOpl'
      ', T3.DayExp AS DayExp'
      ', T3.CurHd_ID AS CurHd_ID'
      ', T3.CurAc_ID AS CurAc_ID'
      'FROM ( '
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
        'om ELSE -1 END) AS Nom'
      
        ', (CASE WHEN (1 IN (SELECT e_AddressID FROM #Expansions)) THEN T' +
        '2.AddressID ELSE -1 END) AS AddressID'
      
        ', (CASE WHEN (1 IN (SELECT e_DOC_TYPE_ID FROM #Expansions)) THEN' +
        ' T2.DOC_TYPE_ID ELSE -1 END) AS DOC_TYPE_ID'
      ', CONVERT(FLOAT, T2.Summa) AS Summa'
      ', CONVERT(FLOAT, T2.SummaDolg) AS SummaDolg'
      ', CONVERT(FLOAT, T2.SumAc) AS SumAc'
      ', CONVERT(FLOAT, T2.SumDAc) AS SumDAc'
      
        ', (CASE WHEN (1 IN (SELECT e_DayNakl FROM #Expansions)) THEN T2.' +
        'DayNakl ELSE -1 END) AS DayNakl'
      
        ', (CASE WHEN (1 IN (SELECT e_DayOpl FROM #Expansions)) THEN T2.D' +
        'ayOpl ELSE -1 END) AS DayOpl'
      
        ', (CASE WHEN (1 IN (SELECT e_DayExp FROM #Expansions)) THEN T2.D' +
        'ayExp ELSE @VeryOldDay END) AS DayExp'
      
        ', (CASE WHEN (1 IN (SELECT e_CurHd_ID FROM #Expansions)) THEN T2' +
        '.CurHd_ID ELSE -1 END) AS CurHd_ID'
      
        ', (CASE WHEN (1 IN (SELECT e_CurAc_ID FROM #Expansions)) THEN T2' +
        '.CurAc_ID ELSE -1 END) AS CurAc_ID'
      'FROM (  '
      ' select * from ('
      ' select'
      '  nr.OtdelNo'
      ', nr.SotrudNo'
      ', nr.Buh'
      ', nr.PostNo'
      ', nr.Nom '
      ',  L5.VidNo'
      ', L5.DOC_TYPE_ID'
      ',  L5.Summa '
      ',  L5.SumAc'
      ',  L5.SummaDolg '
      ',  L5.SumDAc'
      ', ap.ID as AddressID '
      ''
      ', datediff(d, @DateStart, nr.DateNakl) as  DayNakl'
      ', datediff(d, @DateStart, nr.DateOpl) as   DayOpl'
      ', datediff(dd, nr.DateOpl, @p_date_end) as DayExp'
      ', (CASE WHEN (nr.CurrencyHead IS NULL) THEN '
      #9'(SELECT dc.ID from D_CURRENCY dc WHERE dc.IsDefault=1) ELSE '
      
        #9'(SELECT dc.ID from D_CURRENCY dc WHERE dc.L_CODE=nr.CurrencyHea' +
        'd) END) AS CurHd_ID'
      ''
      ', (CASE WHEN (nr.CurrencyAccounting IS NULL) THEN '
      #9'(SELECT dc.ID from D_CURRENCY dc WHERE dc.IsDefault=1) ELSE '
      
        #9'(SELECT dc.ID from D_CURRENCY dc WHERE dc.L_CODE=nr.CurrencyAcc' +
        'ounting) END) AS CurAc_ID'
      ' '
      'from '
      'NaklR nr with (nolock) inner join ( '
      '  select '
      '  L4.NaklNo'
      ', L4.VidNo'
      ', L4.DOC_TYPE_ID'
      ',  CONVERT(FLOAT, ROUND(SUM(Summa), 4)) as Summa '
      ',  CONVERT(FLOAT, ROUND(SUM(SumAc), 4)) as SumAc'
      ',  CONVERT(FLOAT, ROUND(SUM(SummaDolg), 4)) as SummaDolg '
      ',  CONVERT(FLOAT, ROUND(SUM(SumDAc), 4)) as SumDAc'
      'from ('
      '  select'
      '  -- L3  '
      '  VidNo,'
      '  NaklNo,'
      '  DOC_TYPE_ID,'
      '  CONVERT(FLOAT, SumTov) as Summa,'
      '  CONVERT(FLOAT, SumTovAc) as SumAc,  '
      '  CONVERT(FLOAT, case when _Summa<>0 then '
      #9#9#9#9'SumTov*_SummaDolg/_Summa else'
      #9#9#9#9'0 end) as SummaDolg,'
      '  CONVERT(FLOAT, (case when _SumAc<>0 '
      #9#9#9#9#9'   then SumTov*_SumDAc/_SumAc'
      #9#9#9#9#9'   else 0 end )) as SumDAc  '
      '  from ( '
      'select '
      '  L2.VidNo'
      ', L2.NaklNo '
      ', L2.DOC_TYPE_ID'
      ', L2._SumTov * ce.Rate / ceh.Rate  as SumTov'
      ', L2._SumTov * ce_a.Rate / ceh_a.Rate  as SumTovAc'
      ', isnull(nr.Summa, 0) as _Summa'
      ', isnull(nr.SummaDolg, 0) as _SummaDolg'
      ', isnull(nr.SummaCurrencyAccounting, 0) as _SumAc'
      ', isnull(nr.SummaDolgCurrencyAccounting, 0) as _SumDAc'#9
      'from '
      'NaklR nr with (nolock) inner join (   '
      '-- L1'
      'select '
      '  L1.VidNo'
      ', L1.TovarNo'
      ', L1.NaklNo '
      ', L1.DOC_TYPE_ID'
      ', pfv.Currency'
      ', '
      '   (case when @UseColnPrice=0 then L1.PaymentPrice * L1.QTY '
      '   else '
      '   (case '
      '        when ColnPrice = 1 then  Isnull(k.Price, 0)'
      '        when nr.ColnPrice = 2 then  Isnull(k.Price1, 0)'
      '        when nr.ColnPrice = 3 then  Isnull(k.Price2, 0)'
      '        when nr.ColnPrice = 4 then  Isnull(k.Price3, 0)'
      '        when nr.ColnPrice = 5 then  Isnull(k.Price4, 0)'
      '        when nr.ColnPrice = 6 then  Isnull(k.Price5, 0)'
      '        when nr.ColnPrice = 7 then  Isnull(k.Price6, 0)'
      '        when nr.ColnPrice = 8 then  Isnull(k.Price7, 0)'
      '        when nr.ColnPrice = 10 then Isnull(k.Price8, 0)'
      '        when nr.ColnPrice = 11 then Isnull(k.Price9, 0)'
      '        when nr.ColnPrice = 12 then Isnull(k.Price10, 0)'
      '        when nr.ColnPrice = 9 then  Isnull(k.Avgpricein, 0)'
      '        when nr.ColnPrice = 13 then Isnull(Price13, 0)'
      '        when nr.ColnPrice = 14 then Isnull(Price14, 0)'
      '        when nr.ColnPrice = 15 then Isnull(Price15, 0)'
      '        when nr.ColnPrice = 17 then Isnull(pfv.PriceVeb, 0) '
      '        when nr.ColnPrice = 18 then Isnull(pfv.PriceInInst, 0)'
      '                             else 0 '
      '   end * L1.QTY) end) as _SumTov'
      'from'
      'NaklR nr with (nolock) inner join ('
      'select'
      '        t.VidNo'
      '      ,  t.TovarNo'
      '      , h1.NaklNo '
      '     , ds.DOC_TYPE_ID'
      '     , ds.QTY'
      '     , isnull(ds.PaymentPrice, 0) as PaymentPrice'
      '    --, t.NameTovarShort'
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
      #9' and ((@DisableExclusion=1) or (not (h1.PostNo in '
      #9' (select PostNo from ListMinusPostForDebit lmp where '
      #9#9' (h1.PostNo = lmp.PostNo) and (lmp.CheckMinus=1)))))'
      #9') L1 on (L1.NaklNo = nr.NaklNo) left join'
      #9
      '          Ostatok k on k.TovarNo = L1.TovarNo left join'
      '          PriceForVeb pfv on pfv.TovarNo = L1.TovarNo'
      '          '
      '    ) L2 on (L2.NaklNo = nr.NaklNo) left join    '
      #9#9'  d_currency dc on dc.L_CODE = L2.Currency left join'
      
        #9'      CurrencyExchange ce on ce.CurrencyId = dc.ID and ce.isAct' +
        'ive = 1  left join'
      #9'      d_currency dch on dch.L_CODE = nr.CurrencyHead left join'
      
        #9'      CurrencyExchange ceh on ceh.CurrencyId = dch.ID and ceh.I' +
        'sActive = 1 left join'
      #9#9'  '
      #9#9'  d_currency dc_a on dc_a.L_CODE = L2.Currency left join'
      
        #9'      CurrencyExchange ce_a on ce_a.CurrencyId = dc_a.ID and ce' +
        '_a.isActive = 1  left join'
      
        #9'      d_currency dch_a on dch_a.L_CODE = nr.CurrencyAccounting ' +
        'left join'
      
        #9'      CurrencyExchange ceh_a on ceh_a.CurrencyId = dch.ID and c' +
        'eh_a.IsActive = 1 '#9'      '
      #9') L3'
      'where (@DisableZeroSumAcn=0) or '
      #9#9'((@DisableZeroSumAcn=1) and (L3._SumAc=0)) or'
      
        #9#9'((@DisableZeroSumAcn=2) and (L3._SumAc<>0)) '#9'                 ' +
        '      '
      #9') L4'
      '     group by      '
      '       L4.NaklNo'
      '     , L4.VidNo'
      '     , L4.DOC_TYPE_ID'
      '    ) L5'
      '     on (nr.NaklNo=L5.NaklNo) '
      '     left outer join Post p on p.PostNo=nr.PostNo '
      
        '     left outer join AddressPost ap on ap.AddressNo=nr.AddressNo' +
        ' and ap.PostNo=nr.PostNo'
      #9') T1'
      #9
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
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_NaklNo=-1) OR (Nom I' +
        'N (SELECT s_NaklNo FROM #Selections)))'
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
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_CurHd_ID=-1) OR (Cur' +
        'Hd_ID IN (SELECT s_CurHd_ID FROM #Selections)))'
      'AND'
      
        '  (EXISTS(SELECT 1 FROM #Selections WHERE s_CurAc_ID=-1) OR (Cur' +
        'Ac_ID IN (SELECT s_CurAc_ID FROM #Selections)))'
      ' ) T2'
      ') AS T3'
      'GROUP BY'
      '  T3.OtdelNo'
      ', T3.VidNo'
      ', T3.SotrudNo'
      ', T3.Buh'
      ', T3.PostNo'
      ', T3.Nom'
      ', T3.AddressID'
      ', T3.DOC_TYPE_ID'
      ', T3.DayNakl'
      ', T3.DayOpl'
      ', T3.DayExp'
      ', T3.CurHd_ID'
      ', T3.CurAc_ID'
      ') T4'
      ''
      'ORDER BY OtdelName, VidName, SotrudName, _DateNakl, _DayExp DESC')
    ReadOnly = True
    Filtered = True
    OnFilterRecord = quDebtFilterRecord
    Left = 536
    Top = 225
    object quDebtOtdelName: TStringField
      FieldName = 'OtdelName'
      Origin = '.'
      ReadOnly = True
      Size = 30
    end
    object quDebtVidName: TStringField
      FieldName = 'VidName'
      Origin = '.'
      ReadOnly = True
      Size = 30
    end
    object quDebtSotrudName: TStringField
      FieldName = 'SotrudName'
      Origin = '.'
      ReadOnly = True
      Size = 30
    end
    object quDebtBuhName: TStringField
      FieldName = 'BuhName'
      Origin = '.'
      ReadOnly = True
    end
    object quDebtAgentName: TStringField
      FieldName = 'AgentName'
      Origin = '.'
      ReadOnly = True
      Size = 30
    end
    object quDebt_NomNakl: TIntegerField
      FieldName = '_NomNakl'
      Origin = '.'
      ReadOnly = True
    end
    object quDebtNomNakl: TStringField
      FieldName = 'NomNakl'
      Origin = '.'
      ReadOnly = True
    end
    object quDebtPostAddress: TStringField
      FieldName = 'PostAddress'
      Origin = '.'
      ReadOnly = True
      Size = 256
    end
    object quDebtDocTypeName: TStringField
      FieldName = 'DocTypeName'
      Origin = '.'
      ReadOnly = True
      Size = 256
    end
    object quDebtSumma: TFloatField
      FieldName = 'Summa'
      Origin = '.'
      ReadOnly = True
    end
    object quDebtSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      Origin = '.'
      ReadOnly = True
    end
    object quDebt_DateNakl: TIntegerField
      FieldName = '_DateNakl'
      Origin = '.'
      ReadOnly = True
    end
    object quDebtDateNakl: TStringField
      FieldName = 'DateNakl'
      Origin = '.'
      ReadOnly = True
    end
    object quDebt_DateOpl: TIntegerField
      FieldName = '_DateOpl'
      Origin = '.'
      ReadOnly = True
    end
    object quDebtDateOpl: TStringField
      FieldName = 'DateOpl'
      Origin = '.'
      ReadOnly = True
    end
    object quDebt_DayExp: TIntegerField
      FieldName = '_DayExp'
      Origin = '.'
      ReadOnly = True
    end
    object quDebtDayExp: TStringField
      FieldName = 'DayExp'
      Origin = '.'
      ReadOnly = True
    end
    object quDebt_OtdelName: TIntegerField
      FieldName = '_OtdelName'
    end
    object quDebt_VidName: TIntegerField
      FieldName = '_VidName'
    end
    object quDebt_SotrudName: TIntegerField
      FieldName = '_SotrudName'
    end
    object quDebt_BuhName: TIntegerField
      FieldName = '_BuhName'
    end
    object quDebt_AgentName: TIntegerField
      FieldName = '_AgentName'
    end
    object quDebt_PostAddress: TIntegerField
      FieldName = '_PostAddress'
    end
    object quDebt_DocTypeName: TIntegerField
      FieldName = '_DocTypeName'
    end
    object quDebtSumAc: TFloatField
      FieldName = 'SumAc'
    end
    object quDebtSumDAc: TFloatField
      FieldName = 'SumDAc'
    end
    object quDebt_CurHd: TIntegerField
      FieldName = '_CurHd'
    end
    object quDebtCurHd: TStringField
      FieldName = 'CurHd'
    end
    object quDebt_CurAc: TIntegerField
      FieldName = '_CurAc'
    end
    object quDebtCurAc: TStringField
      FieldName = 'CurAc'
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
    Capacity = 445
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
      '40705f536563746f72496420696e74'
      '2c40705f69735f65787020696e74'
      '2c40705f69735f6f6e6c795f6669726d20696e74'
      '2c40705f646174655f62656720536d616c6c4461746554696d65'
      '2c40705f646174655f656e6420536d616c6c4461746554696d65'
      '2c40705f6f75725f6669726d20696e74'
      '2c40705f69735f657870725f746f76617220696e74'
      '2c2040566572794f6c6444617920696e74'
      '2c20404461746553746172742064617465'
      '2c204044697361626c654578636c7573696f6e20626974'
      '2c2040557365436f6c6e507269636520626974'
      '2c204044697361626c655a65726f53756d41636e20696e74'
      ''
      '5345542040705f646174655f626567203d202730312e30312e3139303027'
      '5345542040705f646174655f656e64203d202730382e30332e3230313727'
      '5345542040446174655374617274203d202730312e30312e3230303027'
      '5345542040566572794f6c64446179203d202d3130303030'
      '534554204044697361626c654578636c7573696f6e203d2030'
      '534554204044697361626c655a65726f53756d41636e203d2030'
      '5345542040557365436f6c6e5072696365203d2030'
      ''
      '2d2d44524f50205441424c452023457870616e73696f6e73'
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
      '2c20655f43757248645f494420696e74204e554c4c20'
      '2c20655f43757241635f494420696e74204e554c4c20'
      '293b2020'
      '454e44205452592020'
      '424547494e204341544348'
      '5452554e43415445205441424c452023457870616e73696f6e73'
      '454e442043415443483b20'
      '20'
      
        '494e5345525420494e544f2023457870616e73696f6e732056616c7565732831' +
        '2c20312c20312c20312c20312c20312c20312c20312c20312c20312c20312c20' +
        '312c203129'
      ''
      '2d2d44524f50205441424c45202353656c656374696f6e73'
      '424547494e205452592020'
      '435245415445205441424c45202353656c656374696f6e73'
      '2820'
      '20202d2d494420496e74204964656e7469747928312c31292c'
      '2020735f4f7464656c4e6f20736d616c6c696e74204e554c4c'
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
      '2c20735f43757248645f494420696e74204e554c4c20'
      '2c20735f43757241635f494420696e74204e554c4c20'
      '293b2020'
      '454e44205452592020'
      '424547494e204341544348'
      '5452554e43415445205441424c45202353656c656374696f6e73'
      '454e442043415443483b20'
      '20'
      
        '494e5345525420494e544f202353656c656374696f6e732056616c756573282d' +
        '312c202d312c202d312c202d312c202d312c202d312c202d312c202d312c202d' +
        '312c202d312c202d31303030302c202d312c202d3129'
      ''
      '2d2d44524f50205441424c452023416c6c5479706573'
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
      '2c20615f43757248645f4944207661726368617228323029'
      '2c20615f43757241635f4944207661726368617228323029'
      '293b2020'
      '454e44205452592020'
      '424547494e204341544348'
      '5452554e43415445205441424c452023416c6c5479706573'
      '454e442043415443483b20'
      '20'
      
        '494e5345525420494e544f2023416c6c54797065732056616c7565732827615f' +
        '4f7464656c4e6f272c2027615f5669644e6f272c2027615f536f747275644e6f' +
        '272c2027615f427568272c2027615f506f73744e6f272c2027615f4e616b6c4e' +
        '6f272c2027615f416464726573734944272c2027615f444f435f545950455f49' +
        '44272c2027615f4461794e616b6c272c2027615f4461794f706c272c2027615f' +
        '446179457870272c2027615f43757248645f4944272c2027615f43757241635f' +
        '49442729'
      ''
      '53454c454354'
      '54342e4f7464656c4e6f206173205f4f7464656c4e616d65'
      
        '2c20202843415345205748454e202854342e4f7464656c4e6f203d202d312920' +
        '5448454e202873656c65637420615f4f7464656c4e6f2066726f6d2023416c6c' +
        '54797065732920454c534520'
      
        '20202d2d434153542854342e4f7464656c4e6f20617320766172636861722832' +
        '302929'
      
        '20202853454c454354204f7464656c4e616d652066726f6d205669644f746465' +
        '6c207768657265204f7464656c4e6f203d2054342e4f7464656c4e6f2920'
      '2020454e4429204153204f7464656c4e616d65'
      '2c2054342e5669644e6f206173205f5669644e616d65'
      
        '2c202843415345205748454e202854342e5669644e6f203d202d312920544845' +
        '4e202873656c65637420615f5669644e6f2066726f6d2023416c6c5479706573' +
        '2920454c534520'
      
        '2d2d434153542854342e5669644e6f2061732076617263686172283230292920' +
        '454e4429'
      
        '2873656c656374205669644e616d652066726f6d20566964546f762077686572' +
        '65205669644e6f203d2054342e5669644e6f2920'
      '454e4429204153205669644e616d65'
      '2c2054342e536f747275644e6f206173205f536f747275644e616d65'
      
        '2c202843415345205748454e202854342e536f747275644e6f203d202d312920' +
        '5448454e202873656c65637420615f536f747275644e6f2066726f6d2023416c' +
        '6c54797065732920454c534520'
      
        '2d2d434153542854342e536f747275644e6f2061732076617263686172283230' +
        '292920'
      
        '2873656c65637420536f747275644e616d652066726f6d20536f747275642077' +
        '6865726520536f747275644e6f203d2054342e536f747275644e6f29'
      '454e442920415320536f747275644e616d65'
      '2c2054342e427568206173205f4275684e616d65'
      
        '2c202843415345205748454e202854342e427568203d202d3129205448454e20' +
        '2873656c65637420615f4275682066726f6d2023416c6c54797065732920454c' +
        '534520'
      '2d2d434153542854342e42756820617320766172636861722832302929'
      
        '2873656c656374204275685f747970655f6e616d652066726f6d20645f627568' +
        '5f7479706520776865726520427568203d2054342e4275682920'
      '454e4429204153204275684e616d65'
      '2c2054342e506f73744e6f206173205f4167656e744e616d65'
      
        '2c202843415345205748454e202854342e506f73744e6f203d202d3129205448' +
        '454e202873656c65637420615f506f73744e6f2066726f6d2023416c6c547970' +
        '65732920454c534520'
      
        '2873656c656374204e616d652066726f6d20506f737420776865726520506f73' +
        '744e6f203d2054342e506f73744e6f2920'
      
        '2d2d434153542854342e506f73744e6f20617320766172636861722832302929' +
        '20'
      '454e4429204153204167656e744e616d65'
      
        '2c202843415345205748454e202854342e4e6f6d203d202d3129205448454e20' +
        '2873656c65637420615f4e616b6c4e6f2066726f6d2023416c6c547970657329' +
        '20454c534520'
      
        '202020434153542854342e4e6f6d206173207661726368617228323029292045' +
        '4e4429204153204e6f6d4e616b6c'
      '2c2054342e4e6f6d204153205f4e6f6d4e616b6c'
      '2c2054342e416464726573734944206173205f506f737441646472657373'
      
        '2c202843415345205748454e202854342e416464726573734944203d202d3129' +
        '205448454e202873656c65637420615f4164647265737349442066726f6d2023' +
        '416c6c54797065732920454c534520'
      
        '2d2d434153542854342e41646472657373494420617320766172636861722832' +
        '30292920'
      
        '2873656c65637420416464726573732066726f6d2041646472657373506f7374' +
        '207768657265204944203d2054342e416464726573734944292020'
      '454e442920415320506f737441646472657373'
      '2c2054342e444f435f545950455f4944206173205f446f63547970654e616d65'
      
        '2c202843415345205748454e202854342e444f435f545950455f4944203d202d' +
        '3129205448454e202873656c65637420615f444f435f545950455f4944206672' +
        '6f6d2023416c6c54797065732920454c534520'
      
        '2d2d434153542854342e444f435f545950455f49442061732076617263686172' +
        '283230292920'
      
        '2873656c65637420642e6e616d652066726f6d20645f646f635f747970652064' +
        '207768657265204944203d2054342e444f435f545950455f4944292020'
      '454e442920415320446f63547970654e616d65'
      
        '2c20434f4e5645525428464c4f41542c2054342e53756d6d6129204153205375' +
        '6d6d61'
      
        '2c20434f4e5645525428464c4f41542c2054342e53756d6d61446f6c67292041' +
        '532053756d6d61446f6c67'
      
        '2c20434f4e5645525428464c4f41542c2054342e53756d416329204153205375' +
        '6d4163'
      
        '2c20434f4e5645525428464c4f41542c2054342e53756d444163292041532053' +
        '756d444163'
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
      '2c2054342e43757248645f4944206173205f4375724864'
      
        '2c202843415345205748454e202854342e43757248645f4944203d202d312920' +
        '5448454e202873656c65637420615f43757248645f49442066726f6d2023416c' +
        '6c54797065732920454c534520'
      
        '2873656c65637420642e4c5f434f44452066726f6d20445f43555252454e4359' +
        '206420776865726520642e4944203d2054342e43757248645f49442920454e44' +
        '292061732043757248642020'
      '2c2054342e43757241635f4944206173205f4375724163'
      
        '2c202843415345205748454e202854342e43757241635f4944203d202d312920' +
        '5448454e202873656c65637420615f43757241635f49442066726f6d2023416c' +
        '6c54797065732920454c534520'
      
        '2873656c65637420642e4c5f434f44452066726f6d20445f43555252454e4359' +
        '206420776865726520642e4944203d2054342e43757241635f49442920454e44' +
        '2920617320437572416320'
      ''
      '46524f4d202820'
      '53454c454354'
      '202054332e4f7464656c4e6f204153204f7464656c4e6f'
      '2c2054332e5669644e6f204153205669644e6f'
      '2c2054332e536f747275644e6f20415320536f747275644e6f'
      '2c2054332e42756820415320427568'
      '2c2054332e506f73744e6f20415320506f73744e6f'
      '2d2d2c2054332e4e616b6c4e6f204153204e616b6c4e6f'
      '2c2054332e4e6f6d204153204e6f6d'
      '2c2054332e41646472657373494420415320416464726573734944'
      '2c2054332e444f435f545950455f494420415320444f435f545950455f4944'
      
        '2c20434f4e5645525428464c4f41542c2053554d2854332e53756d6d61292920' +
        '41532053756d6d61'
      
        '2c20434f4e5645525428464c4f41542c2053554d2854332e53756d6d61446f6c' +
        '6729292041532053756d6d61446f6c67'
      
        '2c20434f4e5645525428464c4f41542c2053554d2854332e53756d4163292920' +
        '41532053756d4163'
      
        '2c20434f4e5645525428464c4f41542c2053554d2854332e53756d4441632929' +
        '2041532053756d444163'
      '2c2054332e4461794e616b6c204153204461794e616b6c'
      '2c2054332e4461794f706c204153204461794f706c'
      '2c2054332e44617945787020415320446179457870'
      '2c2054332e43757248645f49442041532043757248645f4944'
      '2c2054332e43757241635f49442041532043757241635f4944'
      '46524f4d202820'
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
        '6f6d20454c5345202d3120454e4429204153204e6f6d'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f416464' +
        '7265737349442046524f4d2023457870616e73696f6e732929205448454e2054' +
        '322e41646472657373494420454c5345202d3120454e44292041532041646472' +
        '6573734944'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f444f43' +
        '5f545950455f49442046524f4d2023457870616e73696f6e732929205448454e' +
        '2054322e444f435f545950455f494420454c5345202d3120454e442920415320' +
        '444f435f545950455f4944'
      
        '2c20434f4e5645525428464c4f41542c2054322e53756d6d6129204153205375' +
        '6d6d61'
      
        '2c20434f4e5645525428464c4f41542c2054322e53756d6d61446f6c67292041' +
        '532053756d6d61446f6c67'
      
        '2c20434f4e5645525428464c4f41542c2054322e53756d416329204153205375' +
        '6d4163'
      
        '2c20434f4e5645525428464c4f41542c2054322e53756d444163292041532053' +
        '756d444163'
      
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
      
        '2c202843415345205748454e20283120494e202853454c45435420655f437572' +
        '48645f49442046524f4d2023457870616e73696f6e732929205448454e205432' +
        '2e43757248645f494420454c5345202d3120454e44292041532043757248645f' +
        '4944'
      
        '2c202843415345205748454e20283120494e202853454c45435420655f437572' +
        '41635f49442046524f4d2023457870616e73696f6e732929205448454e205432' +
        '2e43757241635f494420454c5345202d3120454e44292041532043757241635f' +
        '4944'
      '46524f4d20282020'
      '2073656c656374202a2066726f6d2028'
      '2073656c656374'
      '20206e722e4f7464656c4e6f'
      '2c206e722e536f747275644e6f'
      '2c206e722e427568'
      '2c206e722e506f73744e6f'
      '2c206e722e4e6f6d20'
      '2c20204c352e5669644e6f'
      '2c204c352e444f435f545950455f4944'
      '2c20204c352e53756d6d6120'
      '2c20204c352e53756d4163'
      '2c20204c352e53756d6d61446f6c6720'
      '2c20204c352e53756d444163'
      '2c2061702e49442061732041646472657373494420'
      ''
      
        '2c20646174656469666628642c20404461746553746172742c206e722e446174' +
        '654e616b6c2920617320204461794e616b6c'
      
        '2c20646174656469666628642c20404461746553746172742c206e722e446174' +
        '654f706c292061732020204461794f706c'
      
        '2c2064617465646966662864642c206e722e446174654f706c2c2040705f6461' +
        '74655f656e642920617320446179457870'
      
        '2c202843415345205748454e20286e722e43757272656e637948656164204953' +
        '204e554c4c29205448454e20'
      
        '092853454c4543542064632e49442066726f6d20445f43555252454e43592064' +
        '632057484552452064632e497344656661756c743d312920454c534520'
      
        '092853454c4543542064632e49442066726f6d20445f43555252454e43592064' +
        '632057484552452064632e4c5f434f44453d6e722e43757272656e6379486561' +
        '642920454e44292041532043757248645f4944'
      ''
      
        '2c202843415345205748454e20286e722e43757272656e63794163636f756e74' +
        '696e67204953204e554c4c29205448454e20'
      
        '092853454c4543542064632e49442066726f6d20445f43555252454e43592064' +
        '632057484552452064632e497344656661756c743d312920454c534520'
      
        '092853454c4543542064632e49442066726f6d20445f43555252454e43592064' +
        '632057484552452064632e4c5f434f44453d6e722e43757272656e6379416363' +
        '6f756e74696e672920454e44292041532043757241635f4944'
      '20'
      '66726f6d20'
      
        '4e616b6c52206e72207769746820286e6f6c6f636b2920696e6e6572206a6f69' +
        '6e202820'
      '202073656c65637420'
      '20204c342e4e616b6c4e6f'
      '2c204c342e5669644e6f'
      '2c204c342e444f435f545950455f4944'
      
        '2c2020434f4e5645525428464c4f41542c20524f554e442853554d2853756d6d' +
        '61292c203429292061732053756d6d6120'
      
        '2c2020434f4e5645525428464c4f41542c20524f554e442853554d2853756d41' +
        '63292c203429292061732053756d4163'
      
        '2c2020434f4e5645525428464c4f41542c20524f554e442853554d2853756d6d' +
        '61446f6c67292c203429292061732053756d6d61446f6c6720'
      
        '2c2020434f4e5645525428464c4f41542c20524f554e442853554d2853756d44' +
        '4163292c203429292061732053756d444163'
      '66726f6d2028'
      '202073656c656374'
      '20202d2d204c332020'
      '20205669644e6f2c'
      '20204e616b6c4e6f2c'
      '2020444f435f545950455f49442c'
      
        '2020434f4e5645525428464c4f41542c2053756d546f76292061732053756d6d' +
        '612c'
      
        '2020434f4e5645525428464c4f41542c2053756d546f76416329206173205375' +
        '6d41632c2020'
      
        '2020434f4e5645525428464c4f41542c2063617365207768656e205f53756d6d' +
        '613c3e30207468656e20'
      
        '0909090953756d546f762a5f53756d6d61446f6c672f5f53756d6d6120656c73' +
        '65'
      '090909093020656e64292061732053756d6d61446f6c672c'
      
        '2020434f4e5645525428464c4f41542c202863617365207768656e205f53756d' +
        '41633c3e3020'
      
        '09090909092020207468656e2053756d546f762a5f53756d4441632f5f53756d' +
        '4163'
      
        '0909090909202020656c7365203020656e642029292061732053756d44416320' +
        '20'
      '202066726f6d202820'
      '73656c65637420'
      '20204c322e5669644e6f'
      '2c204c322e4e616b6c4e6f20'
      '2c204c322e444f435f545950455f4944'
      
        '2c204c322e5f53756d546f76202a2063652e52617465202f206365682e526174' +
        '65202061732053756d546f76'
      
        '2c204c322e5f53756d546f76202a2063655f612e52617465202f206365685f61' +
        '2e52617465202061732053756d546f764163'
      '2c2069736e756c6c286e722e53756d6d612c203029206173205f53756d6d61'
      
        '2c2069736e756c6c286e722e53756d6d61446f6c672c203029206173205f5375' +
        '6d6d61446f6c67'
      
        '2c2069736e756c6c286e722e53756d6d6143757272656e63794163636f756e74' +
        '696e672c203029206173205f53756d4163'
      
        '2c2069736e756c6c286e722e53756d6d61446f6c6743757272656e6379416363' +
        '6f756e74696e672c203029206173205f53756d44416309'
      '66726f6d20'
      
        '4e616b6c52206e72207769746820286e6f6c6f636b2920696e6e6572206a6f69' +
        '6e2028202020'
      '2d2d204c31'
      '73656c65637420'
      '20204c312e5669644e6f'
      '2c204c312e546f7661724e6f'
      '2c204c312e4e616b6c4e6f20'
      '2c204c312e444f435f545950455f4944'
      '2c207066762e43757272656e6379'
      '2c20'
      
        '2020202863617365207768656e2040557365436f6c6e50726963653d30207468' +
        '656e204c312e5061796d656e745072696365202a204c312e51545920'
      '202020656c736520'
      '202020286361736520'
      
        '20202020202020207768656e20436f6c6e5072696365203d2031207468656e20' +
        '2049736e756c6c286b2e50726963652c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2032207468' +
        '656e202049736e756c6c286b2e5072696365312c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2033207468' +
        '656e202049736e756c6c286b2e5072696365322c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2034207468' +
        '656e202049736e756c6c286b2e5072696365332c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2035207468' +
        '656e202049736e756c6c286b2e5072696365342c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2036207468' +
        '656e202049736e756c6c286b2e5072696365352c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2037207468' +
        '656e202049736e756c6c286b2e5072696365362c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2038207468' +
        '656e202049736e756c6c286b2e5072696365372c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2031302074' +
        '68656e2049736e756c6c286b2e5072696365382c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2031312074' +
        '68656e2049736e756c6c286b2e5072696365392c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2031322074' +
        '68656e2049736e756c6c286b2e507269636531302c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2039207468' +
        '656e202049736e756c6c286b2e4176677072696365696e2c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2031332074' +
        '68656e2049736e756c6c28507269636531332c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2031342074' +
        '68656e2049736e756c6c28507269636531342c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2031352074' +
        '68656e2049736e756c6c28507269636531352c203029'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2031372074' +
        '68656e2049736e756c6c287066762e50726963655665622c20302920'
      
        '20202020202020207768656e206e722e436f6c6e5072696365203d2031382074' +
        '68656e2049736e756c6c287066762e5072696365496e496e73742c203029'
      
        '2020202020202020202020202020202020202020202020202020202020656c73' +
        '65203020'
      '202020656e64202a204c312e5154592920656e6429206173205f53756d546f76'
      '66726f6d'
      
        '4e616b6c52206e72207769746820286e6f6c6f636b2920696e6e6572206a6f69' +
        '6e2028'
      '73656c656374'
      '2020202020202020742e5669644e6f'
      '2020202020202c2020742e546f7661724e6f'
      '2020202020202c2068312e4e616b6c4e6f20'
      '20202020202c2064732e444f435f545950455f4944'
      '20202020202c2064732e515459'
      
        '20202020202c2069736e756c6c2864732e5061796d656e7450726963652c2030' +
        '29206173205061796d656e745072696365'
      '202020202d2d2c20742e4e616d65546f76617253686f7274'
      
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
      
        '0920616e642028284044697361626c654578636c7573696f6e3d3129206f7220' +
        '286e6f74202868312e506f73744e6f20696e20'
      
        '09202873656c65637420506f73744e6f2066726f6d204c6973744d696e757350' +
        '6f7374466f724465626974206c6d7020776865726520'
      
        '0909202868312e506f73744e6f203d206c6d702e506f73744e6f2920616e6420' +
        '286c6d702e436865636b4d696e75733d312929292929'
      
        '0929204c31206f6e20284c312e4e616b6c4e6f203d206e722e4e616b6c4e6f29' +
        '206c656674206a6f696e'
      '09'
      
        '202020202020202020204f737461746f6b206b206f6e206b2e546f7661724e6f' +
        '203d204c312e546f7661724e6f206c656674206a6f696e'
      
        '202020202020202020205072696365466f7256656220706676206f6e20706676' +
        '2e546f7661724e6f203d204c312e546f7661724e6f'
      '20202020202020202020'
      
        '2020202029204c32206f6e20284c322e4e616b6c4e6f203d206e722e4e616b6c' +
        '4e6f29206c656674206a6f696e20202020'
      
        '09092020645f63757272656e6379206463206f6e2064632e4c5f434f4445203d' +
        '204c322e43757272656e6379206c656674206a6f696e'
      
        '0920202020202043757272656e637945786368616e6765206365206f6e206365' +
        '2e43757272656e63794964203d2064632e494420616e642063652e6973416374' +
        '697665203d203120206c656674206a6f696e'
      
        '09202020202020645f63757272656e637920646368206f6e206463682e4c5f43' +
        '4f4445203d206e722e43757272656e637948656164206c656674206a6f696e'
      
        '0920202020202043757272656e637945786368616e676520636568206f6e2063' +
        '65682e43757272656e63794964203d206463682e494420616e64206365682e49' +
        '73416374697665203d2031206c656674206a6f696e'
      '09092020'
      
        '09092020645f63757272656e63792064635f61206f6e2064635f612e4c5f434f' +
        '4445203d204c322e43757272656e6379206c656674206a6f696e'
      
        '0920202020202043757272656e637945786368616e67652063655f61206f6e20' +
        '63655f612e43757272656e63794964203d2064635f612e494420616e64206365' +
        '5f612e6973416374697665203d203120206c656674206a6f696e'
      
        '09202020202020645f63757272656e6379206463685f61206f6e206463685f61' +
        '2e4c5f434f4445203d206e722e43757272656e63794163636f756e74696e6720' +
        '6c656674206a6f696e'
      
        '0920202020202043757272656e637945786368616e6765206365685f61206f6e' +
        '206365685f612e43757272656e63794964203d206463682e494420616e642063' +
        '65685f612e4973416374697665203d20312009202020202020'
      '0929204c33'
      '776865726520284044697361626c655a65726f53756d41636e3d3029206f7220'
      
        '090928284044697361626c655a65726f53756d41636e3d312920616e6420284c' +
        '332e5f53756d41633d302929206f72'
      
        '090928284044697361626c655a65726f53756d41636e3d322920616e6420284c' +
        '332e5f53756d41633c3e30292920092020202020202020202020202020202020' +
        '202020202020'
      '0929204c34'
      '202020202067726f7570206279202020202020'
      '202020202020204c342e4e616b6c4e6f'
      '20202020202c204c342e5669644e6f'
      '20202020202c204c342e444f435f545950455f4944'
      '2020202029204c35'
      '20202020206f6e20286e722e4e616b6c4e6f3d4c352e4e616b6c4e6f2920'
      
        '20202020206c656674206f75746572206a6f696e20506f73742070206f6e2070' +
        '2e506f73744e6f3d6e722e506f73744e6f20'
      
        '20202020206c656674206f75746572206a6f696e2041646472657373506f7374' +
        '206170206f6e2061702e416464726573734e6f3d6e722e416464726573734e6f' +
        '20616e642061702e506f73744e6f3d6e722e506f73744e6f'
      '0929205431'
      '09'
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
        '6f6e7320574845524520735f4e616b6c4e6f3d2d3129204f5220284e6f6d2049' +
        '4e202853454c45435420735f4e616b6c4e6f2046524f4d202353656c65637469' +
        '6f6e73292929'
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
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f43757248645f49443d2d3129204f522028437572' +
        '48645f494420494e202853454c45435420735f43757248645f49442046524f4d' +
        '202353656c656374696f6e73292929'
      '414e44'
      
        '2020284558495354532853454c45435420312046524f4d202353656c65637469' +
        '6f6e7320574845524520735f43757241635f49443d2d3129204f522028437572' +
        '41635f494420494e202853454c45435420735f43757241635f49442046524f4d' +
        '202353656c656374696f6e73292929'
      '2029205432'
      '29204153205433'
      '47524f5550204259'
      '202054332e4f7464656c4e6f'
      '2c2054332e5669644e6f'
      '2c2054332e536f747275644e6f'
      '2c2054332e427568'
      '2c2054332e506f73744e6f'
      '2c2054332e4e6f6d'
      '2c2054332e416464726573734944'
      '2c2054332e444f435f545950455f4944'
      '2c2054332e4461794e616b6c'
      '2c2054332e4461794f706c'
      '2c2054332e446179457870'
      '2c2054332e43757248645f4944'
      '2c2054332e43757241635f4944'
      '29205434'
      ''
      
        '4f52444552204259204f7464656c4e616d652c205669644e616d652c20536f74' +
        '7275644e616d652c205f446174654e616b6c2c205f4461794578702044455343')
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
    Left = 560
    Top = 272
  end
  object quFilter: TMSQuery
    MasterSource = dsDebt
    Left = 488
    Top = 352
  end
end
