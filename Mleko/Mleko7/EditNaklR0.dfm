inherited fmEditNaklR: TfmEditNaklR
  Left = 431
  Top = 222
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1072#1089#1093#1086#1076#1085#1072#1103' '#1085#1072#1082#1083#1072#1076#1085#1072#1103
  ClientHeight = 557
  ClientWidth = 990
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 29
    Width = 990
    Height = 134
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    OnExit = Panel1Exit
    object scrlbx: TScrollBox
      Left = 1
      Top = 0
      Width = 984
      Height = 137
      TabOrder = 0
      OnExit = ScrollBoxExit
      object lblSet: TLabel
        Left = 170
        Top = 107
        Width = 66
        Height = 26
        Caption = #1053#1072#1073#1086#1088' '#1075#1088#1091#1087#1087' '#1090#1086#1074#1072#1088#1086#1074
        WordWrap = True
      end
      object lbl6: TLabel
        Left = 646
        Top = 36
        Width = 66
        Height = 13
        Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
      end
      object lbl5: TLabel
        Left = 775
        Top = 1
        Width = 78
        Height = 13
        Caption = #1044#1072#1090#1072' '#1079#1072#1082#1088#1099#1090#1080#1103
      end
      object lbl4: TLabel
        Left = 642
        Top = 74
        Width = 210
        Height = 29
        AutoSize = False
        Caption = 'lbl4'
        WordWrap = True
      end
      object lbl3: TLabel
        Left = 643
        Top = 1
        Width = 34
        Height = 13
        Caption = #1057#1091#1084#1084#1072
      end
      object lbl2: TLabel
        Left = 718
        Top = 1
        Width = 26
        Height = 13
        Caption = #1044#1086#1083#1075
      end
      object lbl1: TLabel
        Left = 734
        Top = 36
        Width = 73
        Height = 13
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      end
      object lbl7: TLabel
        Left = 282
        Top = 42
        Width = 53
        Height = 13
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      end
      object lbl8: TLabel
        Left = 432
        Top = 42
        Width = 19
        Height = 13
        Caption = #1058#1080#1087
      end
      object lbl9: TLabel
        Left = 11
        Top = 42
        Width = 19
        Height = 13
        Caption = #1042#1080#1076
      end
      object lbl10: TLabel
        Left = 153
        Top = 3
        Width = 59
        Height = 13
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      end
      object lbl11: TLabel
        Left = 71
        Top = 3
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object lbl12: TLabel
        Left = 522
        Top = 42
        Width = 31
        Height = 13
        Caption = #1054#1090#1076#1077#1083
      end
      object lbl13: TLabel
        Left = 375
        Top = 3
        Width = 48
        Height = 13
        Caption = #1058#1080#1087' '#1094#1077#1085#1099
      end
      object lbl14: TLabel
        Left = 166
        Top = 87
        Width = 81
        Height = 13
        Caption = #1040#1076#1088#1077#1089' '#1076#1086#1089#1090#1072#1074#1082#1080
      end
      object lbl15: TLabel
        Left = 11
        Top = 3
        Width = 11
        Height = 13
        Caption = #8470
      end
      object Label3: TLabel
        Left = 12
        Top = 82
        Width = 69
        Height = 13
        Caption = #1058#1080#1087' '#1074#1086#1079#1074#1088#1072#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 859
        Top = 1
        Width = 113
        Height = 13
        Caption = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083#1102#1090#1077' '#1091#1095#1077#1090#1072
      end
      object Label4: TLabel
        Left = 862
        Top = 36
        Width = 105
        Height = 13
        Caption = #1044#1086#1083#1075' '#1074' '#1074#1072#1083#1102#1090#1077' '#1091#1095#1077#1090#1072
      end
      object Label5: TLabel
        Left = 866
        Top = 81
        Width = 96
        Height = 13
        Caption = #1050#1091#1088#1089' '#1074#1072#1083#1102#1090#1099' '#1091#1095#1077#1090#1072
      end
      object dblkcbbVidNaklName: TDBLookupComboBox
        Left = 11
        Top = 58
        Width = 121
        Height = 21
        DataField = 'VidNaklNo'
        DataSource = DSNaklR
        KeyField = 'VidNaklNo'
        ListField = 'VidNaklName'
        ListSource = dsVidNakl
        TabOrder = 4
        OnCloseUp = dblkcbbVidNaklNameCloseUp
        OnExit = dblkcbbVidNaklNameExit
      end
      object dblkcbbBuhName: TDBLookupComboBox
        Left = 403
        Top = 58
        Width = 85
        Height = 21
        DataField = 'Buh'
        DataSource = DSNaklR
        KeyField = 'buh'
        ListField = 'Buh_type_name'
        ListSource = DsBuhType
        TabOrder = 5
        OnClick = dblkcbbBuhNameClick
        OnExit = dblkcbbBuhNameExit
      end
      object dbedtNom: TDBEdit
        Left = 11
        Top = 19
        Width = 57
        Height = 21
        DataField = 'Nom'
        DataSource = DSNaklR
        TabOrder = 0
      end
      object dbedtName: TDBEdit
        Left = 153
        Top = 19
        Width = 218
        Height = 21
        DataField = 'Name'
        DataSource = DSNaklR
        ReadOnly = True
        TabOrder = 2
        OnChange = dbedtNameChange
        OnDblClick = dbedtNameDblClick
        OnEnter = dbedtNameEnter
        OnKeyDown = dbedtNameKeyDown
      end
      object dbedtAddress: TDBEdit
        Left = 253
        Top = 83
        Width = 385
        Height = 21
        DataField = 'Address'
        DataSource = DSNaklR
        Enabled = False
        TabOrder = 6
        OnKeyDown = deNamePostFirstKeyDown
      end
      object cbbDbLCbListPrice: TcxDBLookupComboBox
        Left = 376
        Top = 19
        DataBinding.DataField = 'ColnPrice'
        DataBinding.DataSource = DSNaklR
        Properties.KeyFieldNames = 'ColNPrice'
        Properties.ListColumns = <
          item
            FieldName = 'ColName'
          end
          item
            FieldName = 'ColNPrice'
          end>
        Properties.ListSource = DSColNPrice
        TabOrder = 3
        OnExit = cbbDbLCbListPriceExit
        Width = 145
      end
      object dbedtUserName: TDBEdit
        Left = 713
        Top = 51
        Width = 139
        Height = 21
        TabStop = False
        DataField = 'UserName'
        DataSource = DSNaklR
        ReadOnly = True
        TabOrder = 9
      end
      object dbedtSummaDolg: TDBEdit
        Left = 712
        Top = 15
        Width = 64
        Height = 21
        TabStop = False
        DataField = 'SummaDolg'
        DataSource = DSNaklR
        TabOrder = 12
      end
      object dbedtSumma: TDBEdit
        Left = 643
        Top = 15
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'Summa'
        DataSource = DSNaklR
        ReadOnly = True
        TabOrder = 13
      end
      object dbedtDateRealOpl: TDBEdit
        Left = 780
        Top = 15
        Width = 71
        Height = 21
        TabStop = False
        DataField = 'RealDateOpl'
        DataSource = DSNaklR
        TabOrder = 14
      end
      object dbedtDateOpl: TDBEdit
        Left = 644
        Top = 51
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'DateOpl'
        DataSource = DSNaklR
        TabOrder = 15
      end
      object dbedt1: TDBEdit
        Left = 645
        Top = 106
        Width = 207
        Height = 21
        DataField = 'NameReturn'
        DataSource = DSNaklR
        ReadOnly = True
        TabOrder = 16
      end
      object dbedt2: TDBEdit
        Left = 493
        Top = 57
        Width = 145
        Height = 21
        TabStop = False
        DataField = 'OtdelName'
        DataSource = DSNaklR
        Enabled = False
        TabOrder = 8
        OnKeyDown = deNamePostFirstKeyDown
      end
      object dbedt3: TDBEdit
        Left = 253
        Top = 57
        Width = 145
        Height = 21
        TabStop = False
        DataField = 'SotrudName'
        DataSource = DSNaklR
        Enabled = False
        TabOrder = 7
        OnKeyDown = deNamePostFirstKeyDown
      end
      object cxdbdtdt1: TcxDBDateEdit
        Left = 71
        Top = 19
        DataBinding.DataField = 'DateNakl'
        DataBinding.DataSource = DSNaklR
        TabOrder = 1
        Width = 78
      end
      object cbbSet: TcxDBLookupComboBox
        Left = 253
        Top = 109
        DataBinding.DataField = 'SET_ARTICLE_GROUP_ID'
        DataBinding.DataSource = DSNaklR
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = DsSetArtGroup
        Properties.OnChange = cbbSetPropertiesChange
        TabOrder = 10
        OnExit = cbbSetExit
        Width = 321
      end
      object btn1: TButton
        Left = 581
        Top = 109
        Width = 57
        Height = 21
        Caption = #1057#1087#1088#1072#1074#1082#1072
        TabOrder = 11
        OnClick = btn1Click
      end
      object bRecalculation: TButton
        Left = 525
        Top = 16
        Width = 111
        Height = 23
        Hint = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1094#1077#1085#1099
        Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
        ParentShowHint = False
        ShowHint = True
        TabOrder = 17
        OnClick = bRecalculationClick
      end
      object DBLookupComboboxEhTypeReturn: TDBLookupComboboxEh
        Left = 8
        Top = 100
        Width = 153
        Height = 21
        DataField = 'TypeReturnNo'
        DataSource = DSNaklR
        EditButtons = <>
        KeyField = 'TypeReturnNo'
        ListField = 'TypeReturnName'
        ListSource = dsTypeReturn
        TabOrder = 18
        Visible = True
        OnExit = DBLookupComboboxEhTypeReturnExit
      end
      object dbedtSummaCurrencyAccounting: TDBEdit
        Left = 859
        Top = 15
        Width = 110
        Height = 21
        TabStop = False
        DataField = 'SummaCurrencyAccounting'
        DataSource = DSNaklR
        ReadOnly = True
        TabOrder = 19
      end
      object dbedtSummaDolgCurrencyAccounting: TDBEdit
        Left = 860
        Top = 50
        Width = 107
        Height = 21
        TabStop = False
        DataField = 'SummaDolgCurrencyAccounting'
        DataSource = DSNaklR
        TabOrder = 20
      end
      object dbnedtRateCurrencyAccounting: TDBNumberEditEh
        Left = 864
        Top = 103
        Width = 103
        Height = 21
        currency = True
        DataField = 'RateCurrencyAccounting'
        DataSource = DSNaklR
        EditButtons = <>
        MaxValue = 1000.000000000000000000
        TabOrder = 21
        Visible = True
        OnChange = dbnedtRateCurrencyAccountingChange
        OnExit = dbnedtRateCurrencyAccountingExit
      end
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 533
    Width = 990
    Height = 24
    Align = alBottom
    TabOrder = 3
    object bbOk: TBitBtn
      Left = 595
      Top = 1
      Width = 75
      Height = 22
      Caption = 'OK'
      ModalResult = 1
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
      Left = 672
      Top = 1
      Width = 75
      Height = 22
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
    object Button1: TButton
      Left = 760
      Top = 0
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 5
      Top = -1
      Width = 208
      Height = 25
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1076#1072#1090#1091' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072' '#1087#1086' '#1090#1086#1074#1072#1088#1091
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object RxDBGrid1: TRxDBGrid [2]
    Left = 0
    Top = 163
    Width = 990
    Height = 370
    Align = alClient
    DataSource = dsRashod
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = RxDBGrid1CellClick
    OnKeyDown = RxDBGrid1KeyDown
    OnKeyUp = RxDBGrid1KeyUp
    TitleButtons = True
    OnTitleBtnClick = RxDBGrid1TitleBtnClick
    Columns = <
      item
        Expanded = False
        FieldName = 'order_num'
        ReadOnly = True
        Title.Caption = #8470
        Width = 26
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'article_id'
        Title.Caption = #1050#1086#1076' '#1090#1086#1074
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vid_name'
        Title.Caption = #1042#1080#1076
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'article_Name'
        ReadOnly = True
        Title.Caption = #1058#1086#1074#1072#1088
        Width = 229
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Weight'
        Title.Caption = #1042#1077#1089
        Width = 41
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'qty'
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Title.Color = clInfoBk
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE_ECO'
        Title.Caption = #1062#1077#1085#1072' '
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE_ECO_IN'
        Title.Caption = #1042#1093' '#1094#1077#1085#1072
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY_PAY'
        Title.Caption = #1054#1087#1083#1072#1095#1077#1085#1086
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateOfManufacture'
        ReadOnly = True
        Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
        Width = 107
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Currency'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PaymentPrice'
        Width = 64
        Visible = True
      end>
  end
  object ToolBar1: TToolBar [3]
    Left = 0
    Top = 0
    Width = 990
    Height = 29
    Caption = 'ToolBar1'
    Images = dmDataModule.ImageListToolBar
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = ActionGenReturn
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 2
      Action = ActionExcel
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 2
      Action = ActionPrint
    end
    object ToolButton4: TToolButton
      Left = 69
      Top = 2
      Action = ActionViewRefresh
    end
    object ToolButton8: TToolButton
      Left = 92
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 6
      Style = tbsDivider
    end
    object ToolButton7: TToolButton
      Left = 100
      Top = 2
      Action = ActionAudit
    end
    object ToolButton5: TToolButton
      Left = 123
      Top = 2
      Width = 9
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsDivider
    end
    object DbLCbStatus: TcxDBLookupComboBox
      Left = 132
      Top = 2
      TabStop = False
      DataBinding.DataField = 'Edit_Status_id'
      DataBinding.DataSource = DSNaklR
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          FieldName = 'description'
        end>
      Properties.ListSource = DSStatus
      TabOrder = 0
      Width = 232
    end
    object ToolButton6: TToolButton
      Left = 364
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 5
      Style = tbsDivider
    end
    object dbCbSvedenie: TcxDBCheckBox
      Left = 372
      Top = 2
      Caption = #1057#1074#1077#1076#1077#1085#1072
      DataBinding.DataField = 'svedenie'
      DataBinding.DataSource = DSNaklR
      ParentFont = False
      Style.BorderStyle = ebsOffice11
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.Shadow = False
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 96
    end
    object Label6: TLabel
      Left = 468
      Top = 2
      Width = 112
      Height = 22
      Caption = #1042#1072#1083#1102#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 580
      Top = 2
      Width = 42
      Height = 22
      AutoSize = True
      DataField = 'CurrencyHead'
      DataSource = DSNaklR
      OnDblClick = dbtCurrencyAccountingDblClick
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 622
      Top = 2
      Width = 121
      Height = 22
      DataField = 'CurrencyHead'
      DataSource = DSNaklR
      EditButtons = <>
      KeyField = 'L_CODE'
      ListField = 'NAME'
      ListSource = dmDataModule.dsCurrency
      TabOrder = 2
      Visible = True
      OnExit = DBLookupComboboxEh1Exit
    end
    object Label1: TLabel
      Left = 743
      Top = 2
      Width = 148
      Height = 22
      Caption = #1042#1072#1083#1102#1090#1072' '#1091#1095#1077#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbedtCurrencyAccounting: TDBEditEh
      Left = 891
      Top = 2
      Width = 70
      Height = 22
      DataField = 'CurrencyAccounting'
      DataSource = DSNaklR
      EditButtons = <>
      Enabled = False
      ReadOnly = True
      TabOrder = 3
      Visible = True
    end
  end
  inherited ActionList: TActionList
    Left = 110
    Top = 188
  end
  object dsRashod: TDataSource
    DataSet = MlekoDbDsMSSQLDm.quDSPEC
    OnStateChange = dsRashodStateChange
    OnDataChange = dsRashodDataChange
    Left = 698
    Top = 188
  end
  object ActionList1: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 28
    Top = 188
    object ActionSetReadOnly: TAction
      Caption = 'ActionSetReadOnly'
    end
    object ActionSetColNPrice: TAction
      Caption = 'ActionSetColNPrice'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1086#1083#1086#1085#1082#1091' '#1094#1077#1085#1099
    end
    object ActionGenReturn: TAction
      Caption = #1057#1087#1080#1089#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090
      Hint = #1057#1087#1080#1089#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090
      ImageIndex = 7
      OnExecute = ActionGenReturnExecute
    end
    object ActionViewRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecute
    end
    object ActionPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 42
      OnExecute = ActionPrintExecute
    end
    object ActionExcel: TAction
      Caption = #1042' Excel'
      Hint = #1042' Excel'
      ImageIndex = 14
      OnExecute = ActionExcelExecute
    end
    object ActionSvedenie: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100', '#1089#1085#1103#1090#1100' '#1089#1074#1077#1076#1077#1085#1080#1077
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100', '#1089#1085#1103#1090#1100' '#1089#1074#1077#1076#1077#1085#1080#1077
      ShortCut = 16465
      OnExecute = ActionSvedenieExecute
    end
    object ActionAudit: TAction
      Caption = #1040#1091#1076#1080#1090
      Hint = #1040#1091#1076#1080#1090
      ImageIndex = 22
      OnExecute = ActionAuditExecute
    end
    object ActionPrintTTN: TAction
      Caption = 'ActionPrintTTN'
      Hint = #1055#1077#1095#1072#1090#1100' '#1058#1086#1074#1072#1088#1085#1086'-'#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
    end
  end
  object DSColNPrice: TDataSource
    DataSet = quListPrice
    Left = 110
    Top = 236
  end
  object quListPrice: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct ColName '
      '      ,lpsagp.COLNPRICE'
      ' from L_POST_SET_ARTGROUP_PRICE lpsagp left join'
      
        '      D_Price_type dpt on lpsagp.COLNPRICE = dpt.ColNPrice inner' +
        ' join'
      '      Post p on p.PostNo = lpsagp.POSTNO'
      '  where lpsagp.COLNPRICE is not null'
      '    and lpsagp.SET_ARTICLE_GROUP_ID is not null '
      '    and lpsagp.POSTNO is not null'
      '    and p.Name = isnull (:PostName,p.Name)'
      'order by lpsagp.COLNPRICE'
      '/*'
      'Select * from d_price_type'
      'where colnprice in (1,2,3,4,5,6,7,8,9,13)'
      '*/')
    Options.StrictUpdate = False
    Left = 502
    Top = 236
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PostName'
      end>
  end
  object quStatus: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_edit_status')
    Options.StrictUpdate = False
    Left = 600
    Top = 236
  end
  object spSetStatus: TMSStoredProc
    StoredProcName = 'SP_SET_NAKLR_EDIT_STATUS;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL SP_SET_NAKLR_EDIT_STATUS;1(:p_NaklNo, :p_E' +
        'dit_Status_id)}')
    Left = 208
    Top = 284
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_NaklNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'p_Edit_Status_id'
        ParamType = ptInput
      end>
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 208
    Top = 236
  end
  object quNaklR: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '   @cnt int'
      ''
      'insert into NaklR'
      
        '  (NaklNo, Nom, PostNo, DateNakl, VidNaklNo, Buh, SotrudNo, Date' +
        'NaklFirst, '
      
        '   Ask, AddressNo, DateOpl, RealDateOpl, PostNoFirst, Weight, Ko' +
        'lPerPak, OtdelNo,'
      
        '   edit_status_id,pkey, set_article_group_id, CurrencyHead, Rate' +
        'CurrencyAccounting, CurrencyAccounting)'
      'values'
      
        '  (:NaklNo, :Nom, :PostNo, :DateNakl, :VidNaklNo, :Buh, :SotrudN' +
        'o, :DateNaklFirst, '
      
        '   :Ask, :AddressNo, :DateOpl, :RealDateOpl, :PostNoFirst, :Weig' +
        'ht, :KolPerPak,  :OtdelNo, '
      
        '   :edit_status_id,:pkey, :set_article_group_id, :CurrencyHead, ' +
        ':RateCurrencyAccounting, :CurrencyAccounting)'
      ''
      'select @cnt = count(*) from L_NaklRReturn where NaklNo = :NaklNo'
      ' if @cnt = 0'
      'insert into L_NaklRReturn (NaklNo,TypeReturnNo)'
      ' values (:NaklNo,:TypeReturnNo)'
      ''
      'update L_NaklRReturn '
      ' set TypeReturnNo = :TypeReturnNo'
      'where NaklNo = :NaklNo')
    SQLDelete.Strings = (
      'delete from NaklR'
      'where'
      '  NaklNo = :OLD_NaklNo'
      ''
      'delete L_NaklRReturn'
      'where '
      '  NaklNo = :OLD_NaklNo')
    SQLUpdate.Strings = (
      'BEGIN'
      ''
      '  DECLARE  @Old_Edit_status_id BIGINT'
      '           ,@Edit_status_id    BIGINT'
      '           ,@dhead_id          BIGINT'
      '           ,@cnt               int'
      '  SET @Edit_status_id = :Edit_status_id'
      '  SET @dhead_id = :pkey'
      ''
      '  SELECT @Old_Edit_status_id = edit_status_id'
      '  FROM   naklR'
      '  WHERE  pkey = @dhead_id'
      ''
      'update NaklR'
      'set'
      '  NaklNo = :NaklNo,'
      '  Nom = :Nom,'
      '  PostNo = :PostNo,'
      '  DateNakl = :DateNakl,'
      '  VidNaklNo = :VidNaklNo,'
      '  Buh = :Buh,'
      '  SotrudNo = :SotrudNo,'
      '  DateNaklFirst = :DateNaklFirst,'
      '  Ask = :Ask,'
      '  AddressNo = :AddressNo,'
      '  DateOpl = :DateOpl,'
      '  RealDateOpl = :RealDateOpl,'
      '  PostNoFirst = :PostNoFirst,'
      '  Weight = :Weight,'
      '  KolPerPak = :KolPerPak,'
      '  OtdelNo = :OtdelNo,'
      '  ColNPrice= :ColNPrice,'
      '  edit_status_id = @Edit_status_id,'
      '  svedenie = :svedenie,'
      '  set_article_group_id = :set_article_group_id,'
      '  CurrencyAccounting = :CurrencyAccounting, '
      '  RateCurrencyAccounting = :RateCurrencyAccounting,'
      '  CurrencyHead = :CurrencyHead'
      'WHERE  pkey = @dhead_id'
      ''
      ''
      '  IF @Edit_status_id <> @old_Edit_status_id'
      '    UPDATE dspec'
      '    SET    state_id = @Edit_status_id'
      '    WHERE  dhead_id = @dhead_id'
      ''
      ''
      'select @cnt = count(*) from L_NaklRReturn where NaklNo = :NaklNo'
      ' if @cnt = 0'
      'insert into L_NaklRReturn (NaklNo,TypeReturnNo)'
      ' values (:NaklNo,:TypeReturnNo)'
      ' if @cnt > 0'
      'update L_NaklRReturn '
      ' set TypeReturnNo = :TypeReturnNo'
      'where NaklNo = :NaklNo'
      ''
      'END')
    SQLRefresh.Strings = (
      'SELECT h.naklno'
      '       ,h.nom'
      '       ,h.nomreturn'
      '       ,h.postno'
      '       ,h.postnofirst'
      '       ,h.datenakl'
      '       ,h.datenaklfirst'
      '       ,h.summa'
      '       ,h.summadolg'
      '       ,h.sotrudno'
      '       ,h.dateopl'
      '       ,h.realdateopl'
      '       ,h.buh'
      '       ,h.vidnaklno'
      '       ,h.userno'
      '       ,h.colnprice'
      '       ,h.ask'
      '       ,h.addressno'
      '       ,h.expeditionno'
      '       ,h.weight'
      '       ,h.kolperpak'
      '       ,h.incar'
      '       ,h.otdelno'
      '       ,h.svedenie'
      '       ,h.edit_status_id'
      '       ,h.set_article_group_id'
      '       ,h.RateCurrencyAccounting '
      'FROM   naklr h left join'
      '       L_NaklRReturn l on l.NaklNo = h.NaklNo'
      'WHERE  pkey = :pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT h.NaklNo,'
      '       h.Nom,'
      '       h.PostNo,'
      '       h.DateNakl,'
      '       h.Summa,'
      '       h.SummaDolg,'
      '       h.VidNaklNo,'
      '       P1.Name,'
      '       h.ColnPrice,'
      '       h.Buh,'
      '       h.SotrudNo,'
      '       s.SotrudName,'
      '       Users.UserName,'
      '       h.DateNaklFirst,'
      '       h.Ask,'
      '       h.AddressNo,'
      '       P2.Name AS NameFirst,'
      '       h.DateOpl,'
      '       h.RealDateOpl,'
      '       h.PostNoFirst,'
      '       AddressPost.Address,'
      '       h.Weight,'
      '       h.KolPerPak,'
      '       VidOtdel.OtdelName,'
      '       h.OtdelNo,'
      '       Post_1.Name AS NameReturn,'
      '       h.NomReturn,'
      '       P1.Print3,'
      '       h.InCar,'
      '       h.ExpeditionNo,'
      
        '       P2.Name + '#39' ('#39' + AddressPost.Address + '#39')'#39' AS NameAddress' +
        ','
      
        '       (SELECT name FROM d_edit_status WHERE id = h.edit_status_' +
        'id) AS Edit_status_name,'
      '       h.Edit_Status_id,'
      '       h.UserNo,'
      '       h.ask,'
      '       v.ViDNaklName,'
      '       h.Pkey,'
      '       h.svedenie,'
      
        '      (select name from D_SET_ARTICLE_GROUP where id=h.SET_ARTIC' +
        'LE_GROUP_ID) as SET_ARTICLE_GROUP_NAME'
      '      ,h.SET_ARTICLE_GROUP_ID'
      '      ,l.TypeReturnNo'
      
        '      ,(select TypeReturnName from d_TypeReturn where TypeReturn' +
        'No = L.TypeReturnNo) as TypeReturnName'
      '      ,h.CurrencyHead'
      '      ,h.CurrencyAccounting'
      '      ,h.SummaCurrencyAccounting'
      '      ,h.SummaDolgCurrencyAccounting'
      '      ,h.RateCurrencyAccounting'
      '  FROM NaklR h'
      '  LEFT OUTER JOIN Post P1 ON P1.PostNo = h.PostNo'
      '  LEFT OUTER JOIN Post P2 ON P2.PostNo = h.PostNoFirst'
      '  LEFT OUTER JOIN Users ON Users.UserNo = h.UserNo'
      '  LEFT OUTER JOIN VidOtdel ON h.OtdelNo = VidOtdel.OtdelNo'
      
        '  LEFT OUTER JOIN AddressPost ON AddressPost.AddressNo = h.Addre' +
        'ssNo'
      '                             AND h.PostNo = AddressPost.PostNo'
      '  LEFT OUTER JOIN Post Post_1 ON h.PostNoReturn = Post_1.PostNo'
      '  LEFT OUTER JOIN Sotrud s on s.SotrudNo=h.SotrudNo'
      '  LEFT OUTER JOIN VidNakl v on v.VidNaklNo=h.VidNaklNo'
      '  LEFT OUTER JOIN L_NaklRReturn L on L.NaklNo = h.NaklNo'
      ' WHERE (h.Pkey = :dhead_id)')
    BeforeOpen = quNaklRBeforeOpen
    AfterPost = quNaklRAfterPost
    Options.StrictUpdate = False
    Left = 110
    Top = 284
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'dhead_id'
        ParamType = ptInput
        Value = -1
      end>
    object quNaklRNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quNaklRNom: TIntegerField
      FieldName = 'Nom'
    end
    object quNaklRPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quNaklRDateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object quNaklRSumma: TFloatField
      FieldName = 'Summa'
    end
    object quNaklRSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
    object quNaklRVidNaklNo: TSmallintField
      FieldName = 'VidNaklNo'
    end
    object quNaklRName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object quNaklRColnPrice: TSmallintField
      FieldName = 'ColnPrice'
    end
    object quNaklRBuh: TSmallintField
      FieldName = 'Buh'
    end
    object quNaklRSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
    end
    object quNaklRSotrudName: TStringField
      FieldName = 'SotrudName'
      Size = 30
    end
    object quNaklRUserName: TStringField
      FieldName = 'UserName'
    end
    object quNaklRDateNaklFirst: TDateTimeField
      FieldName = 'DateNaklFirst'
    end
    object quNaklRAsk: TBooleanField
      FieldName = 'Ask'
    end
    object quNaklRAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object quNaklRNameFirst: TStringField
      FieldName = 'NameFirst'
      Size = 30
    end
    object quNaklRDateOpl: TDateTimeField
      FieldName = 'DateOpl'
    end
    object quNaklRRealDateOpl: TDateTimeField
      FieldName = 'RealDateOpl'
    end
    object quNaklRPostNoFirst: TSmallintField
      FieldName = 'PostNoFirst'
    end
    object quNaklRAddress: TStringField
      FieldName = 'Address'
      Size = 256
    end
    object quNaklRWeight: TFloatField
      FieldName = 'Weight'
    end
    object quNaklRKolPerPak: TFloatField
      FieldName = 'KolPerPak'
    end
    object quNaklROtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 30
    end
    object quNaklROtdelNo: TSmallintField
      FieldName = 'OtdelNo'
    end
    object quNaklRNameReturn: TStringField
      FieldName = 'NameReturn'
      Size = 30
    end
    object quNaklRNomReturn: TLargeintField
      FieldName = 'NomReturn'
    end
    object quNaklRPrint3: TBooleanField
      FieldName = 'Print3'
    end
    object quNaklRInCar: TBooleanField
      FieldName = 'InCar'
    end
    object quNaklRExpeditionNo: TIntegerField
      FieldName = 'ExpeditionNo'
    end
    object quNaklRNameAddress: TStringField
      FieldName = 'NameAddress'
      ReadOnly = True
      Size = 289
    end
    object quNaklREdit_status_name: TStringField
      FieldName = 'Edit_status_name'
      ReadOnly = True
      Size = 50
    end
    object quNaklREdit_Status_id: TSmallintField
      FieldName = 'Edit_Status_id'
    end
    object quNaklRUserNo: TSmallintField
      FieldName = 'UserNo'
    end
    object quNaklRask_1: TBooleanField
      FieldName = 'ask_1'
    end
    object quNaklRViDNaklName: TStringField
      FieldName = 'ViDNaklName'
    end
    object quNaklRPkey: TLargeintField
      FieldName = 'Pkey'
    end
    object quNaklRsvedenie: TBooleanField
      FieldName = 'svedenie'
    end
    object quNaklRSET_ARTICLE_GROUP_NAME: TStringField
      FieldName = 'SET_ARTICLE_GROUP_NAME'
      ReadOnly = True
      Size = 512
    end
    object quNaklRSET_ARTICLE_GROUP_ID: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID'
    end
    object quNaklRTypeReturnNo: TIntegerField
      FieldName = 'TypeReturnNo'
    end
    object quNaklRTypeReturnName: TStringField
      FieldName = 'TypeReturnName'
      ReadOnly = True
      Size = 50
    end
    object quNaklRCurrencyHead: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'CurrencyHead'
      Size = 5
    end
    object quNaklRCurrencyAccounting: TStringField
      FieldName = 'CurrencyAccounting'
      Size = 5
    end
    object quNaklRSummaCurrencyAccounting: TFloatField
      FieldName = 'SummaCurrencyAccounting'
    end
    object quNaklRSummaDolgCurrencyAccounting: TFloatField
      FieldName = 'SummaDolgCurrencyAccounting'
    end
    object quNaklRRateCurrencyAccounting: TFloatField
      FieldName = 'RateCurrencyAccounting'
    end
  end
  object DSNaklR: TDataSource
    DataSet = quNaklR
    OnDataChange = DSNaklRDataChange
    Left = 404
    Top = 188
  end
  object quBuhType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '    @SET_ARTICLE_GROUP_ID bigint'
      '   ,@PostName varchar(30)'
      'set @SET_ARTICLE_GROUP_ID = :SET_ARTICLE_GROUP_ID'
      'set @PostName = :PostName'
      'Select * '
      ' from d_buh_type d'
      '  where d.buh in (select buh'
      '                   from L_POST_SET_ARTGROUP_DELAY l inner join'
      '                        Post p on l.POSTNO = p.PostNo'
      
        '                    where l.SET_ARTICLE_GROUP_ID = isnull(@SET_A' +
        'RTICLE_GROUP_ID,l.SET_ARTICLE_GROUP_ID)'
      '                      and p.Name = isnull(@PostName,p.Name))'
      '/*'
      'Select * from d_buh_type'
      '*/')
    Options.StrictUpdate = False
    Left = 28
    Top = 284
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'SET_ARTICLE_GROUP_ID'
      end
      item
        DataType = ftString
        Name = 'PostName'
      end>
  end
  object DsBuhType: TDataSource
    DataSet = quBuhType
    Left = 306
    Top = 188
  end
  object quVidNakl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from vidNakl')
    Options.AutoRefresh = True
    Left = 306
    Top = 236
    object quVidNaklVidNaklNo: TSmallintField
      FieldName = 'VidNaklNo'
    end
    object quVidNaklVidNaklName: TStringField
      FieldName = 'VidNaklName'
    end
  end
  object dsVidNakl: TDataSource
    DataSet = quVidNakl
    Left = 502
    Top = 188
  end
  object dsSotrud: TDataSource
    Left = 208
    Top = 188
  end
  object SpGetNewNom: TMSStoredProc
    StoredProcName = 'Seq_NaklR_Nom;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL Seq_NaklR_Nom;1(:id)}')
    Left = 306
    Top = 284
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInputOutput
      end>
  end
  object QuOtdel: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from vidotdel')
    Options.StrictUpdate = False
    Left = 404
    Top = 236
  end
  object DsOtdel: TDataSource
    DataSet = QuOtdel
    Left = 28
    Top = 236
  end
  object DSStatus: TDataSource
    DataSet = quStatus
    Left = 600
    Top = 188
  end
  object QuSetArtGroup: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct'
      '       l.POSTNO,'
      '       l.DAY_DELAY,'
      '       l.DAY_DELAY_EXT,'
      '       l.DAY_DELAY + l.DAY_DELAY_EXT as ExtDelay,'
      '       d.ID,'
      '       d.NAME,'
      '       p.Name as NamePost'
      ' from L_POST_SET_ARTGROUP_DELAY l left join'
      
        '      D_SET_ARTICLE_GROUP d on l.SET_ARTICLE_GROUP_ID = d.ID lef' +
        't join'
      '      Post p on l.POSTNO = p.PostNo'
      '  where p.Name = Isnull(:NamePost,p.Name)'
      '    and d.Name = Isnull(:NameGroup,d.Name)'
      ''
      '/*'
      'select * from d_set_article_group'
      'where active='#39'Y'#39
      '*/')
    Options.StrictUpdate = False
    Left = 404
    Top = 324
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NamePost'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NameGroup'
        ParamType = ptInput
      end>
  end
  object DsSetArtGroup: TDataSource
    DataSet = QuSetArtGroup
    OnDataChange = DSNaklRDataChange
    Left = 404
    Top = 292
  end
  object TTN_Query: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select TTN from Post '
      'where Name =:aa')
    Left = 120
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'aa'
      end>
  end
  object dsDayDelay: TDataSource
    DataSet = quDayDelay
    OnDataChange = DSNaklRDataChange
    Left = 502
    Top = 292
  end
  object quDayDelay: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct'
      '       l.POSTNO,'
      '       l.DAY_DELAY,'
      '       l.DAY_DELAY_EXT,'
      '       l.DAY_DELAY + l.DAY_DELAY_EXT as ExtDelay,'
      '       d.ID,'
      '       d.NAME,'
      '       p.Name as NamePost'
      ' from L_POST_SET_ARTGROUP_DELAY l left join'
      
        '      D_SET_ARTICLE_GROUP d on l.SET_ARTICLE_GROUP_ID = d.ID lef' +
        't join'
      '      Post p on l.POSTNO = p.PostNo'
      '  where p.Name = Isnull(:NamePost,p.Name)'
      '    and d.Name = Isnull(:NameGroup,d.Name)'
      ''
      '/*'
      'select * from d_set_article_group'
      'where active='#39'Y'#39
      '*/')
    Options.StrictUpdate = False
    Left = 502
    Top = 324
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NamePost'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'NameGroup'
        ParamType = ptInput
      end>
    object quDayDelayPOSTNO: TLargeintField
      FieldName = 'POSTNO'
    end
    object quDayDelayDAY_DELAY: TIntegerField
      FieldName = 'DAY_DELAY'
    end
    object quDayDelayDAY_DELAY_EXT: TIntegerField
      FieldName = 'DAY_DELAY_EXT'
    end
    object quDayDelayExtDelay: TIntegerField
      FieldName = 'ExtDelay'
      ReadOnly = True
    end
    object quDayDelayID: TLargeintField
      FieldName = 'ID'
    end
    object quDayDelayNAME: TStringField
      FieldName = 'NAME'
      Size = 512
    end
    object quDayDelayNamePost: TStringField
      FieldName = 'NamePost'
      Size = 30
    end
  end
  object sp_RecalculationNakl: TMSStoredProc
    StoredProcName = 'sp_RecalculationNakl'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_RecalculationNakl (:p_key, :ColnPrice)}')
    Left = 754
    Top = 276
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftLargeint
        Name = 'p_key'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ColnPrice'
        ParamType = ptInput
      end>
  end
  object quNaklREntity: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from'
      '(SELECT l1.id'
      
        '               ,l1.entityno_1                                   ' +
        'AS entityno'
      
        '               ,l1.entity_type_1                                ' +
        'AS entity_type'
      
        '               ,l1.entityno_2                                   ' +
        'AS entityno_plat'
      
        '               ,l1.entity_type_2                                ' +
        'AS entity_type_plat'
      '               ,l1.link_summa'
      '               ,l1.link_date'
      
        '               ,l1.userno                                       ' +
        'AS link_userno'
      
        '               ,l1.sign_2                                       ' +
        'AS plat_sign'
      '               ,l1.factor_direction'
      
        '               ,l1.factor_direction * l1.sign_2 * l1.link_summa ' +
        'AS delta'
      '               ,l1.pkey'
      '        FROM   e_plat_nakl_link l1'
      '        WHERE  l1.entityno_1 = isnull(:p_PlatNo1,l1.entityno_1)'
      
        '        AND l1.entity_type_1 = isnull(:p_LinkNaklType1,l1.entity' +
        '_type_1)'
      '        UNION ALL'
      '        SELECT l2.id'
      
        '               ,l2.entityno_2                                   ' +
        'AS entityno'
      
        '               ,l2.entity_type_2                                ' +
        'AS entity_type'
      
        '               ,l2.entityno_1                                   ' +
        'AS entityno_plat'
      
        '               ,l2.entity_type_1                                ' +
        'AS entity_type_plat'
      '               ,l2.link_summa'
      '               ,l2.link_date'
      
        '               ,l2.userno                                       ' +
        'AS link_userno'
      
        '               ,l2.sign_1                                       ' +
        'AS plat_sign'
      '               ,l2.factor_direction'
      
        '               ,l2.factor_direction * l2.sign_1 * l2.link_summa ' +
        'AS delta'
      '               ,l2.pkey'
      '        FROM   e_plat_nakl_link l2'
      '        WHERE  l2.entityno_2 = isnull(:p_PlatNo2,l2.entityno_2)'
      
        '        AND l2.entity_type_2 = isnull(:p_LinkNaklType2,l2.entity' +
        '_type_2)'
      ') l'
      '       LEFT OUTER JOIN v_entity h'
      '         ON l.entityno_plat = h.id'
      '            AND l.entity_type_plat = h.entity_type')
    Left = 696
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PlatNo1'
      end
      item
        DataType = ftString
        Name = 'p_LinkNaklType1'
      end
      item
        DataType = ftInteger
        Name = 'p_PlatNo2'
      end
      item
        DataType = ftString
        Name = 'p_LinkNaklType2'
      end>
    object quNaklREntityid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object quNaklREntityentityno: TIntegerField
      FieldName = 'entityno'
      ReadOnly = True
    end
    object quNaklREntityentity_type: TStringField
      FieldName = 'entity_type'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object quNaklREntityentityno_plat: TIntegerField
      FieldName = 'entityno_plat'
      ReadOnly = True
    end
    object quNaklREntityentity_type_plat: TStringField
      FieldName = 'entity_type_plat'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object quNaklREntitylink_summa: TFloatField
      FieldName = 'link_summa'
      ReadOnly = True
    end
    object quNaklREntitylink_date: TDateTimeField
      FieldName = 'link_date'
      ReadOnly = True
    end
    object quNaklREntitylink_userno: TIntegerField
      FieldName = 'link_userno'
      ReadOnly = True
    end
    object quNaklREntityplat_sign: TSmallintField
      FieldName = 'plat_sign'
      ReadOnly = True
    end
    object quNaklREntityfactor_direction: TSmallintField
      FieldName = 'factor_direction'
      ReadOnly = True
    end
    object quNaklREntitydelta: TFloatField
      FieldName = 'delta'
      ReadOnly = True
    end
    object quNaklREntitypkey: TLargeintField
      FieldName = 'pkey'
      ReadOnly = True
    end
    object quNaklREntityentity_type_1: TStringField
      FieldName = 'entity_type_1'
      Size = 5
    end
    object quNaklREntityentity_type_name: TStringField
      FieldName = 'entity_type_name'
      ReadOnly = True
      Size = 1024
    end
    object quNaklREntitynom: TIntegerField
      FieldName = 'nom'
    end
    object quNaklREntitypostno: TSmallintField
      FieldName = 'postno'
    end
    object quNaklREntitypost_name: TStringField
      FieldName = 'post_name'
      ReadOnly = True
      Size = 30
    end
    object quNaklREntitydateentity: TDateTimeField
      FieldName = 'dateentity'
    end
    object quNaklREntitysumma: TFloatField
      FieldName = 'summa'
    end
    object quNaklREntitybuh: TSmallintField
      FieldName = 'buh'
    end
    object quNaklREntitybuh_type_name: TStringField
      FieldName = 'buh_type_name'
      ReadOnly = True
    end
    object quNaklREntityDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 1024
    end
    object quNaklREntitydoc_type_id: TIntegerField
      FieldName = 'doc_type_id'
    end
    object quNaklREntitydoc_type_name: TStringField
      FieldName = 'doc_type_name'
      ReadOnly = True
      Size = 256
    end
    object quNaklREntityuserno: TSmallintField
      FieldName = 'userno'
    end
    object quNaklREntityusername: TStringField
      FieldName = 'username'
      ReadOnly = True
    end
    object quNaklREntitysotrudno: TIntegerField
      FieldName = 'sotrudno'
    end
    object quNaklREntitysotrudname: TStringField
      FieldName = 'sotrudname'
      ReadOnly = True
      Size = 30
    end
    object quNaklREntitybank_invoice_id: TIntegerField
      FieldName = 'bank_invoice_id'
    end
    object quNaklREntitybank_name: TStringField
      FieldName = 'bank_name'
      ReadOnly = True
      Size = 512
    end
    object quNaklREntityactivity_type_id: TSmallintField
      FieldName = 'activity_type_id'
    end
    object quNaklREntityactivity_type_name: TStringField
      FieldName = 'activity_type_name'
      ReadOnly = True
      Size = 100
    end
    object quNaklREntityanalyticaccno: TIntegerField
      FieldName = 'analyticaccno'
    end
    object quNaklREntityvidrashod_name: TStringField
      FieldName = 'vidrashod_name'
      ReadOnly = True
      Size = 50
    end
    object quNaklREntityotdelno: TIntegerField
      FieldName = 'otdelno'
    end
    object quNaklREntityotdel_name: TStringField
      FieldName = 'otdel_name'
      ReadOnly = True
      Size = 30
    end
    object quNaklREntityourfirmno: TIntegerField
      FieldName = 'ourfirmno'
    end
    object quNaklREntityourfirm_name: TStringField
      FieldName = 'ourfirm_name'
      ReadOnly = True
      Size = 30
    end
    object quNaklREntityis_econom: TIntegerField
      FieldName = 'is_econom'
    end
    object quNaklREntityentityno_1: TIntegerField
      FieldName = 'entityno_1'
    end
    object quNaklREntitycolnprice: TSmallintField
      FieldName = 'colnprice'
    end
    object quNaklREntitycolnprice_name: TStringField
      FieldName = 'colnprice_name'
      ReadOnly = True
      Size = 64
    end
    object quNaklREntityaddressno: TSmallintField
      FieldName = 'addressno'
    end
    object quNaklREntityaddress: TStringField
      FieldName = 'address'
      ReadOnly = True
      Size = 256
    end
    object quNaklREntitypostnoreturn: TSmallintField
      FieldName = 'postnoreturn'
    end
    object quNaklREntitypostreturn_name: TStringField
      FieldName = 'postreturn_name'
      ReadOnly = True
      Size = 30
    end
    object quNaklREntityid_1: TIntegerField
      FieldName = 'id_1'
    end
    object quNaklREntitykoldaydelay: TIntegerField
      FieldName = 'koldaydelay'
    end
    object quNaklREntityreason_id: TIntegerField
      FieldName = 'reason_id'
    end
    object quNaklREntityvidtovgroup_id: TIntegerField
      FieldName = 'vidtovgroup_id'
    end
    object quNaklREntityvidtovgroup_name: TStringField
      FieldName = 'vidtovgroup_name'
      ReadOnly = True
      Size = 512
    end
    object quNaklREntitycontract_id: TIntegerField
      FieldName = 'contract_id'
    end
    object quNaklREntitycontract_description: TStringField
      FieldName = 'contract_description'
      ReadOnly = True
      Size = 1024
    end
    object quNaklREntitypkey_1: TLargeintField
      FieldName = 'pkey_1'
    end
    object quNaklREntityfreesumma: TFloatField
      FieldName = 'freesumma'
    end
    object quNaklREntityentity_type_id: TIntegerField
      FieldName = 'entity_type_id'
      ReadOnly = True
    end
  end
  object quTypeReturn: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from D_TypeReturn'
      '  where Active = 1')
    Left = 760
    Top = 219
    object quTypeReturnTypeReturnNo: TIntegerField
      FieldName = 'TypeReturnNo'
      ReadOnly = True
    end
    object quTypeReturnTypeReturnName: TStringField
      FieldName = 'TypeReturnName'
      Size = 50
    end
    object quTypeReturnActive: TFloatField
      FieldName = 'Active'
    end
  end
  object dsTypeReturn: TMSDataSource
    DataSet = quTypeReturn
    Left = 791
    Top = 219
  end
  object spChackNaklR: TMSStoredProc
    StoredProcName = 'pr_Check_NaklR'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL pr_Check_NaklR (:p_Postno, :DateNakl, :SET' +
        '_ARTICLE_GROUP_ID, :err_level, :err_message)}')
    Left = 800
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftLargeint
        Name = 'p_Postno'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'SET_ARTICLE_GROUP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'err_level'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'err_message'
        ParamType = ptInputOutput
        Size = 1024
      end>
  end
end
