inherited ReconciliationReceiptPriceInInstForm: TReconciliationReceiptPriceInInstForm
  Left = 484
  Top = 121
  Width = 949
  Height = 428
  Caption = #1057#1074#1077#1088#1082#1072' '#1087#1088#1080#1093#1086#1076#1086#1074' '#1089' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1086#1081' '#1094#1077#1085#1086#1081' '#1074#1093#1086#1076#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 933
    Height = 97
    Align = alTop
    TabOrder = 0
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
      TabOrder = 0
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
    object Flt_Post: TcitDBComboEdit
      Left = 328
      Top = 25
      Width = 250
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
      LLblAlignment = laTop
      LLblCaption = #1042#1099#1073#1086#1088' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072':'
      LLblWidth = 101
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
      Visible = True
      LocateKey = False
      KeyField = 'PostNo'
      Owner = 'ReconciliationReceiptPriceInInstForm'
      EntityCode = 'POST'
      EntityName = 'POST_FIRST'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = True
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 348
    Width = 933
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btRefresh: TButton
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 0
      OnClick = btRefreshClick
    end
    object ExportExel: TButton
      Left = 232
      Top = 8
      Width = 129
      Height = 25
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1069#1082#1089#1077#1083#1100
      TabOrder = 1
      OnClick = ExportExelClick
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 97
    Width = 933
    Height = 251
    Align = alClient
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 931
      Height = 249
      Align = alClient
      DataSource = dsl_PriceInInstForNaklP
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DOC_DATE'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.Value = #1048#1090#1086#1075#1086' :'
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Postname'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'NameTovar'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'qty'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PriceInInst'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PriceFact'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'SummaPriceInInst'
          Footer.DisplayFormat = '00'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'SummaFact'
          Footer.DisplayFormat = '00'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'SummaDelta'
          Footer.DisplayFormat = '00'
          Footer.Font.Charset = DEFAULT_CHARSET
          Footer.Font.Color = clWindowText
          Footer.Font.Height = -11
          Footer.Font.Name = 'MS Sans Serif'
          Footer.Font.Style = [fsBold]
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 65528
  end
  object dsl_PriceInInstForNaklP: TMSDataSource
    DataSet = qul_PriceInInstForNaklP
    Left = 744
    Top = 16
  end
  object qul_PriceInInstForNaklP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '     @IsSelectedPostNo int '
      '   , @DateBeg datetime'
      '   , @DateEnd datetime'
      '   , @UserNo int'
      '   , @SPID int'
      ''
      'set @DateBeg = :DateBeg'
      'set @DateEnd = :DateEnd'
      'set @IsSelectedPostNo = :IsSelectedPostNo'
      'set @UserNo = :UserNo'
      'set @SPID = :SPID'
      ''
      'select  s.DOC_DATE'
      
        '      , (select name from Post where PostNo = s.CONTRACTOR_ACC_I' +
        'D) as Postname'
      
        '      , (select NameTovar from Tovar where TovarNo = s.ARTICLE_I' +
        'D) as NameTovar'
      '      , s.ARTICLE_ID as TovarNo'
      '      , s.qty'
      '      , isnull(lp.PriceInInst,0) as PriceInInst'
      '      , isnull(s.PRICE_ECO,0) as PriceFact'
      '      , s.qty * isnull(lp.PriceInInst,0) as SummaPriceInInst'
      '      , s.qty * isnull(s.PRICE_ECO,0) as SummaFact'
      
        '      , (s.qty * isnull(lp.PriceInInst,0)) - (s.qty * isnull(s.P' +
        'RICE_ECO,0)) as SummaDelta'
      ' from DSPEC s left join'
      
        '      l_PriceInInstForNaklP lp on lp.Dhead_Id = s.DHEAD_ID and l' +
        'p.TovarNo = s.ARTICLE_ID and lp.Dspec_Id = s.id left join'
      '      PriceForVeb pfv on pfv.TovarNo = s.ARTICLE_ID'
      '  where s.DOC_DATE between @DateBeg and @DateEnd'
      
        '    and ((s.CONTRACTOR_ACC_ID in (select cast(Param_Value as int' +
        ')'
      '                                   from e_Session_Params'
      '                                    where Userno = @UserNo'
      
        '                                      and Owner_Name = '#39'Reconcil' +
        'iationReceiptPriceInInstForm'#39
      
        '                                      and Param_Name = '#39'FLT_POST' +
        #39
      
        '                                      and Spid = @SPID)) or @IsS' +
        'electedPostNo = 0)'
      '    and s.Entity_Type = '#39'PRIHOD'#39
      'Order by &Order_by')
    Left = 716
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateBeg'
      end
      item
        DataType = ftUnknown
        Name = 'DateEnd'
      end
      item
        DataType = ftUnknown
        Name = 'IsSelectedPostNo'
      end
      item
        DataType = ftUnknown
        Name = 'UserNo'
      end
      item
        DataType = ftUnknown
        Name = 'SPID'
      end>
    MacroData = <
      item
        Name = 'Order_by'
        Value = 's.DOC_DATE'
      end>
    object qul_PriceInInstForNaklPDOC_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DOC_DATE'
    end
    object qul_PriceInInstForNaklPPostname: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'Postname'
      ReadOnly = True
      Size = 30
    end
    object qul_PriceInInstForNaklPNameTovar: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 30
      FieldName = 'NameTovar'
      ReadOnly = True
      Size = 128
    end
    object qul_PriceInInstForNaklPTovarNo: TSmallintField
      DisplayLabel = #1040#1088#1090#1080#1082#1091#1083
      FieldName = 'TovarNo'
    end
    object qul_PriceInInstForNaklPqty: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'qty'
    end
    object qul_PriceInInstForNaklPPriceInInst: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1074#1093'. '#1091#1089#1090'.'
      FieldName = 'PriceInInst'
    end
    object qul_PriceInInstForNaklPPriceFact: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1074#1093'. '#1092#1072#1082#1090
      FieldName = 'PriceFact'
      ReadOnly = True
    end
    object qul_PriceInInstForNaklPSummaPriceInInst: TFloatField
      DisplayLabel = #1057#1091#1084'_'#1091'.'#1062'.'#1074#1093'.'
      FieldName = 'SummaPriceInInst'
      ReadOnly = True
    end
    object qul_PriceInInstForNaklPSummaFact: TFloatField
      DisplayLabel = #1057#1091#1084'_'#1062#1074#1093'.'
      FieldName = 'SummaFact'
      ReadOnly = True
    end
    object qul_PriceInInstForNaklPSummaDelta: TFloatField
      DisplayLabel = #1044#1077#1083#1100#1090#1072
      FieldName = 'SummaDelta'
      ReadOnly = True
    end
  end
  object sdExportReconciliationReceiptPriceInInst: TSaveDialog
    Left = 872
    Top = 32
  end
end
