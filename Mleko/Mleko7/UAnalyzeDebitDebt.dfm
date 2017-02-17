inherited frmAnalyzeDebitDebt: TfrmAnalyzeDebitDebt
  Left = 228
  Top = 165
  Width = 1111
  Height = 604
  Caption = #1040#1085#1072#1083#1080#1079' '#1076#1077#1073#1080#1090#1086#1088#1089#1082#1086#1081' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 505
    Width = 1095
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnRefresh: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      OnClick = btnRefreshClick
    end
    object btnExportToExcel: TButton
      Left = 280
      Top = 8
      Width = 129
      Height = 25
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      TabOrder = 1
      OnClick = btnExportToExcelClick
    end
  end
  object Panel3: TPanel [1]
    Left = 0
    Top = 0
    Width = 1095
    Height = 505
    Align = alClient
    TabOrder = 1
    object dbgDebts: TDBGridEh
      Left = 1
      Top = 138
      Width = 1093
      Height = 366
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
          FieldName = 'Otdel_Name'
          Footers = <>
          Title.Caption = #1054#1090#1076#1077#1083
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'VidTov_Name'
          Footers = <>
          Title.Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
        end
        item
          EditButtons = <>
          FieldName = 'Sotrud_Name'
          Footers = <>
          Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'Buh_Name'
          Footers = <>
          Title.Caption = #1041#1091#1093'. '#1090#1080#1087
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'Name_'
          Footer.Alignment = taRightJustify
          Footer.Value = #1048#1090#1086#1075#1086':'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'Summa'
          Footer.DisplayFormat = '0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072
        end
        item
          EditButtons = <>
          FieldName = 'SummaDolg'
          Footer.DisplayFormat = '0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1076#1086#1083#1075#1072
        end
        item
          EditButtons = <>
          FieldName = 'DateNakl'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        end
        item
          EditButtons = <>
          FieldName = 'DateOpl'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
        end
        item
          EditButtons = <>
          FieldName = 'Srok'
          Footers = <>
          Title.Caption = #1044#1083#1080#1090'. '#1087#1088#1086#1089#1088#1086#1095#1082#1080
        end
        item
          EditButtons = <>
          FieldName = 'Nom'
          Footers = <>
          Title.Caption = #1053#1086#1084'. '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        end
        item
          EditButtons = <>
          FieldName = 'Address_'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'CurrencyHead'
          Footers = <>
          Title.Caption = #1042#1072#1083#1102#1090#1072
        end
        item
          EditButtons = <>
          FieldName = 'CurAcc'
          Footers = <>
          Title.Caption = #1042#1072#1083#1102#1090#1072' '#1091#1095#1077#1090#1072
        end
        item
          EditButtons = <>
          FieldName = 'SummaAcc'
          Footer.DisplayFormat = '0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083'.'#1091#1095#1077#1090#1072
        end
        item
          EditButtons = <>
          FieldName = 'SummaDolgAcc'
          Footer.DisplayFormat = '0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1044#1086#1083#1075' '#1074' '#1074#1072#1083'.'#1091#1095#1077#1090#1072
        end>
    end
    object pnlControls: TPanel
      Left = 1
      Top = 1
      Width = 1093
      Height = 137
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 1
      DesignSize = (
        1093
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
          #1044#1072#1090#1072' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103'='
          #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072' '#1085#1072#1082#1083'.='
          #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072' '#1085#1072#1082#1083'.=')
        TabOrder = 0
        TitleCaptions.Strings = (
          #1055#1072#1088#1072#1084#1077#1090#1088
          #1044#1072#1090#1072)
        OnMouseMove = vleDateMouseMove
        OnSelectCell = vleDateSelectCell
        ColWidths = (
          123
          177)
      end
      object vleSelections: TValueListEditor
        Left = 453
        Top = 2
        Width = 636
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
          #1040#1076#1088#1077#1089#1072'=')
        TabOrder = 1
        TitleCaptions.Strings = (
          #1055#1072#1088#1072#1084#1077#1090#1088
          #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103)
        OnDblClick = vleSelectionsDblClick
        OnEditButtonClick = vleSelectionsEditButtonClick
        ColWidths = (
          123
          490)
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
          Align = alClient
          ItemHeight = 13
          Items.Strings = (
            #1054#1090#1076#1077#1083#1091' '#1087#1088#1086#1076#1072#1078
            #1042#1080#1076#1091' '#1090#1086#1074#1072#1088#1072
            #1057#1086#1090#1088#1091#1076#1085#1080#1082#1091
            #1041#1091#1093'. '#1090#1080#1087#1091
            #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
            #8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
            #1040#1076#1088#1077#1089#1091)
          PopupMenu = pmExpansion
          TabOrder = 0
        end
      end
    end
  end
  object sbStatus: TStatusBar [2]
    Left = 0
    Top = 546
    Width = 1095
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
  end
  object dsDebt: TMSDataSource
    DataSet = quDebt
    Left = 376
    Top = 185
  end
  object quDebt: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      '-- Source file is: D:\Projects\MyProgs\DBUtils\FTask-12-1.sql'
      '-- Param file is: D:\Projects\MyProgs\DBUtils\FTask-12-2.prm'
      'USE WORK'
      ''
      'declare'
      '@p_SotrudNo int'
      ',@p_SectorId int'
      ',@p_is_exp int'
      ',@p_is_only_firm int'
      ',@p_postNo int'
      ',@p_date_beg SmallDateTime'
      ',@p_date_end SmallDateTime'
      ',@p_date_nakl_beg SmallDateTime'
      ',@p_date_nakl_end SmallDateTime'
      ',@p_our_firm int'
      ',@p_is_expr_tovar int'
      ''
      ', @OwnerName'#9'varchar(30)'
      ', @UserNo'#9#9'int'
      ', @SPID'#9#9#9'int'
      ''
      'set @p_postNo=100'
      'set @p_SotrudNo = 10'
      'set @p_SectorId = -1'
      'set @p_is_exp = 0'
      'set @p_is_only_firm = 1'
      'set @p_date_beg = '#39'1900-01-01'#39
      'set @p_date_end = '#39'2017-02-02'#39
      'set @p_our_firm = 1'
      'set @p_is_expr_tovar = 1'
      ''
      'set @p_date_nakl_beg = '#39'1900-01-01'#39
      'set @p_date_nakl_end = getdate()'
      ''
      'set @p_postNo= :p_PostNo'
      'set @p_SotrudNo = :p_SotrudNo'
      'set @p_SectorId = -1'
      'set @p_is_exp = :p_is_exp'
      'set @p_is_only_firm = :p_is_only_firm'
      'set @p_date_beg = '#39'1900-01-01'#39
      'set @p_date_end = :p_date_end'
      'set @p_date_nakl_beg = :p_date_nakl_beg '
      'set @p_date_nakl_end = :p_date_nakl_end '
      'set @p_our_firm = :p_our_firm'
      'set @p_is_expr_tovar = :p_is_expr_tovar'
      '/*'
      'set'#9'@OwnerName  = :OwnerName '
      'set'#9'@UserNo'#9#9'= :UserNo'#9#9
      'set'#9'@SPID'#9#9'= :SPID'#9
      '*/'
      ''
      'SET @OwnerName  = '#39#39
      'SET @UserNo = 14'
      'SET @SPID = 60'
      ''
      '--if @p_is_expr_tovar = 1'
      ''
      'DECLARE'
      '  @Sel_OtdelNo int'
      ', @Sel_VidNo int'
      ', @Sel_SotrudNo int'
      ', @Sel_buh int'
      ', @Sel_PostNo int'
      ', @Sel_NaklRNo int'
      ', @Sel_AddressID int'
      ''
      ', @All_OtdelNo varchar(20)'
      ', @All_VidNo varchar(20)'
      ', @All_SotrudNo varchar(20)'
      ', @All_buh varchar(20)'
      ', @All_PostNo varchar(20)'
      ', @All_NaklRNo varchar(20)'
      ', @All_AddressID varchar(20)'
      ''
      ', @Expansions int'
      ', @Selections int'
      ''
      'SET @Sel_OtdelNo = 1'
      'SET @Sel_VidNo = 2'
      'SET @Sel_SotrudNo = 4'
      'SET @Sel_buh = 8'
      'SET @Sel_PostNo = 16'
      'SET @Sel_NaklRNo = 32'
      'SET @Sel_AddressID = 64'
      ''
      'SET @Expansions = 127'
      'SET @Selections = 0'
      'SET @All_OtdelNo = '#39#1042#1089#1077' '#1086#1090#1076#1077#1083#1099#39
      'SET @All_VidNo = '#39#1042#1089#1077' '#1074#1080#1076#1099#39
      'SET @All_SotrudNo = '#39#1042#1089#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080#39
      'SET @All_buh = '#39#1042#1089#1077' '#1073#1091#1093'.'#1090#1080#1087#1099#39
      'SET @All_PostNo = '#39#1042#1089#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099#39
      'SET @All_NaklRNo = '#39#1042#1089#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077#39
      'SET @All_AddressID = '#39#1042#1089#1077' '#1072#1076#1088#1077#1089#1072#39
      ''
      'SELECT'
      
        '  (CASE WHEN (t3.OtdelNo = -1) THEN @ALL_OtdelNo ELSE isnull(t3.' +
        'OtdelName, '#39#39') END) AS Otdel_Name'
      
        ', (CASE WHEN (t3.VidNo = -1) THEN @ALL_VidNo ELSE isnull(t3.VidT' +
        'ovName, '#39#39') END) AS VidTov_Name'
      
        ', (CASE WHEN (t3.SotrudNo = -1) THEN @ALL_SotrudNo ELSE isnull(t' +
        '3.SotrudName, '#39#39') END) AS Sotrud_Name'
      
        ', (CASE WHEN (t3.buh = -1) THEN @ALL_buh ELSE t3.BuhName END) AS' +
        ' Buh_Name'
      
        ', (CASE WHEN (t3.PostNo = -1) THEN @ALL_PostNo ELSE t3.Name END)' +
        ' AS Name_'
      ', (CASE WHEN (t3.NaklRNo = -1) THEN @ALL_NaklRNo ELSE '
      
        #9'CAST(isnull((SELECT Nom from NaklR nr where nr.NaklNo=t3.NaklRN' +
        'o), 0) as varchar(20)) END) AS Nom'
      ', (CASE WHEN (t3.AddressID = -1) THEN @ALL_AddressID '
      
        'ELSE isnull((SELECT Address from AddressPost ap where ap.ID=t3.A' +
        'ddressID), '#39#39') END) AS Address_'
      ', t3.SummaDolg AS SummaDolg'
      ', t3.Summa AS Summa'
      ', t3.SummaPlat AS SummaPlat'
      ', t3.OverSumma AS OverSumma'
      ', t3.DateNakl AS DateNakl'
      ', t3.DateOpl AS DateOpl'
      ', t3.Srok AS Srok'
      ', t3.Day_Exp AS Day_Exp'
      ', t3.SotrudName AS SotrudName'
      ', t3.Name AS Name'
      ', t3.Phone AS Phone'
      ', t3.BuhName AS BuhName'
      ', t3.VIP AS VIP'
      ', t3.VipName AS VipName'
      ', t3.Address AS Address'
      ', t3.MarschrutNo AS MarschrutNo'
      ', t3.SectorName AS SectorName'
      ', t3.Source_Type AS Source_Type'
      ', t3.OurFirmName AS OurFirmName'
      ', t3.NameTovar AS NameTovar'
      ', t3.KolTovar AS KolTovar'
      ', t3.SummaTovar AS SummaTovar'
      ', t3.CurrencyHead AS CurrencyHead'
      ', t3.CurAcc AS CurAcc'
      ', t3.OtdelName AS OtdelName'
      ', t3.VidTovName AS VidTovName'
      ', t3.SummaAcc AS SummaAcc'
      ', t3.SummaDolgAcc AS SummaDolgAcc'
      ''
      'FROM ('
      'SELECT'
      '  t2.OtdelNo AS OtdelNo'
      ', t2.VidNo AS VidNo'
      ', t2.SotrudNo AS SotrudNo'
      ', t2.buh AS buh'
      ', t2.PostNo AS PostNo'
      ', t2.NaklRNo AS NaklRNo'
      ', t2.AddressID AS AddressID'
      ', SUM(t2.SummaDolg) AS SummaDolg'
      ', SUM(t2.Summa) AS Summa'
      ', SUM(t2.SummaPlat) AS SummaPlat'
      ', SUM(t2.OverSumma) AS OverSumma'
      ', t2.DateNakl AS DateNakl'
      ', t2.DateOpl AS DateOpl'
      ', t2.Srok AS Srok'
      ', t2.Day_Exp AS Day_Exp'
      ', t2.SotrudName AS SotrudName'
      ', t2.Name AS Name'
      ', t2.Phone AS Phone'
      ', t2.BuhName AS BuhName'
      ', t2.VIP AS VIP'
      ', t2.VipName AS VipName'
      ', t2.Address AS Address'
      ', t2.MarschrutNo AS MarschrutNo'
      ', t2.SectorName AS SectorName'
      ', t2.Source_Type AS Source_Type'
      ', t2.OurFirmName AS OurFirmName'
      ', t2.NameTovar AS NameTovar'
      ', t2.KolTovar AS KolTovar'
      ', t2.SummaTovar AS SummaTovar'
      ', t2.CurrencyHead AS CurrencyHead'
      ', t2.CurAcc AS CurAcc'
      ', t2.OtdelName AS OtdelName'
      ', t2.VidTovName AS VidTovName'
      ', SUM(t2.SummaAcc) AS SummaAcc'
      ', SUM(t2.SummaDolgAcc) AS SummaDolgAcc'
      ''
      'FROM ('
      'SELECT'
      
        '  (CASE WHEN (@Expansions & @SEL_OtdelNo <> 0) THEN t1.OtdelNo E' +
        'LSE -1 END) AS OtdelNo'
      
        ', (CASE WHEN (@Expansions & @SEL_VidNo <> 0) THEN t1.VidNo ELSE ' +
        '-1 END) AS VidNo'
      
        ', (CASE WHEN (@Expansions & @SEL_SotrudNo <> 0) THEN t1.SotrudNo' +
        ' ELSE -1 END) AS SotrudNo'
      
        ', (CASE WHEN (@Expansions & @SEL_buh <> 0) THEN t1.buh ELSE -1 E' +
        'ND) AS buh'
      
        ', (CASE WHEN (@Expansions & @SEL_PostNo <> 0) THEN t1.PostNo ELS' +
        'E -1 END) AS PostNo'
      
        ', (CASE WHEN (@Expansions & @SEL_NaklRNo <> 0) THEN t1.NaklRNo E' +
        'LSE -1 END) AS NaklRNo'
      
        ', (CASE WHEN (@Expansions & @SEL_AddressID <> 0) THEN t1.Address' +
        'ID ELSE -1 END) AS AddressID'
      ', t1.SummaDolg AS SummaDolg'
      ', t1.Summa AS Summa'
      ', t1.SummaPlat AS SummaPlat'
      ', t1.OverSumma AS OverSumma'
      ', t1.DateNakl AS DateNakl'
      ', t1.DateOpl AS DateOpl'
      ', t1.Srok AS Srok'
      ', t1.Day_Exp AS Day_Exp'
      ', t1.SotrudName AS SotrudName'
      ', t1.Name AS Name'
      ', t1.Phone AS Phone'
      ', t1.BuhName AS BuhName'
      ', t1.VIP AS VIP'
      ', t1.VipName AS VipName'
      ', t1.Address AS Address'
      ', t1.MarschrutNo AS MarschrutNo'
      ', t1.SectorName AS SectorName'
      ', t1.Source_Type AS Source_Type'
      ', t1.OurFirmName AS OurFirmName'
      ', t1.NameTovar AS NameTovar'
      ', t1.KolTovar AS KolTovar'
      ', t1.SummaTovar AS SummaTovar'
      ', t1.CurrencyHead AS CurrencyHead'
      ', t1.CurAcc AS CurAcc'
      ', t1.OtdelName AS OtdelName'
      ', t1.VidTovName AS VidTovName'
      ', t1.SummaAcc AS SummaAcc'
      ', t1.SummaDolgAcc AS SummaDolgAcc'
      ''
      'FROM ('
      'SELECT DISTINCT     '
      '  h.NaklRNo'
      ', h.SummaDolg'
      ', h.Summa'
      ', h.SummaPlat'
      ', h.OverSumma'
      ', h.DateNakl'
      ', h.DateOpl'
      ', datediff(dd,h.DateNakl, h.DateOpl) as Srok'
      ', datediff(dd,h.DateOpl, @p_date_end ) as Day_Exp'
      ', Sotrud.SotrudName'
      ', Sotrud.SotrudNo'
      ', p.Name'
      ', p.PostNo'
      ', p.Phone '
      ', bt.Buh_type_Name AS BuhName'
      ', bt.buh'
      ', p.VIP'
      
        ', case when p.vip=1 then '#39'Vip '#1082#1083#1080#1077#1085#1090#1099#39' else '#39#1056#1086#1079#1085#1080#1095#1085#1099#1077' '#1082#1083#1080#1077#1085#1090#1099#39' ' +
        'end as VipName'
      ', ap.Address'
      '--, isnull(ap.Address,h.AddressLoad) as Address'
      ', ap.ID as AddressID'
      ', ap.MarschrutNo'
      ', s.Name as SectorName'
      ', h.Source_Type'
      ', h.OurFirmName'
      ', h.NameTovar'
      
        ', (case when h.KolTovar>=0 then CAST(h.KolTovar as CHAR(30)) els' +
        'e '#39#1050#1086#1083'. '#1074#1089#1077#1075#1086' '#1090#1086#1074#1072#1088#1072#39' end) as KolTovar'
      
        ', (case when h.SummaTovar>=0 then CAST(convert(decimal(18,2),h.S' +
        'ummaTovar) as CHAR(30)) else '#39#1057#1091#1084#1084#1072' '#1079#1072' '#1074#1077#1089#1100' '#1090#1086#1074#1072#1088#39' end) as Summa' +
        'Tovar'
      
        '--, case when (h.KolTovar>=0) CAST(h.KolTovar as CHAR(30)) else ' +
        #39#1042#1077#1089#1100' '#1090#1086#1074#1072#1088#39' end; '
      '--, convert(decimal(18,3),h.SummaTovar) as SummaTovar'
      ', h.CurrencyHead'
      ', h.CurAcc'
      ', h.OtdelNo'
      ', h.VidNo'
      
        ', (select v.OtdelName from VidOtdel v where v.OtdelNo=h.OtdelNo)' +
        ' as OtdelName'
      
        ', (select v.VidName from VidTov v where v.VidNo=h.VidNo) as VidT' +
        'ovName'
      
        ', (case when h.CurrencyHead=h.CurAcc then Summa else convert(dec' +
        'imal(18,3),Summa*Rate) end) as SummaAcc'
      
        ', (case when h.CurrencyHead=h.CurAcc then SummaDolg else convert' +
        '(decimal(18,3),SummaDolg*Rate) end) as SummaDolgAcc'
      'from Post p with (nolock) left outer join '
      '    (select h1.NaklNo as NaklRNo'
      '     , count(nom) as kol'
      '     , h1.SummaDolg'
      
        '     , case when h1.vidnaklNo=3 then -1*abs(h1.Summa) else h1.Su' +
        'mma end as Summa'
      
        '     , (case when h1.vidnaklNo=3 then -1*abs(h1.Summa) else h1.S' +
        'umma end)- h1.SummaDolg AS SummaPlat'
      '     , h1.DateNakl'
      '     , h1.DateOpl'
      '--     , ld.day_delay'
      '     , datediff(dd,h1.DateNakl, h1.DateOpl) as Srok'
      
        '--     , (ld.day_delay + datediff(dd,h1.DateOpl, GetDate())) * -' +
        '1 as Day_Exp'
      
        '     , Case when SummaDolg<0 then SummaDolg else 0 end as OverSu' +
        'mma'
      '     , h1.PostNo'
      '     , h1.PostNoFirst'
      '     , h1.AddressNo'
      '     , h1.buh'
      '     , h1.SotrudNo'
      
        '     , case when h1.vidnaklno=1 and h1.SummaDolg<0 then '#39#1055#1077#1088#1077#1087#1083#1072 +
        #1090#1072' '#1087#1086' '#1085#1072#1082#1083#1072#1076#1085#1086#1081#39
      '            when h1.vidnaklNo=3 then '#39#1042#1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088#1072#39
      
        '            when h1.vidnaklno=1 and h1.SummaDolg>0 then '#39#1044#1086#1083#1075' '#1087#1086 +
        ' '#1088#1072#1089#1093' '#1085#1072#1082#1083#1072#1076#1085#1086#1081#39
      
        '            when h1.vidnaklno=4 and h1.SummaDolg>0 then '#39#1044#1086#1083#1075' '#1087#1086 +
        ' '#1058#1072#1088#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081#39
      '            when h1.vidnaklNo=2 then '#39#1057#1087#1080#1089#1072#1085#1080#1077#39' else '#39#39' '
      #9#9'end as source_type'
      
        '     , (select Name from Post where PostNo=h1.OurFirmNo) as OurF' +
        'irmName'
      '     , OurFirmNo'
      
        '     , case when @p_is_expr_tovar = 1 then t.NameTovar else '#39#1042#1077#1089 +
        #1100' '#1090#1086#1074#1072#1088#39' end as NameTovar'
      
        '     --, case when @p_is_expr_tovar = 1 then cast(isnull(ds.QTY,' +
        ' 0) as varchar) else '#39#1042#1077#1089#1100' '#1090#1086#1074#1072#1088#39' end as KolTovar'
      
        '     --, case when @p_is_expr_tovar = 1 then cast(isnull(ds.QTY ' +
        '* ds.PRICE_ECO, 0) as varchar) else '#39#1042#1077#1089#1100' '#1090#1086#1074#1072#1088#39' end as SummaTov' +
        'ar'
      
        '     , case when @p_is_expr_tovar = 1 then isnull(ds.QTY, 0) els' +
        'e -1 end as KolTovar'
      
        '     , case when @p_is_expr_tovar = 1 then isnull(ds.QTY * ds.PR' +
        'ICE_ECO, 0.0) else -1.0 end as SummaTovar'
      '     , '#39#39' as AddressLoad'
      '     , h1.CurrencyHead'
      '     , h1.OtdelNo'
      '     , t.VidNo'
      '     , h1.CurrencyAccounting as CurAcc'
      '     , h1.RateCurrencyAccounting as Rate'
      '     from NaklR h1 with (nolock) left join '
      
        '--'#9'      l_post_set_artgroup_delay ld on ld.set_article_group_id' +
        ' = h1.set_article_group_id and ld.postno = h1.postno and ld.BUH ' +
        '= h1.Buh left join'
      
        #9#9'  DSPEC ds on ds.NaklNo = h1.NaklNo and ds.ENTITY_TYPE = '#39'RASH' +
        'OD'#39' left join'
      #9#9'  Tovar t on t.TovarNo = ds.ARTICLE_ID'
      '     where (h1.vidnaklno=1 and h1.SummaDolg>0)'
      '      and (h1.DateNakl between @p_date_beg and @p_date_end)'
      '    group by'
      '       h1.NaklNo'
      '     , h1.SummaDolg'
      '     , h1.vidnaklNo'
      '     , Summa'
      '     , h1.DateNakl'
      '     , h1.DateOpl'
      '--     , ld.day_delay'
      '     , h1.PostNo'
      '     , h1.PostNoFirst'
      '     , h1.AddressNo'
      '     , h1.buh'
      '     , h1.SotrudNo'
      '     , OurFirmNo'
      '     , t.NameTovar'
      '     , ds.QTY'
      '     , (ds.QTY * ds.PRICE_ECO)'
      '     , h1.CurrencyHead'
      '     , h1.OtdelNo'
      '     , t.VidNo'
      '     , h1.CurrencyAccounting'
      '     , h1.RateCurrencyAccounting'
      ''
      '    union all'
      '    select pp.PlatNo'
      '     , 0 as kol'
      '     , -1*SummaDolg'
      '     , -1*pp.Summa'
      '     , -1*(pp.Summa - pp.SummaDolg ) AS SummaPlat'
      '     , pp.DatePlat'
      '     , pp.DatePlat + ISNULL(pp.DayDeley, 0) as DateOpl'
      '--     , null as day_delay'
      '     , 0 as Srok'
      '--     , 0 as Day_Exp'
      '     , -1*pp.SummaDolg as OverSumma'
      '     , pp.PostNo'
      '     , pp.PostNoFirst'
      '     , 0 as AddressNo'
      '     , pp.buh'
      '     , pp.SotrudNo'
      '     , '#39#1054#1089#1090#1072#1090#1086#1082' '#1087#1088#1080#1093#1086#1076#1072' '#1076#1077#1085#1077#1075#39' as source_type'
      
        '     , (select Name from Post where PostNo=pp.OurFirmNo) as OurF' +
        'irmName'
      '     , OurFirmNo'
      '     , '#39#39
      '     , 0'
      '     , 0.0'
      '     , AddressLoad'
      '     , '#39#39
      '     , 0'
      '     , 0'
      '     , '#39#39
      '     , 1.0'
      '     from PlatP pp with (nolock)'
      '     where SummaDolg<>0'
      ''
      '      and (pp.DatePlat between @p_date_beg and @p_date_end)'
      ''
      '    union all'
      '    select pr.PlatNo'
      '     , 0 as kol'
      '     , SummaDolg'
      '     , pr.Summa'
      '     , (pr.Summa - pr.SummaDolg ) AS SummaPlat'
      '     , pr.DatePlat'
      '     , pr.DatePlat + ISNULL(pr.DayDeley, 0) as DateOpl'
      '     , 0 as Srok'
      '     , pr.SummaDolg as OverSumma'
      '     , pr.PostNo'
      '     , pr.PostNoFirst'
      '     , 0 as AddressNo'
      '     , pr.buh'
      '     , pr.SotrudNo'
      '     , '#39#1054#1089#1090#1072#1090#1086#1082' '#1088#1072#1089#1093#1086#1076#1072' '#1076#1077#1085#1077#1075#39' as source_type'
      
        '     , (select Name from Post where PostNo=pr.OurFirmNo) as OurF' +
        'irmName'
      '     , OurFirmNo'
      '     , '#39#39
      '     , 0'
      '     , 0.0'
      '     , AddressLoad'
      '     , '#39#39
      '     , 0'
      '     , 0'
      '     , '#39#39
      '     , 1.0'
      '     from PlatR pr with (nolock)'
      '     where SummaDolg<>0'
      '      and (pr.DatePlat between @p_date_beg and @p_date_end)'
      
        '      and (pr.VidRashodNo in (select VidRashodNo from VidRashod ' +
        'where IsVisebleInDolg = 1))'
      ' '
      '    ) h '
      '    on p.PostNo=h.PostNo'
      
        '   left outer join AddressPost ap on ap.AddressNo=h.AddressNo an' +
        'd ap.PostNo=h.PostNo '
      '   left outer join Sotrud on Sotrud.SotrudNo=h.SotrudNo'
      '   left outer join d_buh_type bt on h.Buh=bt.Buh'
      '   left outer join d_sector_response s on ap.MarschrutNo=s.id'
      'where SummaDolg is not null'
      ''
      'and (h.DateNakl between @p_date_nakl_beg and @p_date_nakl_end)'
      ''
      
        'and (h.OtdelNo in (select cast(param_value as int) from e_sessio' +
        'n_params'
      #9'where UserNo = @UserNo'
      #9'and (param_name = '#39'FLTOTDEL'#39') and (owner_name=@OwnerName)'
      #9'and (SPID=@SPID)) or (@Selections & @Sel_OtdelNo = 0))'
      #9
      
        'and (h.VidNo in (select cast(param_value as int) from e_session_' +
        'params'
      #9'where UserNo = @UserNo'
      #9'and (param_name = '#39'FLTVIDTOV'#39') and (owner_name=@OwnerName)'
      #9'and (SPID=@SPID)) or (@Selections & @Sel_VidNo = 0))'#9
      #9
      
        'and (h.SotrudNo in (select cast(param_value as int) from e_sessi' +
        'on_params'
      #9'where UserNo = @UserNo'
      #9'and (param_name = '#39'FLTSOTRUD'#39') and (owner_name=@OwnerName)'
      #9'and (SPID=@SPID)) or (@Selections & @SEL_SotrudNo = 0))'
      #9
      
        'and (h.Buh in (select cast(param_value as int) from e_session_pa' +
        'rams'
      #9'where UserNo = @UserNo'
      #9'and (param_name = '#39'FLTBUHTYPE'#39') and (owner_name=@OwnerName)'
      #9'and (SPID=@SPID)) or (@Selections & @SEL_BUH = 0))'
      #9
      
        'and (h.PostNo in (select cast(param_value as int) from e_session' +
        '_params'
      #9'where UserNo = @UserNo'
      #9'and (param_name = '#39'FLTAGENT'#39') and (owner_name=@OwnerName)'
      #9'and (SPID=@SPID)) or (@Selections & @Sel_PostNo = 0))'
      #9
      
        'and (h.NaklRNo in (select cast(param_value as int) from e_sessio' +
        'n_params'
      #9'where UserNo = @UserNo'
      #9'and (param_name = '#39'FLTNAKLNO'#39') and (owner_name=@OwnerName)'
      #9'and (SPID=@SPID)) or (@Selections & @Sel_NaklRNo = 0))'
      #9
      
        'and (ap.ID in (select cast(param_value as int) from e_session_pa' +
        'rams'
      #9'where UserNo = @UserNo'
      #9'and (param_name = '#39'FLTADDRESS'#39') and (owner_name=@OwnerName)'
      #9'and (SPID=@SPID)) or (@Selections & @Sel_AddressID= 0))'#9
      #9#9#9#9#9#9#9' '#9#9#9#9'  '
      '   and (datediff(dd,h.DateOpl, @p_date_end) >0 or @p_is_exp=0)'
      '   and (exists(select 1 from l_firm_prop '
      '                where postNo = h.PostNo '
      #9#9#9#9'  and prop_id = 4) or @p_is_only_firm = 0)'
      #9#9#9#9#9#9#9' '#9#9#9#9'  '
      '   and (datediff(dd,h.DateOpl, @p_date_end) >0 or @p_is_exp=0)'
      '   and (exists(select 1 from l_firm_prop '
      '                where postNo = h.PostNo '
      #9#9#9#9'  and prop_id = 4) or @p_is_only_firm = 0)'
      '/*'
      '   and (datediff(dd,h.DateOpl, @p_date_end) >0 or @p_is_exp=0)'
      '   and (exists(select 1 from l_firm_prop '
      '                where postNo = h.PostNo '
      #9#9#9#9'  and prop_id = 4) or @p_is_only_firm = 0)'
      #9#9#9#9'  */'
      
        '--order by h.Source_Type,Sotrud.SotrudName, p.VIP,p.Name,h.DateN' +
        'akl,h.nom'
      ') AS t1'
      ') AS t2'
      'GROUP BY'
      '  t2.OtdelNo'
      ', t2.VidNo'
      ', t2.SotrudNo'
      ', t2.buh'
      ', t2.PostNo'
      ', t2.NaklRNo'
      ', t2.AddressID'
      ', t2.DateNakl'
      ', t2.DateOpl'
      ', t2.Srok'
      ', t2.Day_Exp'
      ', t2.SotrudName'
      ', t2.Name'
      ', t2.Phone'
      ', t2.BuhName'
      ', t2.VIP'
      ', t2.VipName'
      ', t2.Address'
      ', t2.MarschrutNo'
      ', t2.SectorName'
      ', t2.Source_Type'
      ', t2.OurFirmName'
      ', t2.NameTovar'
      ', t2.KolTovar'
      ', t2.SummaTovar'
      ', t2.CurrencyHead'
      ', t2.CurAcc'
      ', t2.OtdelName'
      ', t2.VidTovName'
      ') AS t3'
      
        'where (t3.OtdelName<>'#39#39') and (t3.VidTovName<>'#39#39') and (t3.NaklRNo' +
        '<>0)'
      'order by t3.OtdelName, t3.VidTovName, t3.SotrudName, t3.NaklRNo')
    BeforeOpen = quDebtBeforeOpen
    Left = 536
    Top = 225
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_PostNo'
      end
      item
        DataType = ftUnknown
        Name = 'p_SotrudNo'
      end
      item
        DataType = ftUnknown
        Name = 'p_is_exp'
      end
      item
        DataType = ftUnknown
        Name = 'p_is_only_firm'
      end
      item
        DataType = ftDateTime
        Name = 'p_date_end'
      end
      item
        DataType = ftDateTime
        Name = 'p_date_nakl_beg'
      end
      item
        DataType = ftDateTime
        Name = 'p_date_nakl_end'
      end
      item
        DataType = ftUnknown
        Name = 'p_our_firm'
      end
      item
        DataType = ftUnknown
        Name = 'p_is_expr_tovar'
      end>
    object quDebtOtdelName: TStringField
      FieldName = 'OtdelName'
      ReadOnly = True
      Size = 30
    end
    object quDebtVidTovName: TStringField
      FieldName = 'VidTovName'
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
    object quDebtSumma: TFloatField
      FieldName = 'Summa'
      ReadOnly = True
    end
    object quDebtSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      ReadOnly = True
    end
    object quDebtOverSumma: TFloatField
      FieldName = 'OverSumma'
      ReadOnly = True
    end
    object quDebtDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      ReadOnly = True
    end
    object quDebtDateOpl: TDateTimeField
      FieldName = 'DateOpl'
      ReadOnly = True
    end
    object quDebtSrok: TIntegerField
      FieldName = 'Srok'
      ReadOnly = True
    end
    object quDebtCurrencyHead: TStringField
      FieldName = 'CurrencyHead'
      ReadOnly = True
      Size = 1
    end
    object quDebtCurAcc: TStringField
      FieldName = 'CurAcc'
      ReadOnly = True
      Size = 1
    end
    object quDebtSummaAcc: TFloatField
      FieldName = 'SummaAcc'
      ReadOnly = True
    end
    object quDebtSummaDolgAcc: TFloatField
      FieldName = 'SummaDolgAcc'
      ReadOnly = True
    end
    object quDebtName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 30
    end
    object quDebtOtdel_Name: TStringField
      FieldName = 'Otdel_Name'
      ReadOnly = True
      Size = 30
    end
    object quDebtVidTov_Name: TStringField
      FieldName = 'VidTov_Name'
      ReadOnly = True
      Size = 30
    end
    object quDebtSotrud_Name: TStringField
      FieldName = 'Sotrud_Name'
      ReadOnly = True
      Size = 30
    end
    object quDebtBuh_Name: TStringField
      FieldName = 'Buh_Name'
      ReadOnly = True
    end
    object quDebtName_: TStringField
      FieldName = 'Name_'
      ReadOnly = True
      Size = 30
    end
    object quDebtSummaPlat: TFloatField
      FieldName = 'SummaPlat'
      ReadOnly = True
    end
    object quDebtDay_Exp: TIntegerField
      FieldName = 'Day_Exp'
      ReadOnly = True
    end
    object quDebtPhone: TStringField
      FieldName = 'Phone'
      Size = 15
    end
    object quDebtVIP: TBooleanField
      FieldName = 'VIP'
    end
    object quDebtVipName: TStringField
      FieldName = 'VipName'
      ReadOnly = True
      Size = 17
    end
    object quDebtMarschrutNo: TSmallintField
      FieldName = 'MarschrutNo'
    end
    object quDebtSectorName: TStringField
      FieldName = 'SectorName'
      Size = 50
    end
    object quDebtSource_Type: TStringField
      FieldName = 'Source_Type'
      ReadOnly = True
      Size = 24
    end
    object quDebtOurFirmName: TStringField
      FieldName = 'OurFirmName'
      ReadOnly = True
      Size = 30
    end
    object quDebtNameTovar: TStringField
      FieldName = 'NameTovar'
      ReadOnly = True
      Size = 128
    end
    object quDebtKolTovar: TStringField
      FieldName = 'KolTovar'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object quDebtSummaTovar: TStringField
      FieldName = 'SummaTovar'
      ReadOnly = True
      FixedChar = True
      Size = 30
    end
    object quDebtAddress: TStringField
      FieldName = 'Address_'
      ReadOnly = True
      Size = 256
    end
    object quDebtNom: TStringField
      FieldName = 'Nom'
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
  object sthVerify: TStrHolder
    Macros = <>
    Left = 456
    Top = 257
    InternalVer = 1
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
  object MemTableEh1: TMemTableEh
    Params = <>
    Left = 576
    Top = 217
  end
  object pmExpansion: TPopupMenu
    Left = 368
    Top = 265
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
    Left = 176
    Top = 257
    object mnuSetDefaultDates: TMenuItem
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1072#1090#1099' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      OnClick = mnuSetDefaultDatesClick
    end
  end
  object pmSelections: TPopupMenu
    Left = 608
    Top = 305
    object mnuDeleteAllSelections: TMenuItem
      Caption = #1059#1073#1088#1072#1090#1100' '#1074#1089#1077' '#1074#1099#1073#1086#1088#1099
      OnClick = mnuDeleteAllSelectionsClick
    end
  end
end
