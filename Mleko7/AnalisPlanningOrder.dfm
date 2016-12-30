inherited AnalisPlanningOrderForm: TAnalisPlanningOrderForm
  Left = 322
  Top = 234
  Width = 1272
  Height = 568
  Caption = #1040#1085#1072#1083#1080#1079' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1083#1072#1085#1086#1074' '#1087#1088#1086#1076#1072#1078
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1256
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 110
      Height = 13
      Caption = #1044#1072#1090#1072' '#1092#1072#1082#1090#1072' '#1082#1086#1085#1077#1095#1085#1072#1103
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 154
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1082#1086#1085#1077#1095#1085#1072#1103':'
    end
    object Label5: TLabel
      Left = 8
      Top = 18
      Width = 160
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1085#1072#1095#1072#1083#1100#1085#1072#1103':'
    end
    object EdDatePlanningBeg: TcxDateEdit
      Left = 165
      Top = 13
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      Properties.OnChange = EdDatePlanningBegPropertiesChange
      TabOrder = 0
      Width = 105
    end
    object EdDatePlanningEnd: TcxDateEdit
      Left = 165
      Top = 37
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      Properties.OnChange = EdDatePlanningEndPropertiesChange
      TabOrder = 1
      Width = 105
    end
    object EdDatePlanningEndFact: TcxDateEdit
      Left = 165
      Top = 61
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      Properties.OnChange = EdDatePlanningEndFactPropertiesChange
      TabOrder = 2
      Width = 105
    end
    object cbIs_Ext_OtdelNo: TCheckBox
      Left = 296
      Top = 16
      Width = 193
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1086#1090#1076#1077#1083#1091' '#1087#1088#1086#1076#1072#1078
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object cbIs_Ext_VidNo: TCheckBox
      Left = 296
      Top = 40
      Width = 193
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1074#1080#1076#1091' '#1090#1086#1074#1072#1088#1072
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object cbIs_Ext_TipNo: TCheckBox
      Left = 296
      Top = 64
      Width = 193
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1090#1080#1087#1091' '#1090#1086#1074#1072#1088#1072
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object cbIs_Ext_TovarNo: TCheckBox
      Left = 480
      Top = 16
      Width = 193
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1090#1086#1074#1072#1088#1091
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object cbIs_Ext_SotrudNo: TCheckBox
      Left = 480
      Top = 40
      Width = 193
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object cbIs_Ext_ColnPrice: TCheckBox
      Left = 480
      Top = 64
      Width = 193
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1082#1086#1083#1086#1085#1082#1077' '#1094#1077#1085#1099
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object fltVidTov: TcitDBComboEdit
      Left = 755
      Top = 37
      Width = 164
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
      LLblCaption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072':'
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
      TabOrder = 9
      Visible = True
      LocateKey = False
      KeyField = 'VidNo'
      TextField = 'VidName'
      Owner = 'AnalisPlanningOrderForm'
      EntityCode = 'VIDTOV'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object fltOtdel: TcitDBComboEdit
      Left = 755
      Top = 13
      Width = 164
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
      LLblCaption = #1054#1090#1076#1077#1083' '#1087#1088#1086#1076#1072#1078':'
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
      KeyField = 'OtdelNo'
      TextField = 'OtdelName'
      Owner = 'AnalisPlanningOrderForm'
      EntityCode = 'VIDOTDEL'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object fltSotrud: TcitDBComboEdit
      Left = 755
      Top = 61
      Width = 165
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
      LLblCaption = #1057#1086#1090#1088#1091#1076#1085#1080#1082':'
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
      TabOrder = 11
      Visible = True
      LocateKey = False
      KeyField = 'SotrudNo'
      TextField = 'SotrudName'
      Owner = 'AnalisPlanningOrderForm'
      EntityCode = 'SOTRUD'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object cbFactSumCorrection_SummaProdag: TCheckBox
      Left = 953
      Top = 64
      Width = 161
      Height = 17
      Caption = #1054#1090#1089#1090#1072#1074#1072#1085#1080#1077'  '#1057#1091#1084'. '#1060#1082#1086#1088'.-'#1055
      TabOrder = 12
    end
    object FltTipTovara: TcitDBComboEdit
      Left = 1032
      Top = 13
      Width = 158
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
      LLblCaption = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072' :'
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
      KeyField = 'TipNo'
      TextField = 'TipName'
      Owner = 'AnalisPlanningOrderForm'
      EntityCode = 'TipTovara'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object FltTovar: TcitDBComboEdit
      Left = 1031
      Top = 40
      Width = 158
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
      LLblCaption = #1058#1086#1074#1072#1088' :'
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
      KeyField = 'TovarNo'
      TextField = 'NameTovar'
      Owner = 'AnalisPlanningOrderForm'
      EntityCode = 'Tovar'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 488
    Width = 1256
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bRefrehs: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      OnClick = bRefrehsClick
    end
    object Button1: TButton
      Left = 280
      Top = 8
      Width = 129
      Height = 25
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1069#1082#1089#1077#1083#1100
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 105
    Width = 1256
    Height = 383
    Align = alClient
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1254
      Height = 381
      Align = alClient
      DataSource = dsAnalisPlanningOrder
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
      OnKeyDown = DBGridEh1KeyDown
      OnKeyPress = DBGridEh1KeyPress
      OnTitleBtnClick = DBGridEh1TitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'OtdelName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'VidName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'TipName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'TovarName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'SotrudName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'SummaPlanProdag'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'SummaProdag'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PlanPrice'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'ColName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Qty'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Summa'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PlanKolFact'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1055#1083#1072#1085' '#1082#1086#1083'. '#1090#1077#1082#1091#1097'.'
        end
        item
          EditButtons = <>
          FieldName = 'PlanSumFact'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'FactKolCorrection'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'FactSumCorrection'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Summa_PlanSumFact'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'FactSumCorrection_SummaProdag'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'PriceInInst'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'SummaPlanProdagInInst'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'DatePlanBeg'
          Footers = <>
        end>
    end
  end
  object dsAnalisPlanningOrder: TMSDataSource
    DataSet = quAnalisPlanningOrder
    Left = 352
    Top = 65
  end
  object quAnalisPlanningOrder: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '     @DatePlanBeg datetime'
      '   , @DatePlanEnd datetime'
      '   , @DateFactEnd datetime'
      ''
      '   , @Is_Ext_OtdelNo int'
      '   , @Is_Ext_VidNo int'
      '   , @Is_Ext_TipNo int'
      '   , @Is_Ext_TovarNo int'
      '   , @Is_Ext_SotrudNo int'
      '   , @Is_Ext_ColnPrice int'
      ''
      '   , @IsSelectedOtdel int'
      '   , @IsSelectedVidTov int'
      '   , @IsSelectedSotrud int'
      ''
      '   , @IsSelectedTipTovara int'
      '   , @IsSelectedTovar int'
      ''
      '   , @IsFactSumCorrection_SummaProdag int'
      ''
      '   , @KolDayPlan int'
      '   , @KolDayFact int'
      ''
      '   , @UserNo int'
      '   , @SPID int'
      ''
      'set @UserNo = :UserNo'
      'set @SPID = :SPID'
      ''
      'set @IsSelectedOtdel = :IsSelectedOtdel'
      'set @IsSelectedVidTov = :IsSelectedVidTov'
      'set @IsSelectedSotrud = :IsSelectedSotrud'
      ''
      
        'set @IsFactSumCorrection_SummaProdag = :IsFactSumCorrection_Summ' +
        'aProdag'
      ''
      'set @DatePlanBeg = :DatePlanBeg'
      'set @DatePlanEnd = :DatePlanEnd'
      'set @DateFactEnd = :DateFactEnd'
      ''
      'set @Is_Ext_OtdelNo = :Is_Ext_OtdelNo'
      'set @Is_Ext_VidNo = :Is_Ext_VidNo'
      'set @Is_Ext_TipNo = :Is_Ext_TipNo'
      'set @Is_Ext_TovarNo = :Is_Ext_TovarNo'
      'set @Is_Ext_SotrudNo = :Is_Ext_SotrudNo'
      'set @Is_Ext_ColnPrice = :Is_Ext_ColnPrice'
      ''
      'set @IsSelectedTipTovara = :IsSelectedTipTovara'
      'set @IsSelectedTovar = :IsSelectedTovar'
      ''
      'select  @KolDayPlan = datediff(day,@DatePlanBeg,@DatePlanEnd)+1'
      '      , @KolDayFact = datediff(day,@DatePlanBeg,@DateFactEnd)+1'
      ''
      'if @Is_Ext_OtdelNo is null set @Is_Ext_OtdelNo = 1'
      'if @Is_Ext_VidNo is null set @Is_Ext_VidNo = 1'
      'if @Is_Ext_TipNo is null set @Is_Ext_TipNo = 1'
      'if @Is_Ext_TovarNo is null set @Is_Ext_TovarNo = 1'
      'if @Is_Ext_SotrudNo is null set @Is_Ext_SotrudNo = 1'
      'if @Is_Ext_ColnPrice is null set @Is_Ext_ColnPrice = 1'
      ''
      'if @IsSelectedOtdel is null set @IsSelectedOtdel = 0'
      'if @IsSelectedVidTov is null set @IsSelectedVidTov = 0'
      'if @IsSelectedSotrud is null set @IsSelectedSotrud = 0'
      ''
      ''
      ''
      'if @IsSelectedTipTovara is null set @IsSelectedTipTovara = 0'
      'if @IsSelectedTovar is null set @IsSelectedTovar = 0'
      ''
      
        'if @IsFactSumCorrection_SummaProdag is null set @IsFactSumCorrec' +
        'tion_SummaProdag = 0'
      ''
      'CREATE TABLE #PlanningOrderTovarTemp'
      '('
      #9'[TovarNo] [int] NULL,'
      #9'[NameTovar] [varchar](64) NULL,'
      #9'[VidNo] [int] NULL,'
      #9'[ColNPrice] [int] NULL,'
      #9'[ColName] [varchar](64) NULL,'
      #9'[Visible] [bit] NULL,'
      #9'[SotrudNo] [int] NULL,'
      #9'[SotrudName] [varchar](30) NULL,'
      #9'[SotrudOtdel] [int] NULL,'
      #9'[PriceNow] [decimal](18, 2) NULL,'
      #9'[TipNo] [int] NULL'
      ')'
      ''
      ''
      '-- truncate table PlanningOrderTovarTemp'
      ''
      
        'Insert into #PlanningOrderTovarTemp (TovarNo, NameTovar, VidNo, ' +
        'TipNo, ColNPrice, ColName, Visible, SotrudNo, SotrudName, Sotrud' +
        'Otdel, PriceNow)'
      '(select   ds.ARTICLE_ID '
      #9#9', t.NameTovarShort'
      #9#9', t.VidNo'
      #9#9', t.TipNo'
      #9#9', nr.ColnPrice'
      
        #9#9', (select ColName from D_Price_type where ColnPrice = nr.ColnP' +
        'rice) as ColName'
      #9#9', null as Visible'
      #9#9', nr.SotrudNo'
      
        #9#9', (select SotrudName from Sotrud where SotrudNo = nr.SotrudNo)' +
        ' as SotrudName'
      #9#9', nr.OtdelNo'
      #9#9', null as PriceNow'
      ''
      '  from NaklR nr inner join'
      '       DSPEC ds on ds.NaklNo = nr.NaklNo inner join'
      '       Tovar t on t.TovarNo = ds.ARTICLE_ID '
      '   where ds.DOC_DATE between @DatePlanBeg and @DateFactEnd'
      '     and t.OtdelNo <> 3'
      '     and ds.DOC_TYPE_ID in (10,12)'
      
        '     and ds.CONTRACTOR_ID not in (select PostNo from ListMinusPo' +
        'stForPlanningOrder where CheckMinus = 1)) '
      ''
      
        'Insert into #PlanningOrderTovarTemp (TovarNo, NameTovar, VidNo, ' +
        'TipNo, ColNPrice, ColName, Visible, SotrudNo, SotrudName, Sotrud' +
        'Otdel, PriceNow)'
      '(select  pos.TovarNo'
      '       , pos.TovarName'
      #9'   , t.VidNo'
      #9'   , t.TipNo'
      
        #9'   , (select ColNPrice from D_Price_type where ColName = pos.Co' +
        'lName) as ColnPrice'
      #9'   , pos.ColName'
      #9'   , null as Visible'
      #9'   , pos.SotrudNo'
      
        #9'   , (select SotrudName from Sotrud where SotrudNo = pos.Sotrud' +
        'No) as SotrudName'
      #9'   , pos.OtdelNo'
      #9'   , null as PriceNow'
      ''
      '  from PlanningOrderSpec pos left join'
      
        '       PlanningOrderHead poh on pos.PlanningOrderHeadId = poh.id' +
        ' left join'
      #9'   Tovar t on t.TovarNo = pos.TovarNo'
      '   where poh.DatePlanning between @DatePlanBeg and @DatePlanEnd'
      '     and t.OtdelNo <> 3)'
      ''
      'select --*,'
      '       SotrudOtdel as OtdelNo'
      
        '     , (select OtdelName from VidOtdel where OtdelNo = t.SotrudO' +
        'tdel) as OtdelName'
      #9' , t.VidNo'
      
        #9' , case when t.VidNo <> -1 then (select VidName from VidTov whe' +
        're VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end as VidName'
      #9' , t.TipNo'
      
        #9' , case when t.TipNo <> -1 then (select TipName from TipTovara ' +
        'where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' end as TipName'
      #9' , t.TovarNo'
      #9' , t.NameTovar as TovarName'
      #9' , t.SotrudNo'
      #9' , t.SotrudName'
      #9' , isnull(p.SummaPlanProdag,0) as SummaPlanProdag'
      #9' , isnull(p.SummaProdag,0) as SummaProdag'
      
        #9' , convert(decimal(18,2),round(isnull(p.PlanPrice,0),2)) as Pla' +
        'nPrice'
      #9' , isnull(p.ColnPrice,d.ColnPrice) as ColnPrice'
      #9' , isnull(p.ColName,d.ColName) as ColName'
      #9' , isnull(d.Qty,0) as Qty'
      #9' , convert(decimal(18,2),round(isnull(d.Summa,0),2)) as Summa'
      ''
      
        #9' , convert(decimal(18,3),round(p.SummaPlanProdag / @KolDayPlan ' +
        '* @KolDayFact,2)) as PlanKolFact'
      
        '         , convert(decimal(18,3),round(p.SummaProdag / @KolDayPl' +
        'an * @KolDayFact,2)) as PlanSumFact'
      ''
      
        #9' , convert(decimal(18,3),round(isnull(d.Qty,0) / @KolDayFact * ' +
        '@KolDayPlan,2)) as FactKolCorrection'
      
        '         , convert(decimal(18,3),round(isnull(d.Summa,0) / @KolD' +
        'ayFact * @KolDayPlan,2)) as FactSumCorrection'
      ''
      
        #9' , convert(decimal(18,2),round(isnull(d.Summa,0),2)) - convert(' +
        'decimal(18,3),round(isnull(p.SummaProdag,0) / @KolDayPlan * @Kol' +
        'DayFact,2)) as Summa_PlanSumFact'
      ''
      
        #9' , convert(decimal(18,3),round(isnull(d.Summa,0) / @KolDayFact ' +
        '* @KolDayPlan,2)) - isnull(p.SummaProdag,0) as FactSumCorrection' +
        '_SummaProdag'
      '        '
      
        '         , case when @Is_Ext_TovarNo = 1 then (select PriceInIns' +
        't from PriceForVeb where TovarNo = t.TovarNo) else 0 end as Pric' +
        'eInInst'
      
        '         , case when @Is_Ext_TovarNo = 1 then isnull(SummaPlanPr' +
        'odag,0) * isnull((select PriceInInst from PriceForVeb where Tova' +
        'rNo = t.TovarNo),0) else 0 end as SummaPlanProdagInInst'
      '         , @DatePlanBeg as DatePlanBeg'
      ''
      ' from (select TovarNo'
      #9'     , NameTovar'
      #9'     , VidNo'
      '      '#9'     , TipNo'#9
      '  '#9'     , ColNPrice'
      '  '#9'     , ColName'
      #9'     , SotrudNo'
      #9'     , SotrudName'
      '  '#9'     , SotrudOtdel'
      
        '        from (select case when @Is_Ext_TovarNo = 1 then TovarNo ' +
        'else -1 end as TovarNo'
      
        '                   , case when @Is_Ext_TovarNo = 1 then NameTova' +
        'r else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as NameTovar'
      
        #9'           , case when @Is_Ext_VidNo = 1 then VidNo else -1 end' +
        ' as VidNo'
      
        '                   , case when @Is_Ext_VidNo = 1 then (select Vi' +
        'dName from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end as ' +
        'VidName'
      
        '                   , case when @Is_Ext_TipNo = 1 then TipNo else' +
        ' -1 end as TipNo'
      
        '                   , case when @Is_Ext_TipNo = 1 then (select Ti' +
        'pName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' end ' +
        'as TipName'
      
        #9'           , case when @Is_Ext_ColnPrice = 1 then ColNPrice els' +
        'e -1 end as ColNPrice'
      
        #9'           , case when @Is_Ext_ColnPrice = 1 then ColName else ' +
        #39#1042#1089#1077' '#1094#1077#1085#1099#39' end as ColName'
      #9'           , PriceNow'
      
        #9'           , case when @Is_Ext_SotrudNo = 1 then SotrudNo else ' +
        '-1 end as SotrudNo'
      
        #9'           , case when @Is_Ext_SotrudNo = 1 then SotrudName els' +
        'e '#39#1042#1089#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080#39' end as SotrudName'
      
        #9'           , case when @Is_Ext_OtdelNo = 1 then SotrudOtdel els' +
        'e -1 end as SotrudOtdel'
      
        '                   , case when @Is_Ext_OtdelNo = 1 then (select ' +
        'OtdelName from VidOtdel where OtdelNo = SotrudOtdel) else '#39#1042#1089#1077' '#1086 +
        #1090#1076#1077#1083#1099#39' end as OtdelName'
      '               from (select distinct * '
      #9#9'      from #PlanningOrderTovarTemp)t) g'
      #9'   group by TovarNo'
      #9'          , NameTovar'
      #9#9#9'  , VidNo'
      #9#9#9'  , TipNo'#9
      #9#9#9'  , ColNPrice'
      #9#9#9'  , ColName'
      #9#9#9'  , SotrudNo'
      #9#9#9'  , SotrudName'
      #9#9#9'  , SotrudOtdel)t left join'
      '      (select  OtdelNo'
      '             , OtdelName'
      #9'         , VidNo'
      '             , VidName'
      '       '#9'     , TipNo'
      #9'         , TipName'
      #9'         , TovarNo'
      #9'         , TovarName'
      #9'         , SotrudNo'
      #9'         , SotrudName'
      #9'         , sum(SummaPlanProdag) as SummaPlanProdag'
      #9'         , sum(SummaProdag) as SummaProdag'
      #9'         , round(avg(PlanPrice),2) as PlanPrice'
      #9'         , ColnPrice'
      #9'         , ColName'
      
        '        from (select   case when @Is_Ext_OtdelNo = 1 then pos.Ot' +
        'delNo else -1 end as OtdelNo'
      
        #9'                 , case when @Is_Ext_OtdelNo = 1 then (select O' +
        'tdelName from VidOtdel where OtdelNo = pos.OtdelNo) else '#39#1042#1089#1077' '#1086#1090 +
        #1076#1077#1083#1099#39' end as OtdelName'
      
        '                     , case when @Is_Ext_VidNo = 1 then t.VidNo ' +
        'else -1 end as VidNo'
      
        '                     , case when @Is_Ext_VidNo = 1 then (select ' +
        'VidName from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end a' +
        's VidName'
      
        '                     , case when @Is_Ext_TipNo = 1 then t.TipNo ' +
        'else -1 end as TipNo'
      
        '                     , case when @Is_Ext_TipNo = 1 then (select ' +
        'TipName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' en' +
        'd as TipName'
      
        '                     , case when @Is_Ext_TovarNo = 1 then pos.To' +
        'varNo else -1 end as TovarNo'
      
        #9'                 , case when @Is_Ext_TovarNo = 1 then pos.Tovar' +
        'Name else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as TovarName'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then pos.Sotr' +
        'udNo else -1 end as SotrudNo'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then (select ' +
        'SotrudName from Sotrud where SotrudNo = pos.SotrudNo) else '#39#1042#1089#1077' ' +
        #1089#1086#1090#1088#1091#1076#1085#1080#1082#1080#39' end as SotrudName'
      '                     , pos.PlanProdag as SummaPlanProdag'
      
        '--                     , isnull(pos.PlanProdag,0) * PriceNow as ' +
        'SummaPlanProdag '
      '--    '#9'             , pos.PlanProdag as SummaPlanProdag'
      '--'#9'                 , pos.SummaProdag as SummaProdag'
      
        '                     , isnull(pos.PlanProdag,0) * isnull(pos.Pri' +
        'ceNow,0) as SummaProdag'
      
        #9'                 , case when (pos.PlanProdag > 0) then SummaPro' +
        'dag/pos.PlanProdag  end as PlanPrice'
      
        #9'                 , case when @Is_Ext_ColnPrice = 1 then (select' +
        ' ColNPrice from D_Price_type where ColName = pos.ColName) else -' +
        '1 end as ColnPrice'
      
        #9'                 , case when @Is_Ext_ColnPrice = 1 then pos.Col' +
        'Name else '#39#1042#1089#1077' '#1094#1077#1085#1099#39' end as ColName'
      '               from PlanningOrderSpec pos left join'
      
        '                    PlanningOrderHead poh on poh.id = pos.Planni' +
        'ngOrderHeadId left join'
      #9'                Tovar t on t.TovarNo = pos.TovarNo'
      
        '                where poh.DatePlanning between @DatePlanBeg and ' +
        '@DatePlanEnd'
      '                  and t.OtdelNo <> 3) Planning'
      '       group by  OtdelNo'
      '               , OtdelName'
      #9'           , VidNo'
      #9'           , VidName'
      #9'           , TipNo'
      '               , TipName'
      #9'           , TovarNo'
      #9'           , TovarName'
      '    '#9'       , SotrudNo'
      #9'           , SotrudName'
      #9'           , ColnPrice'
      
        #9'           , ColName) p on  p.ColnPrice = t.ColNPrice and p.Otd' +
        'elNo = t.SotrudOtdel and p.SotrudNo = t.SotrudNo and p.TipNo = t' +
        '.TipNo and p.VidNo = t.VidNo and p.TovarNo = t.TovarNo  left joi' +
        'n'
      ''
      '      (select  OtdelNo'
      '             , OtdelName'
      #9'         , VidNo'
      #9'         , VidName'
      '       '#9'     , TipNo'
      #9'         , TipName'
      #9'         , TovarNo'
      #9'         , TovarName'
      #9'         , SotrudNo'
      #9'         , SotrudName'
      #9'         , sum(Qty) as Qty'
      #9'         , sum(Summa) as Summa'
      #9'         , ColnPrice'
      #9'         , ColName'
      
        '        from (select   case when @Is_Ext_OtdelNo = 1 then nr.Otd' +
        'elNo else -1 end as OtdelNo'
      
        '                     , case when @Is_Ext_OtdelNo = 1 then (selec' +
        't OtdelName from VidOtdel where OtdelNo = nr.OtdelNo) else '#39#1042#1089#1077' ' +
        #1086#1090#1076#1077#1083#1099#39' end as OtdelName'
      
        '                     , case when @Is_Ext_VidNo = 1 then t.VidNo ' +
        'else -1 end as VidNo'
      
        #9'                 , case when @Is_Ext_VidNo = 1 then (select Vid' +
        'Name from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end as V' +
        'idName'
      
        '                     , case when @Is_Ext_TipNo = 1 then t.TipNo ' +
        'else -1 end as TipNo'
      
        '      '#9'             , case when @Is_Ext_TipNo = 1 then (select T' +
        'ipName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' end' +
        ' as TipName'
      
        '                     , case when @Is_Ext_TovarNo = 1 then ds.ART' +
        'ICLE_ID else -1 end as TovarNo'
      
        #9'                 , case when @Is_Ext_TovarNo = 1 then t.NameTov' +
        'arShort else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as TovarName'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then nr.Sotru' +
        'dNo else -1 end as SotrudNo'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then (select ' +
        'SotrudName from Sotrud where SotrudNo = nr.SotrudNo) else '#39#1042#1089#1077' '#1089 +
        #1086#1090#1088#1091#1076#1085#1080#1082#1080#39' end as SotrudName'
      
        '                     , case when ds.DOC_TYPE_ID = 10 then abs(ds' +
        '.qty) * -1'
      #9#9#9'    '#9'        when ds.DOC_TYPE_ID = 12 then abs(ds.qty)'
      '                       end as qty'
      
        #9'    '#9'         , case when ds.DOC_TYPE_ID = 10 then abs(ds.qty*d' +
        's.PRICE_ECO) * -1'
      
        #9#9#9'                when ds.DOC_TYPE_ID = 12 then abs(ds.qty*ds.P' +
        'RICE_ECO)'
      '                       end as Summa'
      
        '    '#9'             , case when @Is_Ext_ColnPrice = 1 then nr.Coln' +
        'Price else -1 end as ColnPrice'
      
        #9'                 , case when @Is_Ext_ColnPrice = 1 then (select' +
        ' ColName from D_Price_type where ColnPrice = nr.ColnPrice) else ' +
        #39#1042#1089#1077' '#1094#1077#1085#1099#39' end as ColName'
      '               from NaklR nr inner join'
      '                    DSPEC ds on ds.NaklNo = nr.NaklNo inner join'
      '     '#9'            Tovar t on t.TovarNo = ds.ARTICLE_ID '
      
        '                where ds.DOC_DATE between @DatePlanBeg and @Date' +
        'FactEnd'
      '                  and ds.DOC_TYPE_ID in (10,12)'
      
        '                  and ds.CONTRACTOR_ID not in (select PostNo fro' +
        'm ListMinusPostForPlanningOrder where CheckMinus = 1)'
      #9#9'  and t.OtdelNo <> 3) Prodag'
      '       group by  OtdelNo'
      '               , OtdelName'
      #9'           , VidNo'
      #9'           , VidName'
      '               , TipNo'
      #9'           , TipName'
      #9'           , TovarNo'
      #9'           , TovarName'
      #9'           , SotrudNo'
      #9'           , SotrudName'
      #9'           , ColnPrice'
      
        #9'           , ColName) d on d.ColnPrice = t.ColNPrice and d.Otde' +
        'lNo = t.SotrudOtdel and d.SotrudNo = t.SotrudNo and d.TipNo = t.' +
        'TipNo and d.VidNo = t.VidNo and d.TovarNo = t.TovarNo'
      '  where (d.Qty is not null or p.SummaPlanProdag is not null)'
      '    and ((t.VidNo in (select cast(Param_Value as int)'
      '                       from e_Session_Params'
      '                        where Userno = @UserNo'
      
        '                          and Owner_Name = '#39'AnalisPlanningOrderF' +
        'orm'#39
      '                          and Param_Name = '#39'FLTVIDTOV'#39
      
        '                          and Spid = @SPID)) or @IsSelectedVidTo' +
        'v = 0)'
      '    and ((t.SotrudOtdel in (select cast(Param_Value as int)'
      '                             from e_Session_Params'
      '                              where Userno = @UserNo'
      
        '                                and Owner_Name = '#39'AnalisPlanning' +
        'OrderForm'#39
      '                                and Param_Name = '#39'FLTOTDEL'#39
      
        '                                and Spid = @SPID)) or @IsSelecte' +
        'dOtdel = 0)'
      '    and ((t.SotrudNo in (select cast(Param_Value as int)'
      '                          from e_Session_Params'
      '                           where Userno = @UserNo'
      
        '                             and Owner_Name = '#39'AnalisPlanningOrd' +
        'erForm'#39
      '                             and Param_Name = '#39'FLTSOTRUD'#39
      
        '                             and Spid = @SPID)) or @IsSelectedSo' +
        'trud = 0)'
      '    and ((t.TipNo in (select cast(Param_Value as int)'
      '                       from e_Session_Params'
      '                        where Userno = @UserNo'
      
        '                          and Owner_Name = '#39'AnalisPlanningOrderF' +
        'orm'#39
      '                          and Param_Name = '#39'FLTTIPTOVARA'#39
      
        '                          and Spid = @SPID)) or @IsSelectedTipTo' +
        'vara = 0)  '
      ''
      '    and ((t.TovarNo in (select cast(Param_Value as int)'
      '                         from e_Session_Params'
      '                          where Userno = @UserNo'
      
        '                            and Owner_Name = '#39'AnalisPlanningOrde' +
        'rForm'#39
      '                            and Param_Name = '#39'FLTTOVAR'#39
      
        '                            and Spid = @SPID)) or @IsSelectedTov' +
        'ar = 0)  '
      ''
      
        '    and (convert(decimal(18,3),round(d.Summa / @KolDayFact * @Ko' +
        'lDayPlan - SummaProdag,2)) < 0 or @IsFactSumCorrection_SummaProd' +
        'ag = 0)'
      ''
      'order by &_order'
      ''
      ''
      '/*'
      'select  isnull(p.OtdelNo,d.OtdelNo) as OtdelNo'
      '      , isnull(p.OtdelName,d.OtdelName) as OtdelName'
      '      , isnull(p.VidNo,d.VidNo) as VidNo'
      '      , isnull(p.VidName,d.VidName) as VidName'
      '      , isnull(p.TipNo,d.TipNo) as TipNo'
      '      , isnull(p.TipName,d.TipName) as TipName'
      '      , isnull(p.TovarNo,d.TovarNo) as TovarNo'
      '      , isnull(p.TovarName,d.TovarName) as TovarName'
      '      , isnull(p.SotrudNo,d.SotrudNo) as SotrudNo'
      '      , isnull(p.SotrudName,d.SotrudName) as SotrudName'
      '      , isnull(p.SummaPlanProdag,0) as SummaPlanProdag'
      '      , isnull(p.SummaProdag,0) as SummaProdag'
      
        '      , convert(decimal(18,2),round(isnull(p.PlanPrice,0),2)) as' +
        ' PlanPrice'
      '      , isnull(p.ColnPrice,d.ColnPrice) as ColnPrice'
      '      , isnull(p.ColName,d.ColName) as ColName '
      '      , isnull(d.Qty,0) as Qty'
      
        '      , convert(decimal(18,2),round(isnull(d.Summa,0),2)) as Sum' +
        'ma'
      #9'  , d.Summa'
      ''
      
        '      , convert(decimal(18,3),round(p.SummaPlanProdag / @KolDayP' +
        'lan * @KolDayFact,2)) as PlanKolFact'
      
        '      , convert(decimal(18,3),round(p.SummaProdag / @KolDayPlan ' +
        '* @KolDayFact,2)) as PlanSumFact'
      ''
      
        '      , convert(decimal(18,3),round(d.Qty / @KolDayFact * @KolDa' +
        'yPlan,2)) as FactKolCorrection'
      
        '      , convert(decimal(18,3),round(d.Summa / @KolDayFact * @Kol' +
        'DayPlan,2)) as FactSumCorrection'
      ''
      ''
      ''
      
        '      , convert(decimal(18,2),round(isnull(d.Summa,0),2)) - conv' +
        'ert(decimal(18,3),round(p.SummaProdag / @KolDayPlan * @KolDayFac' +
        't,2)) as Summa_PlanSumFact'
      '       '
      
        '      , convert(decimal(18,3),round(d.Summa / @KolDayFact * @Kol' +
        'DayPlan,2)) - isnull(p.SummaProdag,0) as FactSumCorrection_Summa' +
        'Prodag'
      ' from (select  OtdelNo'
      '             , OtdelName'
      #9'     , VidNo'
      '             , VidName'
      '       '#9'     , TipNo'
      #9'     , TipName'
      #9'     , TovarNo'
      #9'     , TovarName'
      #9'     , SotrudNo'
      #9'     , SotrudName'
      #9'     , sum(SummaPlanProdag) as SummaPlanProdag'
      #9'     , sum(SummaProdag) as SummaProdag'
      #9'     , round(avg(PlanPrice),2) as PlanPrice'
      #9'     , ColnPrice'
      #9'     , ColName'
      
        '        from (select   case when @Is_Ext_OtdelNo = 1 then pos.Ot' +
        'delNo else -1 end as OtdelNo'
      
        #9'             , case when @Is_Ext_OtdelNo = 1 then (select Otdel' +
        'Name from VidOtdel where OtdelNo = pos.OtdelNo) else '#39#1042#1089#1077' '#1086#1090#1076#1077#1083#1099 +
        #39' end as OtdelName'
      
        '                     , case when @Is_Ext_VidNo = 1 then t.VidNo ' +
        'else -1 end as VidNo'
      
        '                     , case when @Is_Ext_VidNo = 1 then (select ' +
        'VidName from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end a' +
        's VidName'
      
        '                     , case when @Is_Ext_TipNo = 1 then t.TipNo ' +
        'else -1 end as TipNo'
      
        '                     , case when @Is_Ext_TipNo = 1 then (select ' +
        'TipName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' en' +
        'd as TipName'
      
        '                     , case when @Is_Ext_TovarNo = 1 then pos.To' +
        'varNo else -1 end as TovarNo'
      
        #9'             , case when @Is_Ext_TovarNo = 1 then pos.TovarName' +
        ' else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as TovarName'
      
        #9'             , case when @Is_Ext_SotrudNo = 1 then pos.SotrudNo' +
        ' else -1 end as SotrudNo'
      
        #9'             , case when @Is_Ext_SotrudNo = 1 then (select Sotr' +
        'udName from Sotrud where SotrudNo = pos.SotrudNo) else '#39#1042#1089#1077' '#1089#1086#1090#1088 +
        #1091#1076#1085#1080#1082#1080#39' end as SotrudName'
      #9'             , pos.PlanProdag as SummaPlanProdag'
      #9'             , SummaProdag as SummaProdag'
      
        #9'             , case when (pos.PlanProdag > 0) then SummaProdag/' +
        'pos.PlanProdag  end as PlanPrice'
      
        #9'             , case when @Is_Ext_ColnPrice = 1 then (select Col' +
        'NPrice from D_Price_type where ColName = pos.ColName) else -1 en' +
        'd as ColnPrice'
      
        #9'             , case when @Is_Ext_ColnPrice = 1 then pos.ColName' +
        ' else '#39#1042#1089#1077' '#1094#1077#1085#1099#39' end as ColName'
      '               from PlanningOrderSpec pos left join'
      
        '                    PlanningOrderHead poh on pos.PlanningOrderHe' +
        'adId = poh.id left join'
      #9'            Tovar t on t.TovarNo = pos.TovarNo'
      
        '                where poh.DatePlanning between @DatePlanBeg and ' +
        '@DatePlanEnd) Planning'
      '       group by  OtdelNo'
      '               , OtdelName'
      #9'       , VidNo'
      #9'       , VidName'
      #9'       , TipNo'
      '               , TipName'
      #9'       , TovarNo'
      #9'       , TovarName'
      #9'       , SotrudNo'
      #9'       , SotrudName'
      #9'       , ColnPrice'
      #9'       , ColName) p right join'
      ''
      '      (select  OtdelNo'
      '             , OtdelName'
      #9'     , VidNo'
      #9'     , VidName'
      '       '#9'     , TipNo'
      #9'     , TipName'
      #9'     , TovarNo'
      #9'     , TovarName'
      #9'     , SotrudNo'
      #9'     , SotrudName'
      #9'     , sum(Qty) as Qty'
      #9'     , sum(Summa) as Summa'
      #9'     , ColnPrice'
      #9'     , ColName'
      
        '        from (select   case when @Is_Ext_OtdelNo = 1 then nr.Otd' +
        'elNo else -1 end as OtdelNo'
      
        '                     , case when @Is_Ext_OtdelNo = 1 then (selec' +
        't OtdelName from VidOtdel where OtdelNo = nr.OtdelNo) else '#39#1042#1089#1077' ' +
        #1086#1090#1076#1077#1083#1099#39' end as OtdelName'
      
        '                     , case when @Is_Ext_VidNo = 1 then t.VidNo ' +
        'else -1 end as VidNo'
      
        #9'             , case when @Is_Ext_VidNo = 1 then (select VidName' +
        ' from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end as VidNa' +
        'me'
      
        '                     , case when @Is_Ext_TipNo = 1 then t.TipNo ' +
        'else -1 end as TipNo'
      
        '      '#9'             , case when @Is_Ext_TipNo = 1 then (select T' +
        'ipName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' end' +
        ' as TipName'
      
        '                     , case when @Is_Ext_TovarNo = 1 then ds.ART' +
        'ICLE_ID else -1 end as TovarNo'
      
        #9'             , case when @Is_Ext_TovarNo = 1 then t.NameTovarSh' +
        'ort else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as TovarName'
      
        #9'             , case when @Is_Ext_SotrudNo = 1 then nr.SotrudNo ' +
        'else -1 end as SotrudNo'
      
        #9'             , case when @Is_Ext_SotrudNo = 1 then (select Sotr' +
        'udName from Sotrud where SotrudNo = nr.SotrudNo) else '#39#1042#1089#1077' '#1089#1086#1090#1088#1091 +
        #1076#1085#1080#1082#1080#39' end as SotrudName'
      
        '                     , case when ds.DOC_TYPE_ID = 10 then abs(ds' +
        '.qty) * -1'
      #9#9#9#9'        when ds.DOC_TYPE_ID = 12 then abs(ds.qty)'
      '                       end as qty'
      
        #9'    '#9'     , case when ds.DOC_TYPE_ID = 10 then abs(ds.qty*ds.PR' +
        'ICE_ECO) * -1'
      #9#9#9'    when ds.DOC_TYPE_ID = 12 then abs(ds.qty*ds.PRICE_ECO)'
      '                       end as Summa'
      '--     '#9#9'     , ds.qty'
      '--'#9'  '#9'     , ds.qty*abs(ds.PRICE_ECO) as Summa'
      
        #9'             , case when @Is_Ext_ColnPrice = 1 then nr.ColnPric' +
        'e else -1 end as ColnPrice'
      
        #9'             , case when @Is_Ext_ColnPrice = 1 then (select Col' +
        'Name from D_Price_type where ColnPrice = nr.ColnPrice) else '#39#1042#1089#1077 +
        ' '#1094#1077#1085#1099#39' end as ColName'
      ''
      '               from NaklR nr inner join'
      '                    DSPEC ds on ds.NaklNo = nr.NaklNo inner join'
      '     '#9'            Tovar t on t.TovarNo = ds.ARTICLE_ID '
      
        '                where ds.DOC_DATE between @DatePlanBeg and @Date' +
        'FactEnd'
      '                  and ds.DOC_TYPE_ID in (10,12)'
      
        '                  and ds.CONTRACTOR_ID not in (select PostNo fro' +
        'm ListMinusPostForPlanningOrder where CheckMinus = 1)'
      #9#9#9#9'  ) Prodag'
      '       group by  OtdelNo'
      '               , OtdelName'
      #9'       , VidNo'
      #9'       , VidName'
      '               , TipNo'
      #9'       , TipName'
      #9'       , TovarNo'
      #9'       , TovarName'
      #9'       , SotrudNo'
      #9'       , SotrudName'
      #9'       , ColnPrice'
      
        #9'       , ColName) d on d.ColnPrice = p.ColnPrice and d.OtdelNo ' +
        '= p.OtdelNo and d.SotrudNo = p.SotrudNo and d.TipNo = p.TipNo an' +
        'd d.VidNo = p.VidNo and d.TovarNo = p.TovarNo'
      ''
      '  where ((p.VidNo in (select cast(Param_Value as int)'
      '                       from e_Session_Params'
      '                        where Userno = @UserNo'
      
        '                          and Owner_Name = '#39'AnalisPlanningOrderF' +
        'orm'#39
      '                          and Param_Name = '#39'FLTVIDTOV'#39
      
        '                          and Spid = @SPID)) or @IsSelectedVidTo' +
        'v = 0)'
      '    and ((p.OtdelNo in (select cast(Param_Value as int)'
      '                         from e_Session_Params'
      '                          where Userno = @UserNo'
      
        '                            and Owner_Name = '#39'AnalisPlanningOrde' +
        'rForm'#39
      '                            and Param_Name = '#39'FLTOTDEL'#39
      
        '                            and Spid = @SPID)) or @IsSelectedOtd' +
        'el = 0)'
      '    and ((p.SotrudNo in (select cast(Param_Value as int)'
      '                          from e_Session_Params'
      '                           where Userno = @UserNo'
      
        '                             and Owner_Name = '#39'AnalisPlanningOrd' +
        'erForm'#39
      '                             and Param_Name = '#39'FLTSOTRUD'#39
      
        '                             and Spid = @SPID)) or @IsSelectedSo' +
        'trud = 0)'
      
        '    and (convert(decimal(18,3),round(d.Summa / @KolDayFact * @Ko' +
        'lDayPlan - SummaProdag,2)) < 0 or @IsFactSumCorrection_SummaProd' +
        'ag = 0)'
      ''
      'order by &_order'
      ''
      '--    and d.TovarNo = 9776'
      '*/'
      ''
      '/*'
      'select  isnull(p.OtdelNo,d.OtdelNo) as OtdelNo'
      '      , isnull(p.OtdelName,d.OtdelName) as OtdelName'
      '      , isnull(p.VidNo,d.VidNo) as VidNo'
      '      , isnull(p.VidName,d.VidName) as VidName'
      '      , isnull(p.TipNo,d.TipNo) as TipNo'
      '      , isnull(p.TipName,d.TipName) as TipName'
      '      , isnull(p.TovarNo,d.TovarNo) as TovarNo'
      '      , isnull(p.TovarName,d.TovarName) as TovarName'
      '      , isnull(p.SotrudNo,d.SotrudNo) as SotrudNo'
      '      , isnull(p.SotrudName,d.SotrudName) as SotrudName'
      '      , isnull(p.SummaPlanProdag,0) as SummaPlanProdag'
      '      , isnull(p.SummaProdag,0) as SummaProdag'
      
        '      , convert(decimal(18,2),round(isnull(p.PlanPrice,0),2)) as' +
        ' PlanPrice'
      '      , isnull(p.ColnPrice,d.ColnPrice) as ColnPrice'
      '      , isnull(p.ColName,d.ColName) as ColName '
      '      , isnull(d.Qty,0) as Qty'
      
        '      , convert(decimal(18,2),round(isnull(d.Summa,0),2)) as Sum' +
        'ma'
      ''
      
        '      , convert(decimal(18,3),round(p.SummaPlanProdag / @KolDayP' +
        'lan * @KolDayFact,2)) as PlanKolFact'
      
        '      , convert(decimal(18,3),round(p.SummaProdag / @KolDayPlan ' +
        '* @KolDayFact,2)) as PlanSumFact'
      ''
      
        '      , convert(decimal(18,3),round(d.Qty / @KolDayFact * @KolDa' +
        'yPlan,2)) as FactKolCorrection'
      
        '      , convert(decimal(18,3),round(d.Summa / @KolDayFact * @Kol' +
        'DayPlan,2)) as FactSumCorrection'
      ''
      ''
      ''
      
        '      , convert(decimal(18,2),round(isnull(d.Summa,0),2)) - conv' +
        'ert(decimal(18,3),round(p.SummaProdag / @KolDayPlan * @KolDayFac' +
        't,2)) as Summa_PlanSumFact'
      '       '
      
        '      , convert(decimal(18,3),round(d.Summa / @KolDayFact * @Kol' +
        'DayPlan,2)) - isnull(p.SummaProdag,0) as FactSumCorrection_Summa' +
        'Prodag'
      ' from (select  OtdelNo'
      '             , OtdelName'
      #9'     , VidNo'
      '             , VidName'
      '       '#9'     , TipNo'
      #9'     , TipName'
      #9'     , TovarNo'
      #9'     , TovarName'
      #9'     , SotrudNo'
      #9'     , SotrudName'
      #9'     , sum(SummaPlanProdag) as SummaPlanProdag'
      #9'     , sum(SummaProdag) as SummaProdag'
      #9'     , round(avg(PlanPrice),2) as PlanPrice'
      #9'     , ColnPrice'
      #9'     , ColName'
      
        '        from (select   case when @Is_Ext_OtdelNo = 1 then pos.Ot' +
        'delNo else -1 end as OtdelNo'
      
        #9'             , case when @Is_Ext_OtdelNo = 1 then (select Otdel' +
        'Name from VidOtdel where OtdelNo = pos.OtdelNo) else '#39#1042#1089#1077' '#1086#1090#1076#1077#1083#1099 +
        #39' end as OtdelName'
      
        '                     , case when @Is_Ext_VidNo = 1 then t.VidNo ' +
        'else -1 end as VidNo'
      
        '                     , case when @Is_Ext_VidNo = 1 then (select ' +
        'VidName from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end a' +
        's VidName'
      
        '                     , case when @Is_Ext_TipNo = 1 then t.TipNo ' +
        'else -1 end as TipNo'
      
        '                     , case when @Is_Ext_TipNo = 1 then (select ' +
        'TipName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' en' +
        'd as TipName'
      
        '                     , case when @Is_Ext_TovarNo = 1 then pos.To' +
        'varNo else -1 end as TovarNo'
      
        #9'             , case when @Is_Ext_TovarNo = 1 then pos.TovarName' +
        ' else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as TovarName'
      
        #9'             , case when @Is_Ext_SotrudNo = 1 then pos.SotrudNo' +
        ' else -1 end as SotrudNo'
      
        #9'             , case when @Is_Ext_SotrudNo = 1 then (select Sotr' +
        'udName from Sotrud where SotrudNo = pos.SotrudNo) else '#39#1042#1089#1077' '#1089#1086#1090#1088 +
        #1091#1076#1085#1080#1082#1080#39' end as SotrudName'
      #9'             , sum(pos.PlanProdag) as SummaPlanProdag'
      #9'             , sum(SummaProdag) as SummaProdag'
      
        #9'             , case when (sum(pos.PlanProdag) > 0) then sum(Sum' +
        'maProdag)/sum(pos.PlanProdag)  end as PlanPrice'
      
        #9'             , case when @Is_Ext_ColnPrice = 1 then (select Col' +
        'NPrice from D_Price_type where ColName = pos.ColName) else -1 en' +
        'd as ColnPrice'
      
        #9'             , case when @Is_Ext_ColnPrice = 1 then pos.ColName' +
        ' else '#39#1042#1089#1077' '#1094#1077#1085#1099#39' end as ColName'
      '               from PlanningOrderSpec pos left join'
      
        '                    PlanningOrderHead poh on pos.PlanningOrderHe' +
        'adId = poh.id left join'
      #9'            Tovar t on t.TovarNo = pos.TovarNo'
      
        '                where poh.DatePlanning between @DatePlanBeg and ' +
        '@DatePlanEnd'
      '              group by  pos.OtdelNo'
      '                      , t.VidNo'
      #9#9'      , t.TipNo'
      #9#9'      , pos.TovarNo'
      #9#9'      , pos.TovarName'
      #9#9'      , pos.SotrudNo'
      #9#9'      , pos.ColName) Planning'
      '       group by  OtdelNo'
      '               , OtdelName'
      #9'       , VidNo'
      #9'       , VidName'
      #9'       , TipNo'
      '               , TipName'
      #9'       , TovarNo'
      #9'       , TovarName'
      #9'       , SotrudNo'
      #9'       , SotrudName'
      #9'       , ColnPrice'
      #9'       , ColName) p left join'
      ''
      '      (select  OtdelNo'
      '             , OtdelName'
      #9'     , VidNo'
      #9'     , VidName'
      '       '#9'     , TipNo'
      #9'     , TipName'
      #9'     , TovarNo'
      #9'     , TovarName'
      #9'     , SotrudNo'
      #9'     , SotrudName'
      #9'     , sum(Qty) as Qty'
      #9'     , sum(Summa) as Summa'
      #9'     , ColnPrice'
      #9'     , ColName'
      '        from (select '
      
        '                     /*  case when @Is_Ext_OtdelNo = 1 then pp.O' +
        'tdelNo else -1 end as OtdelNo'
      
        '                     , case when @Is_Ext_OtdelNo = 1 then (selec' +
        't OtdelName from VidOtdel where OtdelNo = pp.OtdelNo) else '#39#1042#1089#1077' ' +
        #1086#1090#1076#1077#1083#1099#39' end as OtdelName'
      
        '                     , case when @Is_Ext_VidNo = 1 then t.VidNo ' +
        'else -1 end as VidNo'
      
        #9'             , case when @Is_Ext_VidNo = 1 then (select VidName' +
        ' from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end as VidNa' +
        'me'
      
        '                     , case when @Is_Ext_TipNo = 1 then t.TipNo ' +
        'else -1 end as TipNo'
      
        '      '#9'             , case when @Is_Ext_TipNo = 1 then (select T' +
        'ipName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' end' +
        ' as TipName'
      
        '                     , case when @Is_Ext_TovarNo = 1 then pp.Tov' +
        'arNo else -1 end as TovarNo'
      
        #9'             , case when @Is_Ext_TovarNo = 1 then t.NameTovarSh' +
        'ort else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as TovarName'
      
        #9'             , case when @Is_Ext_SotrudNo = 1 then pp.SotrudNo ' +
        'else -1 end as SotrudNo'
      
        #9'             , case when @Is_Ext_SotrudNo = 1 then (select Sotr' +
        'udName from Sotrud where SotrudNo = pp.SotrudNo) else '#39#1042#1089#1077' '#1089#1086#1090#1088#1091 +
        #1076#1085#1080#1082#1080#39' end as SotrudName'
      '                     , sum(ds.qty) as Qty'
      #9'             , sum(ds.qty*ds.PRICE_ECO) as Summa'
      
        #9'             , case when @Is_Ext_ColnPrice = 1 then pp.ColnPric' +
        'e else -1 end as ColnPrice'
      
        #9'             , case when @Is_Ext_ColnPrice = 1 then (select Col' +
        'Name from D_Price_type where ColnPrice = pp.ColnPrice) else '#39#1042#1089#1077 +
        ' '#1094#1077#1085#1099#39' end as ColName'
      '                     */'
      ''
      
        '                       case when @Is_Ext_OtdelNo = 1 then nr.Otd' +
        'elNo else -1 end as OtdelNo'
      
        '                     , case when @Is_Ext_OtdelNo = 1 then (selec' +
        't OtdelName from VidOtdel where OtdelNo = nr.OtdelNo) else '#39#1042#1089#1077' ' +
        #1086#1090#1076#1077#1083#1099#39' end as OtdelName'
      
        '                     , case when @Is_Ext_VidNo = 1 then t.VidNo ' +
        'else -1 end as VidNo'
      
        #9'             , case when @Is_Ext_VidNo = 1 then (select VidName' +
        ' from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end as VidNa' +
        'me'
      
        '                     , case when @Is_Ext_TipNo = 1 then t.TipNo ' +
        'else -1 end as TipNo'
      
        '      '#9'             , case when @Is_Ext_TipNo = 1 then (select T' +
        'ipName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' end' +
        ' as TipName'
      
        '                     , case when @Is_Ext_TovarNo = 1 then ds.ART' +
        'ICLE_ID else -1 end as TovarNo'
      
        #9'             , case when @Is_Ext_TovarNo = 1 then t.NameTovarSh' +
        'ort else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as TovarName'
      
        #9'             , case when @Is_Ext_SotrudNo = 1 then nr.SotrudNo ' +
        'else -1 end as SotrudNo'
      
        #9'             , case when @Is_Ext_SotrudNo = 1 then (select Sotr' +
        'udName from Sotrud where SotrudNo = nr.SotrudNo) else '#39#1042#1089#1077' '#1089#1086#1090#1088#1091 +
        #1076#1085#1080#1082#1080#39' end as SotrudName'
      '                     , sum(ds.qty) as Qty'
      '     '#9'             , sum(ds.qty*ds.PRICE_ECO) as Summa'
      
        #9'             , case when @Is_Ext_ColnPrice = 1 then nr.ColnPric' +
        'e else -1 end as ColnPrice'
      
        #9'             , case when @Is_Ext_ColnPrice = 1 then (select Col' +
        'Name from D_Price_type where ColnPrice = nr.ColnPrice) else '#39#1042#1089#1077 +
        ' '#1094#1077#1085#1099#39' end as ColName'
      ''
      '               from NaklR nr inner join'
      '                    DSPEC ds on ds.NaklNo = nr.NaklNo left join'
      #9'            Tovar t on t.TovarNo = ds.ARTICLE_ID '
      '/*left join'
      #9#9'    (select h.DatePlanningBeg'
      #9#9#9'  , h.DatePlanningEnd'
      #9#9#9'  , s.ColName'
      #9#9#9'  , s.OtdelNo'
      #9#9#9'  , s.SotrudNo'
      #9#9#9'  , s.TovarNo '
      
        #9#9#9'  , (select ColNPrice from D_Price_type where ColName = s.Col' +
        'Name) as ColNPrice'
      '                      from PlanningOrderHead h inner join'
      
        '                           PlanningOrderSpec s on s.PlanningOrde' +
        'rHeadId = h.id'
      
        '                       where DatePlanning between @DatePlanBeg a' +
        'nd @DatePlanEnd) pp on pp.ColNPrice = nr.ColnPrice and pp.OtdelN' +
        'o = nr.OtdelNo and pp.SotrudNo = nr.SotrudNo and pp.TovarNo = ds' +
        '.ARTICLE_ID'
      '*/'
      
        '                where ds.DOC_DATE between @DatePlanBeg and @Date' +
        'FactEnd'
      '                  and ds.DOC_TYPE_ID in (10,12)'
      
        '                  and ds.CONTRACTOR_ID not in (select PostNo fro' +
        'm ListMinusPostForPlanningOrder where CheckMinus = 1)'
      '              group by /*pp.ColnPrice'
      '                      , pp.TovarNo'
      '             '#9'      , pp.OtdelNo'
      #9#9'      , pp.SotrudNo'
      '       '#9#9'      , t.VidNo'
      '      '#9'       '#9'      , t.TipNo'
      #9#9'      , t.NameTovarShort*/'
      '                        nr.ColnPrice'
      '                      , ds.ARTICLE_ID'
      '             '#9'      , nr.OtdelNo'
      #9#9'      , nr.SotrudNo'
      '       '#9#9'      , t.VidNo'
      '      '#9'       '#9'      , t.TipNo'
      #9#9'      , t.NameTovarShort) Prodag'
      '       group by  OtdelNo'
      '               , OtdelName'
      #9'       , VidNo'
      #9'       , VidName'
      '               , TipNo'
      #9'       , TipName'
      #9'       , TovarNo'
      #9'       , TovarName'
      #9'       , SotrudNo'
      #9'       , SotrudName'
      #9'       , ColnPrice'
      
        #9'       , ColName) d on d.ColnPrice = p.ColnPrice and d.OtdelNo ' +
        '= p.OtdelNo and d.SotrudNo = p.SotrudNo and d.TipNo = p.TipNo an' +
        'd d.VidNo = p.VidNo and d.TovarNo = p.TovarNo'
      '  where ((p.VidNo in (select cast(Param_Value as int)'
      '                       from e_Session_Params'
      '                        where Userno = @UserNo'
      
        '                          and Owner_Name = '#39'AnalisPlanningOrderF' +
        'orm'#39
      '                          and Param_Name = '#39'FLTVIDTOV'#39
      
        '                          and Spid = @SPID)) or @IsSelectedVidTo' +
        'v = 0)'
      '    and ((p.OtdelNo in (select cast(Param_Value as int)'
      '                         from e_Session_Params'
      '                          where Userno = @UserNo'
      
        '                            and Owner_Name = '#39'AnalisPlanningOrde' +
        'rForm'#39
      '                            and Param_Name = '#39'FLTOTDEL'#39
      
        '                            and Spid = @SPID)) or @IsSelectedOtd' +
        'el = 0)'
      '    and ((p.SotrudNo in (select cast(Param_Value as int)'
      '                          from e_Session_Params'
      '                           where Userno = @UserNo'
      
        '                             and Owner_Name = '#39'AnalisPlanningOrd' +
        'erForm'#39
      '                             and Param_Name = '#39'FLTSOTRUD'#39
      
        '                             and Spid = @SPID)) or @IsSelectedSo' +
        'trud = 0)'
      
        '    and (convert(decimal(18,3),round(d.Summa / @KolDayFact * @Ko' +
        'lDayPlan - SummaProdag,2)) < 0or @IsFactSumCorrection_SummaProda' +
        'g = 0)'
      '*/'
      '/*'
      'select  OtdelNo'
      '      , OtdelName'
      '      , VidNo'
      '      , VidName'
      '      , TipNo'
      '      , TipName'
      '      , TovarNo'
      '      , TovarName'
      '      , SotrudNo'
      '      , SotrudName'
      '      , sum(SummaPlanProdag) as SummaPlanProdag'
      '      , sum(SummaProdag) as SummaProdag'
      '      , round(avg(PlanPrice),2) as PlanPrice'
      '      , ColnPrice'
      '      , ColName'
      '      , sum(Qty) as Qty'
      '      , sum(Summa)as Summa'
      'from'
      '(select  isnull(p.OtdelNo,d.OtdelNo) as OtdelNo'
      '      , isnull(p.OtdelName,d.OtdelName) as OtdelName'
      #9'  , isnull(p.VidNo,d.VidNo) as VidNo'
      #9'  , isnull(p.VidName,d.VidName) as VidName'
      #9'  , isnull(p.TipNo,d.TipNo) as TipNo'
      #9'  , isnull(p.TipName,d.TipName) as TipName'
      #9'  , isnull(p.TovarNo,d.TovarNo) as TovarNo'
      #9'  , isnull(p.TovarName,d.TovarName) as TovarName'
      #9'  , isnull(p.SotrudNo,d.SotrudNo) as SotrudNo'
      #9'  , isnull(p.SotrudName,d.SotrudName) as SotrudName'
      #9'  , isnull(p.SummaPlanProdag,0) as SummaPlanProdag'
      #9'  , isnull(p.SummaProdag,0) as SummaProdag'
      
        #9'  , convert(decimal(18,2),round(isnull(p.PlanPrice,0),2)) as Pl' +
        'anPrice'
      #9'  , isnull(p.ColnPrice,d.ColnPrice) as ColnPrice'
      #9'  , isnull(p.ColName,d.ColName) as ColName '
      #9'  , isnull(d.Qty,0) as Qty'
      #9'  , convert(decimal(18,2),round(isnull(d.Summa,0),2)) as Summa'
      ' from (select  OtdelNo'
      '             , OtdelName'
      #9'         , VidNo'
      '             , VidName'
      '       '#9'     , TipNo'
      #9'         , TipName'
      #9'         , TovarNo'
      #9'         , TovarName'
      #9'         , SotrudNo'
      #9'         , SotrudName'
      #9'         , sum(SummaPlanProdag) as SummaPlanProdag'
      #9'         , sum(SummaProdag) as SummaProdag'
      #9'         , round(PlanPrice,2) as PlanPrice'
      #9'         , ColnPrice'
      #9'         , ColName'
      
        '        from (select   case when @Is_Ext_OtdelNo = 1 then pos.Ot' +
        'delNo else -1 end as OtdelNo'
      
        #9'                 , case when @Is_Ext_OtdelNo = 1 then (select O' +
        'tdelName from VidOtdel where OtdelNo = pos.OtdelNo) else '#39#1042#1089#1077' '#1086#1090 +
        #1076#1077#1083#1099#39' end as OtdelName'
      
        '                     , case when @Is_Ext_VidNo = 1 then t.VidNo ' +
        'else -1 end as VidNo'
      
        '                     , case when @Is_Ext_VidNo = 1 then (select ' +
        'VidName from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end a' +
        's VidName'
      
        '                     , case when @Is_Ext_TipNo = 1 then t.TipNo ' +
        'else -1 end as TipNo'
      
        '                     , case when @Is_Ext_TipNo = 1 then (select ' +
        'TipName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' en' +
        'd as TipName'
      
        '                     , case when @Is_Ext_TovarNo = 1 then pos.To' +
        'varNo else -1 end as TovarNo'
      
        #9'                 , case when @Is_Ext_TovarNo = 1 then pos.Tovar' +
        'Name else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as TovarName'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then pos.Sotr' +
        'udNo else -1 end as SotrudNo'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then (select ' +
        'SotrudName from Sotrud where SotrudNo = pos.SotrudNo) else '#39#1042#1089#1077' ' +
        #1089#1086#1090#1088#1091#1076#1085#1080#1082#1080#39' end as SotrudName'
      #9'                 , sum(pos.PlanProdag) as SummaPlanProdag'
      #9'                 , sum(SummaProdag) as SummaProdag'
      
        #9'                 , case when (sum(pos.PlanProdag) > 0) then sum' +
        '(SummaProdag)/sum(pos.PlanProdag)  end as PlanPrice'
      
        #9'                 , case when @Is_Ext_ColnPrice = 1 then (select' +
        ' ColNPrice from D_Price_type where ColName = pos.ColName) else -' +
        '1 end as ColnPrice'
      
        #9'                 , case when @Is_Ext_ColnPrice = 1 then pos.Col' +
        'Name else '#39#1042#1089#1077' '#1094#1077#1085#1099#39' end as ColName'
      '               from PlanningOrderSpec pos left join'
      
        '                    PlanningOrderHead poh on pos.PlanningOrderHe' +
        'adId = poh.id left join'
      #9'                Tovar t on t.TovarNo = pos.TovarNo'
      
        '                where poh.DatePlanning between @DatePlanBeg and ' +
        '@DatePlanEnd'
      '              group by  pos.OtdelNo'
      '                      , t.VidNo'
      #9#9'              , t.TipNo'
      #9#9'              , pos.TovarNo'
      #9#9'              , pos.TovarName'
      #9#9'              , pos.SotrudNo'
      #9#9'              , pos.ColName) Planning'
      '       group by  OtdelNo'
      '               , OtdelName'
      #9'           , VidNo'
      #9'           , VidName'
      #9'           , TipNo'
      '               , TipName'
      #9'           , TovarNo'
      #9'           , TovarName'
      #9'           , SotrudNo'
      #9'           , SotrudName'
      #9#9'       , ColnPrice'
      #9'           , ColName'
      #9#9'       , PlanPrice) p left join'
      ''
      '      (select  OtdelNo'
      '             , OtdelName'
      #9'         , VidNo'
      #9'         , VidName'
      '       '#9'     , TipNo'
      #9'         , TipName'
      #9'         , TovarNo'
      #9'         , TovarName'
      #9'         , SotrudNo'
      #9'         , SotrudName'
      #9'         , sum(Qty) as Qty'
      #9'         , sum(Summa) as Summa'
      #9'         , ColnPrice'
      #9'         , ColName'
      
        '        from (select   case when @Is_Ext_OtdelNo = 1 then nr.Otd' +
        'elNo else -1 end as OtdelNo'
      
        '                     , case when @Is_Ext_OtdelNo = 1 then (selec' +
        't OtdelName from VidOtdel where OtdelNo = nr.OtdelNo) else '#39#1042#1089#1077' ' +
        #1086#1090#1076#1077#1083#1099#39' end as OtdelName'
      
        '                     , case when @Is_Ext_VidNo = 1 then t.VidNo ' +
        'else -1 end as VidNo'
      
        #9'                 , case when @Is_Ext_VidNo = 1 then (select Vid' +
        'Name from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end as V' +
        'idName'
      
        #9'                 , case when @Is_Ext_TipNo = 1 then t.TipNo els' +
        'e -1 end as TipNo'
      
        '       '#9'             , case when @Is_Ext_TipNo = 1 then (select ' +
        'TipName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' en' +
        'd as TipName'
      
        '                     , case when @Is_Ext_TovarNo = 1 then ds.ART' +
        'ICLE_ID else -1 end as TovarNo'
      
        #9'                 , case when @Is_Ext_TovarNo = 1 then t.NameTov' +
        'arShort else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as TovarName'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then nr.Sotru' +
        'dNo else -1 end as SotrudNo'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then (select ' +
        'SotrudName from Sotrud where SotrudNo = nr.SotrudNo) else '#39#1042#1089#1077' '#1089 +
        #1086#1090#1088#1091#1076#1085#1080#1082#1080#39' end as SotrudName'
      '                     , sum(ds.qty) as Qty'
      #9'                 , sum(ds.qty*ds.PRICE_ECO) as Summa'
      
        #9'                 , case when @Is_Ext_ColnPrice = 1 then nr.Coln' +
        'Price else -1 end as ColnPrice'
      
        #9'                 , case when @Is_Ext_ColnPrice = 1 then (select' +
        ' ColName from D_Price_type where ColnPrice = nr.ColnPrice) else ' +
        #39#1042#1089#1077' '#1094#1077#1085#1099#39' end as ColName'
      '               from NaklR nr inner join'
      '                    DSPEC ds on ds.NaklNo = nr.NaklNo left join'
      #9'                Tovar t on t.TovarNo = ds.ARTICLE_ID'
      
        '                where ds.DOC_DATE between @DatePlanBeg and @Date' +
        'FactEnd'
      '                  and ds.DOC_TYPE_ID in (10,12)'
      
        '                  and ds.CONTRACTOR_ID not in (select PostNo fro' +
        'm ListMinusPostForPlanningOrder where CheckMinus = 1)'
      '                  and ds.ARTICLE_ID in (select TovarNo'
      
        '                                         from PlanningOrderHead ' +
        'h inner join'
      
        '                                              PlanningOrderSpec ' +
        's on s.PlanningOrderHeadId = h.id'
      
        '                                          where DatePlanning bet' +
        'ween @DatePlanBeg and @DatePlanEnd)'
      '              group by nr.ColnPrice'
      '                      , ds.ARTICLE_ID'
      '             '#9#9'  , nr.OtdelNo'
      #9#9'              , nr.SotrudNo'
      '       '#9#9'          , t.VidNo'
      '      '#9'       '#9'      , t.TipNo'
      #9#9'              , t.NameTovarShort) Prodag'
      '       group by  OtdelNo'
      '               , OtdelName'
      #9'           , VidNo'
      #9'           , VidName'
      '               , TipNo'
      #9'           , TipName'
      #9'           , TovarNo'
      #9'           , TovarName'
      #9'           , SotrudNo'
      #9'           , SotrudName'
      #9#9'       , ColnPrice'
      
        #9'           , ColName) d on d.ColnPrice = p.ColnPrice and d.Otde' +
        'lNo = p.OtdelNo and d.SotrudNo = p.SotrudNo and d.TipNo = p.TipN' +
        'o and d.VidNo = p.VidNo and d.TovarNo = p.TovarNo'
      ') u'
      'group by OtdelNo'
      '       , OtdelName'
      #9'   , VidNo'
      #9'   , VidName'
      #9'   , TipNo'
      '       , TipName'
      #9'   , TovarNo'
      #9'   , TovarName'
      #9'   , SotrudNo'
      #9'   , SotrudName'
      #9'   , ColnPrice'
      #9'   , ColName'
      '*/'
      '/*'
      'select  isnull(p.OtdelNo,d.OtdelNo) as OtdelNo'
      '      , isnull(p.OtdelName,d.OtdelName) as OtdelName'
      #9'  , isnull(p.VidNo,d.VidNo) as VidNo'
      #9'  , isnull(p.VidName,d.VidName) as VidName'
      #9'  , isnull(p.TipNo,d.TipNo) as TipNo'
      #9'  , isnull(p.TipName,d.TipName) as TipName'
      #9'  , isnull(p.TovarNo,d.TovarNo) as TovarNo'
      #9'  , isnull(p.TovarName,d.TovarName) as TovarName'
      #9'  , isnull(p.SotrudNo,d.SotrudNo) as SotrudNo'
      #9'  , isnull(p.SotrudName,d.SotrudName) as SotrudName'
      #9'  , isnull(p.SummaPlanProdag,0) as SummaPlanProdag'
      #9'  , isnull(p.SummaProdag,0) as SummaProdag'
      
        #9'  , convert(decimal(18,2),round(isnull(p.PlanPrice,0),2)) as Pl' +
        'anPrice'
      #9'  , isnull(p.ColnPrice,d.ColnPrice) as ColnPrice'
      #9'  , isnull(p.ColName,d.ColName) as ColName '
      #9'  , isnull(d.Qty,0) as Qty'
      #9'  , convert(decimal(18,2),round(isnull(d.Summa,0),2)) as Summa'
      ' from (select  OtdelNo'
      '             , OtdelName'
      #9'         , VidNo'
      '             , VidName'
      '       '#9'     , TipNo'
      #9'         , TipName'
      #9'         , TovarNo'
      #9'         , TovarName'
      #9'         , SotrudNo'
      #9'         , SotrudName'
      #9'         , sum(SummaPlanProdag) as SummaPlanProdag'
      #9'         , sum(SummaProdag) as SummaProdag'
      #9'         , round(PlanPrice,2) as PlanPrice'
      #9'         , ColnPrice'
      #9'         , ColName'
      
        '        from (select   case when @Is_Ext_OtdelNo = 1 then pos.Ot' +
        'delNo else -1 end as OtdelNo'
      
        #9'                 , case when @Is_Ext_OtdelNo = 1 then (select O' +
        'tdelName from VidOtdel where OtdelNo = pos.OtdelNo) else '#39#1042#1089#1077' '#1086#1090 +
        #1076#1077#1083#1099#39' end as OtdelName'
      
        '                     , case when @Is_Ext_VidNo = 1 then t.VidNo ' +
        'else -1 end as VidNo'
      
        '                     , case when @Is_Ext_VidNo = 1 then (select ' +
        'VidName from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end a' +
        's VidName'
      
        '                     , case when @Is_Ext_TipNo = 1 then t.TipNo ' +
        'else -1 end as TipNo'
      
        '                     , case when @Is_Ext_TipNo = 1 then (select ' +
        'TipName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' en' +
        'd as TipName'
      
        '                     , case when @Is_Ext_TovarNo = 1 then pos.To' +
        'varNo else -1 end as TovarNo'
      
        #9'                 , case when @Is_Ext_TovarNo = 1 then pos.Tovar' +
        'Name else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as TovarName'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then pos.Sotr' +
        'udNo else -1 end as SotrudNo'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then (select ' +
        'SotrudName from Sotrud where SotrudNo = pos.SotrudNo) else '#39#1042#1089#1077' ' +
        #1089#1086#1090#1088#1091#1076#1085#1080#1082#1080#39' end as SotrudName'
      #9'                 , sum(pos.PlanProdag) as SummaPlanProdag'
      #9'                 , sum(SummaProdag) as SummaProdag'
      
        #9'                 , case when (sum(pos.PlanProdag) > 0) then sum' +
        '(SummaProdag)/sum(pos.PlanProdag)  end as PlanPrice'
      
        #9'                 , case when @Is_Ext_ColnPrice = 1 then (select' +
        ' ColNPrice from D_Price_type where ColName = pos.ColName) else -' +
        '1 end as ColnPrice'
      
        #9'                 , case when @Is_Ext_ColnPrice = 1 then pos.Col' +
        'Name else '#39#1042#1089#1077' '#1094#1077#1085#1099#39' end as ColName'
      '               from PlanningOrderSpec pos left join'
      
        '                    PlanningOrderHead poh on pos.PlanningOrderHe' +
        'adId = poh.id left join'
      #9'                Tovar t on t.TovarNo = pos.TovarNo'
      
        '                where poh.DatePlanning between @DatePlanBeg and ' +
        '@DatePlanEnd'
      '              group by  pos.OtdelNo'
      '                      , t.VidNo'
      #9#9'              , t.TipNo'
      #9#9'              , pos.TovarNo'
      #9#9'              , pos.TovarName'
      #9#9'              , pos.SotrudNo'
      #9#9'              , pos.ColName) Planning'
      '       group by  OtdelNo'
      '               , OtdelName'
      #9'           , VidNo'
      #9'           , VidName'
      #9'           , TipNo'
      '               , TipName'
      #9'           , TovarNo'
      #9'           , TovarName'
      #9'           , SotrudNo'
      #9'           , SotrudName'
      #9#9'       , ColnPrice'
      #9'           , ColName'
      #9#9'       , PlanPrice) p left join'
      ''
      '      (select  OtdelNo'
      '             , OtdelName'
      #9'         , VidNo'
      #9'         , VidName'
      '       '#9'     , TipNo'
      #9'         , TipName'
      #9'         , TovarNo'
      #9'         , TovarName'
      #9'         , SotrudNo'
      #9'         , SotrudName'
      #9'         , sum(Qty) as Qty'
      #9'         , sum(Summa) as Summa'
      #9'         , ColnPrice'
      #9'         , ColName'
      
        '        from (select   case when @Is_Ext_OtdelNo = 1 then nr.Otd' +
        'elNo else -1 end as OtdelNo'
      
        '                     , case when @Is_Ext_OtdelNo = 1 then (selec' +
        't OtdelName from VidOtdel where OtdelNo = nr.OtdelNo) else '#39#1042#1089#1077' ' +
        #1086#1090#1076#1077#1083#1099#39' end as OtdelName'
      
        '                     , case when @Is_Ext_VidNo = 1 then t.VidNo ' +
        'else -1 end as VidNo'
      
        #9'                 , case when @Is_Ext_VidNo = 1 then (select Vid' +
        'Name from VidTov where VidNo = t.VidNo) else '#39#1042#1089#1077' '#1074#1080#1076#1099#39' end as V' +
        'idName'
      
        #9'                 , case when @Is_Ext_TipNo = 1 then t.TipNo els' +
        'e -1 end as TipNo'
      
        '       '#9'             , case when @Is_Ext_TipNo = 1 then (select ' +
        'TipName from TipTovara where TipNo = t.TipNo) else '#39#1042#1089#1077' '#1090#1080#1087#1099#39' en' +
        'd as TipName'
      
        '                     , case when @Is_Ext_TovarNo = 1 then ds.ART' +
        'ICLE_ID else -1 end as TovarNo'
      
        #9'                 , case when @Is_Ext_TovarNo = 1 then t.NameTov' +
        'arShort else '#39#1042#1089#1077' '#1090#1086#1074#1072#1088#1099#39' end as TovarName'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then nr.Sotru' +
        'dNo else -1 end as SotrudNo'
      
        #9'                 , case when @Is_Ext_SotrudNo = 1 then (select ' +
        'SotrudName from Sotrud where SotrudNo = nr.SotrudNo) else '#39#1042#1089#1077' '#1089 +
        #1086#1090#1088#1091#1076#1085#1080#1082#1080#39' end as SotrudName'
      '                     , sum(ds.qty) as Qty'
      #9'                 , sum(ds.qty*ds.PRICE_ECO) as Summa'
      
        #9'                 , case when @Is_Ext_ColnPrice = 1 then nr.Coln' +
        'Price else -1 end as ColnPrice'
      
        #9'                 , case when @Is_Ext_ColnPrice = 1 then (select' +
        ' ColName from D_Price_type where ColnPrice = nr.ColnPrice) else ' +
        #39#1042#1089#1077' '#1094#1077#1085#1099#39' end as ColName'
      '               from NaklR nr inner join'
      '                    DSPEC ds on ds.NaklNo = nr.NaklNo left join'
      #9'                Tovar t on t.TovarNo = ds.ARTICLE_ID'
      
        '                where ds.DOC_DATE between @DatePlanBeg and @Date' +
        'FactEnd'
      '                  and ds.DOC_TYPE_ID in (10,12)'
      
        '                  and ds.CONTRACTOR_ID not in (select PostNo fro' +
        'm ListMinusPostForPlanningOrder where CheckMinus = 1)'
      '              group by nr.ColnPrice'
      '                      , ds.ARTICLE_ID'
      '             '#9#9'  , nr.OtdelNo'
      #9#9'              , nr.SotrudNo'
      '       '#9#9'          , t.VidNo'
      '      '#9'       '#9'      , t.TipNo'
      #9#9'              , t.NameTovarShort) Prodag'
      '       group by  OtdelNo'
      '               , OtdelName'
      #9'           , VidNo'
      #9'           , VidName'
      '               , TipNo'
      #9'           , TipName'
      #9'           , TovarNo'
      #9'           , TovarName'
      #9'           , SotrudNo'
      #9'           , SotrudName'
      #9#9'       , ColnPrice'
      
        #9'           , ColName) d on d.ColnPrice = p.ColnPrice and d.Otde' +
        'lNo = p.OtdelNo and d.SotrudNo = p.SotrudNo and d.TipNo = p.TipN' +
        'o and d.VidNo = p.VidNo and d.TovarNo = p.TovarNo'
      '*/')
    Left = 320
    Top = 65
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'UserNo'
      end
      item
        DataType = ftUnknown
        Name = 'SPID'
      end
      item
        DataType = ftUnknown
        Name = 'IsSelectedOtdel'
      end
      item
        DataType = ftUnknown
        Name = 'IsSelectedVidTov'
      end
      item
        DataType = ftUnknown
        Name = 'IsSelectedSotrud'
      end
      item
        DataType = ftUnknown
        Name = 'IsFactSumCorrection_SummaProdag'
      end
      item
        DataType = ftUnknown
        Name = 'DatePlanBeg'
      end
      item
        DataType = ftUnknown
        Name = 'DatePlanEnd'
      end
      item
        DataType = ftUnknown
        Name = 'DateFactEnd'
      end
      item
        DataType = ftUnknown
        Name = 'Is_Ext_OtdelNo'
      end
      item
        DataType = ftUnknown
        Name = 'Is_Ext_VidNo'
      end
      item
        DataType = ftUnknown
        Name = 'Is_Ext_TipNo'
      end
      item
        DataType = ftUnknown
        Name = 'Is_Ext_TovarNo'
      end
      item
        DataType = ftUnknown
        Name = 'Is_Ext_SotrudNo'
      end
      item
        DataType = ftUnknown
        Name = 'Is_Ext_ColnPrice'
      end
      item
        DataType = ftUnknown
        Name = 'IsSelectedTipTovara'
      end
      item
        DataType = ftUnknown
        Name = 'IsSelectedTovar'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = 'OtdelName'
      end>
    object quAnalisPlanningOrderOtdelNo: TIntegerField
      DisplayLabel = #1054#1090#1076#1077#1083' '#1087#1088#1086#1076#1072#1078
      FieldName = 'OtdelNo'
      ReadOnly = True
    end
    object quAnalisPlanningOrderOtdelName: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      FieldName = 'OtdelName'
      ReadOnly = True
      Size = 30
    end
    object quAnalisPlanningOrderVidNo: TIntegerField
      FieldName = 'VidNo'
      ReadOnly = True
    end
    object quAnalisPlanningOrderVidName: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'VidName'
      ReadOnly = True
      Size = 30
    end
    object quAnalisPlanningOrderTipNo: TIntegerField
      FieldName = 'TipNo'
      ReadOnly = True
    end
    object quAnalisPlanningOrderTipName: TStringField
      DisplayLabel = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 25
      FieldName = 'TipName'
      ReadOnly = True
      Size = 30
    end
    object quAnalisPlanningOrderTovarNo: TIntegerField
      FieldName = 'TovarNo'
      ReadOnly = True
    end
    object quAnalisPlanningOrderTovarName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 30
      FieldName = 'TovarName'
      ReadOnly = True
      Size = 64
    end
    object quAnalisPlanningOrderSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
      ReadOnly = True
    end
    object quAnalisPlanningOrderSotrudName: TStringField
      DisplayLabel = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      DisplayWidth = 25
      FieldName = 'SotrudName'
      ReadOnly = True
      Size = 30
    end
    object quAnalisPlanningOrderSummaPlanProdag: TFloatField
      DisplayLabel = #1055#1083#1072#1085'.'#1082#1086#1083'-'#1074#1086
      FieldName = 'SummaPlanProdag'
      ReadOnly = True
    end
    object quAnalisPlanningOrderSummaProdag: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103
      FieldName = 'SummaProdag'
      ReadOnly = True
    end
    object quAnalisPlanningOrderPlanPrice: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1083#1072#1085#1080#1088#1091#1077#1084#1072#1103
      FieldName = 'PlanPrice'
      ReadOnly = True
    end
    object quAnalisPlanningOrderColnPrice: TIntegerField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'ColnPrice'
      ReadOnly = True
    end
    object quAnalisPlanningOrderColName: TStringField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 15
      FieldName = 'ColName'
      ReadOnly = True
      Size = 64
    end
    object quAnalisPlanningOrderQty: TFloatField
      DisplayLabel = #1060#1072#1082#1090'. '#1082#1086#1083'. '#1090#1077#1082#1091#1097'.'
      FieldName = 'Qty'
      ReadOnly = True
    end
    object quAnalisPlanningOrderSumma: TFloatField
      DisplayLabel = #1060#1072#1082#1090'. '#1089#1091#1084'. '#1090#1077#1082#1091#1097'.'
      FieldName = 'Summa'
      ReadOnly = True
    end
    object quAnalisPlanningOrderPlanKolFact: TFloatField
      DisplayLabel = #1055#1083#1072#1085' '#1050#1086#1083'. '#1090#1077#1082#1091#1097'.'
      FieldName = 'PlanKolFact'
      ReadOnly = True
    end
    object quAnalisPlanningOrderPlanSumFact: TFloatField
      DisplayLabel = #1055#1083#1072#1085'. '#1089#1091#1084'. '#1090#1077#1082#1091#1097'.'
      FieldName = 'PlanSumFact'
      ReadOnly = True
    end
    object quAnalisPlanningOrderFactKolCorrection: TFloatField
      DisplayLabel = #1060#1072#1082#1090'. '#1082#1086#1083'. '#1082#1086#1088#1088#1077#1082#1094'.'
      FieldName = 'FactKolCorrection'
      ReadOnly = True
    end
    object quAnalisPlanningOrderFactSumCorrection: TFloatField
      DisplayLabel = #1060#1072#1082#1090'. '#1089#1091#1084'. '#1082#1086#1088#1088#1077#1082#1094'.'
      FieldName = 'FactSumCorrection'
      ReadOnly = True
    end
    object quAnalisPlanningOrderSumma_PlanSumFact: TFloatField
      DisplayLabel = #1057#1091#1084'.'#1060#1090'-'#1055#1090
      FieldName = 'Summa_PlanSumFact'
      ReadOnly = True
    end
    object quAnalisPlanningOrderFactSumCorrection_SummaProdag: TFloatField
      DisplayLabel = #1057#1091#1084'.'#1060#1082#1086#1088'.-'#1055
      FieldName = 'FactSumCorrection_SummaProdag'
      ReadOnly = True
    end
    object quAnalisPlanningOrderPriceInInst: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1074#1093'. '#1091#1089#1090'.'
      FieldName = 'PriceInInst'
      ReadOnly = True
    end
    object quAnalisPlanningOrderSummaPlanProdagInInst: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1083#1072#1085'. '#1074#1093'. '#1091#1089#1090'.'
      FieldName = 'SummaPlanProdagInInst'
      KeyFields = 'SummaPlanProdagInInst'
      ReadOnly = True
    end
    object quAnalisPlanningOrderDatePlanBeg: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103
      FieldName = 'DatePlanBeg'
      ReadOnly = True
    end
  end
  object sdExportAnalisInExel: TSaveDialog
    Left = 632
    Top = 496
  end
end
