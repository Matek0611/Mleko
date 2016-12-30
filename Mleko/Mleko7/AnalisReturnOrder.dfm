inherited AnalisReturnOrderForm: TAnalisReturnOrderForm
  Left = 232
  Top = 206
  Width = 1446
  Height = 558
  Caption = #1040#1085#1072#1083#1080#1079' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1430
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 8
      Top = 50
      Width = 136
      Height = 13
      Caption = #1044#1072#1090#1072'  '#1085#1072#1095#1072#1083#1100#1085#1072#1103' 2 '#1087#1077#1088#1080#1086#1076':'
    end
    object Label2: TLabel
      Left = 8
      Top = 26
      Width = 127
      Height = 13
      Caption = #1044#1072#1090#1072' '#1082#1086#1085#1077#1095#1085#1072#1103' 1 '#1087#1077#1088#1080#1086#1076':'
    end
    object Label5: TLabel
      Left = 8
      Top = 4
      Width = 136
      Height = 13
      Caption = #1044#1072#1090#1072'  '#1085#1072#1095#1072#1083#1100#1085#1072#1103' 1 '#1087#1077#1088#1080#1086#1076':'
    end
    object Label1: TLabel
      Left = 7
      Top = 74
      Width = 127
      Height = 13
      Caption = #1044#1072#1090#1072' '#1082#1086#1085#1077#1095#1085#1072#1103' 2 '#1087#1077#1088#1080#1086#1076':'
    end
    object Label4: TLabel
      Left = 1027
      Top = 16
      Width = 52
      Height = 13
      Caption = #1057#1091#1084#1084#1072' 1 >'
    end
    object Label6: TLabel
      Left = 1027
      Top = 40
      Width = 104
      Height = 13
      Caption = #1057#1091#1084#1084#1072' 1 - '#1057#1091#1084#1084#1072' 2 >'
    end
    object EdDateBeg1: TcxDateEdit
      Left = 165
      Top = -1
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      TabOrder = 0
      Width = 105
    end
    object EdDateEnd1: TcxDateEdit
      Left = 165
      Top = 23
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      TabOrder = 1
      Width = 105
    end
    object EdDateBeg2: TcxDateEdit
      Left = 165
      Top = 47
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      TabOrder = 2
      Width = 105
    end
    object cbIs_Ext_OtdelNo: TCheckBox
      Left = 296
      Top = 5
      Width = 172
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1086#1090#1076#1077#1083#1091' '#1087#1088#1086#1076#1072#1078
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object cbIs_Ext_VidNo: TCheckBox
      Left = 296
      Top = 29
      Width = 172
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1074#1080#1076#1091' '#1090#1086#1074#1072#1088#1072
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object cbIs_Ext_TipNo: TCheckBox
      Left = 296
      Top = 53
      Width = 172
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1090#1080#1087#1091' '#1090#1086#1074#1072#1088#1072
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object cbIs_Ext_TovarNo: TCheckBox
      Left = 463
      Top = 5
      Width = 169
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1090#1086#1074#1072#1088#1091
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object cbIs_Ext_SotrudNo: TCheckBox
      Left = 463
      Top = 29
      Width = 169
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1091
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object cbIs_Ext_ColnPrice: TCheckBox
      Left = 463
      Top = 53
      Width = 169
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1082#1086#1083#1086#1085#1082#1077' '#1094#1077#1085#1099
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object fltVidTov: TcitDBComboEdit
      Left = 712
      Top = 37
      Width = 89
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
      Owner = 'AnalisReturnOrderForm'
      EntityCode = 'VIDTOV'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object fltOtdel: TcitDBComboEdit
      Left = 712
      Top = 13
      Width = 89
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
      Owner = 'AnalisReturnOrderForm'
      EntityCode = 'VIDOTDEL'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object fltSotrud: TcitDBComboEdit
      Left = 712
      Top = 61
      Width = 90
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
      Owner = 'AnalisReturnOrderForm'
      EntityCode = 'SOTRUD'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object FltTipTovara: TcitDBComboEdit
      Left = 910
      Top = 13
      Width = 84
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
      TabOrder = 12
      Visible = True
      LocateKey = False
      KeyField = 'TipNo'
      TextField = 'TipName'
      Owner = 'AnalisReturnOrderForm'
      EntityCode = 'TipTovara'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object FltTovar: TcitDBComboEdit
      Left = 910
      Top = 40
      Width = 84
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
      TabOrder = 13
      Visible = True
      LocateKey = False
      KeyField = 'TovarNo'
      TextField = 'NameTovar'
      Owner = 'AnalisReturnOrderForm'
      EntityCode = 'Tovar'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object EdDateEnd2: TcxDateEdit
      Left = 164
      Top = 71
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      TabOrder = 14
      Width = 105
    end
    object FltPost: TcitDBComboEdit
      Left = 910
      Top = 65
      Width = 84
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
      LLblCaption = #1055#1072#1088#1090#1085#1077#1088'  :'
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
      TabOrder = 15
      Visible = True
      LocateKey = False
      KeyField = 'PostNo'
      TextField = 'Name'
      Owner = 'AnalisReturnOrderForm'
      EntityCode = 'Post'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = False
    end
    object cbIs_Ext_PostNo: TCheckBox
      Left = 295
      Top = 73
      Width = 172
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088#1080#1090#1100' '#1087#1086' '#1087#1072#1088#1090#1085#1077#1088#1091
      Checked = True
      State = cbChecked
      TabOrder = 16
    end
    object dbnehSumma1: TDBNumberEditEh
      Left = 1132
      Top = 8
      Width = 48
      Height = 21
      EditButton.Style = ebsUpDownEh
      EditButtons = <>
      TabOrder = 17
      Visible = True
    end
    object dbnehSumma1_Summa2: TDBNumberEditEh
      Left = 1132
      Top = 32
      Width = 48
      Height = 21
      EditButton.Style = ebsUpDownEh
      EditButtons = <>
      TabOrder = 18
      Visible = True
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 478
    Width = 1430
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
    Width = 1430
    Height = 373
    Align = alClient
    TabOrder = 2
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1428
      Height = 371
      Align = alClient
      DataSource = dsAnalisReturnOrder
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
          Width = 121
        end
        item
          EditButtons = <>
          FieldName = 'TipName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 129
        end
        item
          EditButtons = <>
          FieldName = 'TovarName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 226
        end
        item
          EditButtons = <>
          FieldName = 'SotrudName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 184
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
          FieldName = 'PostName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 184
        end
        item
          EditButtons = <>
          FieldName = 'Kol1'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Summa1'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Kol2'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Summa2'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Summa1_Summa2'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end>
    end
  end
  object dsAnalisReturnOrder: TMSDataSource
    DataSet = quAnalisReturnOrder
    Left = 48
  end
  object quAnalisReturnOrder: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '     @DateBeg1 datetime'
      '   , @DateEnd1 datetime'
      '   , @DateBeg2 datetime'
      '   , @DateEnd2 datetime'
      ''
      '   , @Is_Ext_OtdelNo int'
      '   , @Is_Ext_VidNo int'
      '   , @Is_Ext_TipNo int'
      '   , @Is_Ext_TovarNo int'
      '   , @Is_Ext_SotrudNo int'
      '   , @Is_Ext_ColnPrice int'
      '   , @Is_Ext_PostNo int'
      ''
      '   , @IsSelectedOtdel int'
      '   , @IsSelectedVidTov int'
      '   , @IsSelectedSotrud int'
      ''
      '   , @IsSelectedTipTovara int'
      '   , @IsSelectedTovar int'
      ''
      '   , @IsSelectedPostNo int'
      ''
      '   , @UserNo int'
      '   , @SPID int'
      '   '
      '   , @Summa1 int'
      '   , @Summa1_Summa2 int'
      ''
      '   , @IsSumma1 int'
      '   , @IsSumma1_summa2 int'
      ''
      'set @Summa1 = :Summa1'
      'set @Summa1_Summa2 = :Summa1_Summa2'
      ''
      '/*'
      'if @Summa1 is null set @Summa1 = 0'
      'if @Summa1_Summa2 set @Summa1_Summa2 = 0'
      '*/'
      ''
      'if @Summa1 is null set @IsSumma1 = 1'
      'if @Summa1_Summa2 is null set @IsSumma1_summa2 =1'
      ''
      ''
      'set @UserNo = :UserNo'
      'set @SPID = :SPID'
      ''
      'set @DateBeg1 = :DateBeg1'
      'set @DateEnd1 = :DateEnd1'
      'set @DateBeg2 = :DateBeg2'
      'set @DateEnd2 = :DateEnd2'
      ''
      'set @IsSelectedOtdel = :IsSelectedOtdel'
      'set @IsSelectedVidTov = :IsSelectedVidTov'
      'set @IsSelectedSotrud = :IsSelectedSotrud'
      'set @IsSelectedTipTovara = :IsSelectedTipTovara'
      'set @IsSelectedTovar = :IsSelectedTovar'
      'set @IsSelectedPostNo = :IsSelectedPostNo'
      ''
      'set @Is_Ext_OtdelNo = :Is_Ext_OtdelNo'
      'set @Is_Ext_VidNo = :Is_Ext_VidNo'
      'set @Is_Ext_TipNo = :Is_Ext_TipNo'
      'set @Is_Ext_TovarNo = :Is_Ext_TovarNo'
      'set @Is_Ext_SotrudNo = :Is_Ext_SotrudNo'
      'set @Is_Ext_ColnPrice = :Is_Ext_ColnPrice'
      'set @Is_Ext_PostNo = :Is_Ext_PostNo'
      ''
      'if @Is_Ext_OtdelNo is null set @Is_Ext_OtdelNo = 1'
      'if @Is_Ext_VidNo is null set @Is_Ext_VidNo = 1'
      'if @Is_Ext_TipNo is null set @Is_Ext_TipNo = 1'
      'if @Is_Ext_TovarNo is null set @Is_Ext_TovarNo = 1'
      'if @Is_Ext_SotrudNo is null set @Is_Ext_SotrudNo = 1'
      'if @Is_Ext_ColnPrice is null set @Is_Ext_ColnPrice = 1'
      'if @Is_Ext_PostNo is null set @Is_Ext_PostNo = 1'
      ''
      ''
      ''
      ''
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
      #9'[TipNo] [int] NULL,'
      '        [PostNo] [int] null'
      ')'
      ''
      ''
      '-- truncate table PlanningOrderTovarTemp'
      ''
      
        'Insert into #PlanningOrderTovarTemp (TovarNo, NameTovar, VidNo, ' +
        'TipNo, ColNPrice, ColName, Visible, SotrudNo, SotrudName, Sotrud' +
        'Otdel, PriceNow, PostNo)'
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
      '                , nr.POstNo'
      '  from NaklR nr inner join'
      '       DSPEC ds on ds.NaklNo = nr.NaklNo inner join'
      '       Tovar t on t.TovarNo = ds.ARTICLE_ID '
      '   where ds.DOC_DATE between @DateBeg1 and @DateEnd1'
      '     and ds.DOC_TYPE_ID in (10,18))'
      ''
      
        'Insert into #PlanningOrderTovarTemp (TovarNo, NameTovar, VidNo, ' +
        'TipNo, ColNPrice, ColName, Visible, SotrudNo, SotrudName, Sotrud' +
        'Otdel, PriceNow, PostNo)'
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
      '                , nr.PostNo'
      '  from NaklR nr inner join'
      '       DSPEC ds on ds.NaklNo = nr.NaklNo inner join'
      '       Tovar t on t.TovarNo = ds.ARTICLE_ID '
      '   where ds.DOC_DATE between @DateBeg2 and @DateEnd2'
      '     and ds.DOC_TYPE_ID in (10,18))'
      ''
      'select  SotrudOtdel as OtdelNo'
      
        '     , (select OtdelName from VidOtdel where OtdelNo = t.SotrudO' +
        'tdel) as OtdelName'
      #9' , t.VidNo'
      
        #9' , coalesce((select VidName from VidTov where VidNo = t.VidNo),' +
        'r1.VidName,r2.VidName) as VidName'
      #9' , t.TipNo'
      
        #9' , coalesce((select TipName from TipTovara where TipNo = t.TipN' +
        'o),r1.VidName,r2.VidName) as TipName'
      #9' , t.TovarNo'
      #9' , t.NameTovar as TovarName'
      #9' , t.SotrudNo'
      #9' , t.SotrudName'
      '         , t.ColNPrice'
      '         , t.ColName'
      '         , t.PostNo '
      '         , t.PostName '
      #9' , isnull(r1.Qty,0) as Kol1'
      #9' , isnull(r1.Summa,0) as Summa1'
      #9' , isnull(r2.Qty,0) as Kol2'
      #9' , isnull(R2.Summa,0) as Summa2'
      #9' , isnull(r1.Summa,0) - isnull(r2.Summa,0) as Summa1_Summa2'
      ' from (select TovarNo'
      #9'     , NameTovar'
      #9'     , VidNo'
      '             , VidName '
      '             , TipNo'#9
      '             , TipName'
      '  '#9'     , ColNPrice'
      '  '#9'     , ColName'
      #9'     , SotrudNo'
      #9'     , SotrudName'
      '  '#9'     , SotrudOtdel'
      '             , PostNo'
      '             , PostName'
      
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
      
        '                   , case when @Is_Ext_PostNo = 1 then PostNo el' +
        'se -1 end as PostNo'
      
        '                   , case when @Is_Ext_PostNo = 1 then (select n' +
        'ame from post where PostNo = t.PostNo) else '#39#1042#1089#1077' '#1087#1072#1088#1090#1085#1077#1088#1099#39' end a' +
        's PostName'
      '               from (select distinct * '
      #9#9'              from #PlanningOrderTovarTemp)t) g'
      #9'   group by TovarNo'
      #9'          , NameTovar'
      #9#9'  , VidNo'
      '                  , VidName'
      #9#9'  , TipNo'
      '                  , TipName'#9
      #9#9'  , ColNPrice'
      #9#9'  , ColName'
      #9#9'  , SotrudNo'
      #9#9'  , SotrudName'
      #9#9'  , SotrudOtdel'
      '                  , PostNo'
      '                  , PostName) t left join'
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
      '             , PostNo'
      '             , PostName'
      
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
      
        '                     , case when ds.DOC_TYPE_ID in (10,18) then ' +
        'abs(ds.qty) '
      '                       end as qty'
      
        '    '#9'             , case when ds.DOC_TYPE_ID in (10,18) then abs' +
        '(ds.qty*ds.PRICE_ECO)'
      '                       end as Summa'
      
        '    '#9'             , case when @Is_Ext_ColnPrice = 1 then nr.Coln' +
        'Price else -1 end as ColnPrice'
      
        '                     , case when @Is_Ext_ColnPrice = 1 then (sel' +
        'ect ColName from D_Price_type where ColnPrice = nr.ColnPrice) el' +
        'se '#39#1042#1089#1077' '#1094#1077#1085#1099#39' end as ColName'
      
        '                     , case when @Is_Ext_PostNo = 1 then nr.Post' +
        'No else -1 end as PostNo'
      
        '                     , case when @Is_Ext_PostNo = 1 then (select' +
        ' name from post where PostNo = nr.PostNo) else '#39#1042#1089#1077' '#1087#1072#1088#1090#1085#1077#1088#1099#39' en' +
        'd as PostName'
      '               from NaklR nr inner join'
      '                    DSPEC ds on ds.NaklNo = nr.NaklNo inner join'
      '     '#9'            Tovar t on t.TovarNo = ds.ARTICLE_ID '
      
        '                where ds.DOC_DATE between @DateBeg1 and @DateEnd' +
        '1'
      '                  and ds.DOC_TYPE_ID in (10,18)) Prodag'
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
      #9'       , ColName'
      '               , PostNo'
      
        '               , PostName) R1 on R1.ColnPrice = t.ColNPrice and ' +
        'R1.OtdelNo = t.SotrudOtdel and R1.SotrudNo = t.SotrudNo and R1.T' +
        'ipNo = t.TipNo and R1.VidNo = t.VidNo and R1.TovarNo = t.TovarNo' +
        ' and R1.PostNo = t.PostNo  left join'
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
      '             , PostNo'
      '             , PostName'
      
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
        '.qty)'
      '                       end as qty'
      
        '   '#9'             , case when ds.DOC_TYPE_ID = 10 then abs(ds.qty' +
        '*ds.PRICE_ECO)'
      '                       end as Summa'
      
        '    '#9'             , case when @Is_Ext_ColnPrice = 1 then nr.Coln' +
        'Price else -1 end as ColnPrice'
      
        '                     , case when @Is_Ext_ColnPrice = 1 then (sel' +
        'ect ColName from D_Price_type where ColnPrice = nr.ColnPrice) el' +
        'se '#39#1042#1089#1077' '#1094#1077#1085#1099#39' end as ColName'
      
        '                     , case when @Is_Ext_PostNo = 1 then nr.Post' +
        'No else -1 end as PostNo'
      
        '                     , case when @Is_Ext_PostNo = 1 then (select' +
        ' name from post where PostNo = nr.PostNo) else '#39#1042#1089#1077' '#1087#1072#1088#1090#1085#1077#1088#1099#39' en' +
        'd as PostName'
      '               from NaklR nr inner join'
      '                    DSPEC ds on ds.NaklNo = nr.NaklNo inner join'
      '     '#9'            Tovar t on t.TovarNo = ds.ARTICLE_ID '
      
        '                where ds.DOC_DATE between @DateBeg2 and @DateEnd' +
        '2'
      '                  and ds.DOC_TYPE_ID in (10,18)) Prodag'
      '       group by  OtdelNo'
      '               , OtdelName'
      #9'       , VidNo'
      #9'       , VidName'
      '               , TipNo'
      '               , TipName'
      #9'       , TovarNo'
      #9'       , TovarName'
      #9'       , SotrudNo'
      #9'       , SotrudName'
      #9'       , ColnPrice'
      #9'       , ColName'
      '               , PostNo'
      
        '               , PostName) R2 on R2.ColnPrice = t.ColNPrice and ' +
        'R2.OtdelNo = t.SotrudOtdel and R2.SotrudNo = t.SotrudNo and R2.T' +
        'ipNo = t.TipNo and R2.VidNo = t.VidNo and R2.TovarNo = t.TovarNo' +
        ' and R2.PostNo = t.PostNo'
      'where ((t.VidNo in (select cast(Param_Value as int)'
      '                       from e_Session_Params'
      '                        where Userno = @UserNo'
      
        '                          and Owner_Name = '#39'AnalisReturnOrderFor' +
        'm'#39
      '                          and Param_Name = '#39'FLTVIDTOV'#39
      
        '                          and Spid = @SPID)) or @IsSelectedVidTo' +
        'v = 0)'
      '    and ((t.SotrudOtdel in (select cast(Param_Value as int)'
      '                             from e_Session_Params'
      '                              where Userno = @UserNo'
      
        '                                and Owner_Name = '#39'AnalisReturnOr' +
        'derForm'#39
      '                                and Param_Name = '#39'FLTOTDEL'#39
      
        '                                and Spid = @SPID)) or @IsSelecte' +
        'dOtdel = 0)'
      '    and ((t.SotrudNo in (select cast(Param_Value as int)'
      '                          from e_Session_Params'
      '                           where Userno = @UserNo'
      
        '                             and Owner_Name = '#39'AnalisReturnOrder' +
        'Form'#39
      '                             and Param_Name = '#39'FLTSOTRUD'#39
      
        '                             and Spid = @SPID)) or @IsSelectedSo' +
        'trud = 0)'
      '    and ((t.TipNo in (select cast(Param_Value as int)'
      '                       from e_Session_Params'
      '                        where Userno = @UserNo'
      
        '                          and Owner_Name = '#39'AnalisReturnOrderFor' +
        'm'#39
      '                          and Param_Name = '#39'FLTTIPTOVARA'#39
      
        '                          and Spid = @SPID)) or @IsSelectedTipTo' +
        'vara = 0)  '
      ''
      '    and ((t.TovarNo in (select cast(Param_Value as int)'
      '                         from e_Session_Params'
      '                          where Userno = @UserNo'
      
        '                            and Owner_Name = '#39'AnalisReturnOrderF' +
        'orm'#39
      '                            and Param_Name = '#39'FLTTOVAR'#39
      
        '                            and Spid = @SPID)) or @IsSelectedTov' +
        'ar = 0)'
      '   and ((t.PostNo in (select cast(Param_Value as int)'
      '                         from e_Session_Params'
      '                          where Userno = @UserNo'
      
        '                            and Owner_Name = '#39'AnalisReturnOrderF' +
        'orm'#39
      '                            and Param_Name = '#39'FLTPOST'#39
      
        '                            and Spid = @SPID)) or @IsSelectedPos' +
        'tNo = 0)'
      
        '   and ((isnull(r1.Summa,0) > @Summa1 or @IsSumma1 =1) and ((isn' +
        'ull(r1.Summa,0) - isnull(r2.Summa,0) > @Summa1_summa2) or @IsSum' +
        'ma1_summa2 = 1))'
      ''
      ''
      'order by &_order')
    Left = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Summa1'
      end
      item
        DataType = ftUnknown
        Name = 'Summa1_Summa2'
      end
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
        Name = 'DateBeg1'
      end
      item
        DataType = ftUnknown
        Name = 'DateEnd1'
      end
      item
        DataType = ftUnknown
        Name = 'DateBeg2'
      end
      item
        DataType = ftUnknown
        Name = 'DateEnd2'
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
        Name = 'IsSelectedTipTovara'
      end
      item
        DataType = ftUnknown
        Name = 'IsSelectedTovar'
      end
      item
        DataType = ftUnknown
        Name = 'IsSelectedPostNo'
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
        Name = 'Is_Ext_PostNo'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = 'OtdelName'
      end>
    object quAnalisReturnOrderOtdelNo: TIntegerField
      FieldName = 'OtdelNo'
      ReadOnly = True
    end
    object quAnalisReturnOrderOtdelName: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      DisplayWidth = 20
      FieldName = 'OtdelName'
      ReadOnly = True
      Size = 30
    end
    object quAnalisReturnOrderVidNo: TIntegerField
      FieldName = 'VidNo'
      ReadOnly = True
    end
    object quAnalisReturnOrderVidName: TStringField
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 20
      FieldName = 'VidName'
      ReadOnly = True
      Size = 30
    end
    object quAnalisReturnOrderTipNo: TIntegerField
      FieldName = 'TipNo'
      ReadOnly = True
    end
    object quAnalisReturnOrderTipName: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 20
      FieldName = 'TipName'
      ReadOnly = True
      Size = 30
    end
    object quAnalisReturnOrderTovarNo: TIntegerField
      FieldName = 'TovarNo'
      ReadOnly = True
    end
    object quAnalisReturnOrderTovarName: TStringField
      DisplayLabel = #1058#1086#1074#1072#1088
      DisplayWidth = 30
      FieldName = 'TovarName'
      ReadOnly = True
      Size = 64
    end
    object quAnalisReturnOrderSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
      ReadOnly = True
    end
    object quAnalisReturnOrderSotrudName: TStringField
      DisplayLabel = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      DisplayWidth = 20
      FieldName = 'SotrudName'
      ReadOnly = True
      Size = 30
    end
    object quAnalisReturnOrderKol1: TFloatField
      FieldName = 'Kol1'
      ReadOnly = True
    end
    object quAnalisReturnOrderSumma1: TFloatField
      FieldName = 'Summa1'
      ReadOnly = True
    end
    object quAnalisReturnOrderKol2: TFloatField
      FieldName = 'Kol2'
      ReadOnly = True
    end
    object quAnalisReturnOrderSumma2: TFloatField
      FieldName = 'Summa2'
      ReadOnly = True
    end
    object quAnalisReturnOrderSumma1_Summa2: TFloatField
      FieldName = 'Summa1_Summa2'
      ReadOnly = True
    end
    object quAnalisReturnOrderColNPrice: TIntegerField
      FieldName = 'ColNPrice'
      ReadOnly = True
    end
    object quAnalisReturnOrderColName: TStringField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 15
      FieldName = 'ColName'
      ReadOnly = True
      Size = 64
    end
    object quAnalisReturnOrderPostNo: TIntegerField
      FieldName = 'PostNo'
      ReadOnly = True
    end
    object quAnalisReturnOrderPostName: TStringField
      DisplayLabel = #1055#1072#1088#1090#1085#1077#1088
      DisplayWidth = 25
      FieldName = 'PostName'
      ReadOnly = True
      Size = 30
    end
  end
  object sdExportAnalisInExel: TSaveDialog
    Left = 632
    Top = 496
  end
end
