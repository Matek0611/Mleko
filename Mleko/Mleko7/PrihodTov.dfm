inherited fmPrihodTov: TfmPrihodTov
  Left = 597
  Top = 185
  Width = 1114
  Height = 577
  Caption = #1055#1088#1080#1093#1086#1076' '#1090#1086#1074#1072#1088#1072
  ParentFont = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object paTop: TPanel [0]
    Left = 0
    Top = 0
    Width = 1098
    Height = 99
    Align = alTop
    BevelInner = bvLowered
    Caption = 'paTop'
    TabOrder = 0
    object ScrollBox: TScrollBox
      Left = 2
      Top = 2
      Width = 1094
      Height = 95
      HorzScrollBar.Margin = 6
      HorzScrollBar.Range = 341
      HorzScrollBar.Visible = False
      VertScrollBar.Margin = 6
      VertScrollBar.Range = 126
      VertScrollBar.Visible = False
      Align = alClient
      AutoScroll = False
      BorderStyle = bsNone
      TabOrder = 0
      OnExit = ScrollBoxExit
      object Label1: TLabel
        Left = 10
        Top = 48
        Width = 34
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object Label3: TLabel
        Left = 121
        Top = 49
        Width = 60
        Height = 13
        Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084
        FocusControl = EditDate
      end
      object Label4: TLabel
        Left = 592
        Top = 48
        Width = 34
        Height = 13
        Caption = #1057#1091#1084#1084#1072
        FocusControl = EditSumma
      end
      object Label5: TLabel
        Left = 567
        Top = 69
        Width = 60
        Height = 13
        Caption = #1057#1091#1084#1084#1072' '#1076#1086#1083#1075
        FocusControl = EditSummaDolg
      end
      object Label2: TLabel
        Left = 700
        Top = 38
        Width = 19
        Height = 13
        Caption = #1058#1080#1087
      end
      object Label6: TLabel
        Left = 854
        Top = 38
        Width = 19
        Height = 13
        Caption = #1042#1080#1076
      end
      object Label7: TLabel
        Left = 257
        Top = 3
        Width = 58
        Height = 13
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      end
      object Label8: TLabel
        Left = 120
        Top = 71
        Width = 69
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1086#1083#1091#1095#1077#1085
        FocusControl = EditDatePrih
      end
      object Label9: TLabel
        Left = 39
        Top = 3
        Width = 76
        Height = 13
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
      object Label10: TLabel
        Left = 856
        Top = 3
        Width = 34
        Height = 13
        Caption = #1057#1090#1072#1090#1091#1089
      end
      object Label11: TLabel
        Left = 819
        Top = 77
        Width = 31
        Height = 13
        Caption = #1054#1090#1076#1077#1083
        FocusControl = EditSummaDolg
      end
      object lblSet: TLabel
        Left = 456
        Top = 5
        Width = 107
        Height = 13
        Caption = #1053#1072#1073#1086#1088' '#1075#1088#1091#1087#1087' '#1090#1086#1074#1072#1088#1086#1074
        WordWrap = True
      end
      object Label12: TLabel
        Left = 1022
        Top = 20
        Width = 100
        Height = 13
        Caption = #1044#1072#1090#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
        FocusControl = cxDBDateEdit1
        Visible = False
      end
      object Label13: TLabel
        Left = 693
        Top = 16
        Width = 68
        Height = 13
        Caption = #1042#1072#1083#1102#1090#1072' '#1091#1095#1077#1090#1072
      end
      object DBTCurrencyHead: TDBText
        Left = 777
        Top = 16
        Width = 65
        Height = 17
        DataField = 'CurrencyHead'
        DataSource = dsNaklP
      end
      object Label14: TLabel
        Left = 284
        Top = 66
        Width = 112
        Height = 13
        Caption = #1042#1072#1083#1102#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBText1: TDBText
        Left = 396
        Top = 66
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'CurrencyHead'
      end
      object EditDate: TcxDBDateEdit
        Left = 191
        Top = 46
        DataBinding.DataField = 'datenakl'
        DataBinding.DataSource = dsNaklP
        TabOrder = 4
        Width = 92
      end
      object EditSumma: TDBEdit
        Left = 629
        Top = 45
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'Summa'
        DataSource = dsNaklP
        ReadOnly = True
        TabOrder = 6
      end
      object EditSummaDolg: TDBEdit
        Left = 629
        Top = 67
        Width = 65
        Height = 21
        TabStop = False
        DataField = 'SummaDolg'
        DataSource = dsNaklP
        ReadOnly = True
        TabOrder = 7
      end
      object edNom: TDBEdit
        Left = 5
        Top = 63
        Width = 108
        Height = 21
        DataField = 'Nom'
        DataSource = dsNaklP
        TabOrder = 3
      end
      object lcBuh: TcxDBLookupComboBox
        Left = 698
        Top = 50
        DataBinding.DataField = 'buh'
        DataBinding.DataSource = dsNaklP
        Properties.KeyFieldNames = 'buh'
        Properties.ListColumns = <
          item
            FieldName = 'Buh_type_name'
          end>
        Properties.ListSource = DSBuh
        Properties.OnChange = lcBuhPropertiesChange
        Properties.OnCloseUp = lcBuhPropertiesCloseUp
        TabOrder = 8
        Width = 133
      end
      object deNamePost: TDBEdit
        Left = 171
        Top = 18
        Width = 230
        Height = 21
        DataField = 'Name'
        DataSource = dsNaklP
        TabOrder = 2
        OnDblClick = deNamePostDblClick
        OnEnter = deNamePostEnter
        OnKeyDown = deNamePostKeyDown
      end
      object lcVidNakl: TcxDBLookupComboBox
        Left = 855
        Top = 50
        DataBinding.DataField = 'VidNaklNo'
        DataBinding.DataSource = dsNaklP
        Enabled = False
        Properties.KeyFieldNames = 'VidNaklNo'
        Properties.ListColumns = <
          item
            FieldName = 'VidNaklName'
          end>
        Properties.ListSource = DSVid
        TabOrder = 9
        Width = 155
      end
      object cbPriceWithNDS: TCheckBox
        Left = 699
        Top = 72
        Width = 84
        Height = 17
        TabStop = False
        Caption = #1062#1077#1085#1099' '#1089' '#1053#1044#1057
        Checked = True
        State = cbChecked
        TabOrder = 10
      end
      object ep_Prihod_id: TcitDBComboEdit
        Left = 1022
        Top = 74
        Width = 155
        Height = 21
        Enabled = False
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
        LLblCaption = #1044#1086#1082#1091#1084' '#1086#1089#1085#1086#1074#1072#1085#1080#1077
        LLblWidth = 100
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
        Visible = False
        LocateKey = False
        EntityCode = 'NAKLP'
        OnIsSelect = ep_Prihod_idIsSelect
        EditStyle = edSelect
        AutoTabControl = True
      end
      object EditDatePrih: TcxDBDateEdit
        Left = 191
        Top = 68
        DataBinding.DataField = 'dateprih'
        DataBinding.DataSource = dsNaklP
        TabOrder = 5
        Width = 92
      end
      object DBLookupComboBox1: TcxDBLookupComboBox
        Left = 3
        Top = 18
        BeepOnEnter = False
        DataBinding.DataField = 'doc_type'
        DataBinding.DataSource = dsNaklP
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'name'
          end>
        Properties.ListSource = DsDocType
        TabOrder = 0
        OnClick = DBLookupComboBox1Click
        OnExit = DBLookupComboBox1Exit
        Width = 161
      end
      object DbLCbStatus: TcxDBLookupComboBox
        Left = 854
        Top = 16
        TabStop = False
        DataBinding.DataField = 'edit_status_id'
        DataBinding.DataSource = dsNaklP
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            FieldName = 'description'
          end>
        Properties.ListSource = DSStatus
        TabOrder = 11
        Width = 155
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 856
        Top = 73
        DataBinding.DataField = 'otdelno'
        DataBinding.DataSource = dsNaklP
        Properties.KeyFieldNames = 'OtdelNo'
        Properties.ListColumns = <
          item
            FieldName = 'OtdelName'
          end>
        Properties.ListSource = dsOtdel
        TabOrder = 12
        Width = 154
      end
      object cbSetArticleGroup: TDBLookupComboBox
        Left = 408
        Top = 18
        Width = 273
        Height = 21
        DataSource = dsNaklPDelay
        KeyField = 'id'
        ListField = 'FullName'
        ListSource = dsSetArtGroup
        TabOrder = 13
        OnCloseUp = cbSetArticleGroupCloseUp
        OnExit = cbSetArticleGroupExit
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 1132
        Top = 17
        DataBinding.DataField = 'DateOfManufacture'
        DataBinding.DataSource = dsNaklP
        TabOrder = 14
        Width = 92
      end
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 438
        Top = 66
        Width = 121
        Height = 22
        DataField = 'CurrencyHead'
        EditButtons = <>
        KeyField = 'L_CODE'
        ListField = 'NAME'
        ListSource = dmDataModule.dsCurrency
        TabOrder = 15
        Visible = True
      end
    end
  end
  object paMiddle: TPanel [1]
    Left = 0
    Top = 99
    Width = 1098
    Height = 410
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    Caption = 'paMiddle'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 4
      Top = 4
      Width = 1090
      Height = 402
      Align = alClient
      DataSource = dsPrihod
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyUp = DBGrid1KeyUp
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'No_pp'
          Title.Caption = #8470' '#1074' '#1079#1072#1082#1072#1079#1077
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'order_num'
          ReadOnly = True
          Title.Caption = #1053#1086#1084#1077#1088
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'article_Name'
          ReadOnly = True
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 273
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'qty'
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRICE_ECO'
          Title.Caption = #1062#1077#1085#1072
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'summa'
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'summa_no_nds'
          Title.Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DateOfManufacture'
          ReadOnly = True
          Title.Caption = #1044#1072#1090#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
          Width = 109
          Visible = True
        end>
    end
  end
  object paBottom: TPanel [2]
    Left = 0
    Top = 509
    Width = 1098
    Height = 29
    Align = alBottom
    TabOrder = 2
    object bbOK: TBitBtn
      Left = 400
      Top = 2
      Width = 75
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
      Left = 476
      Top = 2
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = bbcancelClick
      Kind = bkCancel
    end
    object bbPrint: TBitBtn
      Left = 286
      Top = 2
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 2
      OnClick = bbPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object bbPrihodDel: TBitBtn
      Left = 117
      Top = 2
      Width = 80
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = bbPrihodDelClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbPrihodInsert: TBitBtn
      Left = 197
      Top = 2
      Width = 80
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 4
      OnClick = bbPrihodInsertClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333FF33333333FF333993333333300033377F3333333777333993333333
        300033F77FFF3333377739999993333333333777777F3333333F399999933333
        33003777777333333377333993333333330033377F3333333377333993333333
        3333333773333333333F333333333333330033333333F33333773333333C3333
        330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
        333333333337733333FF3333333C333330003333333733333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 21
      Top = 2
      Width = 80
      Height = 25
      Action = ActionViewRefresh
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 5
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A5636B00A563
        6B00A5636B00A5636B00A5636B00A5636B00A5636B00FF00FF00FF00FF00FF00
        FF00A5636B00FFEFC600C6CE9400D6CE9400EFCE9C00E7CE9400EFC68400EFBD
        8400EFBD7B00EFBD8400EFBD8400EFC68400A5636B00FF00FF00FF00FF00FF00
        FF00A5636B00FFEFCE009CBD7300299C21006BAD4A0021941000219410005AA5
        3900CEB57300EFBD7B00EFBD7B00EFC68400A5636B00FF00FF00FF00FF00FF00
        FF00A5635A00FFEFDE00BDCE9C00108C08000084000000840000008400000084
        000029941800DEBD7B00EFBD7B00EFC68400A5636B00FF00FF00FF00FF00FF00
        FF00A5635A00FFF7E700BDCE9C00189410000084000018941000ADBD730073AD
        4A000084000073AD4A00EFBD8400EFC68400A5636B00FF00FF00FF00FF00FF00
        FF00A5736B00FFF7EF00BDD6A500088C0800008400000084000084B55A00EFCE
        A500A5B56B006BAD4A00EFC68C00EFC68400A5636B00FF00FF00FF00FF00FF00
        FF00A5736B00FFFFFF00E7E7D600A5CE94009CC6840094BD73009CBD7300EFD6
        AD00EFCEA5009CC67B00EFC69400EFC68C00A5636B00FF00FF00FF00FF00FF00
        FF00BD846B00FFFFFF00A5DEA500FFEFE700F7EFD6009CC6840094BD730094BD
        73009CBD7300EFCEA500EFCE9C00F7CE9400A5636B00FF00FF00FF00FF00FF00
        FF00BD846B00FFFFFF0073C67300ADD6A500FFEFE70084C67300008400000084
        0000088C0800EFD6AD00EFCEA500F7D6A500A5636B00FF00FF00FF00FF00FF00
        FF00D6946B00FFFFFF0084CE8400008400007BC67300ADD6A500189418000084
        0000108C0800F7D6B500F7D6AD00EFCEA500A5636B00FF00FF00FF00FF00FF00
        FF00D6946B00FFFFFF00F7F7EF0029A529000084000000840000008400000084
        0000108C0800FFEFCE00DECEB500B5AD9400A5636B00FF00FF00FF00FF00FF00
        FF00DE9C7300FFFFFF00FFFFFF00DEF7DE0063BD6300219C2100219C210073BD
        6B00299C2100946B5200A56B5A00A56B5A00A5636B00FF00FF00FF00FF00FF00
        FF00DE9C7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEF7DE00DEF7DE00FFFF
        F700ADB594008C6B5200E79C5200E78C3100B56B4A00FF00FF00FF00FF00FF00
        FF00E7AD7B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00DEC6C600A56B5A00FFB55A00BD7B5A00FF00FF00FF00FF00FF00FF00FF00
        FF00E7AD7B00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7EF00F7F7
        EF00DEC6C600A56B5A00BD846B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00E7AD7B00D6946B00D6946B00D6946B00D6946B00D6946B00D6946B00D694
        6B00D6946B00A56B5A00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object Button1: TButton
      Left = 552
      Top = 3
      Width = 75
      Height = 25
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 6
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 657
      Top = 3
      Width = 208
      Height = 25
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1076#1072#1090#1091' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072' '#1087#1086' '#1090#1086#1074#1072#1088#1091
      TabOrder = 7
      OnClick = Button2Click
    end
  end
  inherited ActionList: TActionList
    Left = 520
    Top = 160
    object ActionViewRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecute
    end
  end
  object quNaklP: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '  @d_bank_invoice_id int'
      ''
      
        'select @d_bank_invoice_id = id from D_BANK_INVOICE where isMain ' +
        '= 1'
      ''
      'insert into NaklP'
      
        '  (NaklNo, Nom, PostNo, DateNakl, Summa, SummaDolg, Buh, UserNo,' +
        ' VidNaklNo,'
      
        '   OtdelNo, DatePrih, doc_type, parent_NaklNo, OurFirmNo,pkey,Ed' +
        'it_status_id,'
      '   d_bank_invoice_id, CurrencyHead)'
      'values'
      
        '  (:NaklNo, :Nom, :PostNo, :DateNakl, :Summa, :SummaDolg, :Buh, ' +
        ':UserNo, '
      
        '   :VidNaklNo, :OtdelNo, :DatePrih, :doc_type, :parent_NaklNo, :' +
        'OurFirmNo, '
      '   :pkey, :Edit_status_id, @d_bank_invoice_id, :CurrencyHead)')
    SQLDelete.Strings = (
      'delete from NaklP'
      'where'
      '  Pkey = :OLD_Pkey')
    SQLUpdate.Strings = (
      'BEGIN'
      ''
      '  DECLARE  @Old_Edit_status_id BIGINT'
      '           ,@Edit_status_id    BIGINT'
      '           ,@dhead_id          BIGINT'
      '  SET @Edit_status_id = :Edit_status_id'
      '  SET @dhead_id = :pkey'
      ''
      '  SELECT @Old_Edit_status_id = edit_status_id'
      '  FROM   naklp'
      '  WHERE  pkey = @dhead_id'
      ''
      '  UPDATE naklp'
      '  SET    naklno = :NaklNo'
      '         ,nom = :Nom'
      '         ,postno = :PostNo'
      '         ,datenakl = :DateNakl'
      '         ,summa = :Summa'
      '         ,summadolg = :SummaDolg'
      '         ,buh = :Buh'
      '         ,userno = :UserNo'
      '         ,vidnaklno = :VidNaklNo'
      '         ,otdelno = :OtdelNo'
      '         ,dateprih = :DatePrih'
      '         ,doc_type = :doc_type'
      '         ,parent_naklno = :parent_NaklNo'
      '         ,ourfirmno = :OurFirmNo'
      '         ,edit_status_id = @Edit_status_id'
      '         ,CurrencyHead = :CurrencyHead'
      '  WHERE  pkey = @dhead_id'
      ''
      '  IF @Edit_status_id <> @old_Edit_status_id'
      '    UPDATE dspec'
      '    SET    state_id = @Edit_status_id'
      '    WHERE  dhead_id = @dhead_id'
      ''
      'END')
    SQLRefresh.Strings = (
      
        'SELECT naklp.NaklNo, naklp.Nom, naklp.PostNo, naklp.DateNakl, na' +
        'klp.DatePrih, naklp.Summa, naklp.SummaDolg, naklp.Buh, naklp.Use' +
        'rNo, naklp.VidNaklNo, naklp.OtdelNo, naklp.doc_type, naklp.paren' +
        't_NaklNo, naklp.OurFirmNo, naklp.pkey FROM naklp'
      'WHERE'
      '  pkey = :Old_pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT h.naklno'
      '       ,h.nom'
      '       ,h.datenakl'
      '       ,h.postno'
      '       ,h.buh'
      '       ,h.summa'
      '       ,h.summadolg'
      '       ,h.userno'
      '       ,h.vidnaklno'
      '       ,p.name'
      '       ,h.otdelno'
      '       ,h.dateprih'
      '       ,h.doc_type'
      '       ,h.parent_naklno'
      '       ,h.ourfirmno'
      '       ,h.pkey'
      '       ,h.edit_status_id'
      '       ,h.DateOfManufacture '
      '       ,isnull(h.CurrencyHead,(select c.l_code '
      '                                from D_CURRENCY c inner join '
      
        '                                     CurrencyExchange ce on c.Is' +
        'Default = 1 and ce.IsActive = 1 '
      
        '                                                                ' +
        '            and ce.CurrencyId = c.ID '
      
        '                                                                ' +
        '            and isnull(c.isTrash,0) = 0)) as CurrencyHead'
      'FROM   naklp h inner join post p on h.PostNo=p.PostNo'
      'WHERE  h.pkey = :dhead_id')
    BeforePost = quNaklPBeforePost
    AfterPost = quNaklPAfterPost
    OnNewRecord = quNaklPNewRecord
    Options.StrictUpdate = False
    Left = 168
    Top = 145
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'dhead_id'
        Value = -1
      end>
    object quNaklPnaklno: TIntegerField
      FieldName = 'naklno'
    end
    object quNaklPnom: TIntegerField
      FieldName = 'nom'
    end
    object quNaklPdatenakl: TDateTimeField
      FieldName = 'datenakl'
    end
    object quNaklPpostno: TSmallintField
      FieldName = 'postno'
    end
    object quNaklPbuh: TSmallintField
      FieldName = 'buh'
    end
    object quNaklPsumma: TFloatField
      FieldName = 'summa'
    end
    object quNaklPsummadolg: TFloatField
      FieldName = 'summadolg'
    end
    object quNaklPuserno: TSmallintField
      FieldName = 'userno'
    end
    object quNaklPvidnaklno: TWordField
      FieldName = 'vidnaklno'
    end
    object quNaklPname: TStringField
      FieldName = 'name'
      Size = 30
    end
    object quNaklPotdelno: TSmallintField
      FieldName = 'otdelno'
    end
    object quNaklPdateprih: TDateTimeField
      FieldName = 'dateprih'
    end
    object quNaklPdoc_type: TIntegerField
      FieldName = 'doc_type'
    end
    object quNaklPparent_naklno: TIntegerField
      FieldName = 'parent_naklno'
    end
    object quNaklPourfirmno: TIntegerField
      FieldName = 'ourfirmno'
    end
    object quNaklPpkey: TLargeintField
      FieldName = 'pkey'
    end
    object quNaklPedit_status_id: TSmallintField
      FieldName = 'edit_status_id'
    end
    object quNaklPDateOfManufacture: TDateTimeField
      FieldName = 'DateOfManufacture'
    end
    object quNaklPCurrencyHead: TStringField
      DisplayLabel = #1042#1072#1083#1102#1090#1072
      FieldName = 'CurrencyHead'
      Size = 5
    end
  end
  object dsNaklP: TDataSource
    DataSet = quNaklP
    Left = 168
    Top = 201
  end
  object quBuh: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_buh_type')
    Options.StrictUpdate = False
    Left = 280
    Top = 193
    object quBuhbuh: TSmallintField
      FieldName = 'buh'
    end
    object quBuhBuh_type_name: TStringField
      FieldName = 'Buh_type_name'
    end
    object quBuhIS_FRACTION: TBooleanField
      FieldName = 'IS_FRACTION'
    end
  end
  object quVidNakl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select VidNaklNo,VidNaklName'
      'from VidNakl'
      'order by VidNaklNo')
    Options.StrictUpdate = False
    Left = 336
    Top = 193
  end
  object dsPrihod: TDataSource
    DataSet = MlekoDbDsMSSQLDm.quDSPEC
    OnDataChange = dsPrihodDataChange
    OnUpdateData = dsPrihodUpdateData
    Left = 232
    Top = 201
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Options.StrictUpdate = False
    Left = 56
    Top = 145
  end
  object quDocType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_doc_type t'
      'where entity_code='#39'NAKLP'#39)
    Options.StrictUpdate = False
    Left = 112
    Top = 144
  end
  object DsDocType: TDataSource
    DataSet = quDocType
    Left = 56
    Top = 209
  end
  object DSBuh: TDataSource
    DataSet = quBuh
    Left = 284
    Top = 265
  end
  object DSVid: TDataSource
    DataSet = quVidNakl
    Left = 384
    Top = 273
  end
  object quStatus: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_edit_status')
    Options.StrictUpdate = False
    Left = 496
    Top = 284
  end
  object DSStatus: TDataSource
    DataSet = quStatus
    Left = 496
    Top = 236
  end
  object dsOtdel: TDataSource
    DataSet = quOtdel
    Left = 576
    Top = 244
  end
  object quOtdel: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from vidotdel')
    Options.StrictUpdate = False
    Left = 576
    Top = 292
  end
  object quNaklPEntity: TMSQuery
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
    object quNaklPEntityid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object quNaklPEntityentityno: TIntegerField
      FieldName = 'entityno'
      ReadOnly = True
    end
    object quNaklPEntityentity_type: TStringField
      FieldName = 'entity_type'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object quNaklPEntityentityno_plat: TIntegerField
      FieldName = 'entityno_plat'
      ReadOnly = True
    end
    object quNaklPEntityentity_type_plat: TStringField
      FieldName = 'entity_type_plat'
      ReadOnly = True
      FixedChar = True
      Size = 5
    end
    object quNaklPEntitylink_summa: TFloatField
      FieldName = 'link_summa'
      ReadOnly = True
    end
    object quNaklPEntitylink_date: TDateTimeField
      FieldName = 'link_date'
      ReadOnly = True
    end
    object quNaklPEntitylink_userno: TIntegerField
      FieldName = 'link_userno'
      ReadOnly = True
    end
    object quNaklPEntityplat_sign: TSmallintField
      FieldName = 'plat_sign'
      ReadOnly = True
    end
    object quNaklPEntityfactor_direction: TSmallintField
      FieldName = 'factor_direction'
      ReadOnly = True
    end
    object quNaklPEntitydelta: TFloatField
      FieldName = 'delta'
      ReadOnly = True
    end
    object quNaklPEntitypkey: TLargeintField
      FieldName = 'pkey'
      ReadOnly = True
    end
    object quNaklPEntityentity_type_1: TStringField
      FieldName = 'entity_type_1'
      Size = 5
    end
    object quNaklPEntityentity_type_name: TStringField
      FieldName = 'entity_type_name'
      ReadOnly = True
      Size = 1024
    end
    object quNaklPEntitynom: TIntegerField
      FieldName = 'nom'
    end
    object quNaklPEntitypostno: TSmallintField
      FieldName = 'postno'
    end
    object quNaklPEntitypost_name: TStringField
      FieldName = 'post_name'
      ReadOnly = True
      Size = 30
    end
    object quNaklPEntitydateentity: TDateTimeField
      FieldName = 'dateentity'
    end
    object quNaklPEntitysumma: TFloatField
      FieldName = 'summa'
    end
    object quNaklPEntitybuh: TSmallintField
      FieldName = 'buh'
    end
    object quNaklPEntitybuh_type_name: TStringField
      FieldName = 'buh_type_name'
      ReadOnly = True
    end
    object quNaklPEntityDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 1024
    end
    object quNaklPEntitydoc_type_id: TIntegerField
      FieldName = 'doc_type_id'
    end
    object quNaklPEntitydoc_type_name: TStringField
      FieldName = 'doc_type_name'
      ReadOnly = True
      Size = 256
    end
    object quNaklPEntityuserno: TSmallintField
      FieldName = 'userno'
    end
    object quNaklPEntityusername: TStringField
      FieldName = 'username'
      ReadOnly = True
    end
    object quNaklPEntitysotrudno: TIntegerField
      FieldName = 'sotrudno'
    end
    object quNaklPEntitysotrudname: TStringField
      FieldName = 'sotrudname'
      ReadOnly = True
      Size = 30
    end
    object quNaklPEntitybank_invoice_id: TIntegerField
      FieldName = 'bank_invoice_id'
    end
    object quNaklPEntitybank_name: TStringField
      FieldName = 'bank_name'
      ReadOnly = True
      Size = 512
    end
    object quNaklPEntityactivity_type_id: TSmallintField
      FieldName = 'activity_type_id'
    end
    object quNaklPEntityactivity_type_name: TStringField
      FieldName = 'activity_type_name'
      ReadOnly = True
      Size = 100
    end
    object quNaklPEntityanalyticaccno: TIntegerField
      FieldName = 'analyticaccno'
    end
    object quNaklPEntityvidrashod_name: TStringField
      FieldName = 'vidrashod_name'
      ReadOnly = True
      Size = 50
    end
    object quNaklPEntityotdelno: TIntegerField
      FieldName = 'otdelno'
    end
    object quNaklPEntityotdel_name: TStringField
      FieldName = 'otdel_name'
      ReadOnly = True
      Size = 30
    end
    object quNaklPEntityourfirmno: TIntegerField
      FieldName = 'ourfirmno'
    end
    object quNaklPEntityourfirm_name: TStringField
      FieldName = 'ourfirm_name'
      ReadOnly = True
      Size = 30
    end
    object quNaklPEntityis_econom: TIntegerField
      FieldName = 'is_econom'
    end
    object quNaklPEntityentityno_1: TIntegerField
      FieldName = 'entityno_1'
    end
    object quNaklPEntitycolnprice: TSmallintField
      FieldName = 'colnprice'
    end
    object quNaklPEntitycolnprice_name: TStringField
      FieldName = 'colnprice_name'
      ReadOnly = True
      Size = 64
    end
    object quNaklPEntityaddressno: TSmallintField
      FieldName = 'addressno'
    end
    object quNaklPEntityaddress: TStringField
      FieldName = 'address'
      ReadOnly = True
      Size = 256
    end
    object quNaklPEntitypostnoreturn: TSmallintField
      FieldName = 'postnoreturn'
    end
    object quNaklPEntitypostreturn_name: TStringField
      FieldName = 'postreturn_name'
      ReadOnly = True
      Size = 30
    end
    object quNaklPEntityid_1: TIntegerField
      FieldName = 'id_1'
    end
    object quNaklPEntitykoldaydelay: TIntegerField
      FieldName = 'koldaydelay'
    end
    object quNaklPEntityreason_id: TIntegerField
      FieldName = 'reason_id'
    end
    object quNaklPEntityvidtovgroup_id: TIntegerField
      FieldName = 'vidtovgroup_id'
    end
    object quNaklPEntityvidtovgroup_name: TStringField
      FieldName = 'vidtovgroup_name'
      ReadOnly = True
      Size = 512
    end
    object quNaklPEntitycontract_id: TIntegerField
      FieldName = 'contract_id'
    end
    object quNaklPEntitycontract_description: TStringField
      FieldName = 'contract_description'
      ReadOnly = True
      Size = 1024
    end
    object quNaklPEntitypkey_1: TLargeintField
      FieldName = 'pkey_1'
    end
    object quNaklPEntityfreesumma: TFloatField
      FieldName = 'freesumma'
    end
    object quNaklPEntityentity_type_id: TIntegerField
      FieldName = 'entity_type_id'
      ReadOnly = True
    end
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
      '  where d.id = isnull(:SET_ARTICLE_GROUP_ID,d.id)'
      '    and p.Name = Isnull(:NamePost,p.Name)'
      '    and l.Buh = Isnull(:Buh,l.Buh)'
      '--    and d.Name = Isnull(:NameGroup,d.Name)')
    Left = 736
    Top = 243
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'SET_ARTICLE_GROUP_ID'
      end
      item
        DataType = ftString
        Name = 'NamePost'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
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
  object quNaklPDelay: TMSQuery
    SQLInsert.Strings = (
      
        'insert into L_Delay_NaklP (NaklNo,SET_ARTICLE_GROUP_ID,Day_Delay' +
        ',Day_Delay_Ext,Buh)'
      
        '  values(:NaklNo,:SET_ARTICLE_GROUP_ID,:Day_Delay,:Day_Delay_Ext' +
        ',:Buh)')
    SQLUpdate.Strings = (
      'declare'
      ' @cnt int'
      'select @cnt = count(*) from L_Delay_NaklP where NaklNo = :NaklNo'
      ''
      'if @cnt = 0'
      
        'insert into L_Delay_NaklP (NaklNo,SET_ARTICLE_GROUP_ID,Day_Delay' +
        ',Day_Delay_Ext,Buh)'
      
        '  values(:NaklNo,:SET_ARTICLE_GROUP_ID,:Day_Delay,:Day_Delay_Ext' +
        ',:Buh)'
      'else'
      'update L_Delay_NaklP'
      ' set Day_Delay = :Day_Delay'
      '    ,SET_ARTICLE_GROUP_ID = :SET_ARTICLE_GROUP_ID'
      '    ,Buh = :Buh'
      'where NaklNo = :NaklNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select isnull(np.pkey,ldnp.NaklNo) as NaklNo'
      '      ,ldnp.SET_ARTICLE_GROUP_ID'
      '      ,ldnp.Day_Delay'
      '      ,ldnp.Day_Delay_Ext'
      
        '      ,dsag.NAME + '#39' ('#39'+(select Buh_type_name from d_buh_type b ' +
        'where b.buh = isnull(np.Buh,ldnp.buh))+'#39')'#39' as FullName'
      '      ,isnull(np.Buh, ldnp.buh) as buh'
      
        '      ,convert(char(19),ldnp.SET_ARTICLE_GROUP_ID) + convert(cha' +
        'r(1),ldnp.buh) as id'
      ' from L_Delay_NaklP ldnp left join'
      
        '      D_SET_ARTICLE_GROUP dsag on dsag.ID = ldnp.SET_ARTICLE_GRO' +
        'UP_ID left join'
      '      NaklP np on np.pkey = ldnp.NaklNo'
      '  where ldnp.NaklNo = isnull(:NaklNo,ldnp.NaklNo)')
    Left = 800
    Top = 235
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'NaklNo'
      end>
    object quNaklPDelayNaklNo: TLargeintField
      FieldName = 'NaklNo'
    end
    object quNaklPDelayDay_Delay: TIntegerField
      FieldName = 'Day_Delay'
    end
    object quNaklPDelayDay_Delay_Ext: TIntegerField
      FieldName = 'Day_Delay_Ext'
    end
    object quNaklPDelayFullName: TStringField
      FieldName = 'FullName'
      ReadOnly = True
      Size = 535
    end
    object quNaklPDelayBuh: TIntegerField
      FieldName = 'Buh'
    end
    object quNaklPDelaySET_ARTICLE_GROUP_ID: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID'
    end
    object quNaklPDelayid: TStringField
      FieldName = 'id'
      ReadOnly = True
      FixedChar = True
    end
  end
  object dsSetArtGroup: TMSDataSource
    DataSet = QuSetArtGroup
    Left = 736
    Top = 195
  end
  object dsNaklPDelay: TMSDataSource
    DataSet = quNaklPDelay
    Left = 800
    Top = 203
  end
end
