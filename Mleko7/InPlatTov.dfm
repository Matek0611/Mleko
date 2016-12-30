inherited fmEditPlat: TfmEditPlat
  Left = 789
  Top = 111
  ActiveControl = RxDBGrid1
  BorderStyle = bsDialog
  Caption = #1054#1087#1083#1072#1090#1072' '#1079#1072' '#1090#1086#1074#1072#1088
  ClientHeight = 481
  ClientWidth = 744
  ParentFont = True
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel [0]
    Left = 426
    Top = 188
    Width = 52
    Height = 26
    Caption = #1053#1077' '#1074#1083#1080#1103#1090#1100' '#1085#1072' '#1076#1086#1083#1075
    WordWrap = True
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 451
    Width = 744
    Height = 30
    Align = alBottom
    TabOrder = 2
    object bbOk: TBitBtn
      Left = 296
      Top = 3
      Width = 75
      Height = 23
      Caption = 'OK'
      TabOrder = 0
      OnClick = bbOkClick
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
    object bbCancel: TBitBtn
      Left = 376
      Top = 3
      Width = 75
      Height = 23
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 280
    Width = 744
    Height = 171
    Align = alBottom
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object ScrollBox: TScrollBox
      Left = 6
      Top = 6
      Width = 732
      Height = 159
      HorzScrollBar.Margin = 6
      HorzScrollBar.Range = 331
      VertScrollBar.Margin = 6
      VertScrollBar.Range = 84
      Align = alClient
      AutoScroll = False
      BorderStyle = bsNone
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 6
        Width = 34
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object Label4: TLabel
        Left = 290
        Top = 5
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
        FocusControl = EditDate
      end
      object Label5: TLabel
        Left = 364
        Top = 3
        Width = 34
        Height = 13
        Caption = #1057#1091#1084#1084#1072
        FocusControl = EditSumma
      end
      object Label6: TLabel
        Left = 4
        Top = 119
        Width = 43
        Height = 13
        Caption = #1057#1087#1088#1072#1074#1082#1072
        FocusControl = EditSpravka
      end
      object Label2: TLabel
        Left = 60
        Top = 8
        Width = 43
        Height = 13
        Caption = #1055#1072#1088#1090#1085#1077#1088
      end
      object Label3: TLabel
        Left = 577
        Top = 2
        Width = 53
        Height = 13
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      end
      object Label7: TLabel
        Left = 479
        Top = 2
        Width = 19
        Height = 13
        Caption = #1058#1080#1087
      end
      object Label9: TLabel
        Left = 6
        Top = 51
        Width = 87
        Height = 13
        Caption = #1042#1072#1083#1102#1090#1072' '#1087#1083#1072#1090#1077#1078#1072':'
      end
      object Label10: TLabel
        Left = 230
        Top = 51
        Width = 115
        Height = 13
        Caption = #1050#1091#1088#1089' '#1074#1072#1083#1102#1090#1099' '#1087#1083#1072#1090#1077#1078#1072':'
      end
      object Label11: TLabel
        Left = 3
        Top = 83
        Width = 71
        Height = 13
        Caption = #1042#1072#1083#1102#1090#1072' '#1091#1095#1077#1090#1072':'
      end
      object Label12: TLabel
        Left = 231
        Top = 82
        Width = 99
        Height = 13
        Caption = #1050#1091#1088#1089' '#1074#1072#1083#1102#1090#1099' '#1091#1095#1077#1090#1072':'
      end
      object Label13: TLabel
        Left = 3
        Top = 105
        Width = 116
        Height = 13
        Caption = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083#1102#1090#1077' '#1091#1095#1077#1090#1072':'
        FocusControl = EditSummaAccounting
      end
      object EditDate: TDBEdit
        Left = 290
        Top = 20
        Width = 68
        Height = 21
        AutoSelect = False
        DataField = 'DatePlat'
        DataSource = dsPlatP
        MaxLength = 10
        TabOrder = 2
        OnExit = EditDateExit
      end
      object EditSumma: TDBEdit
        Left = 364
        Top = 19
        Width = 109
        Height = 21
        DataField = 'Summa'
        DataSource = dsPlatP
        ReadOnly = True
        TabOrder = 3
      end
      object EditSpravka: TDBEdit
        Left = 4
        Top = 134
        Width = 425
        Height = 21
        DataField = 'Spravka'
        DataSource = dsPlatP
        TabOrder = 10
      end
      object deNom: TDBEdit
        Left = 8
        Top = 21
        Width = 49
        Height = 21
        DataField = 'Nom'
        DataSource = dsPlatP
        TabOrder = 0
      end
      object lcPost: TDBLookupComboBox
        Left = 60
        Top = 21
        Width = 225
        Height = 21
        DataField = 'PostNo'
        DataSource = dsPlatP
        KeyField = 'PostNo'
        ListField = 'Name'
        ListSource = DSPost
        TabOrder = 1
      end
      object lcTipNakl: TDBLookupComboBox
        Left = 479
        Top = 18
        Width = 89
        Height = 21
        DataField = 'Buh'
        DataSource = dsPlatP
        KeyField = 'buh'
        ListField = 'Buh_type_name'
        ListSource = DSBuh
        TabOrder = 4
      end
      object lcSotrud: TDBLookupComboBox
        Left = 577
        Top = 18
        Width = 145
        Height = 21
        DataField = 'SotrudNo'
        DataSource = dsPlatP
        KeyField = 'SotrudNo'
        ListField = 'SotrudName'
        ListSource = dmDataModule.dsSotrud
        TabOrder = 5
      end
      object cbCurrencyHead: TDBLookupComboboxEh
        Left = 98
        Top = 49
        Width = 127
        Height = 21
        DataField = 'CurrencyHead'
        DataSource = dsPlatP
        EditButtons = <>
        KeyField = 'L_CODE'
        ListField = 'NAME'
        ListSource = dsCurrency
        TabOrder = 6
        Visible = True
        OnExit = cbCurrencyHeadExit
      end
      object dbeRateCurrencyHead: TDBEdit
        Left = 350
        Top = 47
        Width = 48
        Height = 21
        DataField = 'Rate'
        DataSource = dsPlatP
        ReadOnly = True
        TabOrder = 7
      end
      object cbCurrencyAccounting: TDBLookupComboboxEh
        Left = 96
        Top = 78
        Width = 127
        Height = 21
        DataField = 'CurrencyAccounting'
        DataSource = dsPlatP
        EditButtons = <>
        KeyField = 'L_CODE'
        ListField = 'NAME'
        ListSource = dsCurrencyAccounting
        TabOrder = 8
        Visible = True
        OnExit = cbCurrencyAccountingExit
      end
      object dbeRateCurrencyAccounting: TDBEdit
        Left = 351
        Top = 79
        Width = 48
        Height = 21
        TabStop = False
        DataField = 'RateCurrencyAccounting'
        DataSource = dsPlatP
        Enabled = False
        ReadOnly = True
        TabOrder = 11
      end
      object EditSummaAccounting: TDBEdit
        Left = 123
        Top = 103
        Width = 97
        Height = 21
        DataField = 'SummaCurrencyAccounting'
        DataSource = dsPlatP
        Enabled = False
        ReadOnly = True
        TabOrder = 9
      end
    end
  end
  object RxDBGrid1: TRxDBGrid [3]
    Left = 0
    Top = 0
    Width = 744
    Height = 280
    Align = alClient
    DataSource = dsDolg
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnExit = RxDBGrid1Exit
    MultiSelect = True
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'Nom'
        ReadOnly = True
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateNakl'
        ReadOnly = True
        Title.Caption = #1044#1072#1090#1072
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OtdelName'
        Title.Caption = #1054#1090#1076#1077#1083
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        ReadOnly = True
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SummaDolg'
        ReadOnly = True
        Title.Caption = #1044#1086#1083#1075
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SumOplat'
        Title.Caption = #1054#1087#1083#1072#1090#1072
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CurrencyHead'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SummaCurrencyAccounting'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SummaDolgCurrencyAccounting'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SumOplatCurrencyAccounting'
        Visible = True
      end>
  end
  object quDolg: TMSQuery
    SQLUpdate.Strings = (
      'begin'
      '  select 1'
      'end')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT   NaklR.NaklNo'
      '       , NaklR.Summa'
      '       , NaklR.SummaDolg'
      '       , NaklR.DateNakl'
      '       , CAST(0 AS decimal(18, 2)) AS SumOplat'
      '       , NaklR.Nom'
      '       , NaklR.SotrudNo'
      '       , NaklR.CurrencyHead'
      '       , NaklR.SummaCurrencyAccounting'
      '       , NaklR.SummaDolgCurrencyAccounting'
      
        '       , CAST(0 AS decimal(18, 2)) AS SumOplatCurrencyAccounting' +
        ' '
      '       , VidOtdel.OtdelName'
      ''
      ' FROM NaklR INNER JOIN'
      '      VidOtdel ON NaklR.OtdelNo = VidOtdel.OtdelNo'
      '  where (SummaDolg <> 0) '
      '    and (NaklR.PostNo = :PostNo) '
      '    and (NaklR.Buh >= :BuhB)   '
      '    and (NaklR.Buh <= :BuhE)   '
      '    and (NaklR.OurFIrmNo = :OurFirmNo)'
      'order by DateNakl,NaklNo')
    CachedUpdates = True
    BeforeOpen = quDolgBeforeOpen
    AfterInsert = quDolgAfterInsert
    BeforePost = quDolgBeforePost
    AfterPost = quDolgAfterPost
    Options.StrictUpdate = False
    Left = 286
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftSmallint
        Name = 'BuhB'
      end
      item
        DataType = ftSmallint
        Name = 'BuhE'
      end
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
      end>
    object quDolgNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quDolgNom: TIntegerField
      FieldName = 'Nom'
    end
    object quDolgSumma: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '0.00'
    end
    object quDolgSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      DisplayFormat = '0.00'
    end
    object quDolgDateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object quDolgSumOplat: TFloatField
      FieldName = 'SumOplat'
      OnChange = quDolgSumOplatChange
      DisplayFormat = '0.00'
    end
    object quDolgSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
    end
    object quDolgOtdelName: TStringField
      FieldName = 'OtdelName'
      FixedChar = True
      Size = 30
    end
    object quDolgCurrencyHead: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
      FieldName = 'CurrencyHead'
      Size = 5
    end
    object quDolgSummaCurrencyAccounting: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1074' '#1042#1059
      FieldName = 'SummaCurrencyAccounting'
    end
    object quDolgSummaDolgCurrencyAccounting: TFloatField
      DisplayLabel = #1044#1086#1083#1075' '#1074' '#1042#1059
      FieldName = 'SummaDolgCurrencyAccounting'
    end
    object quDolgSumOplatCurrencyAccounting: TFloatField
      DisplayLabel = #1054#1087#1083#1072#1090#1072' '#1042#1059
      FieldName = 'SumOplatCurrencyAccounting'
      DisplayFormat = '0.00'
    end
  end
  object dsDolg: TDataSource
    DataSet = quDolg
    Left = 22
    Top = 15
  end
  object quMaxNom: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select max(nom) Nom from PlatP '
      'where Buh=:Buh')
    Left = 374
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Buh'
      end>
    object quMaxNomNom: TIntegerField
      FieldName = 'Nom'
    end
  end
  object quRashod: TMSQuery
    SQLInsert.Strings = (
      'insert into Rashod'
      '  (KolOpl)'
      'values'
      '  (:KolOpl)')
    SQLDelete.Strings = (
      'delete from Rashod'
      'where'
      '  NaklNo = :OLD_NaklNo and'
      '  RasNo = :OLD_RasNo')
    SQLUpdate.Strings = (
      'update Rashod'
      'set'
      '  KolOpl = :KolOpl'
      'where'
      '  NaklNo = :OLD_NaklNo and'
      '  RasNo = :OLD_RasNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select R.NaklNo,R.RasNo,T.NameTovarShort,'
      
        '       R.Kol,R.KolOpl,R.PriceOut,R.TovarNo,isnull(twn.WithNoNDS,' +
        '0) as WithNoNDS, isnull(tn.IsStavNDS,0) as IsStavNDS'
      ' from Rashod r inner join '
      '      Tovar t on t.TovarNo = r.TovarNo left join '
      '      TovarWithNoNDS twn on twn.TovarNo = T.TovarNo left join'
      '      TovarNDS tn on tn.TovarNo = t.TovarNo'
      '  where (R.NaklNo = :NaklNo)'
      '/*'
      'select Rashod.NaklNo,Rashod.RasNo,Tovar.NameTovarShort,'
      
        '       Rashod.Kol,Rashod.KolOpl,Rashod.PriceOut,Rashod.TovarNo,i' +
        'snull(TovarWithNoNDS.WithNoNDS,0) as WithNoNDS'
      ' from Tovar,Rashod,TovarWithNoNDS'
      '  where (Rashod.NaklNo = :NaklNo) '
      '    and (Tovar.TovarNo = Rashod.TovarNo)'
      '    and (Tovar.TovarNo = TovarWithNoNDS.TovarNo)'
      'order by RasNo'
      '*/')
    CachedUpdates = True
    MasterSource = dsDolg
    Left = 110
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
      end>
    object quRashodNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quRashodRasNo: TSmallintField
      FieldName = 'RasNo'
    end
    object quRashodNameTovarShort: TStringField
      FieldName = 'NameTovarShort'
      Size = 14
    end
    object quRashodPriceOut: TFloatField
      FieldName = 'PriceOut'
      Origin = 'Rashod.PriceOut'
    end
    object quRashodKol: TFloatField
      FieldName = 'Kol'
      Origin = 'Rashod.Kol'
    end
    object quRashodKolOpl: TFloatField
      FieldName = 'KolOpl'
      Origin = 'Rashod.KolOpl'
    end
    object quRashodTovarNo: TSmallintField
      FieldName = 'TovarNo'
      Origin = 'Rashod.TovarNo'
    end
    object quRashodWithNoNDS: TBooleanField
      FieldName = 'WithNoNDS'
      ReadOnly = True
    end
    object quRashodIsStavNDS: TBooleanField
      FieldName = 'IsStavNDS'
      ReadOnly = True
    end
  end
  object quSaleCash: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'insert into SaleCash'
      ' (DateTimeSale,TovarNo,Kol,Price,NaklNo)'
      'values'
      ' (:DateTimeSale,:TovarNo,:Kol,:Price,:NaklNo)')
    Left = 198
    Top = 111
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateTimeSale'
      end
      item
        DataType = ftUnknown
        Name = 'TovarNo'
      end
      item
        DataType = ftUnknown
        Name = 'Kol'
      end
      item
        DataType = ftUnknown
        Name = 'Price'
      end
      item
        DataType = ftUnknown
        Name = 'NaklNo'
      end>
  end
  object quNaklR: TMSQuery
    SQLInsert.Strings = (
      'insert into NaklR'
      '  (PostNo, Buh, RealDateOpl, DateNakl)'
      'values'
      '  (:PostNo, :Buh, :RealDateOpl, :DateNakl)')
    SQLDelete.Strings = (
      'delete from NaklR'
      'where'
      '  NaklNo = :OLD_NaklNo')
    SQLUpdate.Strings = (
      'update NaklR'
      'set'
      '  PostNo = :PostNo,'
      '  Buh = :Buh,'
      '  RealDateOpl = :RealDateOpl,'
      '  DateNakl = :DateNakl,'
      '  AddressNo = :AddressNo'
      'where'
      '  NaklNo = :OLD_NaklNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select NaklNo,PostNo,Buh,RealDateOpl,DateNakl,AddressNo'
      'from NaklR'
      'where NaklNo=:NaklNo'
      'and NaklR.OurFIrmNo= :OurFirmNo')
    BeforeOpen = quNaklRBeforeOpen
    Options.StrictUpdate = False
    Left = 22
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
      end
      item
        DataType = ftUnknown
        Name = 'OurFirmNo'
      end>
    object quNaklRNaklNo: TIntegerField
      FieldName = 'NaklNo'
      Origin = 'NaklR.NaklNo'
    end
    object quNaklRPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'NaklR.PostNo'
    end
    object quNaklRBuh: TSmallintField
      FieldName = 'Buh'
      Origin = 'NaklR.Buh'
    end
    object quNaklRRealDateOpl: TDateTimeField
      FieldName = 'RealDateOpl'
      Origin = 'NaklR.RealDateOpl'
    end
    object quNaklRDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklR.DateNakl'
    end
    object quNaklRAddressNo: TSmallintField
      FieldName = 'AddressNo'
      Origin = 'BASE.NaklR.AddressNo'
    end
  end
  object quPlatP: TMSQuery
    SQLInsert.Strings = (
      'DECLARE @return_value   INT'
      ''
      'EXEC  @return_value = sp_AddEntity'
      '    @p_Entity_type = '#39'PLATP'#39','
      '    @p_Nom = NULL,'
      '    @p_PostNo = :PostNo,'
      '    @p_PostNoFirst = :PostNoFirst,'
      '    @p_DatePlat = :DatePlat,'
      '    @p_Summa = :Summa,'
      '    @p_Buh = :Buh,'
      '    @p_Spravka = :Spravka,'
      '    @p_TipPlat = 1,'
      '    @p_UserNo = :UserNo,'
      '    @p_SotrudNo = :SotrudNo,'
      '    @p_bank_invoice_id = NULL,'
      '    @p_activity_type_id = 17,'
      '    @p_response_dept_id = 17,'
      '    @p_VidRashodNo = 49,'
      '    @p_OtdelNo = 4,'
      '    @p_our_firmNo = :OurFirmNo,'
      '    @p_is_econom = 0,'
      '    @p_Rate = :Rate,'
      '    @p_l_code = :CurrencyHead,'
      '    @p_CurrencyAccounting = :CurrencyAccounting,'
      '    @p_RateCurrencyAccounting = :RateCurrencyAccounting,'
      '    @p_SummaCurrencyAccounting = :SummaCurrencyAccounting,'
      '    @p_Pkey = :Pkey OUT')
    SQLDelete.Strings = (
      'EXEC  dbo.sp_DelEntity   @Pkey = :Pkey')
    SQLUpdate.Strings = (
      'DECLARE @return_value   INT'
      ''
      'EXEC  @return_value = sp_EditEntity'
      '    @p_Entity_type = '#39'PLATP'#39','
      '    @p_Nom = NULL,'
      '    @p_PostNo = :PostNo,'
      '    @p_PostNoFirst = :PostNoFirst,'
      '    @p_DatePlat = :DatePlat,'
      '    @p_Summa = :Summa,'
      '    @p_Buh = :Buh,'
      '    @p_Spravka = :Spravka,'
      '    @p_TipPlat = 1,'
      '    @p_UserNo = :UserNo,'
      '    @p_SotrudNo = :SotrudNo,'
      '    @p_bank_invoice_id = NULL,'
      '    @p_activity_type_id = 17,'
      '    @p_response_dept_id = 17,'
      '    @p_VidRashodNo = 49,'
      '    @p_OtdelNo = 4,'
      '    @p_our_firmNo = :OurFirmNo,'
      '    @p_is_econom = 0,'
      '    @p_l_code = :CurrencyHead,'
      '    @p_CurrencyAccounting = :CurrencyAccounting,'
      '    @p_RateCurrencyAccounting = :RateCurrencyAccounting,'
      '    @p_SummaCurrencyAccounting = :SummaCurrencyAccounting,'
      '    @p_Pkey = :Pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT PlatP.PlatNo'
      '      ,PlatP.DatePlat'
      '      ,PlatP.Nom'
      '      ,PlatP.PostNo'
      '      ,PlatP.PostNoFirst'
      '      ,PlatP.Summa'
      '      ,PlatP.Buh'
      '      ,PlatP.SotrudNo'
      '      ,PlatP.Spravka'
      '      ,PlatP.UserNo'
      '      ,PlatP.SummaDolg'
      '      ,PlatP.FreeSumma'
      '      ,PlatP.OurFirmNo'
      '      ,PlatP.Pkey'
      '      ,PlatP.CurrencyHead'
      '      ,PlatP.Rate'
      '      ,PlatP.CurrencyAccounting'
      '      ,PlatP.RateCurrencyAccounting'
      '      ,PlatP.SummaCurrencyAccounting'
      '  FROM    PlatP'
      ' WHERE PlatP.Pkey = :pPkey')
    BeforeUpdateExecute = quPlatPBeforeUpdateExecute
    AfterUpdateExecute = quPlatPAfterUpdateExecute
    AfterPost = quPlatPAfterPost
    OnNewRecord = quPlatPNewRecord
    Options.StrictUpdate = False
    Left = 22
    Top = 111
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'pPkey'
        ParamType = ptInputOutput
        Value = -1
      end>
  end
  object dsPlatP: TDataSource
    DataSet = quPlatP
    Left = 110
    Top = 15
  end
  object quTipNakl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select TipNo,TipName'
      'from TipNakl'
      'order by TipNo')
    Left = 374
    Top = 15
    object quTipNaklTipNo: TSmallintField
      FieldName = 'TipNo'
      Origin = 'TipNakl.TipNo'
    end
    object quTipNaklTipName: TStringField
      FieldName = 'TipName'
      Origin = 'TipNakl.TipName'
      Size = 10
    end
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Options.StrictUpdate = False
    Left = 198
    Top = 15
  end
  object quPodotchetList: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     *'
      'FROM         PodotchetR'
      'WHERE     (NaklNo = :NaklNo) AND (Summa <> SummaPlat)')
    Left = 286
    Top = 63
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NaklNo'
      end>
    object quPodotchetListPodotchetRNo: TSmallintField
      FieldName = 'PodotchetRNo'
      Origin = 'BASE.PodotchetR.PodotchetRNo'
    end
    object quPodotchetListSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
      Origin = 'BASE.PodotchetR.SotrudNo'
    end
    object quPodotchetListNaklNo: TIntegerField
      FieldName = 'NaklNo'
      Origin = 'BASE.PodotchetR.NaklNo'
    end
    object quPodotchetListDatePodotche: TDateTimeField
      FieldName = 'DatePodotche'
      Origin = 'BASE.PodotchetR.DatePodotche'
    end
    object quPodotchetListSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'BASE.PodotchetR.Summa'
    end
    object quPodotchetListSummaPlat: TFloatField
      FieldName = 'SummaPlat'
      Origin = 'BASE.PodotchetR.SummaPlat'
    end
    object quPodotchetListPodotchetNom: TStringField
      FieldName = 'PodotchetNom'
      Origin = 'BASE.PodotchetR.PodotchetNom'
      FixedChar = True
      Size = 10
    end
  end
  object quPodotchetP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'INSERT INTO PodotchetP'
      
        '                      (PodotchetPNo, SotrudNo, PodotchetRNo, Dat' +
        'ePlat, Summa)'
      
        'VALUES     (:PodotchetPNo, :SotrudNo, :PodotchetRNo, :DatePlat, ' +
        ':Summa)')
    Left = 374
    Top = 63
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PodotchetPNo'
      end
      item
        DataType = ftUnknown
        Name = 'SotrudNo'
      end
      item
        DataType = ftUnknown
        Name = 'PodotchetRNo'
      end
      item
        DataType = ftUnknown
        Name = 'DatePlat'
      end
      item
        DataType = ftUnknown
        Name = 'Summa'
      end>
  end
  object quPodotchetR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     PodotchetR.PodotchetRNo, PodotchetR.DatePodotche, Nak' +
        'lR.Nom, Post.Name, NaklR.DateNaklFirst, '
      
        '                      PodotchetR.Summa - PodotchetR.SummaPlat AS' +
        ' SummaDolg, PodotchetR.SotrudNo'
      'FROM         PodotchetR INNER JOIN'
      
        '                      NaklR ON PodotchetR.NaklNo = NaklR.NaklNo ' +
        'INNER JOIN'
      '                      Post ON NaklR.PostNo = Post.PostNo'
      
        'WHERE     (PodotchetR.SummaPlat <> PodotchetR.Summa) AND (Podotc' +
        'hetR.SotrudNo = :SotrudNo)'
      'ORDER BY PodotchetR.DatePodotche')
    Left = 110
    Top = 63
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SotrudNo'
      end>
    object quPodotchetRPodotchetRNo: TSmallintField
      FieldName = 'PodotchetRNo'
    end
    object quPodotchetRDatePodotche: TDateTimeField
      FieldName = 'DatePodotche'
    end
    object quPodotchetRNom: TIntegerField
      FieldName = 'Nom'
    end
    object quPodotchetRName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object quPodotchetRDateNaklFirst: TDateTimeField
      FieldName = 'DateNaklFirst'
    end
    object quPodotchetRSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
    object quPodotchetRSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
    end
  end
  object quArticle: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     TovarNo, Article_0, Article_1'
      'FROM         Articles'
      'WHERE     (TovarNo = :TovarNo)')
    Left = 198
    Top = 63
    ParamData = <
      item
        DataType = ftString
        Name = 'TovarNo'
        Size = 1
        Value = '1'
      end>
    object quArticleTovarNo: TSmallintField
      FieldName = 'TovarNo'
      Origin = 'BASE.Articles.TovarNo'
    end
    object quArticleArticle_0: TSmallintField
      FieldName = 'Article_0'
      Origin = 'BASE.Articles.Article_0'
    end
    object quArticleArticle_1: TSmallintField
      FieldName = 'Article_1'
      Origin = 'BASE.Articles.Article_1'
    end
  end
  object mdSpravka: TRxMemoryData
    FieldDefs = <>
    Left = 110
    Top = 207
    object mdSpravkaNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object mdSpravkaSumma: TFloatField
      FieldName = 'Summa'
    end
  end
  object spModify_Plat_Nakl_link: TMSStoredProc
    StoredProcName = 'sp_Modify_Plat_Nakl_link;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Modify_Plat_Nakl_link;1(:p_ID, :p_entit' +
        'yNo_1, :p_entityNo_2, :p_Entity_Type_1, :p_Entity_Type_2, :p_Lin' +
        'k_Summa, :p_UserNo, :p_Link_SummaCurrencyAccounting)}')
    Left = 198
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'p_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_entityNo_1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_entityNo_2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_Entity_Type_1'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftString
        Name = 'p_Entity_Type_2'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftFloat
        Name = 'p_Link_Summa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_UserNo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_Link_SummaCurrencyAccounting'
        ParamType = ptInput
      end>
  end
  object DSBuh: TDataSource
    DataSet = QuBuh
    Left = 254
    Top = 303
  end
  object QuBuh: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from d_buh_type')
    Left = 254
    Top = 255
  end
  object quPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from Post'
      'where Post.Trash=0 and Post.Visible=0'
      'order by Name')
    Left = 190
    Top = 207
  end
  object DSPost: TDataSource
    DataSet = quPost
    Left = 254
    Top = 215
  end
  object dsCurrency: TMSDataSource
    DataSet = quCurrency
    Left = 446
    Top = 330
  end
  object quCurrency: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_currency')
    Left = 478
    Top = 330
    object quCurrencyNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object quCurrencyL_CODE: TStringField
      FieldName = 'L_CODE'
      Size = 3
    end
  end
  object dsCurrencyAccounting: TMSDataSource
    DataSet = quCurrencyAccounting
    Left = 446
    Top = 362
  end
  object quCurrencyAccounting: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_currency')
    Left = 478
    Top = 362
    object StringField1: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'L_CODE'
      Size = 3
    end
  end
end
