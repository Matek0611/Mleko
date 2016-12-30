inherited PlanningOrderForm: TPlanningOrderForm
  Left = 253
  Top = 179
  Width = 1447
  Height = 619
  Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1076#1072#1078
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1431
    Height = 137
    Align = alTop
    TabOrder = 0
    OnExit = Panel1Exit
    object Label1: TLabel
      Left = 8
      Top = 0
      Width = 112
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103':'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 126
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' '#1087#1088#1086#1076#1072#1078':'
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 144
      Height = 13
      Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072' '#1087#1088#1086#1076#1072#1078':'
    end
    object Label4: TLabel
      Left = 202
      Top = 110
      Width = 62
      Height = 13
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082' : '
    end
    object Label5: TLabel
      Left = 8
      Top = 18
      Width = 104
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103':'
    end
    object Label6: TLabel
      Left = 167
      Top = 1
      Width = 32
      Height = 13
      Caption = 'Label6'
    end
    object Label7: TLabel
      Left = 8
      Top = 88
      Width = 82
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' :'
    end
    object EdDateBeg: TcxDateEdit
      Left = 165
      Top = 37
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      Properties.OnChange = EdDateBegPropertiesChange
      TabOrder = 0
      Width = 105
    end
    object EdDateEnd: TcxDateEdit
      Left = 165
      Top = 61
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      Properties.OnChange = EdDateEndPropertiesChange
      TabOrder = 1
      Width = 105
    end
    object DBLookupComboboxEhSotrud: TDBLookupComboboxEh
      Left = 281
      Top = 104
      Width = 248
      Height = 21
      EditButtons = <>
      KeyField = 'SotrudNo'
      ListField = 'SotrudName'
      ListSource = dmDataModule.dsSotrud
      TabOrder = 2
      Visible = True
      OnChange = DBLookupComboboxEhSotrudChange
    end
    object cbIsNotNullOrZerroProd: TCheckBox
      Left = 8
      Top = 117
      Width = 129
      Height = 17
      Caption = #1053#1077' '#1085#1091#1083#1077#1074#1099#1077' '#1087#1088#1086#1076#1072#1078#1080
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = cbIsNotNullOrZerroProdClick
    end
    object Button1: TButton
      Left = 280
      Top = 8
      Width = 249
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1085#1077' '#1091#1095#1080#1090#1099#1074#1072#1077#1084#1099#1093' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
      TabOrder = 4
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 280
      Top = 40
      Width = 249
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082'  '#1074#1080#1076#1086#1074' '#1090#1086#1074#1072#1088#1072
      TabOrder = 5
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 280
      Top = 72
      Width = 249
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1086#1090#1076#1077#1083#1086#1074
      TabOrder = 6
      OnClick = Button3Click
    end
    object EdDatePlanning: TcxDateEdit
      Left = 165
      Top = 13
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      Properties.OnChange = EdDatePlanningPropertiesChange
      TabOrder = 7
      Width = 105
    end
    object bInsPlanProd: TButton
      Left = 552
      Top = 104
      Width = 241
      Height = 25
      Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1088#1086#1075#1085#1086#1079#1080#1088#1091#1077#1084#1099#1081' '#1087#1083#1072#1085' '#1087#1088#1086#1076#1072#1078
      TabOrder = 8
      OnClick = bInsPlanProdClick
    end
    object cbIsIzmPlanProdag: TCheckBox
      Left = 808
      Top = 108
      Width = 153
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1088#1072#1079#1085#1080#1094#1072' '#1087#1088#1086#1076#1072#1078
      TabOrder = 9
      OnClick = cbIsIzmPlanProdagClick
    end
    object Button4: TButton
      Left = 600
      Top = 8
      Width = 169
      Height = 25
      Caption = #1047#1072#1076#1072#1090#1100' '#1087#1088#1080#1088#1086#1089#1090' '#1087#1086' '#1090#1080#1087#1091' '#1090#1086#1074#1072#1088#1072
      TabOrder = 10
      OnClick = Button4Click
    end
    object ftTovar: TcitDBComboEdit
      Left = 603
      Top = 43
      Width = 282
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
      LLblCaption = #1058#1086#1074#1072#1088':'
      LLblWidth = 40
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
      KeyField = 'TovarNo'
      TextField = 'NameTovar'
      Owner = 'PlanningOrderForm'
      EntityCode = 'Tovar'
      multiselect = True
      OnSelectOk = ftTovarSelectOk
      EditStyle = edSelect
      AutoTabControl = False
    end
    object edNamePlanningOrder: TEdit
      Left = 84
      Top = 84
      Width = 187
      Height = 21
      TabOrder = 12
    end
    object fltVidTov: TcitDBComboEdit
      Left = 603
      Top = 67
      Width = 282
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
      TabOrder = 13
      Visible = True
      LocateKey = False
      KeyField = 'VidNo'
      TextField = 'VidName'
      Owner = 'PlanningOrderForm'
      EntityCode = 'VIDTOV'
      multiselect = True
      OnSelectOk = fltVidTovSelectOk
      EditStyle = edSelect
      AutoTabControl = False
    end
    object Button5: TButton
      Left = 771
      Top = 8
      Width = 139
      Height = 25
      Caption = #1047#1072#1076#1072#1090#1100' '#1087#1088#1080#1088#1086#1089#1090' '#1087#1086' '#1090#1086#1074#1072#1088#1091
      TabOrder = 14
      OnClick = Button5Click
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 137
    Width = 1431
    Height = 402
    Align = alClient
    TabOrder = 1
    object DBGridEhAdd: TDBGridEh
      Left = 1
      Top = 1
      Width = 1429
      Height = 400
      Align = alClient
      DataSource = dsPlanningOrder
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
      TitleLines = 3
      OnDrawColumnCell = DBGridEhAddDrawColumnCell
      OnTitleBtnClick = DBGridEhAddTitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'OtdelName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'SotrudName'
          Footers = <>
          ReadOnly = True
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
        end
        item
          EditButtons = <>
          FieldName = 'NameTovarShort'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Qty'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Summa'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'ColName'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PriceNow'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'IncrementRate'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PrognozProdag'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PlanProdag'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'IzmPlanProdag'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'SummaProdag'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
    object DBGridEhEdit: TDBGridEh
      Left = 1
      Top = 1
      Width = 1429
      Height = 400
      Align = alClient
      DataSource = dsPlanningOrderEdit
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      SumList.Active = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 3
      OnDrawColumnCell = DBGridEhEditDrawColumnCell
      OnTitleBtnClick = DBGridEhEditTitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'OtdelName'
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
          FieldName = 'VidName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'NameTovarShort'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 310
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
          FieldName = 'ColName'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'PriceNow'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PrognozProdag'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PlanProdag'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'IzmPlanProdag'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'SummaProdag'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 539
    Width = 1431
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Label8: TLabel
      Left = 10
      Top = 20
      Width = 164
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086#1076#1075#1086#1090#1086#1074#1083#1077#1085#1085#1099#1093' '#1089#1090#1088#1086#1082'  : '
    end
    object Label9: TLabel
      Left = 186
      Top = 20
      Width = 18
      Height = 13
      Caption = '      '
    end
    object Label10: TLabel
      Left = 186
      Top = 8
      Width = 174
      Height = 13
      Caption = '                                                          '
    end
    object Label11: TLabel
      Left = 10
      Top = 7
      Width = 141
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1074#1099#1074#1077#1076#1077#1085#1085#1099#1093' '#1089#1090#1088#1086#1082' : '
    end
    object bbOK: TBitBtn
      Left = 362
      Top = 10
      Width = 77
      Height = 25
      TabOrder = 0
      OnClick = bbOKClick
      Kind = bkOK
    end
    object bbcancel: TBitBtn
      Left = 462
      Top = 10
      Width = 77
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = bbcancelClick
      Kind = bkCancel
    end
  end
  inherited ActionList: TActionList
    Left = 1168
  end
  object dsPlanningOrder: TMSDataSource
    DataSet = quPlanningOrder
    Left = 791
    Top = 348
  end
  object quPlanningOrder: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '    @Id_Now bigint'
      '  , @Cnt int'
      ''
      'select @Id_Now = isnull(max(id),0)+1 from PlanningOrderSpec'
      ''
      
        'select @Cnt = COUNT(*) from PlanningOrderSpec where PlanningOrde' +
        'rHeadId = :PlanningOrderHeadId and TovarNo = :TovarNo and ColNam' +
        'e = :ColName and SotrudNo = :SotrudNo'
      ''
      'if @cnt = 0'
      'INSERT INTO PlanningOrderSpec'
      
        '  (Id, PlanningOrderHeadId, TovarNo, OtdelNo, TovarName, Qty, Su' +
        'mma , ColName, PriceNow, PlanProdag, SummaProdag, SotrudNo)'
      'VALUES'
      
        '  (@Id_Now, :PlanningOrderHeadId, :TovarNo, :OtdelNo, :NameTovar' +
        'Short, :Qty, :Summa , :ColName, :PriceNow, :PlanProdag, :SummaPr' +
        'odag, :SotrudNo)'
      ''
      'if @cnt = 1'
      ' update PlanningOrderSpec'
      '  set  PlanProdag = :PlanProdag'
      '     , SummaProdag = :PlanProdag * :PriceNow'
      
        ' where PlanningOrderHeadId = :PlanningOrderHeadId and TovarNo = ' +
        ':TovarNo and ColName =  :ColName and SotrudNo = :SotrudNo')
    SQLUpdate.Strings = (
      'declare'
      '    @Id_Now bigint'
      '  , @Cnt int'
      ''
      'select @Id_Now = isnull(max(id),0)+1 from PlanningOrderSpec'
      ''
      
        'select @Cnt = COUNT(*) from PlanningOrderSpec where PlanningOrde' +
        'rHeadId = :PlanningOrderHeadId and TovarNo = :TovarNo and ColNam' +
        'e = :ColName and SotrudNo = :SotrudNo'
      ''
      'if @cnt = 0'
      'INSERT INTO PlanningOrderSpec'
      
        '  (Id, PlanningOrderHeadId, TovarNo, OtdelNo, TovarName, Qty, Su' +
        'mma , ColName, PriceNow, PlanProdag, SummaProdag, SotrudNo)'
      'VALUES'
      
        '  (@Id_Now, :PlanningOrderHeadId, :TovarNo, :OtdelNo, :NameTovar' +
        'Short, :Qty, :Summa , :ColName, :PriceNow, :PlanProdag, :SummaPr' +
        'odag, :SotrudNo)'
      ''
      'if @cnt = 1'
      ' update PlanningOrderSpec'
      '  set  PlanProdag = :PlanProdag'
      '     , SummaProdag = :PlanProdag * :PriceNow'
      
        ' where PlanningOrderHeadId = :PlanningOrderHeadId and TovarNo = ' +
        ':TovarNo and ColName =  :ColName and SotrudNo = :SotrudNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '     @ColnPrice int'
      '   , @OtdelNo int'
      '   , @TovarNo int'
      '   , @SotrudNo int'
      '   , @Qty decimal(18,3)'
      '   , @Summa decimal(18,2)'
      '   , @PlanningOrderHeadId int'
      '   , @IsNotNullOrZerroProd int'
      '   , @IzmPlanProdag int'
      '   , @Cnt int'
      '   , @DayInMonth int'
      '   , @DateBeg datetime'
      '   , @DateEnd datetime'
      '   , @UserNo int'
      ''
      ''
      'set @SotrudNo = :SotrudNo'
      'set @DayInMonth = :DayInMonth'
      'set @DateBeg = :DateBeg'
      'set @DateEnd = :DateEnd'
      'set @IsNotNullOrZerroProd = :IsNotNullOrZerroProd'
      'set @PlanningOrderHeadId = :PlanningOrderHeadId'
      'set @IzmPlanProdag = :IzmPlanProdag'
      'set @UserNo = :UserNo'
      ''
      'if @IsNotNullOrZerroProd is null set @IsNotNullOrZerroProd = 0'
      'if @IzmPlanProdag is null set @IzmPlanProdag = 0'
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
      'CREATE TABLE #PlanningOrderProdagTemp'
      '('
      #9'[ColNPrice] [int] NULL,'
      #9'[SotrudOtdel] [int] NULL,'
      #9'[TovarNo] [int] NULL,'
      #9'[SotrudNo] [int] NULL,'
      #9'[Qty] [decimal](18, 3) NULL,'
      #9'[Summa] [decimal](18, 2) NULL,'
      #9'[PostNo] [int] NULL'
      ')'
      ''
      '--truncate table PlanningOrderTovarTemp'
      '--truncate table PlanningOrderProdagTemp'
      ''
      
        'Insert into #PlanningOrderTovarTemp (TovarNo, NameTovar, VidNo, ' +
        'TipNo, ColNPrice, ColName, Visible, SotrudNo, SotrudName, Sotrud' +
        'Otdel, PriceNow)'
      '(select  t.TovarNo'
      #9'         , t.NameTovarShort'
      #9#9' , t.VidNo'
      '                 , t.TipNo'
      #9'         , dpt.ColNPrice'
      #9'         , dpt.ColName'
      '             , t.Visible'
      #9#9#9' , s.SotrudNo'
      #9#9#9' , s.SotrudName'
      #9#9#9' , s.SotrudOtdel'
      
        #9#9#9' , convert(decimal(18,2),round(isnull(case when dpt.ColnPrice' +
        ' = 1 then Isnull(Price,0)            '
      
        '                                                       when dpt.' +
        'ColnPrice = 2 then Isnull(Price1,0)           '
      
        '                                                       when dpt.' +
        'ColnPrice = 3 then Isnull(Price2,0)           '
      
        '                                                       when dpt.' +
        'ColnPrice = 4 then Isnull(Price3,0)           '
      
        '                                                       when dpt.' +
        'ColnPrice = 5 then Isnull(Price4,0)           '
      
        '                                                       when dpt.' +
        'ColnPrice = 6 then Isnull(Price5,0)           '
      
        '                                                       when dpt.' +
        'ColnPrice = 7 then Isnull(Price6,0)           '
      
        '                                                       when dpt.' +
        'ColnPrice = 8 then Isnull(Price7,0)           '
      
        '                                                       when dpt.' +
        'ColnPrice = 10 then Isnull(Price8,0)          '
      
        '                                                       when dpt.' +
        'ColnPrice = 11 then Isnull(Price9,0)          '
      
        '                                                       when dpt.' +
        'ColnPrice = 12 then Isnull(Price10,0)         '
      
        '                                                       when dpt.' +
        'ColnPrice = 13 then Isnull(Price13,0)         '
      
        '                                                       when dpt.' +
        'ColnPrice = 14 then Isnull(Price14,0)         '
      
        '                                                       when dpt.' +
        'ColnPrice = 15 then Isnull(Price15,0)         '
      
        '                                                       when dpt.' +
        'ColnPrice = 9 then Isnull(AvgPriceIn,0)       '
      
        '                                                       when dpt.' +
        'ColnPrice = 17 then Isnull(pfv.PriceVeb, 0)   '
      
        '                                                       when dpt.' +
        'ColnPrice = 18 then Isnull(pfv.PriceInInst, 0)'
      
        '                                                  end,0),2)) as ' +
        'PriceNow'
      '        from Tovar t left join'
      #9#9'     ostatok o on o.TovarNo = t.TovarNo left join'
      #9'         PriceForVeb pfv on pfv.TovarNo = t.TovarNo ,'
      '             D_Price_type dpt,'
      #9#9#9' Sotrud s'
      
        #9#9' where t.VidNo in (select VidNo from ListMinusVidTovForPlannin' +
        'gOrder where CheckMinus = 1 and UserNo = @UserNo)'
      '                   and (t.OtdelNo <> 3)'
      
        #9#9'   and s.SotrudOtdel in (select OtdelNo from ListVidOtdelForPl' +
        'anningOrder where CheckMinus = 1 and UserNo = @UserNo)'
      '                   and s.SotrudNo = isnull(@SotrudNo,s.SotrudNo)'
      #9#9'   and s.Visible = 0) '
      ''
      ''
      
        'insert into #PlanningOrderProdagTemp (ColnPrice, SotrudOtdel, To' +
        'varNo, SotrudNo, Qty, Summa)'
      '(select  nr.ColnPrice'
      '       , nr.OtdelNo'
      '       , ds.ARTICLE_ID as TovarNo'
      '       , nr.SotrudNo'
      #9'   , sum(ds.qty) as Qty'
      #9'   , sum(ds.qty*ds.PRICE_ECO) as Summa'
      '  from NaklR nr inner join'
      '       DSPEC ds on ds.NaklNo = nr.NaklNo'
      '   where ds.DOC_DATE between @DateBeg and @DateEnd'
      '     and ds.DOC_TYPE_ID in (10,12)'
      
        '     and ds.Article_Id not in (select TovarNo from Tovar where O' +
        'tdelNo = 3)'
      
        '     and ds.CONTRACTOR_ID not in (select PostNo from ListMinusPo' +
        'stForPlanningOrder where CheckMinus = 1)'
      
        '     and nr.OtdelNo in (select OtdelNo from ListVidOtdelForPlann' +
        'ingOrder where CheckMinus = 1 and UserNo = @UserNo)'
      ' group by nr.ColnPrice, ds.ARTICLE_ID, nr.OtdelNo, nr.SotrudNo)'
      ''
      'select @Cnt = count(*)'
      ' from #PlanningOrderTovarTemp t left join'
      
        '      #PlanningOrderProdagTemp p on p.ColnPrice = t.ColnPrice an' +
        'd p.SotrudOtdel = t.SotrudOtdel and p.TovarNo = t.TovarNo and p.' +
        'SotrudNo = t.SotrudNo left join'
      
        '      PlanningOrderSpec pos on pos.TovarNo = t.TovarNo and pos.C' +
        'olName = t.ColName and pos.OtdelNo = t.SotrudOtdel and pos.Sotru' +
        'dNo = t.SotrudNo and pos.PlanningOrderHeadId = @PlanningOrderHea' +
        'dId'
      ''
      
        ' select  (select OtdelName from VidOtdel where OtdelNo = t.Sotru' +
        'dOtdel) OtdelName'
      '       , t.SotrudOtdel as OtdelNo'
      #9'   , t.TovarNo'
      
        #9'   , (select VidName from VidTov where VidNo = t.VidNo) as VidN' +
        'ame'
      
        '           , (select TipName from TipTovara where TipNo = t.TipN' +
        'o) as TipName'
      #9'   , t.SotrudNo'
      #9'   , t.SotrudName'
      #9'   , t.NameTovar as NameTovarShort'
      #9'   , p.Qty'
      #9'   , p.Summa'
      #9'   , t.ColName'
      #9'   , t.PriceNow'
      #9'   , isnull(pos.PlanProdag,0) as PlanProdag'
      
        '       , isnull(pos.PlanProdag,0) * isnull(t.PriceNow,0)  as Sum' +
        'maProdag'
      '       , t.Visible'
      '       , @PlanningOrderHeadId as PlanningOrderHeadId'
      '       , @Cnt as Cnt'
      '/*'
      
        '       , convert(int,round(@DayInMonth*(p.qty/(datediff(day,@Dat' +
        'eBeg,@DateEnd)+1)),0))*(100+isnull((select IncrementRate from Li' +
        'stTipNoIncrementRateForPlanProdag where TipNo = t.TipNo and User' +
        'No = @UserNo),0))/100 as PrognozProdag'
      
        '       , convert(int,round(@DayInMonth*(p.qty/(datediff(day,@Dat' +
        'eBeg,@DateEnd)+1)),0))*(100+isnull((select IncrementRate from Li' +
        'stTipNoIncrementRateForPlanProdag where TipNo = t.TipNo and User' +
        'No = @UserNo),0))/100 - isnull(pos.PlanProdag,0) as IzmPlanProda' +
        'g'
      
        '       , isnull((select IncrementRate from ListTipNoIncrementRat' +
        'eForPlanProdag where TipNo = t.TipNo and UserNo = @UserNo),0) as' +
        ' IncrementRate'
      '*/'
      
        '       , convert(int,round(@DayInMonth*(p.qty/(datediff(day,@Dat' +
        'eBeg,@DateEnd)+1)),0))*(100+isnull(coalesce((select IncrementRat' +
        'e '
      
        '                                                                ' +
        '                                              from ListTovarNoFo' +
        'rPlanningOrder'
      #9'               '#9#9#9#9#9#9#9#9#9#9#9'       where TovarNo = t.TovarNo'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9' and CheckPlus = 1'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9' and UserNo = @UserNo),'
      #9#9#9#9#9#9#9#9#9#9#9#9#9'     (select IncrementRate '
      #9#9#9#9#9#9#9#9#9#9#9#9#9'       from ListTipNoIncrementRateForPlanProdag '
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'where TipNo = t.TipNo '
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9'  and UserNo = @UserNo)),0))/100 as PrognozProdag'
      
        '       , convert(int,round(@DayInMonth*(p.qty/(datediff(day,@Dat' +
        'eBeg,@DateEnd)+1)),0))*(100+isnull(coalesce((select IncrementRat' +
        'e '
      
        #9'                                                               ' +
        '                                       from ListTovarNoForPlanni' +
        'ngOrder'
      #9#9#9#9#9#9#9#9#9#9#9#9#9'       where TovarNo = t.TovarNo'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9' and CheckPlus = 1'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9' and UserNo = @UserNo),'
      #9#9#9#9#9#9#9#9#9#9#9#9#9'    (select IncrementRate '
      #9#9#9#9#9#9#9#9#9#9#9#9#9'      from ListTipNoIncrementRateForPlanProdag '
      #9#9#9#9#9#9#9#9#9#9#9#9#9'       where TipNo = t.TipNo '
      
        #9#9#9#9#9#9'  '#9#9#9#9#9#9#9'         and UserNo = @UserNo)),0))/100 - isnull(' +
        'pos.PlanProdag,0) as IzmPlanProdag'
      '       , isnull(coalesce((select IncrementRate '
      '                           from ListTovarNoForPlanningOrder'
      #9'   '#9#9'    where TovarNo = t.TovarNo'
      #9#9#9'      and CheckPlus = 1'
      #9#9#9'      and UserNo = @UserNo),'
      #9#9#9' (select IncrementRate '
      #9#9#9'   from ListTipNoIncrementRateForPlanProdag '
      #9#9#9'    where TipNo = t.TipNo '
      #9#9#9'      and UserNo = @UserNo)),0) as IncrementRate'
      
        '       , rtrim(convert(varchar(5),t.TovarNo))+'#39'-'#39'+rtrim(convert(' +
        'varchar(5),t.SotrudNo))+'#39'-'#39'+t.ColName as pkey'
      '  from #PlanningOrderTovarTemp t left join'
      
        '       #PlanningOrderProdagTemp p on p.ColnPrice = t.ColnPrice a' +
        'nd p.SotrudOtdel = t.SotrudOtdel and p.TovarNo = t.TovarNo and p' +
        '.SotrudNo = t.SotrudNo left join'
      
        '       PlanningOrderSpec pos on pos.TovarNo = t.TovarNo and pos.' +
        'ColName = t.ColName and pos.OtdelNo = t.SotrudOtdel and pos.Sotr' +
        'udNo = t.SotrudNo and pos.PlanningOrderHeadId = @PlanningOrderHe' +
        'adId'
      '   where (isnull(p.Qty,0) <> 0 or @IsNotNullOrZerroProd = 0)'
      
        '     and (((convert(int,round(@DayInMonth*(p.qty/(datediff(day,@' +
        'DateBeg,@DateEnd)+1)),0))*(100+isnull((select IncrementRate from' +
        ' ListTipNoIncrementRateForPlanProdag where TipNo = t.TipNo and U' +
        'serNo = @UserNo),0))/100 - isnull(pos.PlanProdag,0)) <> 0 and t.' +
        'Visible = 0) or @IzmPlanProdag = 0)'
      'order by &_order'
      ''
      '/*'
      'declare'
      '     @DateBeg datetime'
      '    ,@DateEnd datetime'
      '    ,@VidTovarNo int'
      '    ,@IsNotNullOrZerroProd int'
      '    ,@PlanningOrderHeadId int'
      ''
      'set @DateBeg = :DateBeg'
      'set @DateEnd = :DateEnd'
      'set @VidTovarNo = :VidTovarNo'
      'set @IsNotNullOrZerroProd = :IsNotNullOrZerroProd'
      'set @PlanningOrderHeadId = :PlanningOrderHeadId'
      ''
      'if @IsNotNullOrZerroProd is null set @IsNotNullOrZerroProd = 0'
      ''
      
        'select  (select OtdelName from VidOtdel where OtdelNo = ds.Otdel' +
        'No) OtdelName'
      '      , ds.OtdelNo'
      '      , t.TovarNo'
      
        '      , (select VidName from VidTov where VidNo = t.VidNo) as Vi' +
        'dName'
      '      , ds.SotrudNo'
      '      , ds.SotrudName'
      '      , t.NameTovarShort'
      #9'  , ds.Qty'
      #9'  , convert(decimal(18,2),round(ds.Summa,2)) as Summa'
      #9'  , t.ColName'
      
        '      , convert(decimal(18,2),round(isnull(case when t.ColnPrice' +
        ' = 1 then Isnull(Price,0)            '
      
        '                                               when t.ColnPrice ' +
        '= 2 then Isnull(Price1,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 3 then Isnull(Price2,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 4 then Isnull(Price3,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 5 then Isnull(Price4,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 6 then Isnull(Price5,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 7 then Isnull(Price6,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 8 then Isnull(Price7,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 10 then Isnull(Price8,0)          '
      
        '                                               when t.ColnPrice ' +
        '= 11 then Isnull(Price9,0)          '
      
        '                                               when t.ColnPrice ' +
        '= 12 then Isnull(Price10,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 13 then Isnull(Price13,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 14 then Isnull(Price14,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 15 then Isnull(Price15,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 9 then Isnull(AvgPriceIn,0)       '
      
        '                                               when t.ColnPrice ' +
        '= 17 then Isnull(pfv.PriceVeb, 0)   '
      
        '                                               when t.ColnPrice ' +
        '= 18 then Isnull(pfv.PriceInInst, 0)'
      '                                          end,0),2)) as PriceNow'
      '     , null as PlanProdag'
      '     , null as SummaProdag'
      '     , t.Visible'
      
        ', isnull(pos.PlanProdag,0) as PlanProdag , isnull(pos.PlanProdag' +
        ',0) * PriceNow as SummaProdag'
      '      , @PlanningOrderHeadId as PlanningOrderHeadId'
      ' from (select  t.TovarNo'
      '             , t.NameTovar'
      #9'         , t.NameTovarShort'
      #9#9#9' , t.VidNo'
      #9'         , dpt.ColNPrice'
      #9'         , dpt.ColName'
      '                 , t.Visible'
      '        from Tovar t,'
      '             D_Price_type dpt'
      
        #9#9' where t.VidNo in (select VidNo from ListMinusVidTovForPlannin' +
        'gOrder where CheckMinus = 1)) t left join'
      '      (select  nr.ColnPrice'
      '             , nr.OtdelNo'
      '             , ds.ARTICLE_ID as TovarNo'
      '             , nr.SotrudNo'
      
        '             , (select SotrudName from Sotrud where SotrudNo = n' +
        'r.SotrudNo) as SotrudName'
      ''
      #9'         , sum(ds.qty) as Qty'
      #9'         , sum(ds.qty*ds.PRICE_ECO) as Summa'
      '        from NaklR nr inner join'
      '             DSPEC ds on ds.NaklNo = nr.NaklNo'
      '         where ds.DOC_DATE between @DateBeg and @DateEnd'
      '           and ds.DOC_TYPE_ID = 12'
      
        '           and ds.CONTRACTOR_ID not in (select PostNo from ListM' +
        'inusPostForPlanningOrder where CheckMinus = 1)'
      
        '           and nr.OtdelNo in (select OtdelNo from ListVidOtdelFo' +
        'rPlanningOrder where CheckMinus = 1)'
      
        '       group by nr.ColnPrice, ds.ARTICLE_ID, nr.OtdelNo, nr.Sotr' +
        'udNo) ds on ds.TovarNo = t.TovarNo and ds.ColNPrice = t.ColNPric' +
        'e left join'
      #9'  ostatok o on o.TovarNo = t.TovarNo left join'
      #9'  PriceForVeb pfv on pfv.TovarNo = t.TovarNo'
      
        'left join PlanningOrderSpec pos on pos.TovarNo = t.TovarNo and p' +
        'os.PlanningOrderHeadId = @PlanningOrderHeadId and pos.ColName = ' +
        't.ColName and pos.OtdelNo = ds.OtdelNo'
      '  where (isnull(ds.Qty,0) > 0 or @IsNotNullOrZerroProd = 0)'
      '    '
      ''
      'order by t.NameTovar'
      '*/')
    FetchRows = 10000
    BeforePost = quPlanningOrderBeforePost
    AfterPost = quPlanningOrderAfterPost
    Left = 763
    Top = 348
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SotrudNo'
      end
      item
        DataType = ftUnknown
        Name = 'DayInMonth'
      end
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
        Name = 'IsNotNullOrZerroProd'
      end
      item
        DataType = ftUnknown
        Name = 'PlanningOrderHeadId'
      end
      item
        DataType = ftUnknown
        Name = 'IzmPlanProdag'
      end
      item
        DataType = ftUnknown
        Name = 'UserNo'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = 'NameTovarShort'
      end>
    object quPlanningOrderOtdelName: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      DisplayWidth = 20
      FieldName = 'OtdelName'
      ReadOnly = True
      Size = 30
    end
    object quPlanningOrderOtdelNo: TIntegerField
      FieldName = 'OtdelNo'
    end
    object quPlanningOrderTovarNo: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'TovarNo'
    end
    object quPlanningOrderVidName: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'VidName'
      ReadOnly = True
      Size = 30
    end
    object quPlanningOrderSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
    end
    object quPlanningOrderSotrudName: TStringField
      DisplayLabel = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      FieldName = 'SotrudName'
      Size = 30
    end
    object quPlanningOrderNameTovarShort: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 30
      FieldName = 'NameTovarShort'
      Size = 64
    end
    object quPlanningOrderQty: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1078' '#1079#1072' '#1087#1077#1088#1086#1076
      FieldName = 'Qty'
    end
    object quPlanningOrderSumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078
      FieldName = 'Summa'
    end
    object quPlanningOrderColName: TStringField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 15
      FieldName = 'ColName'
      Size = 64
    end
    object quPlanningOrderPriceNow: TFloatField
      DisplayLabel = #1058#1077#1082#1091#1097#1072#1103' '#1094#1077#1085#1072
      FieldName = 'PriceNow'
    end
    object quPlanningOrderVisible: TBooleanField
      FieldName = 'Visible'
    end
    object quPlanningOrderPlanningOrderHeadId: TIntegerField
      FieldName = 'PlanningOrderHeadId'
      ReadOnly = True
    end
    object quPlanningOrderPlanProdag: TFloatField
      DisplayLabel = #1055#1083#1072#1085' '#1087#1088#1086#1076#1072#1078
      FieldName = 'PlanProdag'
    end
    object quPlanningOrderSummaProdag: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078
      FieldName = 'SummaProdag'
      ReadOnly = True
    end
    object quPlanningOrderCnt: TIntegerField
      FieldName = 'Cnt'
      ReadOnly = True
    end
    object quPlanningOrderPrognozProdag: TIntegerField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079' '#1087#1088#1086#1076#1072#1078
      FieldName = 'PrognozProdag'
      ReadOnly = True
    end
    object quPlanningOrderpkey: TStringField
      FieldName = 'pkey'
      ReadOnly = True
      Size = 76
    end
    object quPlanningOrderIzmPlanProdag: TFloatField
      DisplayLabel = #1056#1072#1079#1085#1080#1094#1072' '#1087#1088#1086#1076#1072#1078' '
      FieldName = 'IzmPlanProdag'
      ReadOnly = True
    end
    object quPlanningOrderIncrementRate: TIntegerField
      DisplayLabel = #1055#1088#1080#1088#1086#1089#1090' %'
      FieldName = 'IncrementRate'
      ReadOnly = True
    end
    object quPlanningOrderTipName: TStringField
      DisplayLabel = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072
      FieldName = 'TipName'
      ReadOnly = True
      Size = 30
    end
  end
  object spAddPlanningOrderSpec: TMSStoredProc
    StoredProcName = 'pr_add_PlanningOrderSpec'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL pr_add_PlanningOrderSpec (:PlanningOrderHe' +
        'adId, :TovarNo, :OtdelNo, :TovarName, :Qty, :Summa, :ColName, :P' +
        'riceNow, :PlanProdag, :SummaProdag, :SotrudNo, :PrognozProdag, :' +
        'id)}')
    Left = 840
    Top = 345
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = -6
      end
      item
        DataType = ftInteger
        Name = 'PlanningOrderHeadId'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OtdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TovarName'
        ParamType = ptInput
        Size = 64
      end
      item
        DataType = ftFloat
        Name = 'Qty'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Summa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ColName'
        ParamType = ptInput
        Size = 64
      end
      item
        DataType = ftFloat
        Name = 'PriceNow'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PlanProdag'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'SummaProdag'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'SotrudNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PrognozProdag'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInputOutput
        Value = 73013
      end>
  end
  object quPlanningOrderEdit: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '    @Id_Now bigint'
      '  , @Cnt int'
      ''
      'select @Id_Now = isnull(max(id),0)+1 from PlanningOrderSpec'
      ''
      
        'select @Cnt = COUNT(*) from PlanningOrderSpec where PlanningOrde' +
        'rHeadId = :PlanningOrderHeadId and TovarNo = :TovarNo and ColNam' +
        'e = :ColName and SotrudNo = :SotrudNo'
      ''
      'if @cnt = 0'
      'INSERT INTO PlanningOrderSpec'
      
        '  (Id, PlanningOrderHeadId, TovarNo, OtdelNo, TovarName, Qty, Su' +
        'mma , ColName, PriceNow, PlanProdag, SummaProdag, SotrudNo)'
      'VALUES'
      
        '  (@Id_Now, :PlanningOrderHeadId, :TovarNo, :OtdelNo, :NameTovar' +
        'Short, :Qty, :Summa , :ColName, :PriceNow, :PlanProdag, :SummaPr' +
        'odag, :SotrudNo)'
      ''
      'if @cnt = 1'
      ' update PlanningOrderSpec'
      '  set  PlanProdag = :PlanProdag'
      '     , SummaProdag = :PlanProdag * :PriceNow'
      
        ' where PlanningOrderHeadId = :PlanningOrderHeadId and TovarNo = ' +
        ':TovarNo and ColName =  :ColName and SotrudNo = :SotrudNo')
    SQLUpdate.Strings = (
      'declare'
      '    @Id_Now bigint'
      '  , @Cnt int'
      ''
      'select @Id_Now = isnull(max(id),0)+1 from PlanningOrderSpec'
      ''
      
        'select @Cnt = COUNT(*) from PlanningOrderSpec where PlanningOrde' +
        'rHeadId = :PlanningOrderHeadId and TovarNo = :TovarNo and ColNam' +
        'e = :ColName and SotrudNo = :SotrudNo'
      ''
      'if @cnt = 0'
      'INSERT INTO PlanningOrderSpec'
      
        '  (Id, PlanningOrderHeadId, TovarNo, OtdelNo, TovarName, Qty, Su' +
        'mma , ColName, PriceNow, PlanProdag, SummaProdag, SotrudNo)'
      'VALUES'
      
        '  (@Id_Now, :PlanningOrderHeadId, :TovarNo, :OtdelNo, :NameTovar' +
        'Short, :Qty, :Summa , :ColName, :PriceNow, :PlanProdag, :SummaPr' +
        'odag, :SotrudNo)'
      ''
      'if @cnt = 1'
      ' update PlanningOrderSpec'
      '  set  PlanProdag = :PlanProdag'
      '     , SummaProdag = :PlanProdag * :PriceNow'
      
        ' where PlanningOrderHeadId = :PlanningOrderHeadId and TovarNo = ' +
        ':TovarNo and ColName =  :ColName and SotrudNo = :SotrudNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '     @PlanningOrderHeadId int'
      '   , @IsNotNullOrZerroProd int'
      '   , @IzmPlanProdag int'
      '   , @SotrudNo int'
      '   , @IsSelectedTovar int'
      '   , @IsSelectedVid int'
      '   , @UserNo int'
      '   , @SPID int'
      ''
      'set @SotrudNo = :SotrudNo'
      'set @PlanningOrderHeadId = :PlanningOrderHeadId'
      'set @IsNotNullOrZerroProd = :IsNotNullOrZerroProd'
      'set @IzmPlanProdag = :IzmPlanProdag'
      'set @IsSelectedTovar = :IsSelectedTovar'
      'set @IsSelectedVid = :IsSelectedVid'
      'set @UserNo = :UserNo'
      'set @SPID = :SPID'
      ''
      'if @IsNotNullOrZerroProd is null set @IsNotNullOrZerroProd = 0'
      'if @IzmPlanProdag is null set @IzmPlanProdag = 0'
      'if @IsSelectedTovar is null set @IsSelectedTovar = 0'
      'if @IsSelectedVid is null set @IsSelectedVid = 0'
      ''
      
        'select  (select OtdelName from VidOtdel where OtdelNo = pos.Otde' +
        'lNo) OtdelName'
      '      , pos.OtdelNo'
      '      , pos.TovarNo'
      #9'  , (select vt.VidName'
      '          from Tovar t inner join'
      '               VidTov vt on vt.VidNo = t.VidNo'
      '           where t.TovarNo = pos.TovarNo) as VidName'
      '      , pos.TovarName as NameTovarShort'
      #9'  , pos.Qty'
      #9'  , convert(decimal(18,2),round(pos.Summa,2)) as Summa'
      #9'  , pos.ColName'
      #9'  , pos.PriceNow'
      '      , isnull(pos.PlanProdag,0) as PlanProdag '
      '      , isnull(pos.PlanProdag,0) * PriceNow as SummaProdag'
      
        '      , (select SotrudName from Sotrud where SotrudNo = pos.Sotr' +
        'udNo) as SotrudName'
      '      , pos.SotrudNo'
      '      , @PlanningOrderHeadId as PlanningOrderHeadId'
      '      , pos.id'
      
        '      , (select visible from Tovar where TovarNo = pos.TovarNo) ' +
        'as Visible'
      '      , pos.PrognozProdag'
      
        '      , pos.PrognozProdag - isnull(pos.PlanProdag,0) as IzmPlanP' +
        'rodag'
      ' from PlanningOrderSpec pos left join'
      '      Tovar t on t.TovarNo = pos.TovarNo '
      '  where PlanningOrderHeadId = @PlanningOrderHeadId'
      '    and pos.SotrudNo = isnull(@SotrudNo,pos.SotrudNo)'
      '    and (isnull(pos.Qty,0) <> 0 or @IsNotNullOrZerroProd = 0)'
      
        '    and ((pos.PrognozProdag - isnull(pos.PlanProdag,0)) <> 0 or ' +
        '@IzmPlanProdag = 0)'
      '    and (t.OtdelNo <> 3)'
      '    and ((pos.TovarNo in (select cast(Param_Value as int)'
      '                           from e_Session_Params'
      '                            where Userno = @UserNo'
      
        '                              and Owner_Name = '#39'PlanningOrderFor' +
        'm'#39
      '                              and Param_Name = '#39'FTTOVAR'#39
      
        '                              and Spid = @SPID)) or @IsSelectedT' +
        'ovar = 0)'
      '    and ((t.VidNo in (select cast(Param_Value as int)'
      '                       from e_Session_Params'
      '                        where Userno = @UserNo'
      '                          and Owner_Name = '#39'PlanningOrderForm'#39
      '                          and Param_Name = '#39'FLTVIDTOV'#39
      
        '                          and Spid = @SPID)) or @IsSelectedVid =' +
        ' 0)'
      ''
      'order by &_order'
      ''
      '/*'
      'declare'
      '     @PlanningOrderHeadId int'
      '   , @IsNotNullOrZerroProd int'
      ''
      'set @PlanningOrderHeadId = :PlanningOrderHeadId'
      'set @IsNotNullOrZerroProd = :IsNotNullOrZerroProd'
      ''
      'if @IsNotNullOrZerroProd is null set @IsNotNullOrZerroProd = 0'
      ''
      
        'select  (select OtdelName from VidOtdel where OtdelNo = pos.Otde' +
        'lNo) OtdelName'
      '      , pos.OtdelNo'
      '      , t.TovarNo'
      
        '      , (select VidName from VidTov where VidNo = t.VidNo) as Vi' +
        'dName'
      '      , t.NameTovarShort'
      #9'  , pos.Qty'
      #9'  , convert(decimal(18,2),round(pos.Summa,2)) as Summa'
      #9'  , t.ColName'
      
        '      , convert(decimal(18,2),round(isnull(case when t.ColnPrice' +
        ' = 1 then Isnull(Price,0)            '
      
        '                                               when t.ColnPrice ' +
        '= 2 then Isnull(Price1,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 3 then Isnull(Price2,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 4 then Isnull(Price3,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 5 then Isnull(Price4,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 6 then Isnull(Price5,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 7 then Isnull(Price6,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 8 then Isnull(Price7,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 10 then Isnull(Price8,0)          '
      
        '                                               when t.ColnPrice ' +
        '= 11 then Isnull(Price9,0)          '
      
        '                                               when t.ColnPrice ' +
        '= 12 then Isnull(Price10,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 13 then Isnull(Price13,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 14 then Isnull(Price14,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 15 then Isnull(Price15,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 9 then Isnull(AvgPriceIn,0)       '
      
        '                                               when t.ColnPrice ' +
        '= 17 then Isnull(pfv.PriceVeb, 0)   '
      
        '                                               when t.ColnPrice ' +
        '= 18 then Isnull(pfv.PriceInInst, 0)'
      '                                          end,0),2)) as PriceNow'
      ''
      '     , isnull(pos.PlanProdag,0) as PlanProdag '
      
        '     , isnull(pos.PlanProdag,0) * isnull(pos.PriceNow,0) as Summ' +
        'aProdag'
      '     , @PlanningOrderHeadId as PlanningOrderHeadId'
      ' from (select  t.TovarNo'
      '             , t.NameTovar'
      #9'         , t.NameTovarShort'
      #9#9#9' , t.VidNo'
      #9'         , dpt.ColNPrice'
      #9'         , dpt.ColName'
      '                 , t.Visible'
      '        from Tovar t,'
      '             D_Price_type dpt) t left join'
      #9'  ostatok o on o.TovarNo = t.TovarNo left join'
      #9'  PriceForVeb pfv on pfv.TovarNo = t.TovarNo inner join '
      
        '      PlanningOrderSpec pos on pos.TovarNo = t.TovarNo and pos.P' +
        'lanningOrderHeadId = @PlanningOrderHeadId and pos.ColName = t.Co' +
        'lName '
      ''
      '  where (isnull(pos.Qty,0) > 0 or @IsNotNullOrZerroProd = 0)'
      ''
      'order by t.NameTovar'
      '*/'
      '/*'
      'declare'
      '     @DateBeg datetime'
      '    ,@DateEnd datetime'
      '    ,@VidTovarNo int'
      '    ,@IsNotNullOrZerroProd int'
      '    ,@PlanningOrderHeadId int'
      ''
      'set @DateBeg = :DateBeg'
      'set @DateEnd = :DateEnd'
      'set @VidTovarNo = :VidTovarNo'
      'set @IsNotNullOrZerroProd = :IsNotNullOrZerroProd'
      'set @PlanningOrderHeadId = :PlanningOrderHeadId'
      ''
      'if @IsNotNullOrZerroProd is null set @IsNotNullOrZerroProd = 0'
      ''
      
        'select  (select OtdelName from VidOtdel where OtdelNo = ds.Otdel' +
        'No) OtdelName'
      '      , ds.OtdelNo'
      '      , t.TovarNo'
      
        '      , (select VidName from VidTov where VidNo = t.VidNo) as Vi' +
        'dName'
      '      , t.NameTovarShort'
      #9'  , ds.Qty'
      #9'  , convert(decimal(18,2),round(ds.Summa,2)) as Summa'
      #9'  , t.ColName'
      
        '      , convert(decimal(18,2),round(isnull(case when t.ColnPrice' +
        ' = 1 then Isnull(Price,0)            '
      
        '                                               when t.ColnPrice ' +
        '= 2 then Isnull(Price1,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 3 then Isnull(Price2,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 4 then Isnull(Price3,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 5 then Isnull(Price4,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 6 then Isnull(Price5,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 7 then Isnull(Price6,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 8 then Isnull(Price7,0)           '
      
        '                                               when t.ColnPrice ' +
        '= 10 then Isnull(Price8,0)          '
      
        '                                               when t.ColnPrice ' +
        '= 11 then Isnull(Price9,0)          '
      
        '                                               when t.ColnPrice ' +
        '= 12 then Isnull(Price10,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 13 then Isnull(Price13,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 14 then Isnull(Price14,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 15 then Isnull(Price15,0)         '
      
        '                                               when t.ColnPrice ' +
        '= 9 then Isnull(AvgPriceIn,0)       '
      
        '                                               when t.ColnPrice ' +
        '= 17 then Isnull(pfv.PriceVeb, 0)   '
      
        '                                               when t.ColnPrice ' +
        '= 18 then Isnull(pfv.PriceInInst, 0)'
      '                                          end,0),2)) as PriceNow'
      ''
      '     , isnull(pos.PlanProdag,0) as PlanProdag '
      '     , isnull(pos.PlanProdag,0) * PriceNow as SummaProdag'
      '     , @PlanningOrderHeadId as PlanningOrderHeadId'
      ' from (select  t.TovarNo'
      '             , t.NameTovar'
      #9'         , t.NameTovarShort'
      #9#9#9' , t.VidNo'
      #9'         , dpt.ColNPrice'
      #9'         , dpt.ColName'
      '                 , t.Visible'
      '        from Tovar t,'
      '             D_Price_type dpt/*'
      #9#9' where t.Visible = 0*/) t left join'
      '      (select  nr.ColnPrice'
      '             , nr.OtdelNo'
      '             , ds.ARTICLE_ID as TovarNo'
      #9'         , sum(ds.qty) as Qty'
      #9'         , sum(ds.qty*ds.PRICE_ECO) as Summa'
      '        from NaklR nr inner join'
      '             DSPEC ds on ds.NaklNo = nr.NaklNo'
      '         where ds.DOC_DATE between @DateBeg and @DateEnd'
      '           and ds.DOC_TYPE_ID = 12'
      
        '           and ds.CONTRACTOR_ID not in (select PostNo from ListM' +
        'inusPostForPlanningOrder where CheckMinus = 1)'
      
        '       group by nr.ColnPrice, ds.ARTICLE_ID, nr.OtdelNo) ds on d' +
        's.TovarNo = t.TovarNo and ds.ColNPrice = t.ColNPrice left join'
      #9'  ostatok o on o.TovarNo = t.TovarNo left join'
      #9'  PriceForVeb pfv on pfv.TovarNo = t.TovarNo inner join '
      
        '       PlanningOrderSpec pos on pos.TovarNo = t.TovarNo and pos.' +
        'PlanningOrderHeadId = @PlanningOrderHeadId and pos.ColName = t.C' +
        'olName and pos.OtdelNo = ds.OtdelNo'
      ''
      '  where (isnull(ds.Qty,0) > 0 or @IsNotNullOrZerroProd = 0)'
      
        '    and t.VidNo in (select VidNo from ListMinusVidTovForPlanning' +
        'Order where CheckMinus = 1)'
      
        '    and ds.OtdelNo in (select OtdelNo from ListVidOtdelForPlanni' +
        'ngOrder where CheckMinus = 1)'
      ''
      'order by t.NameTovar'
      '*/')
    BeforePost = quPlanningOrderEditBeforePost
    AfterPost = quPlanningOrderEditAfterPost
    Left = 763
    Top = 319
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SotrudNo'
      end
      item
        DataType = ftUnknown
        Name = 'PlanningOrderHeadId'
      end
      item
        DataType = ftUnknown
        Name = 'IsNotNullOrZerroProd'
      end
      item
        DataType = ftUnknown
        Name = 'IzmPlanProdag'
      end
      item
        DataType = ftUnknown
        Name = 'IsSelectedTovar'
      end
      item
        DataType = ftUnknown
        Name = 'IsSelectedVid'
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
        Name = '_Order'
        Value = 'pos.TovarName'
      end>
    object quPlanningOrderEditOtdelName: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      DisplayWidth = 20
      FieldName = 'OtdelName'
      ReadOnly = True
      Size = 30
    end
    object quPlanningOrderEditOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
    end
    object quPlanningOrderEditTovarNo: TSmallintField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'TovarNo'
    end
    object quPlanningOrderEditNameTovarShort: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 30
      FieldName = 'NameTovarShort'
      Size = 64
    end
    object quPlanningOrderEditQty: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086' '#1087#1088#1086#1076#1072#1078' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      FieldName = 'Qty'
      ReadOnly = True
    end
    object quPlanningOrderEditSumma: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078
      FieldName = 'Summa'
      ReadOnly = True
    end
    object quPlanningOrderEditColName: TStringField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 15
      FieldName = 'ColName'
      Size = 64
    end
    object quPlanningOrderEditPriceNow: TFloatField
      DisplayLabel = #1058#1077#1082#1091#1097#1072#1103' '#1094#1077#1085#1072
      FieldName = 'PriceNow'
      ReadOnly = True
    end
    object quPlanningOrderEditPlanProdag: TFloatField
      DisplayLabel = #1055#1083#1072#1085' '#1087#1088#1086#1076#1072#1078
      FieldName = 'PlanProdag'
    end
    object quPlanningOrderEditSummaProdag: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1087#1088#1086#1076#1072#1078
      FieldName = 'SummaProdag'
      ReadOnly = True
    end
    object quPlanningOrderEditPlanningOrderHeadId: TIntegerField
      FieldName = 'PlanningOrderHeadId'
      ReadOnly = True
    end
    object quPlanningOrderEditVidName: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'VidName'
      ReadOnly = True
      Size = 30
    end
    object quPlanningOrderEditSotrudName: TStringField
      DisplayLabel = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      FieldName = 'SotrudName'
      ReadOnly = True
      Size = 30
    end
    object quPlanningOrderEditid: TLargeintField
      FieldName = 'id'
    end
    object quPlanningOrderEditSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
    end
    object quPlanningOrderEditVisible: TBooleanField
      FieldName = 'Visible'
      ReadOnly = True
    end
    object quPlanningOrderEditPrognozProdag: TIntegerField
      DisplayLabel = #1055#1088#1086#1075#1085#1086#1079' '#1087#1088#1086#1076#1072#1078
      FieldName = 'PrognozProdag'
    end
    object quPlanningOrderEditIzmPlanProdag: TFloatField
      DisplayLabel = #1056#1072#1079#1085#1080#1094#1072' '#1087#1088#1086#1076#1072#1078' '
      FieldName = 'IzmPlanProdag'
      ReadOnly = True
    end
  end
  object dsPlanningOrderEdit: TMSDataSource
    DataSet = quPlanningOrderEdit
    Left = 791
    Top = 319
  end
end
