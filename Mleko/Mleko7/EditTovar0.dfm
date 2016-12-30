inherited fmEditTovar: TfmEditTovar
  Left = 996
  Top = 141
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1058#1086#1074#1072#1088
  ClientHeight = 586
  ClientWidth = 397
  ParentFont = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 167
    Top = 559
  end
  inherited ButtonCancel: TButton
    Left = 242
    Top = 559
  end
  inherited ButtonApply: TButton
    Left = 317
    Top = 559
  end
  inherited PageControl: TcxPageControl
    Left = 4
    Width = 393
    Height = 547
    MultiLine = True
    ClientRectBottom = 546
    ClientRectRight = 392
    inherited tsMainProp: TcxTabSheet
      ImageIndex = 0
      object Label9: TLabel
        Left = 160
        Top = 88
        Width = 57
        Height = 13
        Caption = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072
      end
      object Label8: TLabel
        Left = 176
        Top = 168
        Width = 36
        Height = 13
        Caption = #1042#1077#1089' ('#1075'.)'
      end
      object Label7: TLabel
        Left = 16
        Top = 48
        Width = 132
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1082#1072#1089#1089#1099
      end
      object Label6: TLabel
        Left = 128
        Top = 168
        Width = 25
        Height = 13
        Caption = #1057#1088#1086#1082
      end
      object Label5: TLabel
        Left = 16
        Top = 168
        Width = 57
        Height = 13
        Caption = #1042' '#1091#1087#1072#1082#1086#1074#1082#1077
        FocusControl = EditKolPerPak
      end
      object Label4: TLabel
        Left = 160
        Top = 48
        Width = 79
        Height = 13
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      end
      object Label3: TLabel
        Left = 80
        Top = 168
        Width = 39
        Height = 13
        Caption = #1045#1076'.'#1080#1079#1084'.'
        FocusControl = EditEdIzm
      end
      object Label2: TLabel
        Left = 14
        Top = 6
        Width = 76
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        FocusControl = EditNameTovar
      end
      object Label13: TLabel
        Left = 11
        Top = 237
        Width = 49
        Height = 13
        Caption = #1064#1090#1088#1080#1093#1082#1086#1076
        FocusControl = BarCode
      end
      object Label12: TLabel
        Left = 160
        Top = 128
        Width = 25
        Height = 13
        Caption = #1058#1072#1088#1072
      end
      object Label11: TLabel
        Left = 16
        Top = 128
        Width = 31
        Height = 13
        Caption = #1054#1090#1076#1077#1083
      end
      object Label10: TLabel
        Left = 213
        Top = 168
        Width = 76
        Height = 13
        Caption = #1050#1086#1076' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1072
        FocusControl = deCodReport
      end
      object Label1: TLabel
        Left = 16
        Top = 88
        Width = 57
        Height = 13
        Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
      end
      object Label17: TLabel
        Left = 291
        Top = 168
        Width = 89
        Height = 13
        Caption = #1062#1077#1085#1072' '#1074#1093'. '#1091#1089#1090#1085#1086#1074#1083'.'
        FocusControl = deCodReport
      end
      object Label18: TLabel
        Left = 189
        Top = 210
        Width = 107
        Height = 13
        Caption = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080' ('#1076#1085#1077#1081')'
      end
      object Label22: TLabel
        Left = 240
        Top = 386
        Width = 105
        Height = 25
        AutoSize = False
        Caption = #1053#1086#1084#1077#1088' '#1087'/'#1087' '#1076#1083#1103' '#1087#1088#1080#1093#1086#1076#1085#1099#1093' '#1079#1072#1082#1072#1079#1086#1074
        Transparent = True
        WordWrap = True
      end
      object Label23: TLabel
        Left = 10
        Top = 264
        Width = 58
        Height = 13
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      end
      object Label24: TLabel
        Left = 10
        Top = 297
        Width = 87
        Height = 13
        Caption = #1055#1086#1089#1090#1072#1074#1082#1072' '#1090#1086#1074#1072#1088#1072
      end
      object Label28: TLabel
        Left = 13
        Top = 333
        Width = 184
        Height = 13
        Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1099#1081' '#1087#1077#1088#1077#1093#1086#1076#1085#1086#1081' '#1086#1089#1090#1072#1090#1086#1082' :'
      end
      object cbExport1C: TDBCheckBox
        Left = 16
        Top = 210
        Width = 145
        Height = 17
        Caption = #1053#1077' '#1086#1090#1087#1088#1072#1074#1083#1103#1090#1100' '#1074' "1'#1057'"'
        DataField = 'Export1C'
        DataSource = DS
        TabOrder = 0
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object lcVidTov: TDBLookupComboBox
        Left = 16
        Top = 104
        Width = 137
        Height = 21
        DataField = 'VidNo'
        DataSource = DS
        KeyField = 'VidNo'
        ListField = 'VidName'
        ListSource = MlekoDbDsMSSQLDm.dsVidTov
        TabOrder = 1
      end
      object lcTipTovara: TDBLookupComboBox
        Left = 160
        Top = 104
        Width = 153
        Height = 21
        DataField = 'TipNo'
        DataSource = DS
        KeyField = 'TipNo'
        ListField = 'TipName'
        ListSource = MlekoDbDsMSSQLDm.dsTipTovara
        TabOrder = 2
      end
      object lcTara: TDBLookupComboBox
        Left = 160
        Top = 144
        Width = 153
        Height = 21
        DataField = 'TaraNo'
        DataSource = DS
        KeyField = 'TovarNo'
        ListField = 'NameTovar'
        ListSource = MlekoDbDsMSSQLDm.DsTara
        TabOrder = 3
      end
      object lcOtdel: TDBLookupComboBox
        Left = 16
        Top = 144
        Width = 137
        Height = 21
        DataField = 'OtdelNo'
        DataSource = DS
        KeyField = 'OtdelNo'
        ListField = 'OtdelName'
        ListSource = MlekoDbDsMSSQLDm.DsVidOtdel
        TabOrder = 4
      end
      object lcNameCompany: TDBLookupComboBox
        Left = 160
        Top = 64
        Width = 153
        Height = 21
        DataField = 'CompanyNo'
        DataSource = DS
        KeyField = 'CompanyNo'
        ListField = 'NameCompany'
        ListSource = MlekoDbDsMSSQLDm.dsCompany
        TabOrder = 5
      end
      object EditNameTovar: TDBEdit
        Left = 14
        Top = 21
        Width = 299
        Height = 21
        AutoSelect = False
        DataField = 'NameTovar'
        DataSource = DS
        TabOrder = 6
      end
      object EditKolPerPak: TDBEdit
        Left = 16
        Top = 184
        Width = 55
        Height = 21
        DataField = 'KolPerPak'
        DataSource = DS
        TabOrder = 7
      end
      object EditEdIzm: TDBEdit
        Left = 80
        Top = 184
        Width = 40
        Height = 21
        DataField = 'EdIzm'
        DataSource = DS
        TabOrder = 8
      end
      object deWeight: TDBEdit
        Left = 176
        Top = 184
        Width = 41
        Height = 21
        DataField = 'Weight'
        DataSource = DS
        TabOrder = 9
      end
      object deSrokReal: TDBEdit
        Left = 128
        Top = 184
        Width = 40
        Height = 21
        DataField = 'SrokReal'
        DataSource = DS
        TabOrder = 10
      end
      object deNameShort: TDBEdit
        Left = 16
        Top = 64
        Width = 137
        Height = 21
        DataField = 'NameTovarShort'
        DataSource = DS
        TabOrder = 11
      end
      object deCodReport: TDBEdit
        Left = 224
        Top = 183
        Width = 55
        Height = 21
        DataField = 'CodReport'
        DataSource = DS
        TabOrder = 12
      end
      object BarCode: TDBEdit
        Left = 72
        Top = 234
        Width = 243
        Height = 21
        DataField = 'BarCode'
        DataSource = DS
        MaxLength = 18
        TabOrder = 13
      end
      object DBCheckBox2: TDBCheckBox
        Left = 108
        Top = 380
        Width = 117
        Height = 17
        Caption = #1042#1077#1089#1086#1074#1072#1103' '#1091#1087#1072#1082#1086#1074#1082#1072
        DataField = 'weight_packed'
        DataSource = DS
        Enabled = False
        TabOrder = 14
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        Visible = False
      end
      object DBCheckBox3: TDBCheckBox
        Left = 108
        Top = 401
        Width = 95
        Height = 17
        Caption = #1042#1077#1089#1086#1074#1086#1081' '#1090#1086#1074#1072#1088
        DataField = 'is_weight'
        DataSource = DS
        TabOrder = 15
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object DBCheckBox1: TDBCheckBox
        Left = 13
        Top = 381
        Width = 88
        Height = 17
        Caption = #1057#1087#1088#1103#1090#1072#1090#1100
        DataField = 'Visible'
        DataSource = DS
        TabOrder = 16
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object Social_Tovar: TDBCheckBox
        Left = 108
        Top = 423
        Width = 120
        Height = 17
        Caption = #1057#1086#1094#1080#1072#1083#1100#1085#1099#1081' '#1090#1086#1074#1072#1088
        DataField = 'Social'
        DataSource = dsSocial_Tovar
        TabOrder = 17
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object dePriceInInst: TDBEdit
        Left = 304
        Top = 183
        Width = 55
        Height = 21
        DataField = 'PriceInInst'
        DataSource = dsPrice
        TabOrder = 18
      end
      object deEhExpirationDate: TDBEditEh
        Left = 304
        Top = 208
        Width = 41
        Height = 21
        DataField = 'ExpirationDate'
        DataSource = dsTovarExpirationDate
        EditButtons = <>
        TabOrder = 19
        Visible = True
      end
      object Our_Tovar: TDBCheckBox
        Left = 13
        Top = 403
        Width = 93
        Height = 17
        Caption = #1053#1077' '#1085#1072#1096' '#1090#1086#1074#1072#1088
        DataField = 'NotOur'
        DataSource = dsOurTovar
        TabOrder = 20
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object is_Service: TDBCheckBox
        Left = 14
        Top = 423
        Width = 83
        Height = 17
        Caption = #1059#1089#1083#1091#1075#1072
        DataField = 'Is_Service'
        DataSource = dsService
        TabOrder = 21
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object gbNDS: TGroupBox
        Left = 8
        Top = 441
        Width = 337
        Height = 81
        Caption = #1053#1044#1057
        TabOrder = 22
        object Label19: TLabel
          Left = 8
          Top = 60
          Width = 63
          Height = 13
          Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057
        end
        object Label20: TLabel
          Left = 129
          Top = 60
          Width = 62
          Height = 13
          Caption = #1043#1088#1091#1087#1087#1072' '#1053#1044#1057
        end
        object Label21: TLabel
          Left = 116
          Top = 60
          Width = 8
          Height = 13
          Caption = '%'
        end
        object TovarWIthNoNDS: TDBCheckBox
          Left = 217
          Top = 12
          Width = 168
          Height = 17
          Caption = #1058#1086#1074#1072#1088' '#1088#1077#1072#1083#1080#1079#1091#1077#1090#1089#1103' '#1073#1077#1079' '#1053#1044#1057
          DataField = 'WithNoNDS'
          DataSource = dsTovarWIthNoNDS
          Enabled = False
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object IsTovarNDS: TDBCheckBox
          Left = 217
          Top = 37
          Width = 224
          Height = 17
          Caption = #1058#1086#1074#1072#1088' '#1088#1077#1072#1083#1080#1079#1091#1077#1090#1089#1103' '#1089#1086' '#1089#1090#1072#1074#1082#1086#1081' '#1053#1044#1057':'
          DataField = 'IsStavNDS'
          DataSource = dsTovarNDS
          Enabled = False
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          Visible = False
        end
        object deGroupNDS1: TDBEdit
          Left = 217
          Top = 32
          Width = 121
          Height = 21
          DataField = 'GroupNDS'
          DataSource = dsTovarNDS
          TabOrder = 2
          Visible = False
          OnDblClick = deGroupNDS1DblClick
        end
        object DBNumberEditStavNDS: TDBNumberEditEh
          Left = 72
          Top = 56
          Width = 44
          Height = 21
          DataField = 'StavNDS'
          DataSource = dsTovarNDS
          DecimalPlaces = 0
          DisplayFormat = ' ###'
          EditButton.Style = ebsUpDownEh
          EditButton.Visible = True
          EditButtons = <>
          MaxValue = 100.000000000000000000
          TabOrder = 3
          Visible = True
        end
        object rbIsTovarNDS: TRadioButton
          Left = 8
          Top = 33
          Width = 233
          Height = 17
          Caption = #1058#1086#1074#1072#1088' '#1088#1077#1072#1083#1080#1079#1091#1077#1090#1089#1103' '#1089#1086' '#1089#1090#1072#1074#1082#1086#1081' '#1053#1044#1057':'
          TabOrder = 4
          OnClick = rbIsTovarNDSClick
        end
        object rbTovarWIthNoNDS: TRadioButton
          Left = 8
          Top = 16
          Width = 201
          Height = 17
          Caption = #1058#1086#1074#1072#1088' '#1088#1077#1072#1083#1080#1079#1091#1077#1090#1089#1103' '#1073#1077#1079' '#1053#1044#1057
          TabOrder = 5
          OnClick = rbTovarWIthNoNDSClick
        end
        object deGroupNDS: TDBEditEh
          Left = 219
          Top = 55
          Width = 111
          Height = 21
          DataField = 'GroupNDS'
          DataSource = dsTovarNDS
          EditButtons = <>
          TabOrder = 6
          Visible = True
          OnDblClick = deGroupNDS1DblClick
        end
      end
      object DBEditEhNo_pp: TDBEditEh
        Left = 240
        Top = 418
        Width = 41
        Height = 21
        DataField = 'No_pp'
        DataSource = dsTovarNoPP
        EditButtons = <>
        TabOrder = 23
        Visible = True
      end
      object deNamePost: TDBEdit
        Left = 73
        Top = 262
        Width = 241
        Height = 21
        DataField = 'PostName'
        DataSource = dsTovarSupplier
        TabOrder = 24
        OnChange = deNamePostChange
        OnDblClick = deNamePostDblClick
      end
      object deDeliveryGoodsName: TDBEdit
        Left = 105
        Top = 294
        Width = 208
        Height = 21
        DataField = 'DeliveryGoodsName'
        DataSource = dsTovarFromDeliveryOfGoods
        TabOrder = 25
        OnDblClick = deDeliveryGoodsNameDblClick
      end
      object DBCheckBoxEh1: TDBCheckBoxEh
        Left = 13
        Top = 362
        Width = 149
        Height = 17
        Caption = #1058#1086#1074#1072#1088' '#1074#1085#1091#1090#1088#1077#1085#1085#1077#1075#1086' '#1091#1095#1077#1090#1072
        DataField = 'IsInternal'
        DataSource = DS
        TabOrder = 26
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
      object deMinCarryover: TDBEdit
        Left = 200
        Top = 330
        Width = 112
        Height = 21
        DataField = 'MinCarryover'
        DataSource = DS
        MaxLength = 18
        TabOrder = 27
      end
    end
    inherited tsExtendedProp: TcxTabSheet
      object Label15: TLabel
        Left = 8
        Top = 60
        Width = 179
        Height = 13
        Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1081' '#1082#1086#1076'  '#1090#1086#1074#1072#1088#1072' '#1091' '#1087#1072#1088#1090#1085#1077#1088#1072
        FocusControl = deCodReport
      end
      object Label14: TLabel
        Left = 7
        Top = 3
        Width = 61
        Height = 13
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090':'
        Visible = False
      end
      object Label16: TLabel
        Left = 9
        Top = 152
        Width = 139
        Height = 26
        Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1077#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072' '#1091' '#1087#1072#1088#1090#1085#1077#1088#1072
        FocusControl = deCodReport
        Transparent = False
        WordWrap = True
      end
      object Label25: TLabel
        Left = 208
        Top = 60
        Width = 178
        Height = 13
        Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1081' '#1082#1086#1076'  '#1090#1086#1074#1072#1088#1072' '#1090#1077#1082#1089#1090#1086#1074#1099#1081
        FocusControl = deCodReport
      end
      object Label26: TLabel
        Left = 8
        Top = 108
        Width = 159
        Height = 13
        Caption = #1042#1090#1086#1088#1086#1081'  '#1082#1086#1076'  '#1090#1086#1074#1072#1088#1072' '#1091' '#1087#1072#1088#1090#1085#1077#1088#1072
        FocusControl = deCodReport
      end
      object Label27: TLabel
        Left = 205
        Top = 108
        Width = 155
        Height = 13
        Caption = #1042#1090#1086#1088#1086#1081' '#1082#1086#1076'  '#1090#1086#1074#1072#1088#1072' '#1090#1077#1082#1089#1090#1086#1074#1099#1081
        FocusControl = deCodReport
      end
      object TovarNoPost: TDBEdit
        Left = 8
        Top = 79
        Width = 177
        Height = 21
        DataField = 'TovarNoPost'
        DataSource = dsTovarPost
        MaxLength = 12
        TabOrder = 0
      end
      object cbPostForTovar: TDBLookupComboBox
        Left = 88
        Top = 0
        Width = 273
        Height = 21
        KeyField = 'PostNo'
        ListField = 'NameLong'
        ListSource = dsPostForTovar
        TabOrder = 1
        Visible = False
        OnExit = cbPostForTovarExit
      end
      object NameTovarPost: TDBEdit
        Left = 11
        Top = 183
        Width = 323
        Height = 21
        DataField = 'NameTovarPost'
        DataSource = dsTovarPost
        TabOrder = 2
      end
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 208
        Width = 377
        Height = 97
        DataSource = dsListGoodStandarts
        Enabled = False
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'StandartName'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1090#1072#1085#1076#1072#1088#1090#1072
            Width = 302
          end
          item
            EditButtons = <>
            FieldName = 'is_chesk'
            Footers = <>
            Title.Caption = 'V'
          end>
      end
      object bSetGoodStandarts: TButton
        Left = 88
        Top = 316
        Width = 169
        Height = 25
        Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1090#1086#1074#1072#1088' '#1082' '#1089#1090#1072#1085#1076#1072#1088#1090#1072#1084
        TabOrder = 4
        OnClick = bSetGoodStandartsClick
      end
      object leSelectFirm: TLabeledEdit
        Left = 8
        Top = 32
        Width = 305
        Height = 21
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = #1055#1072#1088#1090#1085#1077#1088' :'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'MS Sans Serif'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        TabOrder = 5
        OnDblClick = leSelectFirmDblClick
        OnExit = leSelectFirmExit
      end
      object TovarNoPostText: TDBEdit
        Left = 208
        Top = 78
        Width = 177
        Height = 21
        DataField = 'TovarNoPostText'
        DataSource = dsTovarPost
        TabOrder = 6
      end
      object TovarNoPostSecond: TDBEdit
        Left = 8
        Top = 127
        Width = 177
        Height = 21
        DataField = 'TovarNoPostSecond'
        DataSource = dsTovarPost
        MaxLength = 12
        TabOrder = 7
      end
      object TovarNoPostSecondText: TDBEdit
        Left = 206
        Top = 126
        Width = 177
        Height = 21
        DataField = 'TovarNoPostSecondText'
        DataSource = dsTovarPost
        TabOrder = 8
      end
    end
    object cxConformity: TcxTabSheet
      Caption = #1057#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1077
      ImageIndex = 2
      object DBGridEhTovarForReturn: TDBGridEh
        Left = 1
        Top = 16
        Width = 374
        Height = 234
        DataSource = dsTovarForReturn
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
        Columns = <
          item
            EditButtons = <>
            FieldName = 'TypeReturnName'
            Footers = <>
            Width = 115
          end
          item
            EditButtons = <>
            FieldName = 'NameTovarReturn'
            Footers = <>
          end>
      end
      object Button1: TButton
        Left = 8
        Top = 264
        Width = 145
        Height = 25
        Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1090#1086#1074#1072#1088
        TabOrder = 1
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 8
        Top = 296
        Width = 145
        Height = 25
        Caption = #1054#1090#1074#1103#1079#1072#1090#1100' '#1090#1086#1074#1072#1088
        TabOrder = 2
        OnClick = Button2Click
      end
    end
  end
  inherited DS: TDataSource
    Left = 356
    Top = 22
  end
  object dsSocial_Tovar: TDataSource
    DataSet = quSocialTovar
    Left = 274
    Top = 203
  end
  object quSocialTovar: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @ID dtPkey'
      ''
      'select @ID=isnull(max(ID),0)+1 from Social_Tovar'
      'set :id = @ID'
      ''
      ''
      'INSERT INTO Social_Tovar'
      '  (ID, TovarNo, Social)'
      'VALUES'
      '  (@ID, :TovarNo, :Social)'
      'SET :Old_ID = ident_current('#39'Social_Tovar'#39')'
      'end')
    SQLUpdate.Strings = (
      'UPDATE Social_Tovar'
      'SET'
      '  ID = :ID, TovarNo = :TovarNo, Social = :Social'
      'WHERE'
      '  ID = :Old_ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from Social_Tovar where TovarNo = :TovarNo')
    BeforePost = quSocialTovarBeforePost
    Left = 305
    Top = 237
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end>
    object quSocialTovarID: TIntegerField
      FieldName = 'ID'
    end
    object quSocialTovarTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quSocialTovarSocial: TBooleanField
      FieldName = 'Social'
    end
  end
  object dsTovarPost: TDataSource
    DataSet = quTovarPost
    Left = 329
    Top = 49
  end
  object quTovarPost: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO TovarPost'
      
        '  (PostNo, TovarNo, TovarNoPost, NameTovarPost, NameTovar, NameT' +
        'ovarShort, BarCode, TovarNoPostText, TovarNoPostSecond, TovarNoP' +
        'ostSecondText)'
      'VALUES'
      
        '  (:PostNo, :TovarNo, :TovarNoPost, :NameTovarPost, :NameTovar, ' +
        ':NameTovarShort, :BarCode, :TovarNoPostText, :TovarNoPostSecond,' +
        ' :TovarNoPostSecondText)'
      'SET :id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM TovarPost'
      'WHERE'
      '  id = :Old_id'
      ''
      'delete from PriceForVeb'
      'where'
      '  TovarNo = :TovarNo')
    SQLUpdate.Strings = (
      'UPDATE TovarPost'
      'SET'
      '  PostNo = :PostNo, '
      '  TovarNo = :TovarNo, '
      '  TovarNoPost = :TovarNoPost, '
      '  NameTovarPost = :NameTovarPost,'
      '  NameTovar = :NameTovar, '
      '  NameTovarShort = :NameTovarShort, '
      '  BarCode = :BarCode,'
      '  TovarNoPostText = :TovarNoPostText,'
      '  TovarNoPostSecond = :TovarNoPostSecond,'
      '  TovarNoPostSecondText = :TovarNoPostSecondText'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      'SELECT TovarPost.PostNo, '
      '       TovarPost.TovarNo, '
      '       TovarPost.TovarNoPost,'
      '       TovarPost.NameTovarPost, '
      '       TovarPost.NameTovar, '
      '       TovarPost.NameTovarShort, '
      '       TovarPost.BarCode,'
      '       TovarPost.TovarNoPostText '
      ' FROM TovarPost'
      '  WHERE id = :id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * '
      ' from TovarPost '
      '  where TovarNo = isnull(:TovarNo,TovarNo)'
      '    and PostNo = isnull(:PostNo,PostNo)')
    BeforePost = quTovarPostBeforePost
    Left = 360
    Top = 49
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end
      item
        DataType = ftInteger
        Name = 'PostNo'
        Value = 490
      end>
    object quTovarPostid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object quTovarPostPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quTovarPostTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarPostTovarNoPost: TIntegerField
      DisplayWidth = 128
      FieldName = 'TovarNoPost'
    end
    object quTovarPostNameTovarPost: TStringField
      FieldName = 'NameTovarPost'
      Size = 128
    end
    object quTovarPostNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 128
    end
    object quTovarPostNameTovarShort: TStringField
      FieldName = 'NameTovarShort'
      Size = 64
    end
    object quTovarPostBarCode: TLargeintField
      FieldName = 'BarCode'
    end
    object quTovarPostTovarNoPostText: TStringField
      FieldName = 'TovarNoPostText'
      Size = 50
    end
    object quTovarPostTovarNoPostSecond: TIntegerField
      FieldName = 'TovarNoPostSecond'
    end
    object quTovarPostTovarNoPostSecondText: TStringField
      FieldName = 'TovarNoPostSecondText'
      Size = 50
    end
  end
  object quPostForTovar: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select PostNo,'
      '       Name,'
      '       Isnull(NameLong,Name) NameLong'
      ' from Post'
      '  where Post.Trash=0 '
      '    and Post.Visible=0'
      '    and (PostNO = Isnull(:PostNo ,PostNo) or :PostNo = 0)'
      'order by NameLong')
    Filtered = True
    Left = 336
    Top = 121
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
    object quPostForTovarPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quPostForTovarName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object quPostForTovarNameLong: TStringField
      FieldName = 'NameLong'
      Size = 80
    end
  end
  object dsPostForTovar: TDataSource
    DataSet = quPostForTovar
    Left = 305
    Top = 121
  end
  object quTovarWIthNoNDS: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @ID dtPkey'
      ''
      'select @ID=isnull(max(ID),0)+1 from TovarWithNoNDS'
      'set :id = @ID'
      ''
      'if @ID is null '
      ' set @ID = 1'
      'if @ID = 0 '
      ' set @ID = 1'
      ''
      ''
      'INSERT INTO TovarWithNoNDS'
      '  (ID, TovarNo, WithNoNDS)'
      'VALUES'
      '  (@ID, :TovarNo, :WithNoNDS)'
      'SET :Old_ID = ident_current('#39'TovarWithNoNDS'#39')'
      'end')
    SQLUpdate.Strings = (
      'declare '
      '    @cnt int'
      '   ,@ID dtPkey '
      ''
      
        'select @cnt = count(*) from TovarWithNoNDS where TovarNo = :Tova' +
        'rNo'
      ''
      'if @cnt = 0'
      'begin'
      
        '  select @Id = isnull(max(id),0) + 1 from TovarWithNoNDS where T' +
        'ovarNo = :TovarNo'
      '  '
      '  if @id is null'
      '   set @id = 1'
      '  if @id = 0'
      '   set @id = 1  '
      ''
      '  INSERT INTO TovarWithNoNDS'
      '    (ID, TovarNo, WithNoNDS)'
      '  VALUES'
      '    (@ID, :TovarNo, :WithNoNDS)  '
      ''
      'end'
      ''
      'if @cnt>0'
      ''
      'UPDATE TovarWithNoNDS'
      'SET'
      '  WithNoNDS = :WithNoNDS'
      'WHERE'
      '  TovarNo = :TovarNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'Select * from TovarWithNoNDS where TovarNo = isnull(:TovarNo,Tov' +
        'arNo)')
    BeforePost = quTovarWIthNoNDSBeforePost
    Left = 361
    Top = 361
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end>
    object quTovarWIthNoNDSID: TIntegerField
      FieldName = 'ID'
    end
    object quTovarWIthNoNDSTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarWIthNoNDSWithNoNDS: TBooleanField
      FieldName = 'WithNoNDS'
    end
  end
  object dsTovarWIthNoNDS: TDataSource
    DataSet = quTovarWIthNoNDS
    Left = 274
    Top = 231
  end
  object dsPrice: TDataSource
    DataSet = quPrice
    Left = 330
    Top = 231
  end
  object quPrice: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '    @cnt int'
      '  , @TovarNo int'
      '  , @PriceInInst decimal(18,3)'
      '  , @Edit_user  varchar(50)'
      '  , @Edit_host_name varchar(50)'
      '  , @PriceOld decimal(18,2)'
      ''
      'set @TovarNo = :TovarNo'
      'set @PriceInInst = :PriceInInst'
      'set @PriceOld = isnull(:PriceOld,0)'
      ''
      'select @Edit_user = suser_sname(),'
      '       @Edit_host_name = HOST_NAME()'
      ''
      'select @cnt = count(*) from PriceForVeb where TovarNo = @TovarNo'
      ''
      'if @cnt = 0'
      ' begin'
      '   INSERT INTO PriceForVeb'
      '      (TovarNo, PriceVeb, PriceInInst, PriceOld)'
      '    VALUES'
      '      (@TovarNo, 0, @PriceInInst, @PriceOld)'
      ''
      'declare'
      '   @Price decimal(18, 6),'
      '   @Price1 decimal(18, 6) ,'
      '   @Price2 decimal(18, 6) ,'
      '   @Price3 decimal(18, 6) ,'
      '   @Price4 decimal(10, 3) ,'
      '   @Price5 decimal(18, 4) ,'
      '   @Price6 decimal(18, 4) ,'
      '   @Price7 decimal(18, 4) ,'
      '   @Price8 decimal(18, 4) ,'
      '   @Price9 decimal(18, 4) ,'
      '   @Price10 decimal(18, 4) ,'
      '   @Price13 decimal(18, 4) ,'
      '   @Price14 decimal(18, 4) ,'
      '   @Price15 decimal(18, 4) ,'
      '   @AvgPriceIn decimal(18, 6) ,'
      '   @LastPriceIn decimal(18, 6)'
      ''
      'select  @Price = Price'
      '      , @Price1 = Price1'
      '      , @Price2 = Price2'
      '      , @Price3 = Price3'
      '      , @Price4 = Price4'
      '      , @Price5 = Price5'
      '      , @Price6 = Price6'
      '      , @Price7 = Price7'
      '      , @Price8 = Price8'
      '      , @Price9 = Price9'
      '      , @Price10 = Price10'
      '      , @Price13 = Price13'
      '      , @Price14 = Price14'
      '      , @Price15 = Price15'
      '      , @AvgPriceIn = AvgPriceIn'
      '      , @LastPriceIn = LastPriceIn'
      ' from Ostatok'
      '  where TovarNo = @TovarNo'
      '   '
      
        'insert into HistoriPrice (TovarNo, NameTovar, DateChangePrice, V' +
        'idName, Price, Price1, price2,'#9'Price3, Price4, Price5, Price6, P' +
        'rice7,'
      
        '                          Price8, Price9, Price10, Price13, Pric' +
        'e14, Price15, PriceVeb, PriceInInst, Edit_user, Edit_host_name, ' +
        'AvgPriceIn, LastPriceIn)'
      '     values (  @TovarNo'
      
        '             , (select NameTovar from Tovar where TovarNo = @Tov' +
        'arNo) '
      '             , getdate ()'
      
        '             , (select VidName from VidTov where VidNo = (select' +
        ' VidNo from Tovar where TovarNo = @TovarNo))'
      '             , @Price'
      '             , @Price1'
      '             , @Price2'
      '             , @Price3'
      '             , @Price4'
      '             , @Price5'
      '             , @Price6'
      '             , @Price7'
      '             , @Price8'
      '             , @Price9'
      '             , @Price10'
      '             , @Price13'
      '             , @Price14'
      '             , @Price15'
      '             , Null'
      '             , @PriceInInst'
      '             , @Edit_user'
      #9'     , @Edit_host_name'
      '             , @AvgPriceIn'
      '             , @LastPriceIn )'
      ''
      ''
      ''
      ' end')
    SQLUpdate.Strings = (
      'declare'
      '   '
      '    @TovarNo int'
      '  , @PriceInInst decimal(18, 3)'
      '  , @Edit_user  varchar(50)'
      '  , @Edit_host_name varchar(50)'
      '  , @PriceOld decimal(18,2)'
      '  , @cnt int'
      ''
      'set @TovarNo = :TovarNo '
      'set @PriceInInst = :PriceInInst'
      ''
      'select @Edit_user = suser_sname(),'
      '       @Edit_host_name = HOST_NAME()'
      ''
      ''
      'declare'
      '   @Price decimal(18, 6),'
      '   @Price1 decimal(18, 6) ,'
      '   @Price2 decimal(18, 6) ,'
      '   @Price3 decimal(18, 6) ,'
      '   @Price4 decimal(10, 3) ,'
      '   @Price5 decimal(18, 4) ,'
      '   @Price6 decimal(18, 4) ,'
      '   @Price7 decimal(18, 4) ,'
      '   @Price8 decimal(18, 4) ,'
      '   @Price9 decimal(18, 4) ,'
      '   @Price10 decimal(18, 4) ,'
      '   @Price13 decimal(18, 4) ,'
      '   @Price14 decimal(18, 4) ,'
      '   @Price15 decimal(18, 4) ,'
      '   @AvgPriceIn decimal(18, 6) ,'
      '   @LastPriceIn decimal(18, 6) '
      ''
      'select  @Price = Price'
      '      , @Price1 = Price1'
      '      , @Price2 = Price2'
      '      , @Price3 = Price3'
      '      , @Price4 = Price4'
      '      , @Price5 = Price5'
      '      , @Price6 = Price6'
      '      , @Price7 = Price7'
      '      , @Price8 = Price8'
      '      , @Price9 = Price9'
      '      , @Price10 = Price10'
      '      , @Price13 = Price13'
      '      , @Price14 = Price14'
      '      , @Price15 = Price15'
      '      , @AvgPriceIn = AvgPriceIn'
      '      , @LastPriceIn = LastPriceIn'
      ''
      ' from Ostatok'
      '  where TovarNo = @TovarNo'
      ''
      'if isnull(@PriceInInst,0) <>'
      '   (select isnull(pfv.PriceInInst,0) '
      '     from PriceForVeb pfv '
      '      where pfv.TovarNo = @TovarNo)'
      ''
      
        'insert into HistoriPrice (TovarNo, NameTovar, DateChangePrice, V' +
        'idName, Price, Price1,'#9'Price2,'#9'Price3, Price4, Price5, Price6, P' +
        'rice7,'
      
        '                          Price8, Price9, Price10, Price13, Pric' +
        'e14, Price15, PriceVeb, PriceInInst, Edit_user, Edit_host_name, ' +
        'AvgPriceIn, LastPriceIn)'
      ' values (  @TovarNo'
      
        '         , (select NameTovar from Tovar where TovarNo = @TovarNo' +
        ') '
      '         , getdate ()'
      
        '         , (select VidName from VidTov where VidNo = (select Vid' +
        'No from Tovar where TovarNo = @TovarNo))'
      '         , @Price'
      '         , @Price1'
      '         , @Price2'
      '         , @Price3'
      '         , @Price4'
      '         , @Price5'
      '         , @Price6'
      '         , @Price7'
      '         , @Price8'
      '         , @Price9'
      '         , @Price10'
      '         , @Price13'
      '         , @Price14'
      '         , @Price15'
      '         , Null'
      '         , @PriceInInst'
      '         , @Edit_user'
      #9' , @Edit_host_name'
      '         , @AvgPriceIn'
      '         , @LastPriceIn);'
      ''
      
        'select @cnt = count(*)  from PriceForVeb where TovarNo = @TovarN' +
        'o'
      ''
      'if @cnt > 0'
      ''
      'UPDATE PriceForVeb'
      'SET'
      '  PriceInInst = @PriceInInst,'
      '  PriceOld = @PriceOld'
      '  '
      'WHERE'
      '  TovarNo = @TovarNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare @TovarNo int'
      ''
      'set @TovarNo = :TovarNo'
      ''
      
        'Select * from PriceForVeb where TovarNo = isnull(@TovarNo,TovarN' +
        'o)')
    BeforePost = quPriceBeforePost
    Left = 361
    Top = 231
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end>
    object quPriceTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quPricePriceVeb: TFloatField
      FieldName = 'PriceVeb'
    end
    object quPricePriceInInst: TFloatField
      FieldName = 'PriceInInst'
    end
    object quPricePriceOld: TFloatField
      FieldName = 'PriceOld'
    end
  end
  object quTovarExpirationDate: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @cnt int'
      ''
      
        'select @cnt = count(*) from TovarExpirationDate where TovarNo = ' +
        ':TovarNo'
      ''
      'if @cnt = 0'
      'INSERT INTO TovarExpirationDate'
      '  (TovarNo, ExpirationDate)'
      'VALUES'
      '  (:TovarNo, :ExpirationDate)'
      ''
      'end')
    SQLUpdate.Strings = (
      'UPDATE TovarExpirationDate'
      'SET'
      '  ExpirationDate = :ExpirationDate'
      'WHERE'
      '  TovarNo = :TovarNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'Select * from TovarExpirationDate where TovarNo = isnull(:TovarN' +
        'o,TovarNo)')
    BeforePost = quTovarExpirationDateBeforePost
    Left = 361
    Top = 259
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end>
    object quTovarExpirationDateTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarExpirationDateExpirationDate: TIntegerField
      FieldName = 'ExpirationDate'
    end
  end
  object dsTovarExpirationDate: TDataSource
    DataSet = quTovarExpirationDate
    Left = 330
    Top = 259
  end
  object quListGoodStandarts: TMSQuery
    SQLUpdate.Strings = (
      'declare'
      '  @cnt int'
      ''
      'select @cnt = count(l.id) '
      ' from l_GoodStandart l '
      '  where l.Standart_id = :StandartNo '
      '    and l.TovarNo = :TovarNo'
      ''
      'if @cnt >0'
      ''
      '{CALL sp_SetGoodStandart(:TovarNo, :StandartNo, :is_chesk)}')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select g.StandartName'
      '      ,Case when l.id is null then cast(0 as bit)'
      '       else cast(1 as bit) end as is_chesk'
      '      ,g.StandartNo'
      '      ,isnull(l.TovarNo,:p_TovarNo1) as TovarNo'
      ' from GoodStandarts g left outer join'
      
        '      l_GoodStandart l on l.Standart_id = g.StandartNo and l.Tov' +
        'arNo = :p_TovarNo'
      '  where g.Active = 1')
    Left = 37
    Top = 317
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_TovarNo1'
      end
      item
        DataType = ftUnknown
        Name = 'p_TovarNo'
      end>
    object quListGoodStandartsStandartName: TStringField
      FieldName = 'StandartName'
      Size = 50
    end
    object quListGoodStandartsis_chesk: TBooleanField
      FieldName = 'is_chesk'
      ReadOnly = True
    end
    object quListGoodStandartsStandartNo: TIntegerField
      FieldName = 'StandartNo'
      ReadOnly = True
    end
    object quListGoodStandartsTovarNo: TIntegerField
      FieldName = 'TovarNo'
    end
  end
  object dsListGoodStandarts: TMSDataSource
    DataSet = quListGoodStandarts
    Left = 65517
    Top = 317
  end
  object sp_SetGoodStandart: TMSStoredProc
    StoredProcName = 'sp_SetGoodStandart'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_SetGoodStandart (:p_TovarNo, :p_Standar' +
        't_id, :p_Check)}')
    Left = 69
    Top = 317
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_TovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Standart_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Check'
        ParamType = ptInput
      end>
  end
  object dsTovarForReturn: TMSDataSource
    DataSet = quTovarForReturn
    Left = 65524
    Top = 272
  end
  object quTovarForReturn: TMSQuery
    SQLDelete.Strings = (
      'delete from l_TovarForReturn'
      'where TovarNo = :TovarNo'
      '  and TovarNoReturn = :TovarNoReturn'
      '  and TypeReturnNo = :TypeReturnNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select d.TypeReturnName'
      '      ,t.NameTovar'
      '      ,d.TypeReturnNo'
      '      ,l.TovarNo'
      '      ,tr.NameTovar as NameTovarReturn '
      '      ,l.TovarNoReturn'
      ' from D_TypeReturn d left outer join'
      
        '      l_TovarForReturn l on l.TypeReturnNo = d.TypeReturnNo and ' +
        'l.TovarNo = :TovarNo left join '
      '      Tovar t on t.TovarNo = l.TovarNo left join'
      '      Tovar tr on tr.TovarNo = l.TovarNoReturn'
      '  where d.Active = 1')
    Left = 140
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end>
    object quTovarForReturnTypeReturnName: TStringField
      FieldName = 'TypeReturnName'
      Size = 50
    end
    object quTovarForReturnNameTovarReturn: TStringField
      FieldName = 'NameTovarReturn'
      Size = 128
    end
    object quTovarForReturnNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 128
    end
    object quTovarForReturnTypeReturnNo: TIntegerField
      FieldName = 'TypeReturnNo'
      ReadOnly = True
    end
    object quTovarForReturnTovarNo: TIntegerField
      FieldName = 'TovarNo'
    end
    object quTovarForReturnTovarNoReturn: TIntegerField
      FieldName = 'TovarNoReturn'
    end
  end
  object quDelLinkTovarForReturn: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'delete from l_TovarForReturn'
      'where TovarNo = :TovarNo'
      '  and TovarNoReturn = :TovarNoReturn'
      '  and TypeReturnNo = :TypeReturnNo')
    Left = 180
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end
      item
        DataType = ftInteger
        Name = 'TovarNoReturn'
      end
      item
        DataType = ftInteger
        Name = 'TypeReturnNo'
      end>
  end
  object dsOurTovar: TMSDataSource
    DataSet = quOurTovar
    Left = 268
    Top = 312
  end
  object dsService: TMSDataSource
    DataSet = quService
    Left = 300
    Top = 400
  end
  object quOurTovar: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @ID dtPkey'
      ''
      'select @ID=max(ID)+1 from Our_Tovar'
      'if @ID is null '
      ' set @ID = 1'
      'if @ID = 0'
      ' set @ID = 1'
      'set :id = @ID'
      ''
      ''
      'INSERT INTO Our_Tovar'
      '  (ID, TovarNo, NotOur)'
      'VALUES'
      '  (@ID, :TovarNo, :NotOur)'
      'SET :Old_ID = ident_current('#39'Our_Tovar'#39')'
      'end')
    SQLUpdate.Strings = (
      'UPDATE Our_Tovar'
      'SET'
      '  ID = :ID, TovarNo = :TovarNo, NotOur = :NotOur'
      'WHERE'
      '  ID = :Old_ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from Our_Tovar where TovarNo = isnull(:TovarNo,TovarNo)')
    BeforePost = quOurTovarBeforePost
    Left = 244
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
        Value = 0
      end>
    object quOurTovarID: TIntegerField
      FieldName = 'ID'
    end
    object quOurTovarTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quOurTovarNotOur: TBooleanField
      FieldName = 'NotOur'
    end
  end
  object quService: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @ID dtPkey'
      ''
      'select @ID=isnull(max(ID),0)+1 from Service'
      'set :id = @ID'
      ''
      ''
      'INSERT INTO Service'
      '  (ID, TovarNo, is_Service)'
      'VALUES'
      '  (@ID, :TovarNo, :is_Service)'
      'SET :Old_ID = ident_current('#39'Service'#39')'
      'end')
    SQLUpdate.Strings = (
      'UPDATE Service'
      'SET'
      '  ID = :ID, TovarNo = :TovarNo, is_Service = :is_Service'
      'WHERE'
      '  ID = :Old_ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from Service where TovarNo = :TovarNo')
    BeforePost = quServiceBeforePost
    Left = 328
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end>
    object quServiceID: TIntegerField
      FieldName = 'ID'
    end
    object quServiceTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quServiceIs_Service: TBooleanField
      FieldName = 'Is_Service'
    end
  end
  object quTovarNds: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @ID dtPkey'
      '       ,@Cnt int '
      ''
      'select @ID=max(ID)+1 from TovarNDS'
      'if @ID is null '
      ' set @ID = 1'
      'if @ID = 0'
      ' set @ID = 1'
      'set :id = @ID'
      ''
      'select @Cnt = count(*) from TovarNDS where TovarNo = :TovarNo '
      ''
      'if @Cnt = 0'
      'INSERT INTO TovarNDS'
      '  (ID, TovarNo, StavNDS , GroupNDS, IsStavNDS)'
      'VALUES'
      '  (@ID, :TovarNo, :StavNDS , :GroupNDS, :IsStavNDS)'
      'SET :Old_ID = ident_current('#39'TovarNDS'#39')'
      'end')
    SQLUpdate.Strings = (
      'declare'
      '  @cnt int'
      ' ,@ID dtPkey'
      ''
      'select @cnt = count(*) from TovarNDS where TovarNo = :TovarNo'
      ''
      'if @cnt = 0'
      ' begin '
      '   select @ID=max(ID)+1 from TovarNDS'
      '   if @ID is null '
      '    set @ID = 1'
      '   if @ID = 0'
      '    set @ID = 1'
      '   set :id = @ID'
      '   INSERT INTO TovarNDS'
      '       (ID, TovarNo, StavNDS , GroupNDS, IsStavNDS)'
      '   VALUES'
      '       (@ID, :TovarNo, :StavNDS , :GroupNDS, :IsStavNDS)'
      ' end'
      'if @cnt = 1'
      ' begin'
      '   UPDATE TovarNDS'
      '    SET'
      
        '     StavNDS = :StavNDS, GroupNDS = :GroupNDS, IsStavNDS = :IsSt' +
        'avNDS'
      '   WHERE'
      '    TovarNo = :TovarNo'
      ' end')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from TovarNDS where TovarNo = :TovarNo')
    BeforePost = quTovarNdsBeforePost
    Left = 65524
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end>
    object quTovarNdsId: TIntegerField
      FieldName = 'Id'
    end
    object quTovarNdsTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarNdsStavNDS: TIntegerField
      FieldName = 'StavNDS'
    end
    object quTovarNdsGroupNDS: TStringField
      FieldName = 'GroupNDS'
      Size = 10
    end
    object quTovarNdsIsStavNDS: TBooleanField
      FieldName = 'IsStavNDS'
    end
  end
  object dsTovarNDS: TMSDataSource
    DataSet = quTovarNds
    Left = 4
    Top = 400
  end
  object quTovarNOPP: TMSQuery
    SQLInsert.Strings = (
      'declare'
      ' @cnt int'
      ''
      'select @cnt = count(*) from TovarNOPP where TovarNo = :TovarNo'
      ''
      'if @cnt = 0'
      'INSERT INTO TovarNOPP'
      '  (TovarNo, No_pp)'
      'VALUES'
      '  (:TovarNo, :No_pp)')
    SQLUpdate.Strings = (
      'declare'
      ' @cnt int'
      ''
      'select @cnt = count(*) from TovarNOPP where TovarNo = :TovarNo'
      ''
      'if @cnt = 0'
      'INSERT INTO TovarNOPP'
      '  (TovarNo, No_pp)'
      'VALUES'
      '  (:TovarNo, :No_pp)'
      ''
      'if @cnt >0'
      'UPDATE TovarNOPP'
      'SET'
      '  No_pp = :No_pp'
      'WHERE'
      '  TovarNo = :TovarNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from TovarNoPP where TovarNo = :TovarNo')
    BeforePost = quTovarNOPPBeforePost
    Left = 325
    Top = 365
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end>
    object quTovarNOPPTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarNOPPNo_pp: TIntegerField
      FieldName = 'No_pp'
    end
  end
  object dsTovarNoPP: TMSDataSource
    DataSet = quTovarNOPP
    Left = 301
    Top = 365
  end
  object quTovarSupplier: TMSQuery
    SQLInsert.Strings = (
      'insert into TovarSupplier (TovarNo,PostNo)'
      '  values(:TovarNo,:PostNo)')
    SQLDelete.Strings = (
      'delete TovarSupplier'
      ' where TovarNo = :TovarNo')
    SQLUpdate.Strings = (
      'declare'
      ' @cnt int'
      ''
      
        'select @cnt = count(*) from TovarSupplier where TovarNo = :Tovar' +
        'No'
      ''
      'if @cnt = 0'
      ' insert into TovarSupplier (TovarNo,PostNo)'
      '  values(:TovarNo,:PostNo)'
      ''
      'if @cnt > 0'
      ' update TovarSupplier'
      '  set PostNo = :PostNo'
      ' where TovarNo = :TovarNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  Id'
      '       ,TovarNo'
      '       ,PostNo'
      
        '       ,(select Name from Post where PostNo = ts.PostNo) PostNam' +
        'e'
      ' from TovarSupplier ts'
      '  where ts.TovarNo = isnull(:TovarNo,ts.TovarNo)')
    BeforePost = quTovarSupplierBeforePost
    Left = 365
    Top = 285
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end>
    object quTovarSupplierId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
    end
    object quTovarSupplierTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarSupplierPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quTovarSupplierPostName: TStringField
      FieldName = 'PostName'
      ReadOnly = True
      Size = 30
    end
  end
  object dsTovarSupplier: TMSDataSource
    DataSet = quTovarSupplier
    Left = 333
    Top = 285
  end
  object quTovarFromDeliveryOfGoods: TMSQuery
    SQLInsert.Strings = (
      'insert into TovarFromDeliveryOfGoods (TovarNo,DeliveryTovarNo)'
      '  values (:TovarNo,:DeliveryTovarNo)')
    SQLDelete.Strings = (
      'delete TovarFromDeliveryOfGoods'
      'where TovarNo = :TovarNo')
    SQLUpdate.Strings = (
      'declare '
      ' @cnt int'
      ''
      
        'select @cnt = count(*) from TovarFromDeliveryOfGoods where Tovar' +
        'No = :TovarNo'
      ''
      'if @cnt = 0'
      ' insert into TovarFromDeliveryOfGoods (TovarNo,DeliveryTovarNo)'
      '  values (:TovarNo,:DeliveryTovarNo)'
      ''
      'if @cnt > 0'
      ' update TovarFromDeliveryOfGoods'
      '  set DeliveryTovarNo = :DeliveryTovarNo'
      ' where TovarNo = :TovarNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  t.TovarNo'
      '       ,tfdg.DeliveryTovarNo'
      '       ,dog.DeliveryGoodsName'
      ' from TovarFromDeliveryOfGoods tfdg left join'
      '      Tovar t on t.TovarNo = tfdg.TovarNo left join'
      
        '      DeliveryOfGoods dog on dog.DeliveryTovarNo = tfdg.Delivery' +
        'TovarNo and dog.Visible = 0'
      '  where tfdg.TovarNo = :TovarNo')
    BeforePost = quTovarFromDeliveryOfGoodsBeforePost
    Left = 365
    Top = 317
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TovarNo'
      end>
    object quTovarFromDeliveryOfGoodsTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarFromDeliveryOfGoodsDeliveryTovarNo: TIntegerField
      FieldName = 'DeliveryTovarNo'
    end
    object quTovarFromDeliveryOfGoodsDeliveryGoodsName: TStringField
      FieldName = 'DeliveryGoodsName'
      Size = 50
    end
  end
  object dsTovarFromDeliveryOfGoods: TMSDataSource
    DataSet = quTovarFromDeliveryOfGoods
    Left = 333
    Top = 317
  end
end
