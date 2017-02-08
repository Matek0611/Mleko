inherited frmAnalyze_Debit_Debt: TfrmAnalyze_Debit_Debt
  Left = 160
  Top = 136
  Width = 1303
  Height = 604
  Caption = #1040#1085#1072#1083#1080#1079' '#1076#1077#1073#1080#1090#1086#1088#1089#1082#1086#1081' '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080' (v2)'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1287
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label5: TLabel
      Left = 12
      Top = 10
      Width = 86
      Height = 13
      Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
    end
    object EdDateAnalyzeEnd: TcxDateEdit
      Left = 13
      Top = 25
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      Properties.OnChange = EdDateAnalyzeEndPropertiesChange
      TabOrder = 0
      Width = 105
    end
    object cbIs_Ext_OtdelNo: TCheckBox
      Left = 128
      Top = 14
      Width = 169
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1086#1090#1076#1077#1083#1091' '#1087#1088#1086#1076#1072#1078
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = cbIs_Ext_OtdelNoClick
    end
    object cbIs_Ext_VidNo: TCheckBox
      Left = 143
      Top = 38
      Width = 153
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1074#1080#1076#1091' '#1090#1086#1074#1072#1088#1072
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = cbIs_Ext_VidNoClick
    end
    object cbIs_Ext_SotrudNo: TCheckBox
      Left = 140
      Top = 62
      Width = 153
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = cbIs_Ext_SotrudNoClick
    end
    object fltVidTov: TcitDBComboEdit
      Left = 299
      Top = 37
      Width = 164
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnFlat = False
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 0
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblWidth = 70
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
      TabOrder = 4
      Visible = True
      LocateKey = False
      KeyField = 'VidNo'
      TextField = 'VidName'
      Owner = 'frmAnalyzeDebitDebt'
      EntityCode = 'VIDTOV'
      multiselect = True
      OnSelectOk = fltVidTovSelectOk
      EditStyle = edSelect
      AutoTabControl = False
    end
    object fltOtdel: TcitDBComboEdit
      Left = 299
      Top = 13
      Width = 164
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnFlat = False
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 0
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblWidth = 80
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
      TabOrder = 5
      Visible = True
      LocateKey = False
      KeyField = 'OtdelNo'
      TextField = 'OtdelName'
      Owner = 'frmAnalyzeDebitDebt'
      EntityCode = 'VIDOTDEL'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object fltSotrud: TcitDBComboEdit
      Left = 299
      Top = 61
      Width = 165
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnFlat = False
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 0
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblWidth = 70
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
      TabOrder = 6
      Visible = True
      LocateKey = False
      KeyField = 'SotrudNo'
      TextField = 'SotrudName'
      Owner = 'frmAnalyze_Debit_Debt'
      EntityCode = 'SOTRUD'
      multiselect = True
      OnSelectOk = fltSotrudSelectOk
      EditStyle = edSelect
      AutoTabControl = False
    end
    object cbxBuhType: TCheckBox
      Left = 560
      Top = 16
      Width = 145
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1073#1091#1093'. '#1090#1080#1087#1091
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object cbxAgent: TCheckBox
      Left = 541
      Top = 40
      Width = 157
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object cbxNaklNo: TCheckBox
      Left = 534
      Top = 66
      Width = 163
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#8470' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object fltBuhType: TcitDBComboEdit
      Left = 699
      Top = 13
      Width = 164
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnFlat = False
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 0
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblWidth = 80
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
      TabOrder = 10
      Visible = True
      LocateKey = False
      KeyField = 'buh'
      TextField = 'Buh_type_name'
      Owner = 'frmAnalyzeDebitDebt'
      EntityCode = 'd_buh_type'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object fltAddress: TcitDBComboEdit
      Left = 1028
      Top = 13
      Width = 164
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnFlat = False
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 115
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblWidth = 80
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
      TabOrder = 12
      Visible = True
      LocateKey = False
      KeyField = 'ID'
      TextField = 'Address'
      Owner = 'frmAnalyzeDebitDebt'
      EntityCode = 'AddressPost'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object cbxAddress: TCheckBox
      Left = 896
      Top = 16
      Width = 129
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
    object fltAgent: TcitDBComboEdit
      Left = 699
      Top = 38
      Width = 164
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnFlat = False
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 0
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblWidth = 80
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
      TabOrder = 13
      Visible = True
      LocateKey = False
      KeyField = 'PostNo'
      TextField = 'Name'
      Owner = 'frmAnalyzeDebitDebt'
      EntityCode = 'Post'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object fltNaklNo: TcitDBComboEdit
      Left = 699
      Top = 63
      Width = 164
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnFlat = False
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 0
      LBtnShortCut2 = 40
      LBtnWidth = 25
      LLblAlignment = laLeft
      LLblWidth = 80
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
      Visible = True
      LocateKey = False
      KeyField = 'PlatNo'
      TextField = 'Nom'
      Owner = 'frmAnalyzeDebitDebt'
      EntityCode = 'PlatR'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 505
    Width = 1287
    Height = 41
    Align = alBottom
    TabOrder = 1
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
  object Panel3: TPanel [2]
    Left = 0
    Top = 97
    Width = 1287
    Height = 408
    Align = alClient
    TabOrder = 2
    object dbgDebts: TDBGridEh
      Left = 1
      Top = 1
      Width = 1285
      Height = 406
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
          FieldName = 'OverSumma'
          Footer.DisplayFormat = '0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1087#1088#1086#1089#1088#1086#1095#1082#1080
        end
        item
          EditButtons = <>
          FieldName = 'DateNakl'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
          Width = 64
        end
        item
          EditButtons = <>
          FieldName = 'DateOpl'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
          Width = 64
        end
        item
          EditButtons = <>
          FieldName = 'Srok'
          Footers = <>
          Title.Caption = #1044#1083#1080#1090'. '#1087#1088#1086#1089#1088#1086#1095#1082#1080
        end
        item
          EditButtons = <>
          FieldName = 'Nom_'
          Footers = <>
          Title.Caption = #1053#1086#1084'. '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        end
        item
          EditButtons = <>
          FieldName = 'AddressName'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'CurrencyHead'
          Footers = <>
          Title.Caption = #1042#1072#1083#1102#1090#1072
          Width = 64
        end
        item
          EditButtons = <>
          FieldName = 'CurAcc'
          Footers = <>
          Title.Caption = #1042#1072#1083#1102#1090#1072' '#1091#1095#1077#1090#1072
          Width = 64
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
  end
  object sbStatus: TStatusBar [3]
    Left = 0
    Top = 546
    Width = 1287
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
        Width = 70
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
      'set'#9'@OwnerName  = '#39#39' '
      'set'#9'@UserNo'#9#9'= 14'#9#9
      'set'#9'@SPID'#9#9'= 60'#9
      ''
      ''
      'set @p_postNo= :p_PostNo'
      'set @p_SotrudNo = :p_SotrudNo'
      'set @p_SectorId = -1'
      'set @p_is_exp = :p_is_exp'
      'set @p_is_only_firm = :p_is_only_firm'
      'set @p_date_beg = '#39'1900-01-01'#39
      'set @p_date_end = :p_date_end'
      'set @p_our_firm = :p_our_firm'
      'set @p_is_expr_tovar = :p_is_expr_tovar'
      'set'#9'@OwnerName  = :OwnerName '
      'set'#9'@UserNo'#9#9'= :UserNo'#9#9
      'set'#9'@SPID'#9#9'= :SPID'#9
      ''
      ''
      '--if @p_is_expr_tovar = 1'
      ''
      'DECLARE'
      '  @Sel_OtdelNo int'
      ', @Sel_VidNo int'
      ', @Sel_SotrudNo int'
      ', @Sel_buh int'
      ', @Sel_PostNo int'
      ', @Sel_Nom int'
      ', @Sel_AddressNo int'
      ', @Sel_Srok int'
      ', @Sel_Day_Exp int'
      ', @Sel_SotrudName int'
      ', @Sel_Name int'
      ', @Sel_Phone int'
      ', @Sel_BuhName int'
      ', @Sel_VIP int'
      ', @Sel_VipName int'
      ', @Sel_Address int'
      ', @Sel_MarschrutNo int'
      ', @Sel_SectorName int'
      ', @Sel_Source_Type int'
      ', @Sel_OurFirmName int'
      ', @Sel_NameTovar int'
      ', @Sel_KolTovar int'
      ', @Sel_SummaTovar int'
      ', @Sel_CurrencyHead int'
      ', @Sel_CurAcc int'
      ', @Sel_OtdelName int'
      ', @Sel_VidTovName int'
      ''
      ', @All_OtdelNo varchar(20)'
      ', @All_VidNo varchar(20)'
      ', @All_SotrudNo varchar(20)'
      ', @All_buh varchar(20)'
      ', @All_PostNo varchar(20)'
      ', @All_Nom varchar(20)'
      ', @All_AddressNo varchar(20)'
      ', @All_Srok varchar(20)'
      ', @All_Day_Exp varchar(20)'
      ', @All_SotrudName varchar(20)'
      ', @All_Name varchar(20)'
      ', @All_Phone varchar(20)'
      ', @All_BuhName varchar(20)'
      ', @All_VIP varchar(20)'
      ', @All_VipName varchar(20)'
      ', @All_Address varchar(20)'
      ', @All_MarschrutNo varchar(20)'
      ', @All_SectorName varchar(20)'
      ', @All_Source_Type varchar(20)'
      ', @All_OurFirmName varchar(20)'
      ', @All_NameTovar varchar(20)'
      ', @All_KolTovar varchar(20)'
      ', @All_SummaTovar varchar(20)'
      ', @All_CurrencyHead varchar(20)'
      ', @All_CurAcc varchar(20)'
      ', @All_OtdelName varchar(20)'
      ', @All_VidTovName varchar(20)'
      ''
      ', @Expansions int'
      ', @Selections int'
      ''
      'SET @Sel_OtdelNo = 1'
      'SET @Sel_VidNo = 2'
      'SET @Sel_SotrudNo = 4'
      'SET @Sel_buh = 8'
      'SET @Sel_PostNo = 16'
      'SET @Sel_Nom = 32'
      'SET @Sel_AddressNo = 64'
      'SET @Sel_Srok = 128'
      'SET @Sel_Day_Exp = 256'
      'SET @Sel_SotrudName = 512'
      'SET @Sel_Name = 1024'
      'SET @Sel_Phone = 2048'
      'SET @Sel_BuhName = 4096'
      'SET @Sel_VIP = 8192'
      'SET @Sel_VipName = 16384'
      'SET @Sel_Address = 32768'
      'SET @Sel_MarschrutNo = 65536'
      'SET @Sel_SectorName = 131072'
      'SET @Sel_Source_Type = 262144'
      'SET @Sel_OurFirmName = 524288'
      'SET @Sel_NameTovar = 1048576'
      'SET @Sel_KolTovar = 2097152'
      'SET @Sel_SummaTovar = 4194304'
      'SET @Sel_CurrencyHead = 8388608'
      'SET @Sel_CurAcc = 16777216'
      'SET @Sel_OtdelName = 33554432'
      'SET @Sel_VidTovName = 67108864'
      ''
      'SET @Expansions = 134217727'
      'SET @Selections = 134217727'
      'SET @All_OtdelNo = '#39#1042#1089#1077' '#1086#1090#1076#1077#1083#1099#39
      'SET @All_VidNo = '#39#1042#1089#1077' '#1074#1080#1076#1099#39
      'SET @All_SotrudNo = '#39#1042#1089#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1080#39
      'SET @All_buh = '#39#1042#1089#1077' '#1073#1091#1093'.'#1090#1080#1087#1099#39
      'SET @All_PostNo = '#39#1042#1089#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099#39
      'SET @All_Nom = '#39#1042#1089#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077#39
      'SET @All_AddressNo = '#39#1042#1089#1077' '#1072#1076#1088#1077#1089#1072#39
      'SET @All_Srok = '#39'All_Srok'#39
      'SET @All_Day_Exp = '#39'All_Day_Exp'#39
      'SET @All_SotrudName = '#39'All_SotrudName'#39
      'SET @All_Name = '#39'All_Name'#39
      'SET @All_Phone = '#39'All_Phone'#39
      'SET @All_BuhName = '#39'All_BuhName'#39
      'SET @All_VIP = '#39'All_VIP'#39
      'SET @All_VipName = '#39'All_VipName'#39
      'SET @All_Address = '#39'All_Address'#39
      'SET @All_MarschrutNo = '#39'All_MarschrutNo'#39
      'SET @All_SectorName = '#39'All_SectorName'#39
      'SET @All_Source_Type = '#39'All_Source_Type'#39
      'SET @All_OurFirmName = '#39'All_OurFirmName'#39
      'SET @All_NameTovar = '#39'All_NameTovar'#39
      'SET @All_KolTovar = '#39'All_KolTovar'#39
      'SET @All_SummaTovar = '#39'All_SummaTovar'#39
      'SET @All_CurrencyHead = '#39'All_CurrencyHead'#39
      'SET @All_CurAcc = '#39'All_CurAcc'#39
      'SET @All_OtdelName = '#39'All_OtdelName'#39
      'SET @All_VidTovName = '#39'All_VidTovName'#39
      ''
      'SELECT'
      
        '  (CASE WHEN (t3.OtdelNo = -1) THEN @ALL_OtdelNo ELSE t3.OtdelNa' +
        'me END) AS Otdel_Name'
      
        ', (CASE WHEN (t3.VidNo = -1) THEN @ALL_VidNo ELSE t3.VidTovName ' +
        'END) AS VidTov_Name'
      
        ', (CASE WHEN (t3.SotrudNo = -1) THEN @ALL_SotrudNo ELSE t3.Sotru' +
        'dName END) AS Sotrud_Name'
      
        ', (CASE WHEN (t3.buh = -1) THEN @ALL_buh ELSE t3.BuhName END) AS' +
        ' Buh_Name'
      
        ', (CASE WHEN (t3.PostNo = -1) THEN @ALL_PostNo ELSE t3.Name END)' +
        ' AS Name_'
      
        ', (CASE WHEN (t3.Nom = -1) THEN @ALL_Nom ELSE CAST(t3.Nom as var' +
        'char(20)) END) AS Nom'
      
        ', (CASE WHEN (t3.AddressNo = -1) THEN @ALL_AddressNo ELSE CAST(i' +
        'snull(t3.Address, '#39#39') as varchar(20)) END) AS AddressName'
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
      ', t3.AddressNo as AddressNo'
      ''
      'FROM ('
      'SELECT'
      '  t2.OtdelNo AS OtdelNo'
      ', t2.VidNo AS VidNo'
      ', t2.SotrudNo AS SotrudNo'
      ', t2.buh AS buh'
      ', t2.PostNo AS PostNo'
      ', t2.Nom AS Nom'
      ', t2.AddressNo AS AddressNo'
      ', SUM(t2.SummaDolg) AS SummaDolg'
      ', SUM(t2.Summa) AS Summa'
      ', SUM(t2.SummaPlat) AS SummaPlat'
      ', SUM(t2.OverSumma) AS OverSumma'
      ', MIN(t2.DateNakl) AS DateNakl'
      ', MIN(t2.DateOpl) AS DateOpl'
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
      
        ', (CASE WHEN (@Expansions & @SEL_Nom <> 0) THEN t1.Nom ELSE -1 E' +
        'ND) AS Nom'
      
        ', (CASE WHEN (@Expansions & @SEL_AddressNo <> 0) THEN t1.Address' +
        'No ELSE -1 END) AS AddressNo'
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
      '  h.Nom'
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
      
        ', case when p.vip=1 then '#39'Vip eeeaiou'#39' else '#39'?icie?iua eeeaiou'#39' ' +
        'end as VipName'
      ', ap.Address'
      '--, isnull(ap.Address,h.AddressLoad) as Address'
      ', ap.AddressNo'
      ', ap.MarschrutNo'
      ', s.Name as SectorName'
      ', h.Source_Type'
      ', h.OurFirmName'
      ', h.NameTovar'
      
        ', (case when h.KolTovar>=0 then CAST(h.KolTovar as CHAR(30)) els' +
        'e '#39'Eie. anaai oiaa?a'#39' end) as KolTovar'
      
        ', (case when h.SummaTovar>=0 then CAST(convert(decimal(18,2),h.S' +
        'ummaTovar) as CHAR(30)) else '#39'Noiia ca aanu oiaa?'#39' end) as Summa' +
        'Tovar'
      
        '--, case when (h.KolTovar>=0) CAST(h.KolTovar as CHAR(30)) else ' +
        #39'Aanu oiaa?'#39' end; '
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
      '    (select h1.Nom'
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
      
        '     , case when h1.vidnaklno=1 and h1.SummaDolg<0 then '#39'Ia?aiea' +
        'oa ii iaeeaaiie'#39
      '            when h1.vidnaklNo=3 then '#39'Aica?ao oiaa?a'#39
      
        '            when h1.vidnaklno=1 and h1.SummaDolg>0 then '#39'Aiea ii' +
        ' ?ano iaeeaaiie'#39
      
        '            when h1.vidnaklno=4 and h1.SummaDolg>0 then '#39'Aiea ii' +
        ' Oa?iie iaeeaaiie'#39
      '            when h1.vidnaklNo=2 then '#39'Nienaiea'#39' else '#39#39' '
      #9#9'end as source_type'
      
        '     , (select Name from Post where PostNo=h1.OurFirmNo) as OurF' +
        'irmName'
      '     , OurFirmNo'
      
        '     , case when @p_is_expr_tovar = 1 then t.NameTovar else '#39'Aan' +
        'u oiaa?'#39' end as NameTovar'
      
        '     --, case when @p_is_expr_tovar = 1 then cast(isnull(ds.QTY,' +
        ' 0) as varchar) else '#39'Aanu oiaa?'#39' end as KolTovar'
      
        '     --, case when @p_is_expr_tovar = 1 then cast(isnull(ds.QTY ' +
        '* ds.PRICE_ECO, 0) as varchar) else '#39'Aanu oiaa?'#39' end as SummaTov' +
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
      '       nom'
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
      '    select pp.Nom'
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
      '     , '#39'Inoaoie i?eoiaa aaiaa'#39' as source_type'
      
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
      '    select pr.Nom'
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
      '     , '#39'Inoaoie ?anoiaa aaiaa'#39' as source_type'
      
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
      '   AND (h.SotrudNo in (select cast(param_value as int) '
      '                        from e_session_params '
      '                         where UserNo = @UserNo '
      #9#9#9#9#9#9'   and owner_name = @OwnerName  '
      #9#9#9#9#9#9'   and param_name = '#39'P_SOTRUDNO'#39'  '
      '                           and SPID=@SPID ) or @p_SotrudNo=-1)'
      '/*'
      '   AND (h.PostNo in (select cast(param_value as int) '
      '                      from e_session_params '
      '                       where UserNo = @UserNo '
      #9#9#9#9#9'     and owner_name = @OwnerName  '
      #9#9#9#9#9#9' and param_name = '#39'P_POSTNO'#39'  '
      '                         and SPID=@SPID ) or @p_PostNo=-1)'
      ''
      '   AND  (s.id in (select cast(param_value as int) '
      '                   from e_session_params '
      '                    where UserNo = @UserNo '
      #9#9#9#9#9'  and owner_name = @OwnerName  '
      #9#9#9#9#9'  and param_name = '#39'P_SECTORID'#39'  '
      '                      and SPID=@SPID ) or @p_SectorId=-1)'
      '   AND (h.OurFirmNo in (select cast(param_value as int) '
      '                         from e_session_params '
      #9#9#9#9#9#9'  where UserNo = @UserNo '
      #9#9#9#9#9#9'    and owner_name = @OwnerName  '
      #9#9#9#9#9#9#9'and param_name = '#39'P_OUR_FIRM'#39'  '
      '                            and SPID=@SPID ) or @P_OUR_FIRM=-1)'
      '*/'
      '   and (datediff(dd,h.DateOpl, @p_date_end) >0 or @p_is_exp=0)'
      '   and (exists(select 1 from l_firm_prop '
      '                where postNo = h.PostNo '
      #9#9#9#9'  and prop_id = 4) or @p_is_only_firm = 0)'
      ') AS t1'
      ') AS t2'
      'GROUP BY'
      '  t2.OtdelNo'
      ', t2.VidNo'
      ', t2.SotrudNo'
      ', t2.buh'
      ', t2.PostNo'
      ', t2.Nom'
      ', t2.AddressNo'
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
      
        'order by t3.Source_Type, t3.SotrudName, t3.VIP, t3.Name, t3.Date' +
        'Nakl, t3.nom')
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
        DataType = ftUnknown
        Name = 'p_date_end'
      end
      item
        DataType = ftUnknown
        Name = 'p_our_firm'
      end
      item
        DataType = ftUnknown
        Name = 'p_is_expr_tovar'
      end
      item
        DataType = ftUnknown
        Name = 'OwnerName'
      end
      item
        DataType = ftUnknown
        Name = 'UserNo'
      end
      item
        DataType = ftUnknown
        Name = 'SPID'
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
    object quDebtAddress: TStringField
      FieldName = 'Address'
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
    object quDebtNom: TStringField
      FieldName = 'Nom'
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
    object quDebtAddressName: TStringField
      FieldName = 'AddressName'
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
end
