inherited PrihodOrderForm: TPrihodOrderForm
  Left = 285
  Top = 246
  Width = 1209
  Height = 439
  Caption = #1047#1072#1082#1072#1079' '#1085#1072' '#1087#1088#1080#1093#1086#1076
  PixelsPerInch = 96
  TextHeight = 13
  object paHead: TPanel [0]
    Left = 0
    Top = 0
    Width = 1193
    Height = 105
    Align = alTop
    TabOrder = 0
    OnExit = paHeadExit
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 65
      Height = 13
      Caption = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072
    end
    object Label2: TLabel
      Left = 8
      Top = 32
      Width = 123
      Height = 13
      Caption = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072' '#1087#1088#1086#1076#1072#1078
    end
    object Label3: TLabel
      Left = 8
      Top = 56
      Width = 141
      Height = 13
      Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072' '#1087#1088#1086#1076#1072#1078
    end
    object Label4: TLabel
      Left = 280
      Top = 13
      Width = 58
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object Label5: TLabel
      Left = 282
      Top = 37
      Width = 76
      Height = 13
      Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object Label6: TLabel
      Left = 281
      Top = 59
      Width = 95
      Height = 13
      Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1080#1081' '#1090#1080#1087
    end
    object Label7: TLabel
      Left = 626
      Top = 77
      Width = 34
      Height = 13
      Caption = #1057#1091#1084#1084#1072
    end
    object Label8: TLabel
      Left = 975
      Top = 12
      Width = 42
      Height = 13
      Caption = #1064#1072#1073#1083#1086#1085':'
    end
    object Label9: TLabel
      Left = 977
      Top = 51
      Width = 81
      Height = 13
      Caption = #1053#1072#1073#1086#1088' '#1086#1090#1089#1088#1086#1095#1082#1080
    end
    object dbeAnalisDateEnd: TDBDateTimeEditEh
      Left = 152
      Top = 56
      Width = 121
      Height = 21
      DataField = 'AnalisDateEnd'
      DataSource = dsPrihodOrderHead
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
      OnClick = dbeAnalisDateEndClick
    end
    object dbeAnalisDateBeg: TDBDateTimeEditEh
      Left = 152
      Top = 32
      Width = 121
      Height = 21
      DataField = 'AnalisDateBeg'
      DataSource = dsPrihodOrderHead
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
      OnClick = dbeAnalisDateBegClick
    end
    object dbeOrderDate: TDBDateTimeEditEh
      Left = 152
      Top = 8
      Width = 121
      Height = 21
      DataField = 'OrderDate'
      DataSource = dsPrihodOrderHead
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
      OnClick = dbeOrderDateClick
    end
    object deNamePost: TDBEdit
      Left = 386
      Top = 8
      Width = 230
      Height = 21
      DataField = 'PostName'
      DataSource = dsPrihodOrderHead
      TabOrder = 3
      OnDblClick = deNamePostDblClick
    end
    object is_all_Tovar: TCheckBox
      Left = 8
      Top = 80
      Width = 89
      Height = 17
      Caption = #1042#1089#1077' '#1090#1086#1074#1072#1088#1099
      TabOrder = 4
      OnClick = is_all_TovarClick
    end
    object is_all_TovarOrders: TCheckBox
      Left = 281
      Top = 80
      Width = 112
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1079#1072#1082#1072#1079
      TabOrder = 5
      OnClick = is_all_TovarOrdersClick
    end
    object EdTovar: TcitDBComboEdit
      Left = 703
      Top = 36
      Width = 245
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
      LLblCaption = #1058#1086#1074#1072#1088
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
      LLblRequiredFont.Style = []
      Required = True
      TabOrder = 6
      Visible = True
      LocateKey = False
      Owner = 'PrihodOrder'
      EntityCode = 'TOVAR'
      multiselect = True
      OnSelectOk = EdTovarSelectOk
      EditStyle = edSelect
      AutoTabControl = True
    end
    object dblBuh: TcxDBLookupComboBox
      Left = 388
      Top = 58
      DataBinding.DataField = 'Buh'
      DataBinding.DataSource = dsPrihodOrderHead
      Properties.KeyFieldNames = 'buh'
      Properties.ListColumns = <
        item
          FieldName = 'Buh_type_name'
        end>
      Properties.ListSource = DSBuh
      TabOrder = 7
      OnExit = dblBuhExit
      Width = 133
    end
    object dblDocType: TcxDBLookupComboBox
      Left = 387
      Top = 34
      BeepOnEnter = False
      DataBinding.DataField = 'Doc_Type'
      DataBinding.DataSource = dsPrihodOrderHead
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'name'
        end>
      Properties.ListSource = DsDocType
      TabOrder = 8
      Width = 161
    end
    object Flt_Post_Minus: TcitDBComboEdit
      Left = 757
      Top = 9
      Width = 191
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
      LLblCaption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
      LLblWidth = 130
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
      OnChange = Flt_Post_MinusChange
      LocateKey = False
      KeyField = 'PostNo'
      Owner = 'PrihodOrder'
      EntityCode = 'POST'
      EntityName = 'POST_BUH'
      multiselect = True
      EditStyle = edSelect
      AutoTabControl = True
    end
    object DBEditEhSumma: TDBEditEh
      Left = 704
      Top = 72
      Width = 89
      Height = 21
      DataField = 'Summa'
      DataSource = dsPrihodOrderHead
      EditButtons = <>
      ReadOnly = True
      TabOrder = 10
      Visible = True
    end
    object DBLSablonName: TDBLookupComboboxEh
      Left = 1032
      Top = 8
      Width = 121
      Height = 21
      EditButtons = <>
      KeyField = 'NameShablon'
      ListField = 'NameShablon'
      ListSource = dsListShablonName
      TabOrder = 11
      Visible = True
      OnChange = DBLSablonNameChange
    end
    object DBlDelayForNaklP: TDBLookupComboboxEh
      Left = 976
      Top = 72
      Width = 193
      Height = 21
      EditButtons = <>
      KeyField = 'id'
      ListField = 'FullName'
      ListSource = dsDelayForNaklP
      TabOrder = 12
      Visible = True
    end
  end
  object paGrid: TPanel [1]
    Left = 0
    Top = 105
    Width = 1193
    Height = 254
    Align = alClient
    TabOrder = 1
    object DBGridEh: TDBGridEh
      Left = 1
      Top = 1
      Width = 1191
      Height = 252
      Align = alClient
      DataSource = dsPrihodOrderSpec
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGridEhKeyDown
      OnKeyPress = DBGridEhKeyPress
      OnKeyUp = DBGridEhKeyUp
      OnTitleClick = DBGridEhTitleClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'No_pp'
          Footers = <>
          Title.Caption = #8470' '#1087'/'#1087
        end
        item
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1053#1086#1084#1077#1088' '#1090#1086#1074#1072#1088#1072
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'NameTovar'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
          Width = 324
        end
        item
          EditButtons = <>
          FieldName = 'KolOst'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1054#1089#1090#1072#1090#1086#1082
        end
        item
          EditButtons = <>
          FieldName = 'QtyPricePeriod'
          Footers = <>
          Title.Caption = #1055#1088#1086#1076#1072#1078#1080' '#1087#1077#1088#1080#1086#1076
          Width = 96
        end
        item
          EditButtons = <>
          FieldName = 'QtyPriceDay'
          Footers = <>
          Title.Caption = #1055#1088#1086#1076#1072#1078#1080' '#1076#1077#1085#1100
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'KolPerPak'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1042' '#1091#1087#1072#1082#1086#1074#1082#1077
        end
        item
          EditButtons = <>
          FieldName = 'ExpirationDate'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
          Width = 84
        end
        item
          EditButtons = <>
          FieldName = 'Price'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1062#1077#1085#1072
        end
        item
          EditButtons = <>
          FieldName = 'KolOrder'
          Footers = <>
          Title.Caption = #1050#1086#1083'. '#1079#1072#1082#1072#1079
        end
        item
          EditButtons = <>
          FieldName = 'KolPak'
          Footers = <>
          Title.Caption = #1050#1086#1083'. '#1091#1087#1072#1082#1086#1074'.'
          Width = 69
        end
        item
          EditButtons = <>
          FieldName = 'Summa'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1091#1084#1084#1072
        end>
    end
  end
  object paButton: TPanel [2]
    Left = 0
    Top = 359
    Width = 1193
    Height = 41
    Align = alBottom
    TabOrder = 2
    object bbOK: TBitBtn
      Left = 176
      Top = 10
      Width = 77
      Height = 25
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 0
      OnClick = bbOKClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbcancel: TBitBtn
      Left = 276
      Top = 10
      Width = 77
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = bbcancelClick
      Kind = bkCancel
    end
    object Button1: TButton
      Left = 384
      Top = 10
      Width = 163
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1085#1077' '#1091#1095#1080#1090#1099#1074#1072#1077#1084#1099#1093
      TabOrder = 2
      OnClick = Button1Click
    end
    object bCreateNaklP: TButton
      Left = 728
      Top = 10
      Width = 119
      Height = 25
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1087#1088#1080#1093#1086#1076#1085#1091#1102' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1091#1102
      TabOrder = 3
      OnClick = bCreateNaklPClick
    end
    object Button2: TButton
      Left = 573
      Top = 10
      Width = 116
      Height = 25
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
      TabOrder = 4
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 880
      Top = 8
      Width = 145
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100'/'#1091#1076#1072#1083#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      TabOrder = 5
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 1048
      Top = 8
      Width = 75
      Height = 25
      Caption = #1064#1072#1073#1083#1086#1085#1099
      TabOrder = 6
      OnClick = Button4Click
    end
  end
  object dsPrihodOrderHead: TMSDataSource
    DataSet = quPrihodOrderHead
    Left = 1144
    Top = 112
  end
  object quDocType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_doc_type t'
      'where entity_code='#39'NAKLP'#39)
    Options.StrictUpdate = False
    Left = 575
    Top = 24
  end
  object DsDocType: TDataSource
    DataSet = quDocType
    Left = 551
    Top = 25
  end
  object quBuh: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_buh_type')
    Options.StrictUpdate = False
    Left = 521
    Top = 56
  end
  object DSBuh: TDataSource
    DataSet = quBuh
    Left = 551
    Top = 56
  end
  object quPrihodOrderHead: TMSQuery
    SQLInsert.Strings = (
      
        'insert into E_PrihodOrderHead (OrderNo,OrderDate,AnalisDateBeg,A' +
        'nalisDateEnd,PostNo,UserNo,Summa,Buh,Doc_Type,EditUserNo,EditOrd' +
        'erDate,OurFirmNo,Pkey)'
      
        '          values (:OrderNo,:OrderDate,:AnalisDateBeg,:AnalisDate' +
        'End,:PostNo,:UserNo,0,:Buh,:Doc_Type,:EditUserNo,getdate(),:OurF' +
        'irmNo,:Pkey)')
    SQLUpdate.Strings = (
      'declare '
      '   @cnt int'
      ''
      'select @cnt = count(*) from E_PrihodOrderHead where Pkey = :Pkey'
      ''
      'if @cnt = 0'
      
        'insert into E_PrihodOrderHead (OrderNo,OrderDate,AnalisDateBeg,A' +
        'nalisDateEnd,PostNo,UserNo,Summa,Buh,Doc_Type,EditUserNo,EditOrd' +
        'erDate,OurFirmNo,Pkey)'
      
        '                       values (:OrderNo,:OrderDate,:AnalisDateBe' +
        'g,:AnalisDateEnd,:PostNo,:UserNo,0,:Buh,:Doc_Type,:EditUserNo,ge' +
        'tdate(),:OurFirmNo,:Pkey)'
      ''
      'if @cnt > 0'
      'update E_PrihodOrderHead'
      ' set  OrderDate = :OrderDate'
      '     ,AnalisDateBeg = :AnalisDateBeg'
      '     ,AnalisDateEnd = :AnalisDateEnd'
      '     ,PostNo = :PostNo'
      
        '     ,Summa = isnull((select sum(Kol*Price) from E_PrihodOrderSp' +
        'ec where Document_Pkey = :Pkey),0)'
      '     ,Buh = :Buh'
      '     ,Doc_Type = :Doc_Type'
      '     ,EditUserNo = :EditUserNo'
      '     ,EditOrderDate = getdate()'
      'where Pkey = :Pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  epoh.Id'
      '       ,epoh.OrderNo'
      '       ,epoh.OrderDate'
      '       ,epoh.PostNo'
      '       ,p.Name as PostName'
      '       ,epoh.Buh'#9
      '       ,dbt.Buh_type_name as BuhName'
      '       ,epoh.Summa'
      '       ,epoh.Doc_Type'
      '       ,ddt.name as DocTypeName'
      '       ,epoh.AnalisDateBeg'
      '       ,epoh.AnalisDateEnd'
      '       ,epoh.UserNo'
      '       ,u.UserName'
      '       ,epoh.EditUserNo'
      
        '       ,(select UserName from Users where UserNo = epoh.EditUser' +
        'No) as EditUserName'
      '       ,epoh.EditOrderDate'
      '       ,epoh.Pkey'
      '       ,epoh.OurFirmNo'
      ' from E_PrihodOrderHead epoh left join'
      '      Post p on p.PostNo = epoh.PostNo left join'
      #9'  Users u on u.UserNo = epoh.UserNo left join'
      #9'  d_buh_type dbt on dbt.buh = epoh.Buh left join'
      #9'  d_doc_type ddt on ddt.ID = epoh.Doc_Type'
      '  where epoh.Pkey = :Pkey')
    Left = 1118
    Top = 112
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'Pkey'
      end>
    object quPrihodOrderHeadId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
    object quPrihodOrderHeadOrderNo: TIntegerField
      FieldName = 'OrderNo'
    end
    object quPrihodOrderHeadOrderDate: TDateTimeField
      FieldName = 'OrderDate'
    end
    object quPrihodOrderHeadPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quPrihodOrderHeadPostName: TStringField
      FieldName = 'PostName'
      Size = 30
    end
    object quPrihodOrderHeadBuh: TSmallintField
      FieldName = 'Buh'
    end
    object quPrihodOrderHeadBuhName: TStringField
      FieldName = 'BuhName'
    end
    object quPrihodOrderHeadSumma: TFloatField
      FieldName = 'Summa'
    end
    object quPrihodOrderHeadDoc_Type: TIntegerField
      FieldName = 'Doc_Type'
    end
    object quPrihodOrderHeadDocTypeName: TStringField
      FieldName = 'DocTypeName'
      Size = 256
    end
    object quPrihodOrderHeadAnalisDateBeg: TDateTimeField
      FieldName = 'AnalisDateBeg'
    end
    object quPrihodOrderHeadAnalisDateEnd: TDateTimeField
      FieldName = 'AnalisDateEnd'
    end
    object quPrihodOrderHeadUserNo: TIntegerField
      FieldName = 'UserNo'
    end
    object quPrihodOrderHeadUserName: TStringField
      FieldName = 'UserName'
    end
    object quPrihodOrderHeadEditUserNo: TIntegerField
      FieldName = 'EditUserNo'
    end
    object quPrihodOrderHeadEditUserName: TStringField
      FieldName = 'EditUserName'
      ReadOnly = True
    end
    object quPrihodOrderHeadEditOrderDate: TDateTimeField
      FieldName = 'EditOrderDate'
    end
    object quPrihodOrderHeadPkey: TLargeintField
      FieldName = 'Pkey'
    end
    object quPrihodOrderHeadOurFirmNo: TIntegerField
      FieldName = 'OurFirmNo'
    end
  end
  object InsInListMinusPrihodOrder: TMSStoredProc
    StoredProcName = 'InsInListMinusPrihodOrder;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL InsInListMinusPrihodOrder;1(:SPID, :UserNo' +
        ')}')
    Left = 904
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'SPID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UserNo'
        ParamType = ptInput
      end>
  end
  object quInsInNaklP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '    @p_NaklNo int'
      '   ,@p_Nom int'
      '   ,@p_PostNo smallint'
      '   ,@p_DateNakl smalldatetime'
      '   ,@p_DatePrih smalldatetime'
      '   ,@p_Buh int'
      '   ,@p_UserNo int'
      '   ,@P_doc_type int'
      '   ,@d_bank_invoice_id int'
      '   ,@Pkey bigint'
      '   ,@CurrencyHead varhar(5)'
      ''
      
        'select @d_bank_invoice_id = id from D_BANK_INVOICE where isMain ' +
        '= 1'
      ''
      
        'select @CurrencyHead = c.l_code from D_CURRENCY c inner join Cur' +
        'rencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1 and ce.C' +
        'urrencyId = c.ID and isnull(c.isTrash,0) = 0'
      ''
      ''
      'select @p_NaklNo=max(naklNo)+1 '
      ' from NaklP'
      ''
      'if @p_NaklNo is null'
      ' set @p_NaklNo = 1'
      ''
      'if @p_NaklNo = 0'
      ' set @p_NaklNo = 1'
      ''
      'select @p_Nom=max(Nom)+1 '
      ' from NaklP'
      ''
      'if @p_Nom is null'
      ' set @p_NaklNo = 1'
      ''
      'if @p_Nom = 0'
      ' set @p_NaklNo = 1'
      ''
      'set @p_PostNo = :PostNo'
      'set @p_Buh = :Buh'
      'set @p_DateNakl = :DateNakl'
      'set @p_DatePrih = :DatePrih'
      'set @p_UserNo = :UserNo'
      'set @P_doc_type = :Doc_Type'
      ''
      ''
      
        'INSERT INTO NaklP (NaklNo, Nom, PostNo, DateNakl, DatePrih, Summ' +
        'a, SummaDolg, Buh, UserNo,  doc_type, OurFirmNo, OtdelNo, d_bank' +
        '_invoice_id, CurrencyHead)'
      
        'VALUES(@p_NaklNo, @p_Nom, @p_PostNo, @p_DateNakl, @p_DatePrih, 0' +
        ', 0, @p_Buh, @p_UserNo, @p_doc_type, (select PostNo from d_our_f' +
        'irm), 0, @d_bank_invoice_id, @CurrencyHead)'
      ''
      ''
      'select @Pkey = pkey from naklp where NaklNo = @p_NaklNo'
      ''
      
        'INSERT INTO L_Delay_NaklP (NaklNo,SET_ARTICLE_GROUP_ID,Day_Delay' +
        ',Day_Delay_Ext,Buh)'
      
        'values (@Pkey,:SET_ARTICLE_GROUP_ID,:Day_Delay,:Day_Delay_Ext,@p' +
        '_Buh)'
      ''
      '-- select NaklNo, Pkey from NaklP where NaklNo = @p_NaklNo')
    Left = 1032
    Top = 193
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Buh'
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
      end
      item
        DataType = ftDateTime
        Name = 'DatePrih'
      end
      item
        DataType = ftInteger
        Name = 'UserNo'
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'Doc_Type'
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'SET_ARTICLE_GROUP_ID'
      end
      item
        DataType = ftUnknown
        Name = 'Day_Delay'
      end
      item
        DataType = ftUnknown
        Name = 'Day_Delay_Ext'
      end>
  end
  object od_ExportExcel: TOpenDialog
    Left = 48
  end
  object quPrihodOrderSpec: TMSQuery
    SQLInsert.Strings = (
      
        'insert into E_PrihodOrderSpec (  Document_Id,OrderDate,TovarNo,K' +
        'ol,Price,PriceInInst,KolOstatok,KolSalePeriod,KolSaleDey,UserNo,' +
        'EditUserNo,EditDate,OurFirmNo,Document_Pkey)'
      '                       values ( :Document_Id'
      '                               ,:OrderDate'
      '                               ,:TovarNo'
      '                               ,:KolOrder'
      '                               ,:Price'
      '                               ,:PriceInInst'
      '                               ,:KolOst '
      '                               ,:QtyPricePeriod'
      '                               ,:QtyPriceDay'
      '                               ,:UserNom'
      '                               ,:EditUserNom'
      '                               ,getdate()'
      '                               ,(select PostNo from d_our_firm)'
      '                               ,:Document_Pkey)')
    SQLDelete.Strings = (
      'delete E_PrihodOrderSpec'
      'where Document_Pkey = :Document_Pkey'
      '  and TovarNo = :TovarNo')
    SQLUpdate.Strings = (
      'declare'
      '  @cnt int'
      ''
      'select @cnt = count(*)'
      ' from E_PrihodOrderSpec '
      '  where  Document_Pkey = :Document_Pkey'
      '    and TovarNo = :TovarNo'
      ''
      'if @cnt = 0'
      
        ' insert into E_PrihodOrderSpec (  Document_Id,OrderDate,TovarNo,' +
        'Kol,Price,PriceInInst,KolOstatok,KolSalePeriod,KolSaleDey,UserNo' +
        ',EditUserNo,EditDate,OurFirmNo,Document_Pkey)'
      '                        values ( :Document_Id'
      '                                ,:OrderDate'
      '                                ,:TovarNo'
      '                                ,:KolOrder'
      '                                ,:Price'
      '                                ,:PriceInInst'
      '                                ,:KolOst '
      '                                ,:QtyPricePeriod'
      '                                ,:QtyPriceDay'
      '                                ,:UserNom'
      '                                ,:EditUserNom'
      '                                ,getdate()'
      '                                ,(select PostNo from d_our_firm)'
      '                                ,:Document_Pkey)'
      ''
      'if @cnt > 0'
      ' update E_PrihodOrderSpec'
      '  set  Kol = :KolOrder'
      '      ,KolSalePeriod = :QtyPricePeriod '
      '      ,KolSaleDey = :QtyPriceDay'
      '      ,EditUserNo = :EditUserNom'
      '      ,EditDate = getdate()'
      ' where Document_Pkey = :Document_Pkey'
      '   and TovarNo = :TovarNo'
      ''
      'update E_PrihodOrderHead'
      
        ' set Summa = (select sum(Kol*Price) from E_PrihodOrderSpec where' +
        ' Document_Pkey = :Document_Pkey)'
      'where Pkey = :Document_Pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '    @Document_Pkey bigint'
      '   ,@Document_Id int'
      '   ,@OrderDate datetime'
      '   ,@UserNo int'
      '   ,@EditUserNo int'
      '   ,@SPID int'
      '   ,@DataBeg datetime'
      '   ,@DataEnd datetime '
      '   ,@NameShablon varchar(30)'
      ''
      'set @Document_Pkey = :Document_Pkey'
      'set @NameShablon = :NameShablon'
      ''
      'set @SPID = :SPID'
      ''
      'set @DataBeg = :DataBeg'
      'set @DataEnd = :DataEnd'
      ''
      'set @Document_Id = :Document_Id'
      'set @OrderDate = :OrderDate'
      'set @UserNo = :UserNo'
      'set @EditUserNo = :EditUserNo'
      ''
      'select  tnp.No_pp'
      '      , pos.TovarNoPP'
      '      , t.TovarNo'
      '      , t.NameTovar'
      '      , o.Kol as KolOst'
      '      , isnull(s.QtyPricePeriod,0) as QtyPricePeriod'
      '      , isnull(s.QtyPriceDay,0) as QtyPriceDay'
      '      , t.KolPerPak'
      '      , ted.ExpirationDate'
      
        '      , isnull(case when (@Document_Pkey = 0 or @Document_Pkey =' +
        ' -1) then (select PriceInInst from PriceForVeb where TovarNo = t' +
        '.TovarNo) '
      
        '                                                                ' +
        '     else (select price from E_PrihodOrderSpec where Document_Pk' +
        'ey = @Document_Pkey and TovarNo = t.TovarNo)'
      
        '    '#9'       end,(select PriceInInst from PriceForVeb where Tovar' +
        'No = t.TovarNo)) as Price'
      
        '      , (select PriceInInst from PriceForVeb where TovarNo = t.T' +
        'ovarNo) as PriceInInst'
      
        '      , isnull(case when (@Document_Pkey = 0 or @Document_Pkey =' +
        ' -1) then  0 '
      
        '                                                                ' +
        '     else (select Kol from E_PrihodOrderSpec where Document_Pkey' +
        ' = @Document_Pkey  and TovarNo = t.TovarNo) '
      '    '#9'       end,0) as KolOrder'
      
        '      , isnull (case when (@Document_Pkey = 0 or @Document_Pkey ' +
        '= -1) then  0'
      
        #9'                                                               ' +
        '   else (case when floor((select Kol from E_PrihodOrderSpec wher' +
        'e Document_Pkey = @Document_Pkey  and TovarNo = t.TovarNo)/t.Kol' +
        'PerPak) = 0 then 1 '
      
        '                                                                ' +
        '                 else floor((select Kol from E_PrihodOrderSpec w' +
        'here Document_Pkey = @Document_Pkey  and TovarNo = t.TovarNo)/t.' +
        'KolPerPak)'
      #9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9#9'end)'
      #9'            end,0) as KolPak'
      
        '      , isnull(case when (@Document_Pkey = 0 or @Document_Pkey =' +
        ' -1) then  0 '
      
        '                                                                ' +
        '     else (select Kol from E_PrihodOrderSpec where Document_Pkey' +
        ' = @Document_Pkey  and TovarNo = t.TovarNo) '
      '    '#9'end,0)  * '
      
        '    '#9'isnull(case when (@Document_Pkey = 0 or @Document_Pkey = -1' +
        ') then (select PriceInInst from PriceForVeb where TovarNo = t.To' +
        'varNo) '
      
        '                                                                ' +
        '     else (select price from E_PrihodOrderSpec where Document_Pk' +
        'ey = @Document_Pkey  and TovarNo = t.TovarNo)'
      #9'       end,0) as Summa'
      '      , @Document_Id as Document_Id'
      '      , @Document_Pkey as Document_Pkey'
      '      , @OrderDate as OrderDate'
      '      , @UserNo as UserNom'
      '      , @EditUserNo as EditUserNom'
      '    '
      ' from Tovar t left join'
      '      Ostatok o on o.TovarNo = t.TovarNo left join'
      '      (select  article_id '
      '              ,floor(sum(qty)) as QtyPricePeriod'
      
        '              ,case when floor(sum(qty)/ case when DATEDIFF(dd, ' +
        '@DataBeg,@DataEnd) = 0 then 1'
      
        #9#9#9'                                                             ' +
        '              else DATEDIFF(dd, @DataBeg,@DataEnd) '
      #9#9#9#9#9#9#9#9#9#9' end) = 0 then 1 '
      
        '                                                  else floor(sum' +
        '(qty)/case when DATEDIFF(dd, @DataBeg,@DataEnd) = 0 then 1'
      
        #9#9#9'                                                             ' +
        '                                           else DATEDIFF(dd, @Da' +
        'taBeg,@DataEnd) '
      #9#9#9#9#9#9#9#9#9#9'                              end)'
      #9'       end as QtyPriceDay'
      '              ,DATEDIFF(dd, @DataBeg,@DataEnd) as isKolDay'
      '        from DSPEC '
      '         where entity_type  = '#39'RASHOD'#39
      '           and DOC_TYPE_ID = 12'
      '     '#9'   and DOC_DATE between @DataBeg and @DataEnd'
      
        #9'   and CONTRACTOR_ACC_ID not in (select PostNo from ListMinusPr' +
        'ihodOrder where CheckMinus = 1)'
      
        '       group by ARTICLE_ID) s on s.ARTICLE_ID = t.TovarNo left j' +
        'oin'
      
        '      TovarExpirationDate ted on ted.TovarNo = t.TovarNo left jo' +
        'in'
      '      TovarNOPP tnp on tnp.TovarNo = t.TovarNo left join'
      '      PrihodOrderShablon pos on pos.TovarNo = t.TovarNo'
      '      '
      '  where o.Kol is not null'
      '    and t.OtdelNo <> 3'
      '&_where'
      'order by &_order')
    BeforePost = quPrihodOrderSpecBeforePost
    AfterPost = quPrihodOrderSpecAfterPost
    Left = 1120
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Document_Pkey'
      end
      item
        DataType = ftUnknown
        Name = 'NameShablon'
      end
      item
        DataType = ftUnknown
        Name = 'SPID'
      end
      item
        DataType = ftUnknown
        Name = 'DataBeg'
      end
      item
        DataType = ftUnknown
        Name = 'DataEnd'
      end
      item
        DataType = ftUnknown
        Name = 'Document_Id'
      end
      item
        DataType = ftUnknown
        Name = 'OrderDate'
      end
      item
        DataType = ftUnknown
        Name = 'UserNo'
      end
      item
        DataType = ftUnknown
        Name = 'EditUserNo'
      end>
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_order'
        Value = 't.NameTovar'
      end>
    object quPrihodOrderSpecTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quPrihodOrderSpecNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 128
    end
    object quPrihodOrderSpecKolOst: TFloatField
      FieldName = 'KolOst'
    end
    object quPrihodOrderSpecQtyPricePeriod: TFloatField
      FieldName = 'QtyPricePeriod'
      ReadOnly = True
    end
    object quPrihodOrderSpecQtyPriceDay: TFloatField
      FieldName = 'QtyPriceDay'
      ReadOnly = True
    end
    object quPrihodOrderSpecKolPerPak: TSmallintField
      FieldName = 'KolPerPak'
    end
    object quPrihodOrderSpecExpirationDate: TIntegerField
      FieldName = 'ExpirationDate'
    end
    object quPrihodOrderSpecPrice: TFloatField
      FieldName = 'Price'
    end
    object quPrihodOrderSpecPriceInInst: TFloatField
      FieldName = 'PriceInInst'
      ReadOnly = True
    end
    object quPrihodOrderSpecKolOrder: TFloatField
      FieldName = 'KolOrder'
    end
    object quPrihodOrderSpecKolPak: TFloatField
      FieldName = 'KolPak'
    end
    object quPrihodOrderSpecSumma: TFloatField
      FieldName = 'Summa'
    end
    object quPrihodOrderSpecDocument_Id: TIntegerField
      FieldName = 'Document_Id'
    end
    object quPrihodOrderSpecDocument_Pkey: TLargeintField
      FieldName = 'Document_Pkey'
    end
    object quPrihodOrderSpecOrderDate: TDateTimeField
      FieldName = 'OrderDate'
    end
    object quPrihodOrderSpecUserNom: TIntegerField
      FieldName = 'UserNom'
    end
    object quPrihodOrderSpecEditUserNom: TIntegerField
      FieldName = 'EditUserNom'
    end
    object quPrihodOrderSpecNo_pp: TIntegerField
      FieldName = 'No_pp'
    end
  end
  object dsPrihodOrderSpec: TMSDataSource
    DataSet = quPrihodOrderSpec
    Left = 1144
    Top = 328
  end
  object spEditPrihodOrderShablon: TMSStoredProc
    StoredProcName = 'EditPrihodOrderShablon'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL EditPrihodOrderShablon (:TovarNo, :NameSha' +
        'blon)}')
    Left = 992
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftSmallint
        Name = 'TovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NameShablon'
        ParamType = ptInput
        Size = 30
      end>
  end
  object quListShablonName: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select distinct /*ShablonNo,*/ NameShablon from PrihodOrderShabl' +
        'on where NameShablon is not null')
    Left = 1144
  end
  object dsListShablonName: TMSDataSource
    DataSet = quListShablonName
    Left = 1120
  end
  object QuSetArtGroup: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct'
      '       l.POSTNO,'
      '       l.DAY_DELAY,'
      '       l.DAY_DELAY_EXT,'
      '       l.DAY_DELAY + l.DAY_DELAY_EXT as ExtDelay,'
      '       convert(char(19),d.ID) + convert(char(1),l.buh) as id,'
      '       d.id as SET_ARTICLE_GROUP_ID,'
      '       d.NAME,'
      '       p.Name as NamePost,'
      '       l.Buh,'
      '       d.NAME +'#39' ('#39'+dbt.Buh_type_name+'#39')'#39' as FullName'
      ' from L_POST_SET_ARTGROUP_DELAY l left join'
      
        '      D_SET_ARTICLE_GROUP d on l.SET_ARTICLE_GROUP_ID = d.ID lef' +
        't join'
      '      Post p on l.POSTNO = p.PostNo left join'
      '      d_buh_type dbt on dbt.buh = l.BUH'
      '  where p.Name = Isnull(:NamePost,p.Name)'
      '    and d.Name = Isnull(:NameGroup,d.Name)')
    Left = 1136
    Top = 219
    ParamData = <
      item
        DataType = ftString
        Name = 'NamePost'
      end
      item
        DataType = ftString
        Name = 'NameGroup'
      end>
    object QuSetArtGroupPOSTNO: TLargeintField
      FieldName = 'POSTNO'
    end
    object QuSetArtGroupDAY_DELAY: TIntegerField
      FieldName = 'DAY_DELAY'
    end
    object QuSetArtGroupDAY_DELAY_EXT: TIntegerField
      FieldName = 'DAY_DELAY_EXT'
    end
    object QuSetArtGroupExtDelay: TIntegerField
      FieldName = 'ExtDelay'
      ReadOnly = True
    end
    object QuSetArtGroupNAME: TStringField
      FieldName = 'NAME'
      Size = 512
    end
    object QuSetArtGroupNamePost: TStringField
      FieldName = 'NamePost'
      Size = 30
    end
    object QuSetArtGroupFullName: TStringField
      FieldName = 'FullName'
      ReadOnly = True
      Size = 535
    end
    object QuSetArtGroupBuh: TLargeintField
      FieldName = 'Buh'
    end
    object QuSetArtGroupid: TStringField
      FieldName = 'id'
      ReadOnly = True
      FixedChar = True
      Size = 21
    end
    object QuSetArtGroupSET_ARTICLE_GROUP_ID: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID'
    end
  end
  object dsSetArtGroup: TMSDataSource
    DataSet = QuSetArtGroup
    Left = 1136
    Top = 195
  end
  object quDelayForNaklP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct'
      '       l.POSTNO,'
      '       l.DAY_DELAY,'
      '       l.DAY_DELAY_EXT,'
      '       l.DAY_DELAY + l.DAY_DELAY_EXT as ExtDelay,'
      '       convert(char(19),d.ID) + convert(char(1),l.buh) as id,'
      '       d.id as SET_ARTICLE_GROUP_ID,'
      '       d.NAME,'
      '       p.Name as NamePost,'
      '       l.Buh,'
      '       d.NAME +'#39' ('#39'+dbt.Buh_type_name+'#39')'#39' as FullName'
      ' from L_POST_SET_ARTGROUP_DELAY l left join'
      
        '      D_SET_ARTICLE_GROUP d on l.SET_ARTICLE_GROUP_ID = d.ID lef' +
        't join'
      '      Post p on l.POSTNO = p.PostNo left join'
      '      d_buh_type dbt on dbt.buh = l.BUH'
      '  where p.PostNo = Isnull(:PostNo,p.PostNo)'
      '    and l.BUH = Isnull(:Buh,l.BUH)')
    Left = 1000
    Top = 289
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end
      item
        DataType = ftSmallint
        Name = 'Buh'
      end>
    object quDelayForNaklPid: TStringField
      FieldName = 'id'
      ReadOnly = True
      FixedChar = True
    end
    object quDelayForNaklPPOSTNO: TLargeintField
      FieldName = 'POSTNO'
    end
    object quDelayForNaklPDAY_DELAY: TIntegerField
      FieldName = 'DAY_DELAY'
    end
    object quDelayForNaklPDAY_DELAY_EXT: TIntegerField
      FieldName = 'DAY_DELAY_EXT'
    end
    object quDelayForNaklPExtDelay: TIntegerField
      FieldName = 'ExtDelay'
      ReadOnly = True
    end
    object quDelayForNaklPSET_ARTICLE_GROUP_ID: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID'
    end
    object quDelayForNaklPNAME: TStringField
      FieldName = 'NAME'
      Size = 512
    end
    object quDelayForNaklPNamePost: TStringField
      FieldName = 'NamePost'
      Size = 30
    end
    object quDelayForNaklPBuh: TLargeintField
      FieldName = 'Buh'
    end
    object quDelayForNaklPFullName: TStringField
      FieldName = 'FullName'
      ReadOnly = True
      Size = 535
    end
  end
  object dsDelayForNaklP: TMSDataSource
    DataSet = quDelayForNaklP
    Left = 1024
    Top = 289
  end
end
