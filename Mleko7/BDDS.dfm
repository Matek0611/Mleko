inherited BDDSForm: TBDDSForm
  Left = 301
  Top = 324
  Width = 1447
  Height = 673
  Caption = #1041#1044#1044#1057
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1431
    Height = 185
    Align = alTop
    TabOrder = 0
    object DBTextSaldo: TDBText
      Left = 175
      Top = 160
      Width = 65
      Height = 17
      DataField = 'Saldo'
      DataSource = dsSaldo
    end
    object Label3: TLabel
      Left = 8
      Top = 160
      Width = 160
      Height = 13
      Caption = #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1085#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 256
      Top = 161
      Width = 154
      Height = 13
      Caption = #1057#1072#1083#1100#1076#1086' '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTextEndSaldo: TDBText
      Left = 423
      Top = 161
      Width = 65
      Height = 17
      DataField = 'EndSaldo'
      DataSource = dsSaldo
    end
    object Label5: TLabel
      Left = 504
      Top = 159
      Width = 146
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object p_bank_invoice_id: TcitDBComboEdit
      Left = 182
      Top = 104
      Width = 226
      Height = 21
      Enabled = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
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
      LLblWidth = 80
      LLblFont.Charset = DEFAULT_CHARSET
      LLblFont.Color = clWindowText
      LLblFont.Height = -11
      LLblFont.Name = 'MS Sans Serif'
      LLblFont.Style = [fsBold]
      LLblRequiredFont.Charset = DEFAULT_CHARSET
      LLblRequiredFont.Color = clWindowText
      LLblRequiredFont.Height = -11
      LLblRequiredFont.Name = 'MS Sans Serif'
      LLblRequiredFont.Style = [fsBold]
      Required = False
      ParentFont = False
      TabOrder = 0
      Visible = True
      OnExit = p_bank_invoice_idExit
      DataSet = quBankInvoice
      KeyFieldValue = '1'
      LocateKey = False
      KeyField = 'ID'
      TextField = 'Invoice_Name'
      OnSelectOk = p_bank_invoice_idSelectOk
      EditStyle = edCombo
      AutoTabControl = True
    end
    object GroupBoxDates: TGroupBox
      Left = 16
      Top = 8
      Width = 289
      Height = 57
      Caption = #1044#1072#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object gBPeriod: TGroupBox
        Left = 4
        Top = 16
        Width = 273
        Height = 36
        Caption = #1055#1077#1088#1080#1086#1076
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 18
          Width = 9
          Height = 13
          Caption = #1057
        end
        object Label2: TLabel
          Left = 141
          Top = 18
          Width = 17
          Height = 13
          Caption = #1055#1086
        end
        object EdDateBeg: TcxDateEdit
          Left = 21
          Top = 13
          Properties.ClearKey = 46
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.WeekNumbers = True
          Properties.OnChange = EdDateBegPropertiesChange
          TabOrder = 0
          Width = 105
        end
        object EdDateEnd: TcxDateEdit
          Left = 159
          Top = 13
          Properties.ClearKey = 46
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.WeekNumbers = True
          Properties.OnChange = EdDateEndPropertiesChange
          TabOrder = 1
          Width = 105
        end
      end
      object GroupBox1: TGroupBox
        Left = 144
        Top = 64
        Width = 121
        Height = 36
        Caption = #1058#1077#1082#1091#1097#1072#1103' '#1076#1072#1090#1072
        TabOrder = 1
        Visible = False
        object EdCurrentDate: TcxDateEdit
          Left = 5
          Top = 13
          Properties.ClearKey = 46
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.WeekNumbers = True
          TabOrder = 0
          Width = 105
        end
      end
    end
    object cbListMinusPostForBDDS: TCheckBox
      Left = 465
      Top = 16
      Width = 177
      Height = 17
      Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 2
      OnClick = cbListMinusPostForBDDSClick
      OnExit = cbListMinusPostForBDDSExit
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 72
      Width = 89
      Height = 65
      Caption = #1044#1044#1057
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnExit = GroupBox2Exit
      object cbKassa: TCheckBox
        Left = 8
        Top = 16
        Width = 73
        Height = 17
        Caption = #1050#1072#1089#1089#1072
        TabOrder = 0
        OnClick = cbKassaClick
      end
      object cbBank: TCheckBox
        Left = 8
        Top = 40
        Width = 73
        Height = 17
        Caption = #1041#1072#1085#1082
        TabOrder = 1
        OnClick = cbBankClick
      end
    end
    object cbNaklR: TCheckBox
      Left = 465
      Top = 40
      Width = 241
      Height = 17
      Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = cbNaklRClick
    end
    object cbPlatRAndPlatR: TCheckBox
      Left = 465
      Top = 64
      Width = 249
      Height = 17
      Caption = #1053#1077#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1099'/'#1088#1072#1089#1093#1086#1076#1099' '#1076#1077#1085#1077#1075
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = cbPlatRAndPlatRClick
    end
    object cbBDDS: TCheckBox
      Left = 466
      Top = 88
      Width = 209
      Height = 17
      Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1041#1044#1044#1057
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = cbBDDSClick
    end
    object cbSummaDolg: TCheckBox
      Left = 466
      Top = 111
      Width = 209
      Height = 17
      Caption = #1053#1077' '#1074#1099#1074#1086#1076#1080#1090#1100' '#1089#1091#1084#1084#1091' '#1076#1086#1083#1075#1072' = 0'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 7
      OnClick = cbSummaDolgClick
    end
    object DBLookupComboboxEhFilter: TDBLookupComboboxEh
      Left = 656
      Top = 152
      Width = 217
      Height = 21
      EditButtons = <>
      KeyField = 'PostName'
      ListField = 'PostName'
      ListSource = dsFilter
      TabOrder = 8
      Visible = True
      OnChange = DBLookupComboboxEhFilterChange
    end
    object Button2: TButton
      Left = 896
      Top = 152
      Width = 121
      Height = 25
      Caption = #1055#1088#1086#1075#1085#1086#1079' '#1086#1089#1090#1072#1090#1082#1072' '#1044#1057
      TabOrder = 9
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 593
    Width = 1431
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 496
      Top = 8
      Width = 75
      Height = 25
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 616
      Top = 8
      Width = 94
      Height = 25
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Exel'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 185
    Width = 1431
    Height = 408
    Align = alClient
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1429
      Height = 406
      Align = alClient
      DataSource = dsDataQuery1
      EditActions = [geaCopyEh]
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      STFilter.Local = True
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      OnApplyFilter = DBGridEh1ApplyFilter
      OnTitleBtnClick = DBGridEh1TitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DayPayment'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.Value = #1048#1090#1086#1075#1086' :'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 57
        end
        item
          EditButtons = <>
          FieldName = 'PostName'
          Footers = <>
          STFilter.DataField = 'PostName'
          STFilter.ListField = 'PostName'
          STFilter.ListSource = dsFilter
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'DateNakl'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Width = 61
        end
        item
          EditButtons = <>
          FieldName = 'Day_Delay'
          Footers = <>
          ReadOnly = True
          Width = 32
        end
        item
          EditButtons = <>
          FieldName = 'Day_Delay_Ext'
          Footers = <>
          ReadOnly = True
          Width = 27
        end
        item
          EditButtons = <>
          FieldName = 'General_Day_Dalay'
          Footers = <>
          ReadOnly = False
          Width = 31
        end
        item
          EditButtons = <>
          FieldName = 'Summa'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'VidRashod'
          Footers = <>
          Title.Alignment = taCenter
          Width = 114
        end
        item
          EditButtons = <>
          FieldName = 'Spravka'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'BuhType'
          Footers = <>
          Title.Alignment = taCenter
          Width = 46
        end
        item
          EditButtons = <>
          FieldName = 'PlatName'
          Footers = <>
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'Invoive'
          Footers = <>
          Title.Alignment = taCenter
          Width = 91
        end
        item
          EditButtons = <>
          FieldName = 'TransferDey'
          Footers = <>
          Title.Alignment = taCenter
          Width = 45
        end
        item
          EditButtons = <>
          FieldName = 'SummaDolg'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'SummaPrihoda'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'Invoice_Id'
          Footers = <>
          Visible = False
          Width = 47
        end
        item
          EditButtons = <>
          FieldName = 'AmountPrih_Rash'
          Footers = <>
          Title.Alignment = taCenter
          Width = 97
        end>
    end
  end
  object quBankInvoice: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Id'
      '      ,Invoice_num'
      '      ,Bank_Name as Invoice_Name'
      '      ,Description'
      ' from d_bank_invoice'
      'order by Bank_Name')
    Left = 376
    Top = 72
    object quBankInvoiceId: TIntegerField
      DisplayWidth = 5
      FieldName = 'Id'
      ReadOnly = True
    end
    object quBankInvoiceInvoice_num: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
      DisplayWidth = 15
      FieldName = 'Invoice_num'
    end
    object quBankInvoiceInvoice_Name: TStringField
      DisplayLabel = #1041#1072#1085#1082#1086#1074#1089#1082#1080#1081' '#1089#1095#1077#1090
      DisplayWidth = 25
      FieldName = 'Invoice_Name'
      Size = 512
    end
    object quBankInvoiceDescription: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 5
      FieldName = 'Description'
      Size = 1024
    end
  end
  object dsSaldo: TMSDataSource
    DataSet = quSaldo
    Left = 264
    Top = 136
  end
  object quSaldo: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '    @DateBeg datetime'
      '  , @DateEnd datetime'
      '  , @id int'
      '  , @SummaBank decimal(18,2)'
      '  , @SummaKassa decimal(18,2)'
      '  , @SummaPlatP decimal(18,2)'
      '  , @SummaPlatPB decimal(18,2)'
      '  , @SummaPlatPK decimal(18,2)'
      '  , @SummaPlatR decimal(18,2)'
      '  , @SummaPlatRB decimal(18,2)'
      '  , @SummaPlatRK decimal(18,2)'
      '  , @IsKassa bit'
      '  , @IsBank bit'
      '  , @IsPost bit'
      '  , @IsEnableNaklP int'
      '  , @IsEnablePlatPAndPlatR int'
      '  , @IsEnableBDDS int'
      '  , @IsSummaDolga int'
      ''
      'set @DateBeg = :DateBeg'
      'set @DateEnd = :DateEnd'
      'set @Id = :Id'
      'set @IsKassa = :IsKassa'
      'set @IsBank = :IsBank'
      'set @IsPost = :IsPost'
      ''
      'set @IsEnableNaklP = :IsEnableNaklP'
      'set @IsEnablePlatPAndPlatR = :IsEnablePlatPAndPlatR'
      'set @IsEnableBDDS = :IsEnableBDDS'
      ''
      'set @IsSummaDolga = :IsSummaDolga'
      ''
      'if @IsPost is null set @IsPost = 0'
      ''
      'if @IsBank = 1'
      ' select @SummaBank = isnull(sum(isnull(SummaRest,0)),0)'
      '  from D_BANK_INVOICE '
      '   where Date <= @DateBeg '
      '     and id = isnull(@id,id)'
      ''
      'if @SummaBank is null set @SummaBank = 0'
      ''
      'if @IsKassa = 1'
      ' select @SummaKassa = isnull(SummaRest,0) '
      '  from d_Kassa'
      '   where Date <= @DateBeg'
      ''
      'if @SummaKassa is null set @SummaKassa = 0'
      ''
      'if @IsKassa = 1'
      
        ' select @SummaPlatPK = case when ((@IsBank = 0 or @IsBank is nul' +
        'l) and (@IsKassa = 0 or @IsKassa is null)) then 0 else isnull(su' +
        'm(isnull(summa,0)),0) end'
      '  from PlatP pp left join'
      '       D_BANK_INVOICE dbi on dbi.id = pp.Bank_Invoice_id '
      '   where (pp.DatePlat < @DateBeg)'
      '     and (pp.TipPlat = 1)'
      
        '     and (isnull(pp.Bank_Invoice_id,0) = isnull(@id,isnull(pp.Ba' +
        'nk_Invoice_id,0)))'
      '     and (pp.Buh in (1,3))'
      '     and (pp.DatePlat >= (select Date from d_kassa))'
      ''
      'if @SummaPlatPK is null '
      ' set @SummaPlatPK = 0'
      ''
      'if @IsBank = 1'
      
        ' select @SummaPlatPB = case when ((@IsBank = 0 or @IsBank is nul' +
        'l) and (@IsKassa = 0 or @IsKassa is null)) then 0 else isnull(su' +
        'm(isnull(summa,0)),0) end'
      '  from PlatP pp left join'
      '       D_BANK_INVOICE dbi on dbi.id = pp.Bank_Invoice_id '
      '   where (pp.DatePlat < @DateBeg)'
      '     and (pp.TipPlat = 1)'
      
        '     and (isnull(pp.Bank_Invoice_id,0) = isnull(@id,isnull(pp.Ba' +
        'nk_Invoice_id,0)))'
      '     and (pp.Buh = 2)'
      '     and (pp.DatePlat >= dbi.Date)'
      ''
      'if @SummaPlatPB is null '
      ' set @SummaPlatPB = 0'
      ''
      'set @SummaPlatP = @SummaPlatPB + @SummaPlatPK'
      ''
      ''
      'if @IsKassa = 1'
      
        ' select @SummaPlatRK = case when ((@IsBank = 0 or @IsBank is nul' +
        'l) and (@IsKassa = 0 or @IsKassa is null)) then 0 else isnull(su' +
        'm(isnull(summa,0)),0) end'
      '  from PlatR pr left join'
      '       D_BANK_INVOICE dbi on dbi.id = pr.Bank_Invoice_id '
      '   where (DatePlat < @DateBeg)'
      '     and (pr.TipPlat = 1)'
      
        '     and (isnull(pr.Bank_Invoice_id,0) = isnull(@id,isnull(pr.Ba' +
        'nk_Invoice_id,0)))'
      '     and (pr.Buh in (1,3)) '
      '     and (pr.DatePlat >= (select Date from d_kassa))'
      ''
      'if @SummaPlatRK is null set @SummaPlatRK = 0'
      ''
      'if @IsBank = 1'
      
        ' select @SummaPlatRB = case when ((@IsBank = 0 or @IsBank is nul' +
        'l) and (@IsKassa = 0 or @IsKassa is null)) then 0 else isnull(su' +
        'm(isnull(summa,0)),0) end'
      '  from PlatR pr left join'
      '       D_BANK_INVOICE dbi on dbi.id = pr.Bank_Invoice_id '
      '   where (DatePlat < @DateBeg)'
      '     and (pr.TipPlat = 1)'
      
        '     and (isnull(pr.Bank_Invoice_id,0) = isnull(@id,isnull(pr.Ba' +
        'nk_Invoice_id,0)))'
      '     and (pr.Buh = 2)'
      '     and (pr.DatePlat >= dbi.Date)'
      ''
      'if @SummaPlatRB is null set @SummaPlatRB = 0'
      ''
      'set @SummaPlatR = @SummaPlatRB + @SummaPlatRK'
      ''
      
        '-- select @SummaBank + @SummaKassa + @SummaPlatP - @SummaPlatR a' +
        's Saldo'
      ''
      ''
      
        'select @SummaBank + @SummaKassa + @SummaPlatP - @SummaPlatR as S' +
        'aldo, isnull((@SummaBank + @SummaKassa + @SummaPlatP - @SummaPla' +
        'tR),0) + isnull(sum(SummaPrihoda),0) - isnull(sum(SummaDolg),0) ' +
        'as EndSaldo'
      ' from'
      '(select * from'
      
        '(select top 100 percent dateadd(day,(isnull(ldn.Day_Delay,0)+isn' +
        'ull(ldn.Day_Delay_Ext,0)+isnull(tpfnp.TransferDey,0)),np.DateNak' +
        'l) as DayPayment'
      
        '      , (select name from Post where PostNo = np.PostNo) as Post' +
        'Name'
      '      , np.DateNakl as DateNakl'
      '      , isnull(ldn.Day_Delay,0) as Day_Delay'
      '      , isnull(ldn.Day_Delay_Ext,0) as Day_Delay_Ext'
      
        '      , isnull(ldn.Day_Delay,0) + isnull(ldn.Day_Delay_Ext,0) as' +
        ' General_Day_Dalay'
      '      , np.Summa'
      '      , np.SummaDolg'
      '      , 0 as SummaPrihoda'
      
        '      , (select Buh_type_name from d_buh_type where buh = np.Buh' +
        ') as BuhType'
      '      , isnull(tpfnp.TransferDey,0) as TransferDey'
      '      , np.d_bank_invoice_id as Invoice_Id'
      
        '      , isnull((select Bank_Name from D_BANK_INVOICE where id = ' +
        'np.d_bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      '      , np.pkey'
      ' from NaklP np left join'
      '      L_Delay_NaklP ldn on ldn.NaklNo = np.pkey left join'
      
        '      TransferDayPaymentForNaklP tpfnp on tpfnp.NaklPPkey = np.p' +
        'key'
      
        '  where dateadd(day,(isnull(ldn.Day_Delay,0)+isnull(ldn.Day_Dela' +
        'y_Ext,0)+isnull(tpfnp.TransferDey,0)),np.DateNakl) between @Date' +
        'Beg and @DateEnd'
      
        '    and (np.PostNo not in (select PostNo from ListMinusPostForBD' +
        'DS where CheckMinus = 1) or @IsPost = 0) '
      
        '    and (isnull(np.d_bank_invoice_id,0) = isnull(@id,isnull(np.d' +
        '_bank_invoice_id,0)))'
      '    and @IsEnableNaklP = 0'
      #9'and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (np.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (np.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( np.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (np.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      
        '    and case when (@IsSummaDolga = 1) and (np.SummaDolg <> 0) th' +
        'en 1'
      '             when (@IsSummaDolga = 0) then 1'
      '             when (@IsSummaDolga is null) then 1'
      '        end = 1'
      ' order by DayPayment,PostName) np'
      ''
      'union all'
      ''
      'select * from'
      '(select  top 100 percent DatePlat as DayPayment'
      '       , '#39#1042#1089#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1091' '#1076#1077#1085#1077#1075#39' as PostName'
      #9'   , DatePlat as DateNakl'
      #9'   , 0 as Day_Delay'
      #9'   , 0 as Day_Delay_Ext'
      #9'   , 0 as General_Day_Dalay'
      #9'   , 0 as Summa'
      #9'   , 0 as SummaDolg'
      #9'   , sum(pp.Summa) as SummaPrihoda'
      
        #9'   , (select Buh_type_name from d_buh_type where buh = pp.Buh) ' +
        'as BuhType'
      #9'   , 0 as TransferDey'
      #9'   , pp.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pp.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      '       , 0 as pkey'
      ' from PlatP pp'
      '  where pp.DatePlat  between @DateBeg and @DateEnd'
      
        '    and (isnull(pp.bank_invoice_id,0) = isnull(@id,isnull(pp.ban' +
        'k_invoice_id,0)))'
      '    and pp.TipPlat = 1'
      '    and @IsEnablePlatPAndPlatR = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pp.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pp.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pp.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pp.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      'group by DatePlat, pp.Buh, pp.Bank_Invoice_id'
      'order by DayPayment, PostName) pp'
      ''
      'union all'
      ''
      'select * from'
      '(select  top 100 percent DatePlat as DayPayment'
      '       , '#39#1042#1089#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099' '#1087#1086' '#1088#1072#1089#1093#1086#1076#1091' '#1076#1077#1085#1077#1075#39' as PostName'
      #9'   , DatePlat as DateNakl'
      #9'   , 0 as Day_Delay'
      #9'   , 0 as Day_Delay_Ext'
      #9'   , 0 as General_Day_Dalay'
      #9'   , 0 as Summa'
      #9'   , sum(pr.Summa) as SummaDolg'
      #9'   , 0 as SummaPrihoda'
      
        #9'   , (select Buh_type_name from d_buh_type where buh = pr.Buh) ' +
        'as BuhType'
      #9'   , 0 as TransferDey'
      #9'   , pr.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pr.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      '       , 0 as pkey'
      ' from PlatR pr'
      '  where pr.DatePlat  between @DateBeg and @DateEnd'
      
        '    and (isnull(pr.bank_invoice_id,0) = isnull(@id,isnull(pr.ban' +
        'k_invoice_id,0)))'
      '    and pr.TipPlat = 1'
      '    and @IsEnablePlatPAndPlatR = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pr.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pr.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pr.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pr.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      'group by DatePlat, pr.Buh, pr.Bank_Invoice_id'
      'order by DayPayment, PostName) pr'
      ''
      'union all'
      ''
      'select * from'
      
        '(select  top 100 percent dateadd(day,isnull(tdpppbdds.TransferDe' +
        'y,0),DatePlat) as DayPayment'
      
        '       , (select name from Post where PostNo = pp.PostNo) as Pos' +
        'tName'
      #9'   , DatePlat as DateNakl'
      #9'   , 0 as Day_Delay'
      #9'   , 0 as Day_Delay_Ext'
      #9'   , 0 as General_Day_Dalay'
      #9'   , 0 as Summa'
      #9'   , 0 as SummaDolg'
      #9'   , pp.Summa as SummaPrihoda'
      
        #9'   , (select Buh_type_name from d_buh_type where buh = pp.Buh) ' +
        'as BuhType'
      #9'   , isnull(tdpppbdds.TransferDey,0) as TransferDey'
      #9'   , pp.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pp.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      '       , 0 as pkey'
      ' from PlatP pp left join '
      
        '      TransferDayPaymentForPlatPBDDS tdpppbdds on tdpppbdds.Plat' +
        'PPkey = pp.pkey'
      
        '  where dateadd(day,isnull(tdpppbdds.TransferDey,0),DatePlat)  b' +
        'etween @DateBeg and @DateEnd'
      
        '    and (isnull(pp.bank_invoice_id,0) = isnull(@id,isnull(pp.ban' +
        'k_invoice_id,0)))'
      '    and pp.TipPlat = 7'
      '    and @IsEnableBDDS = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pp.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pp.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pp.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pp.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      'order by DayPayment, PostName) ppbdds'
      ''
      'union all'
      ''
      'select * from'
      
        '(select  top 100 percent dateadd(day,isnull(tdpprbdds.TransferDe' +
        'y,0),DatePlat) as DayPayment'
      
        '       , (select name from Post where PostNo = pr.PostNo) as Pos' +
        'tName'
      #9'   , DatePlat as DateNakl'
      #9'   , 0 as Day_Delay'
      #9'   , 0 as Day_Delay_Ext'
      #9'   , 0 as General_Day_Dalay'
      #9'   , 0 as Summa'
      #9'   , pr.Summa as SummaDolg'
      #9'   , 0 as SummaPrihoda'
      
        #9'   , (select Buh_type_name from d_buh_type where buh = pr.Buh) ' +
        'as BuhType'
      #9'   , isnull(tdpprbdds.TransferDey,0) as TransferDey'
      #9'   , pr.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pr.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      '       , 0 as pkey'
      ' from PlatR pr left join'
      
        '      TransferDayPaymentForPlatRBDDS tdpprbdds on tdpprbdds.Plat' +
        'RPkey = pr.pkey'
      
        '  where dateadd(day,isnull(tdpprbdds.TransferDey,0),DatePlat) be' +
        'tween @DateBeg and @DateEnd'
      
        '    and (isnull(pr.bank_invoice_id,0) = isnull(@id,isnull(pr.ban' +
        'k_invoice_id,0)))'
      '    and pr.TipPlat = 7'
      '    and @IsEnableBDDS = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pr.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pr.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pr.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pr.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      'order by DayPayment, PostName) prbdds) EndSaldo')
    Left = 291
    Top = 136
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBeg'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'Id'
      end
      item
        DataType = ftBoolean
        Name = 'IsKassa'
      end
      item
        DataType = ftBoolean
        Name = 'IsBank'
      end
      item
        DataType = ftBoolean
        Name = 'IsPost'
      end
      item
        DataType = ftInteger
        Name = 'IsEnableNaklP'
      end
      item
        DataType = ftInteger
        Name = 'IsEnablePlatPAndPlatR'
      end
      item
        DataType = ftInteger
        Name = 'IsEnableBDDS'
      end
      item
        DataType = ftInteger
        Name = 'IsSummaDolga'
      end>
    object quSaldoSaldo: TFloatField
      FieldName = 'Saldo'
      ReadOnly = True
    end
    object quSaldoEndSaldo: TFloatField
      FieldName = 'EndSaldo'
      ReadOnly = True
    end
  end
  object dsDataQuery1: TMSDataSource
    DataSet = quDataQuery
    OnUpdateData = dsDataQuery1UpdateData
    Left = 680
    Top = 1
  end
  object quDataQuery: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '  @cnt int,'
      '  @cnt1 int,'
      '  @cnt2 int,'
      '  @Pkey bigint'
      ''
      
        'select @cnt = count(*) from TransferDayPaymentForNaklP where Nak' +
        'lPPkey = :pkey'
      ''
      'if ((@cnt = 0) and (:pkey <> 0) and (:Entity_Type = '#39'NaklP'#39'))'
      ' insert into TransferDayPaymentForNaklP (NaklPPkey, TransferDey)'
      '  values (:pkey, :TransferDey)'
      ''
      'if ((@cnt > 1) and (:pkey <> 0) and (:Entity_Type = '#39'NaklP'#39'))'
      ' update TransferDayPaymentForNaklP'
      '  set TransferDey = :TransferDey'
      ' where NaklPPkey = :pkey'
      ''
      
        'select @cnt1 = count(*) from TransferDayPaymentForPlatPBDD where' +
        ' NaklPPkey = :pkey'
      ''
      'if ((@cnt1 = 0) and (:pkey <> 0) and (:Entity_Type = '#39'PlatP'#39'))'
      
        ' insert into TransferDayPaymentForPlatPBDD (PlatPPkey, TransferD' +
        'ey)'
      '  values (:pkey, :TransferDey)'
      ''
      'if ((@cnt1 > 1) and (:pkey <> 0) and (:Entity_Type = '#39'PlatP'#39'))'
      ' update TransferDayPaymentForPlatPBDD'
      '  set TransferDey = :TransferDey'
      ' where PlatPPkey = :pkey'
      ''
      
        'select @cnt2 = count(*) from TransferDayPaymentForPlatRBDDS wher' +
        'e NaklPPkey = :pkey'
      ''
      'if ((@cnt2 = 0) and (:pkey <> 0) and (:Entity_Type = '#39'PlatR'#39'))'
      
        ' insert into TransferDayPaymentForPlatRBDD (PlatRPkey, TransferD' +
        'ey)'
      '  values (:pkey, :TransferDey)'
      ''
      'if ((@cnt1 > 1) and (:pkey <> 0) and (:Entity_Type = '#39'PlatR'#39'))'
      ' update TransferDayPaymentForRlatPBDD'
      '  set TransferDey = :TransferDey'
      ' where PlatRPkey = :pkey')
    SQLUpdate.Strings = (
      'declare'
      '   @cnt int'
      '  ,@cnt1 int'
      '  ,@cnt2 int'
      '  ,@cnt3 int'
      '  ,@cnt4 int'
      '  ,@cnt5 int'
      '  ,@Pkey bigint '
      '  ,@Entity_Type varchar(10)'
      ''
      'set @Pkey = :pkey'
      'set @Entity_Type = rtrim(ltrim(:Entity_Type))'
      ''
      'if @Entity_Type is null set @Entity_Type = '#39#39
      ''
      
        'select @cnt = count(*) from TransferDayPaymentForNaklP where Nak' +
        'lPPkey = @Pkey and @Entity_Type = '#39'NaklP'#39
      ''
      
        'select @cnt1 = count(*) from NaklP where pkey = @Pkey and @Entit' +
        'y_Type = '#39'NaklP'#39
      ''
      
        'select @cnt2 = count(*) from PlatP where pkey = @Pkey and @Entit' +
        'y_Type = '#39'PlatP'#39
      ''
      
        'select @cnt3 = count(*) from PlatR where pkey = @Pkey and @Entit' +
        'y_Type = '#39'PlatR'#39
      ''
      
        'select @cnt4 = count(*) from TransferDayPaymentForPlatPBDDS wher' +
        'e PlatPPkey = @Pkey and @Entity_Type = '#39'PlatP'#39
      ''
      
        'select @cnt5 = count(*) from TransferDayPaymentForPlatRBDDS wher' +
        'e PlatRPkey = @Pkey and @Entity_Type = '#39'PlatR'#39
      ''
      'if ((@cnt = 0) and (@Pkey > 0))'
      ' insert into TransferDayPaymentForNaklP (NaklPPkey, TransferDey)'
      '  values (@Pkey, :TransferDey)'
      ''
      'if ((@cnt > 0) and (@Pkey > 0))'
      ' update TransferDayPaymentForNaklP'
      '  set TransferDey = :TransferDey'
      ' where NaklPPkey = @Pkey'
      ''
      'if ((@cnt4 = 0) and (@Pkey > 0))'
      
        ' insert into TransferDayPaymentForPlatPBDDS (PlatPPkey, Transfer' +
        'Dey)'
      '  values (@Pkey, :TransferDey)'
      ''
      'if ((@cnt4 > 0) and (@Pkey > 0))'
      ' update TransferDayPaymentForPlatPBDDS'
      '  set TransferDey = :TransferDey'
      ' where PlatPPkey = @Pkey'
      ''
      'if ((@cnt5 = 0) and (@Pkey > 0))'
      
        ' insert into TransferDayPaymentForPlatRBDDS (PlatRPkey, Transfer' +
        'Dey)'
      '  values (@Pkey, :TransferDey)'
      ''
      'if ((@cnt5 > 0) and (@Pkey > 0))'
      ' update TransferDayPaymentForPlatRBDDS'
      '  set TransferDey = :TransferDey'
      ' where PlatRPkey = @Pkey'
      ''
      'if ((@cnt1 > 0) and (@Entity_Type = '#39'NaklP'#39') and (@Pkey > 0))'
      'update NaklP'
      ' set d_bank_invoice_id = :Invoice_Id'
      'where pkey = @Pkey'
      ''
      'if ((@cnt2 > 0) and (@Entity_Type = '#39'PlatP'#39') and (@Pkey > 0))'
      'update PlatP'
      ' set bank_invoice_id = :Invoice_Id'
      '    ,Summa = :SummaPrihoda'
      'where pkey = @Pkey'
      ''
      'if ((@cnt3 > 0) and (@Entity_Type = '#39'PlatR'#39') and (@Pkey > 0))'
      'update PlatR'
      ' set bank_invoice_id = :Invoice_Id'
      '    ,Summa = :SummaDolg'
      'where pkey = @Pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '   @IsPost int'
      '  ,@IsKassa int'
      '  ,@IsBank int'
      '  ,@id int'
      '  ,@DateBeg datetime'
      '  ,@DateEnd datetime'
      '  ,@IsEnableNaklP int'
      '  ,@IsEnablePlatPAndPlatR int'
      '  ,@IsEnableBDDS int'
      '  ,@IsSummaDolga int'
      ''
      'set @IsPost = :IsPost'
      'set @IsKassa = :IsKassa'
      'set @IsBank = :IsBank'
      'set @id = :id'
      ''
      'set @IsEnableNaklP = :IsEnableNaklP'
      'set @IsEnablePlatPAndPlatR = :IsEnablePlatPAndPlatR'
      'set @IsEnableBDDS = :IsEnableBDDS'
      ''
      'set @DateBeg = :DateBeg'
      'set @DateEnd = :DateEnd'
      ''
      'set @IsSummaDolga = :IsSummaDolga'
      ''
      'if @IsPost is null set @IsPost = 0'
      'if @IsSummaDolga is null set @IsSummaDolga = 1'
      ''
      'select * from'
      '(select * from'
      
        '(select top 100 percent dateadd(day,(isnull(ldn.Day_Delay,0)+isn' +
        'ull(ldn.Day_Delay_Ext,0)+isnull(tpfnp.TransferDey,0)),np.DateNak' +
        'l) as DayPayment'
      
        '      , (select name from Post where PostNo = np.PostNo) as Post' +
        'Name'
      '      , np.DateNakl as DateNakl'
      '      , isnull(ldn.Day_Delay,0) as Day_Delay'
      '      , isnull(ldn.Day_Delay_Ext,0) as Day_Delay_Ext'
      
        '      , isnull(ldn.Day_Delay,0) + isnull(ldn.Day_Delay_Ext,0) as' +
        ' General_Day_Dalay'
      '      , np.Summa'
      '      , np.SummaDolg'
      '      , 0 as SummaPrihoda'
      
        '      , (select Buh_type_name from d_buh_type where buh = np.Buh' +
        ') as BuhType'
      '      , null as VidRashod'
      '      , isnull(tpfnp.TransferDey,0) as TransferDey'
      '      , np.d_bank_invoice_id as Invoice_Id'
      
        '      , isnull((select Bank_Name from D_BANK_INVOICE where id = ' +
        'np.d_bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      '      , '#39#39' as PlatName'
      '      , np.pkey'
      '      , '#39'NaklP'#39' as Entity_Type'
      '      , '#39#39' as Spravka '
      '      , 0 - np.SummaDolg as AmountPrih_Rash'
      ' from NaklP np left join'
      '      L_Delay_NaklP ldn on ldn.NaklNo = np.pkey left join'
      
        '      TransferDayPaymentForNaklP tpfnp on tpfnp.NaklPPkey = np.p' +
        'key'
      
        '  where dateadd(day,(isnull(ldn.Day_Delay,0)+isnull(ldn.Day_Dela' +
        'y_Ext,0)+isnull(tpfnp.TransferDey,0)),np.DateNakl) between @Date' +
        'Beg and @DateEnd'
      
        '    and (np.PostNo not in (select PostNo from ListMinusPostForBD' +
        'DS where CheckMinus = 1) or @IsPost = 0) '
      
        '    and (isnull(np.d_bank_invoice_id,0) = isnull(@id,isnull(np.d' +
        '_bank_invoice_id,0)))'
      '    and @IsEnableNaklP = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (np.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (np.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( np.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (np.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      
        '    and case when (@IsSummaDolga = 1) and (np.SummaDolg <> 0) th' +
        'en 1'
      '             when (@IsSummaDolga = 0) then 1'
      '             when (@IsSummaDolga is null) then 1'
      '        end = 1'
      ''
      ' order by DayPayment,PostName) np'
      ''
      'union all'
      '/*'
      
        'select null as DayPayment, null as PostName, null as DateNakl, n' +
        'ull as Day_Delay, null as Day_Delay_Ext, null as General_Day_Del' +
        'ay, '
      
        '       null as Summa, null as SummaDolg, null as SummaPrihoda, n' +
        'ull as BuhType, null as TransferDey, null as Invoice_Id, null as' +
        ' Invoice, 0 as pkey'
      ''
      'union all'
      '*/'
      'select * from'
      '(select  top 100 percent DatePlat as DayPayment'
      '       , '#39#1042#1089#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1091' '#1076#1077#1085#1077#1075#39' as PostName'
      '       , DatePlat as DateNakl'
      '       , 0 as Day_Delay'
      '       , 0 as Day_Delay_Ext'
      '       , 0 as General_Day_Dalay'
      '       , 0 as Summa'
      '       , 0 as SummaDolg'
      '       , sum(pp.Summa) as SummaPrihoda'
      
        '       , (select Buh_type_name from d_buh_type where buh = pp.Bu' +
        'h) as BuhType'
      '       , null as VidRashod'
      '       , 0 as TransferDey'
      '       , pp.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pp.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      '       , '#39#39' as PlatName'
      '       , 0 as pkey'
      '       , '#39#39' as Entity_Type'
      '       , '#39#39' as Spravka'
      '       , sum(pp.Summa) - 0 as AmountPrih_Rash'
      ' from PlatP pp'
      '  where pp.DatePlat  between @DateBeg and @DateEnd'
      
        '    and (isnull(pp.bank_invoice_id,0) = isnull(@id,isnull(pp.ban' +
        'k_invoice_id,0)))'
      '    and pp.TipPlat = 1'
      '    and @IsEnablePlatPAndPlatR = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pp.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pp.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pp.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pp.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      ''
      'group by DatePlat, pp.Buh, pp.Bank_Invoice_id'
      'order by DayPayment, PostName) pp'
      ''
      'union all'
      '/*'
      
        'select null as DayPayment, null as PostName, null as DateNakl, n' +
        'ull as Day_Delay, null as Day_Delay_Ext, null as General_Day_Del' +
        'ay, '
      
        '       null as Summa, null as SummaDolg, null as SummaPrihoda, n' +
        'ull as BuhType, null as TransferDey, null as Invoice_Id, null as' +
        ' Invoice, 0 as pkey'
      ''
      'union all'
      '*/'
      'select * from'
      '(select  top 100 percent DatePlat as DayPayment'
      '       , '#39#1042#1089#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099' '#1087#1086' '#1088#1072#1089#1093#1086#1076#1091' '#1076#1077#1085#1077#1075#39' as PostName'
      '       , DatePlat as DateNakl'
      '       , 0 as Day_Delay'
      '       , 0 as Day_Delay_Ext'
      '       , 0 as General_Day_Dalay'
      '       , 0 as Summa'
      '       , sum(pr.Summa) as SummaDolg'
      '       , 0 as SummaPrihoda'
      
        '       , (select Buh_type_name from d_buh_type where buh = pr.Bu' +
        'h) as BuhType'
      '       , null as VidRashod'
      '       , 0 as TransferDey'
      '       , pr.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pr.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      '       , '#39#39' as PlatName'
      '       , 0 as pkey'
      '       , '#39#39' as Entity_Type'
      '       , '#39#39' as Spravka'
      '       , 0 - sum(pr.Summa) as AmountPrih_Rash'
      ' from PlatR pr'
      '  where pr.DatePlat  between @DateBeg and @DateEnd'
      
        '    and (isnull(pr.bank_invoice_id,0) = isnull(@id,isnull(pr.ban' +
        'k_invoice_id,0)))'
      '    and pr.TipPlat = 1'
      '    and @IsEnablePlatPAndPlatR = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pr.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pr.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pr.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pr.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      ''
      'group by DatePlat, pr.Buh, pr.Bank_Invoice_id'
      'order by DayPayment, PostName) pr'
      ''
      'union all'
      ''
      'select * from'
      
        '(select  top 100 percent dateadd(day,isnull(tdpppbdds.TransferDe' +
        'y,0),DatePlat) as DayPayment'
      
        '       , (select name from Post where PostNo = pp.PostNo) as Pos' +
        'tName'
      '       , DatePlat as DateNakl'
      '       , 0 as Day_Delay'
      '       , 0 as Day_Delay_Ext'
      '       , 0 as General_Day_Dalay'
      '       , 0 as Summa'
      '       , 0 as SummaDolg'
      '       , pp.Summa as SummaPrihoda'
      
        '       , (select Buh_type_name from d_buh_type where buh = pp.Bu' +
        'h) as BuhType'
      
        '       , (select VidRashodName from VidRashod where VidRashodNo ' +
        '= pp.VidRashodNo) as VidRashod'
      '       , isnull(tdpppbdds.TransferDey,0) as TransferDey'
      '       , pp.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pp.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      
        '       , (select Name from d_PLat_Type where id = pp.TipPlat) as' +
        ' PlatName'
      '       , pp.pkey as pkey'
      '       , '#39'PlatP'#39' as Entity_Type'
      '       , pp.Spravka as Spravka'
      '       , pp.Summa - 0 as AmountPrih_Rash'
      ' from PlatP pp left join '
      
        '      TransferDayPaymentForPlatPBDDS tdpppbdds on tdpppbdds.Plat' +
        'PPkey = pp.pkey'
      
        '  where dateadd(day,isnull(tdpppbdds.TransferDey,0),DatePlat)  b' +
        'etween @DateBeg and @DateEnd'
      
        '    and (isnull(pp.bank_invoice_id,0) = isnull(@id,isnull(pp.ban' +
        'k_invoice_id,0)))'
      '    and pp.TipPlat = 7'
      '    and @IsEnableBDDS = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pp.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pp.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pp.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pp.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      ''
      'order by DayPayment, PostName) ppbdds'
      ''
      'union all'
      ''
      'select * from'
      
        '(select  top 100 percent dateadd(day,isnull(tdpprbdds.TransferDe' +
        'y,0),DatePlat) as DayPayment'
      
        '       , (select name from Post where PostNo = pr.PostNo) as Pos' +
        'tName'
      '       , DatePlat as DateNakl'
      '       , 0 as Day_Delay'
      '       , 0 as Day_Delay_Ext'
      '       , 0 as General_Day_Dalay'
      '       , 0 as Summa'
      '       , pr.Summa as SummaDolg'
      '       , 0 as SummaPrihoda'
      
        '       , (select Buh_type_name from d_buh_type where buh = pr.Bu' +
        'h) as BuhType'
      
        '       , (select VidRashodName from VidRashod where VidRashodNo ' +
        '= pr.VidRashodNo) as VidRashod'
      '       , isnull(tdpprbdds.TransferDey,0) as TransferDey'
      '       , pr.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pr.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      
        '       , (select Name from d_PLat_Type where id = pr.TipPlat) as' +
        ' PlatName'
      '       , pr.pkey as pkey'
      '       , '#39'PlatR'#39' as Entity_Type'
      '       , pr.Spravka as Spravka'
      '       , 0 - pr.Summa as AmountPrih_Rash  '
      ' from PlatR pr left join'
      
        '      TransferDayPaymentForPlatRBDDS tdpprbdds on tdpprbdds.Plat' +
        'RPkey = pr.pkey'
      
        '  where dateadd(day,isnull(tdpprbdds.TransferDey,0),DatePlat)  b' +
        'etween @DateBeg and @DateEnd'
      
        '    and (isnull(pr.bank_invoice_id,0) = isnull(@id,isnull(pr.ban' +
        'k_invoice_id,0)))'
      '    and pr.TipPlat = 7'
      '    and @IsEnableBDDS = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pr.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pr.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pr.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pr.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      ''
      'order by DayPayment, PostName) prbdds) u'
      'where 1=1'
      '&_where'
      'order by &_order')
    Filtered = True
    AfterPost = quDataQueryAfterPost
    Left = 680
    Top = 29
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IsPost'
      end
      item
        DataType = ftUnknown
        Name = 'IsKassa'
      end
      item
        DataType = ftUnknown
        Name = 'IsBank'
      end
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftInteger
        Name = 'IsEnableNaklP'
      end
      item
        DataType = ftInteger
        Name = 'IsEnablePlatPAndPlatR'
      end
      item
        DataType = ftInteger
        Name = 'IsEnableBDDS'
      end
      item
        DataType = ftDateTime
        Name = 'DateBeg'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'IsSummaDolga'
      end>
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 'DayPayment, PostName, DateNakl'
      end>
    object quDataQueryDayPayment: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1054#1087#1083#1072#1090#1099
      FieldName = 'DayPayment'
      ReadOnly = True
    end
    object quDataQueryPostName: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'PostName'
      ReadOnly = True
      Size = 30
    end
    object quDataQueryDateNakl: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'DateNakl'
    end
    object quDataQueryDay_Delay: TIntegerField
      DisplayLabel = #1054#1090#1089#1088#1086#1095#1082#1072
      FieldName = 'Day_Delay'
    end
    object quDataQueryDay_Delay_Ext: TIntegerField
      DisplayLabel = #1044#1086#1087'. '#1086#1090#1089#1088#1086#1095#1082#1072
      FieldName = 'Day_Delay_Ext'
    end
    object quDataQueryGeneral_Day_Dalay: TIntegerField
      DisplayLabel = #1054#1073#1097#1072#1103' '#1086#1090#1089#1088#1086#1095#1082#1072
      FieldName = 'General_Day_Dalay'
      ReadOnly = True
    end
    object quDataQuerySumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Summa'
    end
    object quDataQuerySummaDolg: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1076#1086#1083#1075#1072'/'#1056#1072#1089#1093#1086#1076
      FieldName = 'SummaDolg'
    end
    object quDataQuerySummaPrihoda: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1088#1080#1093#1086#1076#1072
      FieldName = 'SummaPrihoda'
    end
    object quDataQueryBuhType: TStringField
      DisplayLabel = #1041#1091#1093'. '#1090#1080#1087
      FieldName = 'BuhType'
      ReadOnly = True
    end
    object quDataQueryVidRashod: TStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1072
      FieldName = 'VidRashod'
      ReadOnly = True
      Size = 50
    end
    object quDataQueryTransferDey: TIntegerField
      DisplayLabel = #1055#1077#1088#1077#1085#1086#1089' '#1086#1087#1083'. '#1076'.'
      FieldName = 'TransferDey'
    end
    object quDataQueryInvoive: TStringField
      DisplayLabel = #1057#1095#1077#1090
      DisplayWidth = 50
      FieldKind = fkLookup
      FieldName = 'Invoive'
      LookupDataSet = quInvoice
      LookupKeyFields = 'id'
      LookupResultField = 'Invoice'
      KeyFields = 'Invoice_Id'
      Size = 512
      Lookup = True
    end
    object quDataQueryPlatName: TStringField
      DisplayLabel = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'PlatName'
      ReadOnly = True
      Size = 512
    end
    object quDataQueryInvoice_Id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Id '#1057#1095#1077#1090#1072
      FieldName = 'Invoice_Id'
      LookupCache = True
    end
    object quDataQuerypkey: TLargeintField
      FieldName = 'pkey'
    end
    object quDataQueryEntity_Type: TStringField
      FieldName = 'Entity_Type'
      ReadOnly = True
      Size = 5
    end
    object quDataQuerySpravka: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'Spravka'
      ReadOnly = True
      Size = 200
    end
    object quDataQueryAmountPrih_Rash: TFloatField
      DisplayLabel = #1057#1091#1084'.'#1087#1088#1080#1093'-'#1057#1091#1084'.'#1088#1072#1089#1093' + '#1055#1088#1077#1076'.'#1089#1090#1088'.'
      DisplayWidth = 15
      FieldName = 'AmountPrih_Rash'
    end
  end
  object dsInvoice: TMSDataSource
    DataSet = quInvoice
    Left = 680
    Top = 72
  end
  object quInvoice: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select id, Bank_Name as Invoice '
      ' from D_BANK_INVOICE'
      'order by Invoice')
    Left = 680
    Top = 100
    object quInvoiceid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object quInvoiceInvoice: TStringField
      DisplayLabel = #1057#1095#1077#1090
      DisplayWidth = 50
      FieldName = 'Invoice'
      Size = 50
    end
  end
  object quFilter: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '  @cnt int,'
      '  @cnt1 int,'
      '  @cnt2 int,'
      ''
      
        'select @cnt = count(*) from TransferDayPaymentForNaklP where Nak' +
        'lPPkey = :pkey'
      ''
      'if ((@cnt = 0) and (:pkey <> 0) and (:Entity_Type = '#39'NaklP'#39'))'
      ' insert into TransferDayPaymentForNaklP (NaklPPkey, TransferDey)'
      '  values (:pkey, :TransferDey)'
      ''
      'if ((@cnt > 1) and (:pkey <> 0) and (:Entity_Type = '#39'NaklP'#39'))'
      ' update TransferDayPaymentForNaklP'
      '  set TransferDey = :TransferDey'
      ' where NaklPPkey = :pkey'
      ''
      
        'select @cnt1 = count(*) from TransferDayPaymentForPlatPBDD where' +
        ' NaklPPkey = :pkey'
      ''
      'if ((@cnt1 = 0) and (:pkey <> 0) and (:Entity_Type = '#39'PlatP'#39'))'
      
        ' insert into TransferDayPaymentForPlatPBDD (PlatPPkey, TransferD' +
        'ey)'
      '  values (:pkey, :TransferDey)'
      ''
      'if ((@cnt1 > 1) and (:pkey <> 0) and (:Entity_Type = '#39'PlatP'#39'))'
      ' update TransferDayPaymentForPlatPBDD'
      '  set TransferDey = :TransferDey'
      ' where PlatPPkey = :pkey'
      ''
      
        'select @cnt2 = count(*) from TransferDayPaymentForPlatRBDDS wher' +
        'e NaklPPkey = :pkey'
      ''
      'if ((@cnt2 = 0) and (:pkey <> 0) and (:Entity_Type = '#39'PlatR'#39'))'
      
        ' insert into TransferDayPaymentForPlatRBDD (PlatRPkey, TransferD' +
        'ey)'
      '  values (:pkey, :TransferDey)'
      ''
      'if ((@cnt1 > 1) and (:pkey <> 0) and (:Entity_Type = '#39'PlatR'#39'))'
      ' update TransferDayPaymentForRlatPBDD'
      '  set TransferDey = :TransferDey'
      ' where PlatRPkey = :pkey')
    SQLUpdate.Strings = (
      'declare'
      '   @cnt int'
      '  ,@cnt1 int'
      '  ,@cnt2 int'
      '  ,@cnt3 int'
      '  ,@cnt4 int'
      '  ,@cnt5 int'
      ''
      
        'select @cnt = count(*) from TransferDayPaymentForNaklP where Nak' +
        'lPPkey = :pkey and :Entity_Type = '#39'NaklP'#39
      ''
      
        'select @cnt1 = count(*) from NaklP where pkey = :pkey and :Entit' +
        'y_Type = '#39'NaklP'#39
      ''
      
        'select @cnt2 = count(*) from PlatP where pkey = :pkey and :Entit' +
        'y_Type = '#39'PlatP'#39
      ''
      
        'select @cnt3 = count(*) from PlatR where pkey = :pkey and :Entit' +
        'y_Type = '#39'PlatR'#39
      ''
      
        'select @cnt4 = count(*) from TransferDayPaymentForPlatPBDDS wher' +
        'e PlatPPkey = :pkey and :Entity_Type = '#39'PlatP'#39
      ''
      
        'select @cnt5 = count(*) from TransferDayPaymentForPlatRBDDS wher' +
        'e PlatRPkey = :pkey and :Entity_Type = '#39'PlatR'#39
      ''
      'if ((@cnt = 0) and (:pkey <> 0))'
      ' insert into TransferDayPaymentForNaklP (NaklPPkey, TransferDey)'
      '  values (:pkey, :TransferDey)'
      ''
      'if ((@cnt > 0) and (:pkey <> 0))'
      ' update TransferDayPaymentForNaklP'
      '  set TransferDey = :TransferDey'
      ' where NaklPPkey = :pkey'
      ''
      'if ((@cnt4 = 0) and (:pkey <> 0))'
      
        ' insert into TransferDayPaymentForPlatPBDDS (PlatPPkey, Transfer' +
        'Dey)'
      '  values (:pkey, :TransferDey)'
      ''
      'if ((@cnt4 > 0) and (:pkey <> 0))'
      ' update TransferDayPaymentForPlatPBDDS'
      '  set TransferDey = :TransferDey'
      ' where PlatPPkey = :pkey'
      ''
      'if ((@cnt5 = 0) and (:pkey <> 0))'
      
        ' insert into TransferDayPaymentForPlatRBDDS (PlatRPkey, Transfer' +
        'Dey)'
      '  values (:pkey, :TransferDey)'
      ''
      'if ((@cnt5 > 0) and (:pkey <> 0))'
      ' update TransferDayPaymentForPlatRBDDS'
      '  set TransferDey = :TransferDey'
      ' where PlatRPkey = :pkey'
      ''
      'if (@cnt1 > 0) and (:Entity_Type = '#39'NaklP'#39')'
      'update NaklP'
      ' set d_bank_invoice_id = :Invoice_Id'
      'where pkey = :pkey'
      ''
      'if (@cnt2 > 0) and (:Entity_Type = '#39'PlatP'#39')'
      'update PlatP'
      ' set bank_invoice_id = :Invoice_Id'
      '    ,Summa = :SummaPrihoda'
      'where pkey = :pkey'
      ''
      'if (@cnt3 > 0) and (:Entity_Type = '#39'PlatR'#39')'
      'update PlatR'
      ' set bank_invoice_id = :Invoice_Id'
      '    ,Summa = :SummaDolg'
      'where pkey = :pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '   @IsPost int'
      '  ,@IsKassa int'
      '  ,@IsBank int'
      '  ,@id int'
      '  ,@DateBeg datetime'
      '  ,@DateEnd datetime'
      '  ,@IsEnableNaklP int'
      '  ,@IsEnablePlatPAndPlatR int'
      '  ,@IsEnableBDDS int'
      '  ,@IsSummaDolga int'
      ''
      'set @IsPost = :IsPost'
      'set @IsKassa = :IsKassa'
      'set @IsBank = :IsBank'
      'set @id = :id'
      ''
      'set @IsEnableNaklP = :IsEnableNaklP'
      'set @IsEnablePlatPAndPlatR = :IsEnablePlatPAndPlatR'
      'set @IsEnableBDDS = :IsEnableBDDS'
      ''
      'set @DateBeg = :DateBeg'
      'set @DateEnd = :DateEnd'
      ''
      'set @IsSummaDolga = :IsSummaDolga'
      ''
      'if @IsPost is null set @IsPost = 0'
      'if @IsSummaDolga is null set @IsSummaDolga = 1'
      ''
      'select distinct PostName from'
      '(select * from'
      
        '(select top 100 percent dateadd(day,(isnull(ldn.Day_Delay,0)+isn' +
        'ull(ldn.Day_Delay_Ext,0)+isnull(tpfnp.TransferDey,0)),np.DateNak' +
        'l) as DayPayment'
      
        '      , (select name from Post where PostNo = np.PostNo) as Post' +
        'Name'
      '      , np.DateNakl as DateNakl'
      '      , isnull(ldn.Day_Delay,0) as Day_Delay'
      '      , isnull(ldn.Day_Delay_Ext,0) as Day_Delay_Ext'
      
        '      , isnull(ldn.Day_Delay,0) + isnull(ldn.Day_Delay_Ext,0) as' +
        ' General_Day_Dalay'
      '      , np.Summa'
      '      , np.SummaDolg'
      '      , 0 as SummaPrihoda'
      
        '      , (select Buh_type_name from d_buh_type where buh = np.Buh' +
        ') as BuhType'
      '      , null as VidRashod'
      '      , isnull(tpfnp.TransferDey,0) as TransferDey'
      '      , np.d_bank_invoice_id as Invoice_Id'
      
        '      , isnull((select Bank_Name from D_BANK_INVOICE where id = ' +
        'np.d_bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      '      , '#39#39' as PlatName'
      '      , np.pkey'
      '      , '#39'NaklP'#39' as Entity_Type'
      '      , '#39#39' as Spravka '
      ' from NaklP np left join'
      '      L_Delay_NaklP ldn on ldn.NaklNo = np.pkey left join'
      
        '      TransferDayPaymentForNaklP tpfnp on tpfnp.NaklPPkey = np.p' +
        'key'
      
        '  where dateadd(day,(isnull(ldn.Day_Delay,0)+isnull(ldn.Day_Dela' +
        'y_Ext,0)+isnull(tpfnp.TransferDey,0)),np.DateNakl) between @Date' +
        'Beg and @DateEnd'
      
        '    and (np.PostNo not in (select PostNo from ListMinusPostForBD' +
        'DS where CheckMinus = 1) or @IsPost = 0) '
      
        '    and (isnull(np.d_bank_invoice_id,0) = isnull(@id,isnull(np.d' +
        '_bank_invoice_id,0)))'
      '    and @IsEnableNaklP = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (np.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (np.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( np.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (np.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      
        '    and case when (@IsSummaDolga = 1) and (np.SummaDolg <> 0) th' +
        'en 1'
      '             when (@IsSummaDolga = 0) then 1'
      '             when (@IsSummaDolga is null) then 1'
      '        end = 1'
      ''
      ' order by DayPayment,PostName) np'
      ''
      'union all'
      '/*'
      
        'select null as DayPayment, null as PostName, null as DateNakl, n' +
        'ull as Day_Delay, null as Day_Delay_Ext, null as General_Day_Del' +
        'ay, '
      
        '       null as Summa, null as SummaDolg, null as SummaPrihoda, n' +
        'ull as BuhType, null as TransferDey, null as Invoice_Id, null as' +
        ' Invoice, 0 as pkey'
      ''
      'union all'
      '*/'
      'select * from'
      '(select  top 100 percent DatePlat as DayPayment'
      '       , '#39#1042#1089#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1091' '#1076#1077#1085#1077#1075#39' as PostName'
      '       , DatePlat as DateNakl'
      '       , 0 as Day_Delay'
      '       , 0 as Day_Delay_Ext'
      '       , 0 as General_Day_Dalay'
      '       , 0 as Summa'
      '       , 0 as SummaDolg'
      '       , sum(pp.Summa) as SummaPrihoda'
      
        '       , (select Buh_type_name from d_buh_type where buh = pp.Bu' +
        'h) as BuhType'
      '       , null as VidRashod'
      '       , 0 as TransferDey'
      '       , pp.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pp.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      '       , '#39#39' as PlatName'
      '       , 0 as pkey'
      '       , '#39#39' as Entity_Type'
      '       , '#39#39' as Spravka'
      ' from PlatP pp'
      '  where pp.DatePlat  between @DateBeg and @DateEnd'
      
        '    and (isnull(pp.bank_invoice_id,0) = isnull(@id,isnull(pp.ban' +
        'k_invoice_id,0)))'
      '    and pp.TipPlat = 1'
      '    and @IsEnablePlatPAndPlatR = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pp.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pp.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pp.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pp.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      ''
      'group by DatePlat, pp.Buh, pp.Bank_Invoice_id'
      'order by DayPayment, PostName) pp'
      ''
      'union all'
      '/*'
      
        'select null as DayPayment, null as PostName, null as DateNakl, n' +
        'ull as Day_Delay, null as Day_Delay_Ext, null as General_Day_Del' +
        'ay, '
      
        '       null as Summa, null as SummaDolg, null as SummaPrihoda, n' +
        'ull as BuhType, null as TransferDey, null as Invoice_Id, null as' +
        ' Invoice, 0 as pkey'
      ''
      'union all'
      '*/'
      'select * from'
      '(select  top 100 percent DatePlat as DayPayment'
      '       , '#39#1042#1089#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1099' '#1087#1086' '#1088#1072#1089#1093#1086#1076#1091' '#1076#1077#1085#1077#1075#39' as PostName'
      '       , DatePlat as DateNakl'
      '       , 0 as Day_Delay'
      '       , 0 as Day_Delay_Ext'
      '       , 0 as General_Day_Dalay'
      '       , 0 as Summa'
      '       , sum(pr.Summa) as SummaDolg'
      '       , 0 as SummaPrihoda'
      
        '       , (select Buh_type_name from d_buh_type where buh = pr.Bu' +
        'h) as BuhType'
      '       , null as VidRashod'
      '       , 0 as TransferDey'
      '       , pr.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pr.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      '       , '#39#39' as PlatName'
      '       , 0 as pkey'
      '       , '#39#39' as Entity_Type'
      '       , '#39#39' as Spravka'
      ' from PlatR pr'
      '  where pr.DatePlat  between @DateBeg and @DateEnd'
      
        '    and (isnull(pr.bank_invoice_id,0) = isnull(@id,isnull(pr.ban' +
        'k_invoice_id,0)))'
      '    and pr.TipPlat = 1'
      '    and @IsEnablePlatPAndPlatR = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pr.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pr.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pr.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pr.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      ''
      'group by DatePlat, pr.Buh, pr.Bank_Invoice_id'
      'order by DayPayment, PostName) pr'
      ''
      'union all'
      ''
      'select * from'
      
        '(select  top 100 percent dateadd(day,isnull(tdpppbdds.TransferDe' +
        'y,0),DatePlat) as DayPayment'
      
        '       , (select name from Post where PostNo = pp.PostNo) as Pos' +
        'tName'
      '       , DatePlat as DateNakl'
      '       , 0 as Day_Delay'
      '       , 0 as Day_Delay_Ext'
      '       , 0 as General_Day_Dalay'
      '       , 0 as Summa'
      '       , 0 as SummaDolg'
      '       , pp.Summa as SummaPrihoda'
      
        '       , (select Buh_type_name from d_buh_type where buh = pp.Bu' +
        'h) as BuhType'
      
        '       , (select VidRashodName from VidRashod where VidRashodNo ' +
        '= pp.VidRashodNo) as VidRashod'
      '       , isnull(tdpppbdds.TransferDey,0) as TransferDey'
      '       , pp.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pp.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      
        '       , (select Name from d_PLat_Type where id = pp.TipPlat) as' +
        ' PlatName'
      '       , pp.pkey as pkey'
      '       , '#39'PlatP'#39' as Entity_Type'
      '       , pp.Spravka as Spravka'
      ' from PlatP pp left join '
      
        '      TransferDayPaymentForPlatPBDDS tdpppbdds on tdpppbdds.Plat' +
        'PPkey = pp.pkey'
      
        '  where dateadd(day,isnull(tdpppbdds.TransferDey,0),DatePlat)  b' +
        'etween @DateBeg and @DateEnd'
      
        '    and (isnull(pp.bank_invoice_id,0) = isnull(@id,isnull(pp.ban' +
        'k_invoice_id,0)))'
      '    and pp.TipPlat = 7'
      '    and @IsEnableBDDS = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pp.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pp.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pp.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pp.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      ''
      'order by DayPayment, PostName) ppbdds'
      ''
      'union all'
      ''
      'select * from'
      
        '(select  top 100 percent dateadd(day,isnull(tdpprbdds.TransferDe' +
        'y,0),DatePlat) as DayPayment'
      
        '       , (select name from Post where PostNo = pr.PostNo) as Pos' +
        'tName'
      '       , DatePlat as DateNakl'
      '       , 0 as Day_Delay'
      '       , 0 as Day_Delay_Ext'
      '       , 0 as General_Day_Dalay'
      '       , 0 as Summa'
      '       , pr.Summa as SummaDolg'
      '       , 0 as SummaPrihoda'
      
        '       , (select Buh_type_name from d_buh_type where buh = pr.Bu' +
        'h) as BuhType'
      
        '       , (select VidRashodName from VidRashod where VidRashodNo ' +
        '= pr.VidRashodNo) as VidRashod'
      '       , isnull(tdpprbdds.TransferDey,0) as TransferDey'
      '       , pr.bank_invoice_id as Invoice_Id'
      
        '       , isnull((select Bank_Name from D_BANK_INVOICE where id =' +
        ' pr.bank_invoice_id),'#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39') as Invoive'
      
        '       , (select Name from d_PLat_Type where id = pr.TipPlat) as' +
        ' PlatName'
      '       , pr.pkey as pkey'
      '       , '#39'PlatR'#39' as Entity_Type'
      '       , pr.Spravka as Spravka'
      ' from PlatR pr left join'
      
        '      TransferDayPaymentForPlatRBDDS tdpprbdds on tdpprbdds.Plat' +
        'RPkey = pr.pkey'
      
        '  where dateadd(day,isnull(tdpprbdds.TransferDey,0),DatePlat)  b' +
        'etween @DateBeg and @DateEnd'
      
        '    and (isnull(pr.bank_invoice_id,0) = isnull(@id,isnull(pr.ban' +
        'k_invoice_id,0)))'
      '    and pr.TipPlat = 7'
      '    and @IsEnableBDDS = 0'
      '    and case '
      
        '          when (@IsKassa = 1) and (@IsBank = 1) AND (pr.Buh in (' +
        '1,2,3)) then 1 '
      '          when (@IsKassa = 1) AND (pr.Buh in (1,3)) then 1 '
      '          when (@IsBank = 1) AND ( pr.Buh = 2) then 1 '
      
        '          when (@IsKassa is null) and (@IsBank is null) and (pr.' +
        'Buh in (1,2,3)) then 1'
      '          else 0 '
      '        end = 1'
      ''
      'order by DayPayment, PostName) prbdds) u'
      'where /*Filter*/1=1'
      'order by &_order')
    Left = 722
    Top = 29
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IsPost'
      end
      item
        DataType = ftUnknown
        Name = 'IsKassa'
      end
      item
        DataType = ftUnknown
        Name = 'IsBank'
      end
      item
        DataType = ftUnknown
        Name = 'id'
      end
      item
        DataType = ftInteger
        Name = 'IsEnableNaklP'
      end
      item
        DataType = ftInteger
        Name = 'IsEnablePlatPAndPlatR'
      end
      item
        DataType = ftInteger
        Name = 'IsEnableBDDS'
      end
      item
        DataType = ftDateTime
        Name = 'DateBeg'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'IsSummaDolga'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = '  1'
      end>
    object quFilterPostName: TStringField
      FieldName = 'PostName'
      ReadOnly = True
      Size = 32
    end
  end
  object dsFilter: TMSDataSource
    AutoEdit = False
    DataSet = quFilter
    OnUpdateData = dsDataQuery1UpdateData
    Left = 722
    Top = 1
  end
  object sdExportBDDSInExel: TSaveDialog
    Left = 736
    Top = 600
  end
end
