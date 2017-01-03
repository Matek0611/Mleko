inherited EditClientCardForm: TEditClientCardForm
  Left = 197
  Top = 39
  Width = 1639
  Height = 622
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1623
    Height = 129
    Align = alTop
    TabOrder = 0
    OnExit = Panel1Exit
    DesignSize = (
      1623
      129)
    object Label1: TLabel
      Left = 8
      Top = 27
      Width = 142
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
    end
    object Label2: TLabel
      Left = 8
      Top = 45
      Width = 83
      Height = 13
      Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 73
      Height = 13
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    end
    object Label4: TLabel
      Left = 8
      Top = 88
      Width = 215
      Height = 13
      Caption = #1058#1086#1088#1075#1086#1074#1099#1081' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1100' ('#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081')'
    end
    object Label5: TLabel
      Left = 9
      Top = 9
      Width = 91
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object dbtIdDoc: TDBText
      Left = 160
      Top = 9
      Width = 44
      Height = 13
      AutoSize = True
      DataField = 'id'
      DataSource = dsDocClientCardHead
    end
    object dbtPostName: TDBText
      Left = 160
      Top = 27
      Width = 64
      Height = 13
      AutoSize = True
      DataField = 'PostName'
      DataSource = dsDocClientCardHead
    end
    object dbtDocDate: TDBText
      Left = 160
      Top = 45
      Width = 58
      Height = 13
      AutoSize = True
      DataField = 'DocDate'
      DataSource = dsDocClientCardHead
    end
    object dbtUserName: TDBText
      Left = 160
      Top = 64
      Width = 65
      Height = 13
      AutoSize = True
      DataField = 'UserName'
      DataSource = dsDocClientCardHead
    end
    object cbIsAllAddress: TCheckBox
      Left = 26
      Top = 108
      Width = 138
      Height = 16
      Anchors = [akBottom]
      BiDiMode = bdLeftToRight
      Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1074#1089#1077' '#1072#1076#1088#1077#1089#1072
      Checked = True
      Color = clBtnFace
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentBiDiMode = False
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      State = cbChecked
      TabOrder = 0
      OnClick = cbIsAllAddressClick
    end
    object cbIsAllSotrud: TCheckBox
      Left = 152
      Top = 108
      Width = 172
      Height = 17
      Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = cbIsAllSotrudClick
    end
    object cbSotrud: TDBLookupComboboxEh
      Left = 240
      Top = 87
      Width = 177
      Height = 21
      DataField = 'SotrudNo'
      DataSource = dsDocClientCardHead
      EditButtons = <>
      KeyField = 'SotrudNo'
      ListField = 'SotrudName'
      ListSource = dmDataModule.dsSotrud
      TabOrder = 2
      Visible = True
      OnExit = cbSotrudExit
    end
    object dbcbPrint3: TDBCheckBoxEh
      Left = 233
      Top = 11
      Width = 231
      Height = 17
      Caption = #1055#1077#1095#1072#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1099#1093' '#1074' 3-'#1093' '#1101#1082#1079#1077#1084#1087#1083#1103#1088#1072#1093
      DataField = 'Print3'
      DataSource = dsDocClientCardHead
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = dbcbPrint3Click
    end
    object dbcbTTN: TDBCheckBoxEh
      Left = 233
      Top = 40
      Width = 239
      Height = 17
      Caption = #1053#1072#1083#1080#1095#1080#1077' '#1090#1086#1074#1072#1088#1085#1086'-'#1090#1088#1072#1085#1089#1087#1086#1088#1090#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      DataField = 'TTN'
      DataSource = dsDocClientCardHead
      TabOrder = 4
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = dbcbTTNClick
    end
    object GroupBox4: TGroupBox
      Left = 788
      Top = 8
      Width = 313
      Height = 113
      Caption = #1055#1086#1076#1087#1080#1089#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object DBGridEhSignature: TDBGridEh
        Left = 2
        Top = 15
        Width = 309
        Height = 96
        Align = alClient
        DataSource = dsListUserForVidDoc
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = DBGridEhSignatureDrawColumnCell
        OnGetCellParams = DBGridEhSignatureGetCellParams
      end
    end
    object cbIsDocSignature: TCheckBox
      Left = 1104
      Top = 16
      Width = 97
      Height = 17
      Caption = #1055#1086#1076#1087#1080#1089#1072#1090#1100
      TabOrder = 6
      OnClick = cbIsDocSignatureClick
    end
    object cbIsEdit: TCheckBox
      Left = 336
      Top = 110
      Width = 185
      Height = 17
      Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1080#1079#1084#1077#1085#1077#1085#1085#1099#1077
      TabOrder = 7
      OnClick = cbIsEditClick
    end
    object GroupBox6: TGroupBox
      Left = 473
      Top = 9
      Width = 313
      Height = 105
      Caption = #1043#1088#1091#1087#1087#1072' '#1087#1086#1088#1077#1079#1082#1080' '#1079#1072#1082#1072#1079#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object DBGridEhGroupCutting: TDBGridEh
        Left = 2
        Top = 15
        Width = 309
        Height = 88
        Align = alClient
        DataSource = dsDocClientCardPostGroupCuttingSpec
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnExit = DBGridEhGroupCuttingExit
        OnGetCellParams = DBGridEhGroupCuttingGetCellParams
        OnKeyDown = DBGridEhGroupCuttingKeyDown
        Columns = <
          item
            EditButtons = <>
            FieldName = 'GroupCuttingName'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'VidName'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'IsLock'
            Footers = <>
            Title.Alignment = taCenter
          end
          item
            EditButtons = <>
            FieldName = 'Id'
            Footers = <>
            Visible = False
          end>
      end
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 548
    Width = 1623
    Height = 35
    Align = alBottom
    TabOrder = 1
    object bbOK: TBitBtn
      Left = 520
      Top = 5
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
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
      Left = 596
      Top = 5
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = bbcancelClick
      Kind = bkCancel
    end
    object bbConductingDoc: TBitBtn
      Left = 736
      Top = 5
      Width = 137
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      ModalResult = 1
      TabOrder = 2
      OnClick = bbConductingDocClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
        44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
        00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
        33833F333383F33300003333AA463362A433333333383F333833F33300003333
        6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
        33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
        6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
        000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
        333383333333F3330000333333322AAA4333333333333833333F333300003333
        333322A4333333333333338333F333330000333333344A433333333333333338
        3F333333000033333336A24333333333333333833F333333000033333336AA43
        33333333333333833F3333330000333333336663333333333333333888333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 129
    Width = 1623
    Height = 419
    Align = alClient
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1065
      Top = 1
      Width = 557
      Height = 248
      Align = alClient
      Caption = #1054#1090#1089#1088#1086#1095#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object DBGridEhDelay: TDBGridEh
        Left = 2
        Top = 15
        Width = 553
        Height = 231
        Align = alClient
        DataSource = dsDalay
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnExit = DBGridEhDelayExit
        OnGetCellParams = DBGridEhDelayGetCellParams
        OnKeyDown = DBGridEhDelayKeyDown
      end
    end
    object GroupBox2: TGroupBox
      Left = 433
      Top = 1
      Width = 632
      Height = 248
      Align = alLeft
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object DBGridEhSotrud: TDBGridEh
        Left = 2
        Top = 15
        Width = 628
        Height = 231
        Align = alClient
        DataSource = dsSotrudAddress
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnExit = DBGridEhSotrudExit
        OnGetCellParams = DBGridEhSotrudGetCellParams
        OnKeyDown = DBGridEhSotrudKeyDown
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 249
      Width = 1621
      Height = 169
      Align = alBottom
      TabOrder = 2
      object GroupBox3: TGroupBox
        Left = 1329
        Top = 1
        Width = 291
        Height = 167
        Align = alRight
        Caption = #1062#1077#1085#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object DBGridEhPrice: TDBGridEh
          Left = 2
          Top = 15
          Width = 287
          Height = 150
          Align = alClient
          DataSource = dsPrice
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnExit = DBGridEhPriceExit
          OnGetCellParams = DBGridEhPriceGetCellParams
          OnKeyDown = DBGridEhPriceKeyDown
        end
      end
      object gbAdvancetProvAddress: TGroupBox
        Left = 1
        Top = 1
        Width = 1328
        Height = 167
        Align = alClient
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lbAddressNoPost: TLabel
          Left = 7
          Top = 16
          Width = 190
          Height = 13
          Caption = #8470' '#1072#1076#1088#1077#1089#1072' '#1074' '#1073#1072#1079#1077' '#1091' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
        end
        object lbAddressPost: TLabel
          Left = 9
          Top = 34
          Width = 158
          Height = 13
          Caption = #1040#1076#1088#1077#1089' '#1074' '#1073#1072#1079#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
        end
        object lbCategoryName: TLabel
          Left = 9
          Top = 52
          Width = 83
          Height = 13
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1058#1058
        end
        object lbTimeBeg: TLabel
          Left = 8
          Top = 76
          Width = 58
          Height = 13
          Caption = #1056#1072#1073#1086#1090#1072' '#1089' '
        end
        object lbUnloading: TLabel
          Left = 200
          Top = 78
          Width = 98
          Height = 13
          Caption = #1056#1072#1079#1075#1088#1091#1079#1082#1072'('#1084#1080#1085'.)'
        end
        object lbTimeEnd: TLabel
          Left = 112
          Top = 77
          Width = 23
          Height = 13
          Caption = ' '#1087#1086' '
        end
        object lbQuantityDelivery: TLabel
          Left = 8
          Top = 98
          Width = 139
          Height = 13
          Caption = #1057#1087#1077#1094#1076#1086#1089#1090#1072#1074#1082#1072'  '#1086#1090' ('#1082#1075'): '
        end
        object lbRegionName: TLabel
          Left = 447
          Top = 14
          Width = 37
          Height = 13
          Caption = #1056#1072#1081#1086#1085
        end
        object lbCity: TLabel
          Left = 447
          Top = 39
          Width = 36
          Height = 13
          Caption = #1043#1086#1088#1086#1076
        end
        object lbStreet: TLabel
          Left = 447
          Top = 63
          Width = 38
          Height = 13
          Caption = #1059#1083#1080#1094#1072
        end
        object lbHouseNo: TLabel
          Left = 447
          Top = 84
          Width = 50
          Height = 13
          Caption = #8470' '#1044#1086#1084#1072
        end
        object lbCar: TLabel
          Left = 447
          Top = 108
          Width = 48
          Height = 13
          Caption = #1052#1072#1096#1080#1085#1072
        end
        object lbDriver: TLabel
          Left = 446
          Top = 136
          Width = 57
          Height = 13
          Caption = #1042#1086#1076#1080#1090#1077#1083#1100
        end
        object lbX: TLabel
          Left = 9
          Top = 118
          Width = 45
          Height = 13
          Caption = #1064#1080#1088#1086#1090#1072
        end
        object lbY: TLabel
          Left = 195
          Top = 117
          Width = 51
          Height = 13
          Caption = #1044#1086#1083#1075#1086#1090#1072
        end
        object lbDateDeparture: TLabel
          Left = 8
          Top = 139
          Width = 79
          Height = 13
          Caption = #1044#1072#1090#1072' '#1074#1099#1077#1079#1076#1072
        end
        object lbClassifierName: TLabel
          Left = 228
          Top = 141
          Width = 142
          Height = 13
          Caption = 'ABCDZ '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088' '
        end
        object lbMail1: TLabel
          Left = 744
          Top = 14
          Width = 70
          Height = 13
          Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 1'
        end
        object lbMail2: TLabel
          Left = 744
          Top = 38
          Width = 70
          Height = 13
          Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 2'
        end
        object lbMail3: TLabel
          Left = 744
          Top = 59
          Width = 70
          Height = 13
          Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 3'
        end
        object lbTopic: TLabel
          Left = 742
          Top = 83
          Width = 80
          Height = 13
          Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072
        end
        object lbMessage: TLabel
          Left = 741
          Top = 106
          Width = 84
          Height = 13
          Caption = #1058#1077#1082#1089#1090' '#1087#1080#1089#1100#1084#1072
        end
        object lbCode: TLabel
          Left = 744
          Top = 134
          Width = 77
          Height = 13
          Caption = #1050#1072#1085#1072#1083' '#1089#1073#1099#1090#1072
        end
        object lbKOATUU: TLabel
          Left = 872
          Top = 133
          Width = 71
          Height = 13
          Caption = #1058#1077#1088#1088#1080#1090#1086#1088#1080#1080
        end
        object lbCommerce_Network: TLabel
          Left = 949
          Top = 15
          Width = 88
          Height = 13
          Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1089#1077#1090#1100
        end
        object DBEditEhAddressNoPost: TDBEditEh
          Left = 207
          Top = 13
          Width = 41
          Height = 21
          DataField = 'AddressNoPost'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 0
          Visible = True
          OnChange = DBEditEhAddressNoPostChange
          OnCheckDrawRequiredState = DBEditEhAddressNoPostCheckDrawRequiredState
        end
        object DBEditEhAddressPost: TDBEditEh
          Left = 207
          Top = 32
          Width = 225
          Height = 21
          DataField = 'AddressPost'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 1
          Visible = True
          OnChange = DBEditEhAddressPostChange
          OnCheckDrawRequiredState = DBEditEhAddressPostCheckDrawRequiredState
        end
        object DBEditEhCategoryName: TDBEditEh
          Left = 207
          Top = 50
          Width = 29
          Height = 21
          DataField = 'CategoryName'
          DataSource = dsAddressPost
          EditButtons = <>
          ReadOnly = True
          TabOrder = 2
          Visible = True
          OnChange = DBEditEhCategoryNameChange
          OnCheckDrawRequiredState = DBEditEhCategoryNameCheckDrawRequiredState
          OnDblClick = DBEditEhCategoryNameDblClick
        end
        object DBEditEhTimeBeg: TDBEditEh
          Left = 72
          Top = 72
          Width = 35
          Height = 21
          DataField = 'TimeBeg'
          DataSource = dsAddressPost
          EditButtons = <>
          MaxLength = 5
          TabOrder = 3
          Visible = True
          OnChange = DBEditEhTimeBegChange
          OnCheckDrawRequiredState = DBEditEhTimeBegCheckDrawRequiredState
          EditMask = '90:00;1;_'
        end
        object DBEditEhTimeEnd: TDBEditEh
          Left = 144
          Top = 72
          Width = 37
          Height = 21
          DataField = 'TimeEnd'
          DataSource = dsAddressPost
          EditButtons = <>
          MaxLength = 5
          TabOrder = 4
          Visible = True
          OnChange = DBEditEhTimeEndChange
          OnCheckDrawRequiredState = DBEditEhTimeEndCheckDrawRequiredState
          EditMask = '90:00;1;_'
        end
        object DBEditEhUnloading: TDBEditEh
          Left = 304
          Top = 72
          Width = 33
          Height = 21
          DataField = 'Unloading'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 5
          Visible = True
          OnChange = DBEditEhUnloadingChange
          OnCheckDrawRequiredState = DBEditEhUnloadingCheckDrawRequiredState
        end
        object cbRefrezherator: TDBCheckBoxEh
          Left = 318
          Top = 96
          Width = 115
          Height = 17
          Caption = #1056#1077#1092#1088#1077#1078#1077#1088#1072#1090#1086#1088
          DataField = 'Refrezherator'
          DataSource = dsAddressPost
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbRefrezheratorClick
        end
        object DBEditEhQuantityDelivery: TDBEditEh
          Left = 144
          Top = 93
          Width = 41
          Height = 21
          DataField = 'QuantityDelivery'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 7
          Visible = True
          OnChange = DBEditEhQuantityDeliveryChange
          OnCheckDrawRequiredState = DBEditEhQuantityDeliveryCheckDrawRequiredState
        end
        object cbSpecialDelivery: TDBCheckBox
          Left = 200
          Top = 97
          Width = 115
          Height = 17
          Caption = #1057#1087#1077#1094' '#1076#1086#1089#1090#1072#1074#1082#1072
          DataField = 'SpecialDelivery'
          DataSource = dsAddressPost
          TabOrder = 8
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = cbSpecialDeliveryClick
        end
        object DBLookupComboboxEhRegionNo: TDBLookupComboboxEh
          Left = 504
          Top = 10
          Width = 137
          Height = 21
          DataField = 'RegionNo'
          DataSource = dsAddressPost
          EditButtons = <>
          KeyField = 'RegionNo'
          ListField = 'RegionName'
          ListSource = dmDataModule.dsRegions
          TabOrder = 9
          Visible = True
          OnChange = DBLookupComboboxEhRegionNoChange
          OnCheckDrawRequiredState = DBLookupComboboxEhRegionNoCheckDrawRequiredState
        end
        object DBEditEhHouseNo: TDBEditEh
          Left = 504
          Top = 82
          Width = 33
          Height = 21
          DataField = 'HouseNo'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 10
          Visible = True
          OnChange = DBEditEhHouseNoChange
          OnCheckDrawRequiredState = DBEditEhHouseNoCheckDrawRequiredState
        end
        object DBEditEhStreet: TDBEditEh
          Left = 504
          Top = 59
          Width = 225
          Height = 21
          DataField = 'Street'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 11
          Visible = True
          OnChange = DBEditEhStreetChange
          OnCheckDrawRequiredState = DBEditEhStreetCheckDrawRequiredState
        end
        object DBEditEhCity: TDBEditEh
          Left = 504
          Top = 35
          Width = 137
          Height = 21
          DataField = 'City'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 12
          Visible = True
          OnChange = DBEditEhCityChange
          OnCheckDrawRequiredState = DBEditEhCityCheckDrawRequiredState
        end
        object DBEditEhCar: TDBEditEh
          Left = 504
          Top = 105
          Width = 225
          Height = 21
          DataField = 'Car'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 13
          Visible = True
          OnChange = DBEditEhCarChange
          OnCheckDrawRequiredState = DBEditEhCarCheckDrawRequiredState
        end
        object DBEditEhDriver: TDBEditEh
          Left = 504
          Top = 131
          Width = 225
          Height = 21
          DataField = 'Driver'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 14
          Visible = True
          OnChange = DBEditEhDriverChange
          OnCheckDrawRequiredState = DBEditEhDriverCheckDrawRequiredState
        end
        object DBEditEhX: TDBEditEh
          Left = 64
          Top = 114
          Width = 121
          Height = 21
          DataField = 'X'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 15
          Visible = True
          OnChange = DBEditEhXChange
          OnCheckDrawRequiredState = DBEditEhXCheckDrawRequiredState
        end
        object DBEditEhY: TDBEditEh
          Left = 264
          Top = 114
          Width = 121
          Height = 21
          DataField = 'Y'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 16
          Visible = True
          OnChange = DBEditEhYChange
          OnCheckDrawRequiredState = DBEditEhYCheckDrawRequiredState
        end
        object DBEditEhDateDeparture: TDBEditEh
          Left = 93
          Top = 136
          Width = 121
          Height = 21
          DataField = 'DateDeparture'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 17
          Visible = True
          OnChange = DBEditEhDateDepartureChange
          OnCheckDrawRequiredState = DBEditEhDateDepartureCheckDrawRequiredState
        end
        object DBEditEhClassifierName: TDBEditEh
          Left = 382
          Top = 138
          Width = 25
          Height = 21
          DataField = 'ClassifierName'
          DataSource = dsAddressPost
          EditButtons = <>
          ReadOnly = True
          TabOrder = 18
          Visible = True
          OnChange = DBEditEhClassifierNameChange
          OnCheckDrawRequiredState = DBEditEhClassifierNameCheckDrawRequiredState
          OnDblClick = DBEditEhClassifierNameDblClick
        end
        object DBEditEhMail1: TDBEditEh
          Left = 824
          Top = 10
          Width = 120
          Height = 21
          DataField = 'Mail1'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 19
          Visible = True
          OnChange = DBEditEhMail1Change
          OnCheckDrawRequiredState = DBEditEhMail1CheckDrawRequiredState
        end
        object DBEditEhMail2: TDBEditEh
          Left = 824
          Top = 34
          Width = 121
          Height = 21
          DataField = 'Mail2'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 20
          Visible = True
          OnChange = DBEditEhMail2Change
          OnCheckDrawRequiredState = DBEditEhMail2CheckDrawRequiredState
        end
        object DBEditEhMail3: TDBEditEh
          Left = 824
          Top = 57
          Width = 121
          Height = 21
          DataField = 'Mail3'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 21
          Visible = True
          OnChange = DBEditEhMail3Change
          OnCheckDrawRequiredState = DBEditEhMail3CheckDrawRequiredState
        end
        object DBEditEhTopic: TDBEditEh
          Left = 824
          Top = 80
          Width = 225
          Height = 21
          DataField = 'Topic'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 22
          Visible = True
          OnChange = DBEditEhTopicChange
          OnCheckDrawRequiredState = DBEditEhTopicCheckDrawRequiredState
        end
        object DBEditEhMessage: TDBEditEh
          Left = 824
          Top = 103
          Width = 225
          Height = 21
          DataField = 'Message'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 23
          Visible = True
          WordWrap = True
          OnChange = DBEditEhMessageChange
          OnCheckDrawRequiredState = DBEditEhMessageCheckDrawRequiredState
        end
        object DBEditEhCode: TDBEditEh
          Left = 824
          Top = 130
          Width = 41
          Height = 21
          DataField = 'Code'
          DataSource = dsAddressPost
          EditButtons = <>
          TabOrder = 24
          Visible = True
          WordWrap = True
          OnChange = DBEditEhCodeChange
          OnCheckDrawRequiredState = DBEditEhCodeCheckDrawRequiredState
          OnDblClick = DBEditEhCodeDblClick
        end
        object DBEditEhKOATUU: TDBEditEh
          Left = 952
          Top = 129
          Width = 200
          Height = 21
          DataField = 'KOATUU_ID_CODE'
          DataSource = dsAddressPost
          EditButtons = <>
          ReadOnly = True
          TabOrder = 25
          Visible = True
          WordWrap = True
          OnChange = DBEditEhKOATUUChange
          OnCheckDrawRequiredState = DBEditEhKOATUUCheckDrawRequiredState
          OnDblClick = DBEditEhKOATUUDblClick
        end
        object DBEditEhCommerce_Network: TDBEditEh
          Left = 1040
          Top = 12
          Width = 111
          Height = 21
          Alignment = taLeftJustify
          DataField = 'Commerce_Network'
          DataSource = dsAddressPost
          EditButtons = <>
          ReadOnly = True
          TabOrder = 26
          Visible = True
          WordWrap = True
          OnChange = DBEditEhCommerce_NetworkChange
          OnCheckDrawRequiredState = DBEditEhCommerce_NetworkCheckDrawRequiredState
          OnDblClick = DBEditEhCommerce_NetworkDblClick
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 1
      Top = 1
      Width = 432
      Height = 248
      Align = alLeft
      Caption = #1040#1076#1088#1077#1089#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object DBGridEhAddress: TDBGridEh
        Left = 2
        Top = 15
        Width = 416
        Height = 231
        Align = alLeft
        DataSource = dsAddressPost
        Flat = False
        FooterColor = clNone
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = [fsBold]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnCellClick = DBGridEhAddressCellClick
        OnDrawColumnCell = DBGridEhAddressDrawColumnCell
        OnExit = DBGridEhAddressExit
        OnGetCellParams = DBGridEhAddressGetCellParams
        OnKeyDown = DBGridEhAddressKeyDown
        OnKeyUp = DBGridEhAddressKeyUp
      end
    end
  end
  inherited ActionList: TActionList
    Left = 1280
  end
  object dsAddressPost: TMSDataSource
    DataSet = quAddressPost
    OnDataChange = dsAddressPostDataChange
    Left = 384
    Top = 345
  end
  object quAddressPost: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '     @apId int'
      '   , @DocApId int'
      '   , @AddressNo int'
      '   , @AddressNoDoc int'
      ''
      'select @apId = max(Id)+1 from AddressPost'
      'select @DocApId = max(apId)+1 from DocClientCardAddressPostSpec'
      
        'select @AddressNoDoc = max(AddressNo)+1 from DocClientCardAddres' +
        'sPostSpec where DocId = :DocId'
      
        'select @AddressNo = max(AddressNo)+1 from AddressPost where Post' +
        'No = :PostNo'
      ''
      'if @AddressNo is null'
      ' set @AddressNo = 1'
      ''
      'if isnull(@DocApId,0) > isnull(@apId,0)'
      ' set @apId = @DocApId'
      ''
      'if isnull(@AddressNoDoc,0) > isnull(@AddressNo,0)'
      ' set @AddressNo = @AddressNoDoc'
      ''
      'INSERT INTO DocClientCardAddressPostSpec'
      
        '  (DocId, apId, PostNo, AddressNo, Address, Active, RegionNo, Ci' +
        'ty, Street, HouseNo, MarschrutNo, Topic, Message, Mail1, Mail2, ' +
        'Mail3, Car, Driver, DateDeparture, Degrees, Mminutes, Seconds, C' +
        'oordinates, X, Y, CategoryId, CategoryName, TimeBeg, TimeEnd, Un' +
        'loading, AddressPost, AddressNoPost, ClassifierNo, ClassifierNam' +
        'e, KOATUU_ID_CODE, Code, Commerce_Network, SpecialDelivery, Quan' +
        'tityDelivery, Refrezherator, isEdit)'
      'VALUES'
      
        '  (:DocId, @apId, :PostNo, @AddressNo, :Address, :Active, :Regio' +
        'nNo, :City, :Street, :HouseNo, :MarschrutNo, :Topic, :Message, :' +
        'Mail1, :Mail2, :Mail3, :Car, :Driver, :DateDeparture, :Degrees, ' +
        ':Mminutes, :Seconds, :Coordinates, :X, :Y, :CategoryId, :Categor' +
        'yName, :TimeBeg, :TimeEnd, :Unloading, :AddressPost, :AddressNoP' +
        'ost, :ClassifierNo, :ClassifierName, :KOATUU_ID_CODE, :Code, :Co' +
        'mmerce_Network, :SpecialDelivery, :QuantityDelivery, :Refrezhera' +
        'tor, :isEdit)'
      'SET :Id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM DocClientCardAddressPostSpec'
      'WHERE'
      '  Id = :Old_Id')
    SQLUpdate.Strings = (
      'UPDATE DocClientCardAddressPostSpec'
      'SET'
      
        '  apId = :apId, PostNo = :PostNo, AddressNo = :AddressNo, Addres' +
        's = :Address, Active = :Active, RegionNo = :RegionNo, City = :Ci' +
        'ty, Street = :Street, HouseNo = :HouseNo, MarschrutNo = :Marschr' +
        'utNo, Topic = :Topic, Message = :Message, Mail1 = :Mail1, Mail2 ' +
        '= :Mail2, Mail3 = :Mail3, Car = :Car, Driver = :Driver, DateDepa' +
        'rture = :DateDeparture, Degrees = :Degrees, Mminutes = :Mminutes' +
        ', Seconds = :Seconds, Coordinates = :Coordinates, X = :X, Y = :Y' +
        ', CategoryId = :CategoryId, CategoryName = :CategoryName, TimeBe' +
        'g = :TimeBeg, TimeEnd = :TimeEnd, Unloading = :Unloading, Addres' +
        'sPost = :AddressPost, AddressNoPost = :AddressNoPost, Classifier' +
        'No = :ClassifierNo, ClassifierName = :ClassifierName, KOATUU_ID_' +
        'CODE = :KOATUU_ID_CODE, Code = :Code, Commerce_Network = :Commer' +
        'ce_Network, SpecialDelivery = :SpecialDelivery, QuantityDelivery' +
        ' = :QuantityDelivery, Refrezherator = :Refrezherator, isEdit = :' +
        'isEdit'
      'WHERE'
      '  Id = :Id')
    SQLRefresh.Strings = (
      
        'SELECT DocClientCardAddressPostSpec.DocId, DocClientCardAddressP' +
        'ostSpec.apId, DocClientCardAddressPostSpec.PostNo, DocClientCard' +
        'AddressPostSpec.AddressNo, DocClientCardAddressPostSpec.Address,' +
        ' DocClientCardAddressPostSpec.Active, DocClientCardAddressPostSp' +
        'ec.RegionNo, DocClientCardAddressPostSpec.City, DocClientCardAdd' +
        'ressPostSpec.Street, DocClientCardAddressPostSpec.HouseNo, DocCl' +
        'ientCardAddressPostSpec.MarschrutNo, DocClientCardAddressPostSpe' +
        'c.Topic, DocClientCardAddressPostSpec.Message, DocClientCardAddr' +
        'essPostSpec.Mail1, DocClientCardAddressPostSpec.Mail2, DocClient' +
        'CardAddressPostSpec.Mail3, DocClientCardAddressPostSpec.Car, Doc' +
        'ClientCardAddressPostSpec.Driver, DocClientCardAddressPostSpec.D' +
        'ateDeparture, DocClientCardAddressPostSpec.Degrees, DocClientCar' +
        'dAddressPostSpec.Mminutes, DocClientCardAddressPostSpec.Seconds,' +
        ' DocClientCardAddressPostSpec.Coordinates, DocClientCardAddressP' +
        'ostSpec.X, DocClientCardAddressPostSpec.Y, DocClientCardAddressP' +
        'ostSpec.CategoryId, DocClientCardAddressPostSpec.CategoryName, D' +
        'ocClientCardAddressPostSpec.TimeBeg, DocClientCardAddressPostSpe' +
        'c.TimeEnd, DocClientCardAddressPostSpec.Unloading, DocClientCard' +
        'AddressPostSpec.AddressPost, DocClientCardAddressPostSpec.Addres' +
        'sNoPost, DocClientCardAddressPostSpec.ClassifierNo, DocClientCar' +
        'dAddressPostSpec.ClassifierName, DocClientCardAddressPostSpec.KO' +
        'ATUU_ID_CODE, DocClientCardAddressPostSpec.Code, DocClientCardAd' +
        'dressPostSpec.Commerce_Network, DocClientCardAddressPostSpec.Spe' +
        'cialDelivery, DocClientCardAddressPostSpec.QuantityDelivery, Doc' +
        'ClientCardAddressPostSpec.Refrezherator, DocClientCardAddressPos' +
        'tSpec.isEdit FROM DocClientCardAddressPostSpec'
      'WHERE'
      '  Id = :Id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * '
      ' from DocClientCardAddressPostSpec'
      '  where DocId = :DocId'
      '    and (Active = 1 or :IsAllAddress = 1)'
      '    and (isEdit = 1 or :IsEdit = 0)'
      ''
      '/*'
      'declare'
      '    @PostNo smallint'
      '   ,@DateDeperture smalldatetime '
      '   ,@IsAllAddress int'
      '   ,@DocId int'
      '   ,@AdderessPostNo int'
      ''
      ''
      'set @IsAllAddress = :IsAllAddress'
      ''
      'set @PostNo = :PostNo'
      'set @DateDeperture = :DateDeperture'
      'set @DocId = :DocId'
      'set @AdderessPostNo = :AddressNo'
      ''
      'select isnull(d.DocId,@DocId) as DocId'
      '      ,isnull(d.apId,ap.ID) as ApId'
      '      ,isnull(d.PostNo,ap.PostNo ) as PostNo'
      
        '      ,coalisce(d.AddressNo,ap.AddressNo, @AdderessPostNo) as Ad' +
        'dressNo'
      '      ,isnull(d.Address,ap.Address) as Address'
      '      ,isnull(d.Active,ap.Active) as Active'
      '      ,isnull(isnull(d.RegionNo,ap.RegionNo),0) as RegionNo'
      '      ,isnull(d.City,pm.City) as City'
      '      ,isnull(d.Street,pm.Street) as Street'
      '      ,isnull(d.HouseNo,pm.HouseNo) as HouseNo'
      '      ,isnull(d.MarschrutNo,ap.MarschrutNo) as MarschrutNo'
      '      ,isnull(d.Topic,pm.Topic) as Topic'
      '      ,isnull(d.Topic,pm.Message) as Message'
      '      ,isnull(d.Mail1,pm.Mail1) as Mail1'
      '      ,isnull(d.Mail2,pm.Mail2) as Mail2'
      '      ,isnull(d.Mail3,pm.Mail3) as Mail3'
      
        '      ,isnull(d.Car,(select cfa.Car from CarForAdressPost cfa wh' +
        'ere cfa.AddressNo = ap.AddressNo and cfa.PostNo = ap.PostNo and ' +
        'DateDeparture = @DateDeperture)) as Car'
      
        '      ,isnull(d.Driver,(select cfa.Driver from CarForAdressPost ' +
        'cfa where cfa.AddressNo = ap.AddressNo and cfa.PostNo = ap.PostN' +
        'o and DateDeparture = @DateDeperture)) as Driver'
      
        '      ,isnull(d.DateDeparture,(select cfa.DateDeparture from Car' +
        'ForAdressPost cfa where cfa.AddressNo = ap.AddressNo and cfa.Pos' +
        'tNo = ap.PostNo and DateDeparture = @DateDeperture)) as DateDepa' +
        'rture'
      '      ,isnull(d.Degrees,cap.Degrees) as Degrees'
      '      ,isnull(d.Mminutes,cap.Mminutes) as Mminutes'
      '      ,isnull(d.Seconds,cap.Seconds) as Seconds'
      '      ,isnull(d.Coordinates,cap.Coordinates) as Coordinates'
      '      ,isnull(d.X,cap.X) as X'
      '      ,isnull(d.Y,cap.Y) as Y'
      '      ,isnull(d.CategoryId,lcap.CategoryId) as CategoryId'
      
        '      ,isnull(d.CategoryName,(select CategoryTTName from D_Categ' +
        'oryTT where CategoryTTNo = lcap.CategoryId)) as CategoryName'
      '      ,isnull(d.TimeBeg,lapp.TimeBeg) as TimeBeg'
      '      ,isnull(d.TimeEnd,lapp.TimeEnd) as TimeEnd'
      '      ,isnull(d.Unloading,lapp.Unloading) as Unloading'
      '      ,isnull(d.AddressPost,ac.AddressPost) as AddressPost'
      '      ,isnull(d.AddressNoPost,ac.AddressNoPost) as AddressNoPost'
      '      ,isnull(d.ClassifierNo,lapc.ClassifierNo) as ClassifierNo'
      
        '      ,isnull(d.ClassifierName,(select ClassifierName from Class' +
        'ifierABCDZ where ClassifierNo = lapc.ClassifierNo)) as Classifie' +
        'rName'
      
        '      ,isnull(d.KOATUU_ID_CODE,lapkop.KOATUU_ID_CODE) as KOATUU_' +
        'ID_CODE'
      '      ,isnull(d.Code,lapscop.Code) as Code'
      
        '      ,isnull(d.Commerce_Network,lapccnop.Commerce_Network) as C' +
        'ommerce_Network'
      
        '      ,isnull(d.SpecialDelivery,ap.SpecialDelivery) as SpecialDe' +
        'livery'
      
        '      ,isnull(d.QuantityDelivery,ap.QuantityDelivery) as Quantit' +
        'yDelivery'
      '      ,isnull(d.Refrezherator,ap.Refrezherator) as Refrezherator'
      ' from AddressPost ap left join '
      
        '      Post_Mail pm on ap.AddressNo = pm.AddressNo and ap.PostNo ' +
        '= pm.PostNo left join'
      
        '      CoordinatesAddressPost cap on cap.PostNo = ap.PostNo and c' +
        'ap.AddressNo = ap.AddressNo left join'
      
        '      L_CategoryAddressPost lcap on lcap.PostNo = ap.PostNo and ' +
        'lcap.AddressNo = ap.AddressNo left join'
      
        '      L_AddressPostProp lapp on lapp.PostNo = ap.PostNo and lapp' +
        '.AddressNo = ap.AddressNo left join'
      
        '      AddressCorrespondence ac on ac.PostNo = ap.PostNo and ac.A' +
        'ddressNo = ap.AddressNo left join'
      
        '      L_AddressPostClassifierABCDZ lapc on lapc.PostNo = ap.Post' +
        'No and lapc.AddressNo = ap.AddressNo left join'
      
        '      L_AddressPostKOATUUOfPepsico lapkop on  lapkop.PostNo = ap' +
        '.PostNo and lapkop.AddressNo = ap.AddressNo left join'
      
        '      L_AddressPostSalesChannelsOfPepsico lapscop on lapscop.Pos' +
        'tNo = ap.PostNo and lapscop.AddressNo = ap.AddressNo left join'
      
        '      L_AddressPost_CODE_Commerce_Network_Of_Pepsico lapccnop on' +
        ' lapccnop.PostNo = ap.PostNo and lapccnop.AddressNo = ap.Address' +
        'No left join'
      
        #9'  DocClientCardAddressPostSpec d on d.DocId = @DocId and d.apId' +
        ' = ap.ID'
      ''
      '  where ap.PostNo = isnull(@PostNo,ap.PostNo)'
      '    and (ap.Active = 1 or @IsAllAddress = 1)'
      ''
      'order by ap.AddressNo'
      '*/')
    BeforeOpen = quAddressPostBeforeOpen
    BeforePost = quAddressPostBeforePost
    AfterPost = quAddressPostAfterPost
    Left = 360
    Top = 345
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DocId'
      end
      item
        DataType = ftBoolean
        Name = 'IsAllAddress'
      end
      item
        DataType = ftUnknown
        Name = 'IsEdit'
      end>
    object quAddressPostDocId: TIntegerField
      FieldName = 'DocId'
      Visible = False
    end
    object quAddressPostApId: TIntegerField
      FieldName = 'ApId'
      Visible = False
    end
    object quAddressPostPostNo: TIntegerField
      FieldName = 'PostNo'
      Visible = False
    end
    object quAddressPostAddressNo: TIntegerField
      DisplayLabel = #8470
      DisplayWidth = 3
      FieldName = 'AddressNo'
    end
    object quAddressPostAddress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 50
      FieldName = 'Address'
      Size = 256
    end
    object quAddressPostActive: TBooleanField
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'Active'
    end
    object quAddressPostRegionNo: TWordField
      FieldName = 'RegionNo'
      Visible = False
    end
    object quAddressPostCity: TStringField
      FieldName = 'City'
      Visible = False
    end
    object quAddressPostStreet: TStringField
      FieldName = 'Street'
      Visible = False
      Size = 126
    end
    object quAddressPostHouseNo: TStringField
      FieldName = 'HouseNo'
      Visible = False
      Size = 10
    end
    object quAddressPostMarschrutNo: TSmallintField
      FieldName = 'MarschrutNo'
      Visible = False
    end
    object quAddressPostTopic: TStringField
      FieldName = 'Topic'
      Visible = False
      Size = 85
    end
    object quAddressPostMessage: TStringField
      FieldName = 'Message'
      Visible = False
      Size = 85
    end
    object quAddressPostMail1: TStringField
      FieldName = 'Mail1'
      Visible = False
      Size = 50
    end
    object quAddressPostMail2: TStringField
      FieldName = 'Mail2'
      Visible = False
      Size = 50
    end
    object quAddressPostMail3: TStringField
      FieldName = 'Mail3'
      Visible = False
      Size = 50
    end
    object quAddressPostCar: TStringField
      FieldName = 'Car'
      Visible = False
      FixedChar = True
      Size = 50
    end
    object quAddressPostDriver: TStringField
      FieldName = 'Driver'
      Visible = False
      FixedChar = True
      Size = 50
    end
    object quAddressPostDateDeparture: TDateTimeField
      FieldName = 'DateDeparture'
      Visible = False
    end
    object quAddressPostDegrees: TStringField
      FieldName = 'Degrees'
      Visible = False
      Size = 3
    end
    object quAddressPostMminutes: TStringField
      FieldName = 'Mminutes'
      Visible = False
      Size = 5
    end
    object quAddressPostSeconds: TStringField
      FieldName = 'Seconds'
      Visible = False
      Size = 5
    end
    object quAddressPostCoordinates: TBlobField
      FieldName = 'Coordinates'
      Visible = False
    end
    object quAddressPostX: TStringField
      FieldName = 'X'
      Visible = False
    end
    object quAddressPostY: TStringField
      FieldName = 'Y'
      Visible = False
    end
    object quAddressPostCategoryId: TIntegerField
      FieldName = 'CategoryId'
      Visible = False
    end
    object quAddressPostCategoryName: TStringField
      FieldName = 'CategoryName'
      Visible = False
      Size = 50
    end
    object quAddressPostTimeBeg: TWideStringField
      FieldName = 'TimeBeg'
      Visible = False
      Size = 16
    end
    object quAddressPostTimeEnd: TWideStringField
      FieldName = 'TimeEnd'
      Visible = False
      Size = 16
    end
    object quAddressPostUnloading: TIntegerField
      FieldName = 'Unloading'
      Visible = False
    end
    object quAddressPostAddressPost: TStringField
      FieldName = 'AddressPost'
      Visible = False
      Size = 1024
    end
    object quAddressPostAddressNoPost: TIntegerField
      FieldName = 'AddressNoPost'
      Visible = False
    end
    object quAddressPostClassifierNo: TIntegerField
      FieldName = 'ClassifierNo'
      Visible = False
    end
    object quAddressPostClassifierName: TStringField
      FieldName = 'ClassifierName'
      Visible = False
      Size = 50
    end
    object quAddressPostKOATUU_ID_CODE: TStringField
      FieldName = 'KOATUU_ID_CODE'
      Visible = False
      FixedChar = True
      Size = 12
    end
    object quAddressPostCode: TIntegerField
      FieldName = 'Code'
      Visible = False
    end
    object quAddressPostCommerce_Network: TStringField
      FieldName = 'Commerce_Network'
      Visible = False
      FixedChar = True
      Size = 12
    end
    object quAddressPostSpecialDelivery: TBooleanField
      FieldName = 'SpecialDelivery'
      Visible = False
    end
    object quAddressPostQuantityDelivery: TFloatField
      FieldName = 'QuantityDelivery'
      Visible = False
    end
    object quAddressPostRefrezherator: TBooleanField
      FieldName = 'Refrezherator'
      Visible = False
    end
    object quAddressPostId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object quAddressPostisEdit: TBooleanField
      DisplayLabel = 'E'
      DisplayWidth = 3
      FieldName = 'isEdit'
    end
  end
  object dsSotrudAddress: TMSDataSource
    DataSet = quSotrudAddress
    Left = 993
    Top = 346
  end
  object quSotrudAddress: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO DocClientCardSotrudAddressSpec'
      
        '  (DocId, AddressPost_id, SotrudName, OtdelName, Active, DateBeg' +
        'OnActive, DateEndOnActive, SotrudNo, DsaId, OtdelNo)'
      'VALUES'
      
        '  (:DocId, :AddressPost_id, :SotrudName, :SotrudOtdelName, 1, Ge' +
        'tDate(), :DateEndOnActive, :SotrudNo, :DsaId, :OtdelNom)'
      'SET :id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM DocClientCardSotrudAddressSpec'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'declare'
      '    @Active  int'
      '  , @MaxId  int'
      ''
      
        'select @MaxId = max(id) from DocClientCardSotrudAddressSpec wher' +
        'e AddressPost_id = :AddressPost_id and SotrudNo = :SotrudNo'
      ''
      
        'select @Active = Active from DocClientCardSotrudAddressSpec wher' +
        'e id = @MaxId'
      ''
      'if @Active is null set @Active = 0'
      ''
      'if @MaxId is not null '
      ' begin'
      ''
      '   if @Active = 1 '
      '    UPDATE DocClientCardSotrudAddressSpec'
      '     SET AddressPost_id = :AddressPost_id'
      '       , SotrudNo = :SotrudNo'
      '       , Active = 0'
      '       , DateBegOnActive = :DateBegOnActive'
      '       , DateEndOnActive = getdate()'
      '     WHERE id = :Old_id'
      ''
      '    if @Active = 0'
      '     UPDATE DocClientCardSotrudAddressSpec'
      '      SET AddressPost_id = :AddressPost_id'
      '        , SotrudNo = :SotrudNo'
      '        , Active = 1'
      '        , DateBegOnActive = getdate()'
      '        , DateEndOnActive = null'
      '     WHERE id = :Old_id'
      ' end'
      'else'
      ' begin'
      
        '   INSERT INTO DocClientCardSotrudAddressSpec  (AddressPost_id, ' +
        'SotrudNo, Active, DateBegOnActive, DateEndOnActive, OtdelNo)'
      
        '    VALUES (:AddressPost_id, :SotrudNo, 1, getdate(), null, :Otd' +
        'elNo)'
      '   SET :id = SCOPE_IDENTITY()'
      ' end '
      ''
      '/*'
      'UPDATE DocClientCardSotrudAddressSpec'
      'SET'
      '   AddressPost_id = :AddressPost_id'
      ' , SotrudName = :SotrudName'
      ' , OtdelName = :OtdelName'
      ' , Active = :Active'
      ' , DateBegOnActive = :DateBegOnActive'
      ' , DateEndOnActive = :DateEndOnActive'
      ' , SotrudNo = :SotrudNo'
      ' , DsaId = :DsaId'
      'WHERE'
      '  id = :Old_id'
      '*/')
    SQLRefresh.Strings = (
      
        'SELECT DocClientCardSotrudAddressSpec.DocId, DocClientCardSotrud' +
        'AddressSpec.AddressPost_id, DocClientCardSotrudAddressSpec.Sotru' +
        'dName, DocClientCardSotrudAddressSpec.OtdelName, DocClientCardSo' +
        'trudAddressSpec.Active, DocClientCardSotrudAddressSpec.DateBegOn' +
        'Active, DocClientCardSotrudAddressSpec.DateEndOnActive, DocClien' +
        'tCardSotrudAddressSpec.SotrudNo, DocClientCardSotrudAddressSpec.' +
        'DsaId FROM DocClientCardSotrudAddressSpec'
      'WHERE'
      '  id = :id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select * ,isnull(d.OtdelName,vo.OtdelName) as SotrudOtdelName, i' +
        'snull(d.OtdelNo,vo.OtdelNo) as OtdelNom'
      ' from DocClientCardSotrudAddressSpec d left join'
      '      Sotrud s on s.SotrudNo = d.SotrudNo left join'
      #9'  VidOtdel vo on vo.OtdelNo = s.SotrudOtdel'
      '  where d.DocId = :DocId'
      '    and ((isnull(d.active,0) = 1) or :IsAllSotrud = 1)'
      '    and d.AddressPost_id = :AddressPost_id'
      ''
      '/*'
      'declare'
      '   @IsAllSotrud int'
      '  ,@DocId int   '
      ''
      'set @IsAllSotrud = :IsAllSotrud'
      'set @DocId = :DocId'
      ''
      
        'select  isnull(d.AddressPost_id,dsa.AddressPost_id) as AddressPo' +
        'st_id '
      '       ,isnull(d.SotrudName,s.SotrudName) as SotrudName'
      '       ,isnull(d.OtdelName,vo.OtdelName) as OtdelName'
      '       ,isnull(d.Active,dsa.Active) as Active'
      
        '       ,isnull(d.DateBegOnActive,dsa.DateBegOnActive) as DateBeg' +
        'OnActive'
      
        '       ,isnull(d.DateEndOnActive,dsa.DateEndOnActive) as DateEnd' +
        'OnActive'
      '       ,isnull(d.SotrudNo,s.SotrudNo) as SotrudNo'
      '       ,isnull(d.DsaId,dsa.id) as id'
      ' from d_sotrud_address dsa left join'
      '      sotrud s on s.SotrudNo = dsa.SotrudNo left join'
      '      VidOtdel vo on vo.OtdelNo = s.SotrudOtdel left join'
      
        '      DocClientCardSotrudAddressSpec d on d.DsaId = dsa.id and d' +
        '.DocId = @DocId'
      '  where ((isnull(d.active,dsa.active) = 1) or @IsAllSotrud = 1)'
      '    and dsa.AddressPost_id = :AddressPost_id'
      '*/')
    BeforeOpen = quSotrudAddressBeforeOpen
    BeforePost = quSotrudAddressBeforePost
    AfterPost = quSotrudAddressAfterPost
    Left = 969
    Top = 346
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DocId'
      end
      item
        DataType = ftBoolean
        Name = 'IsAllSotrud'
      end
      item
        DataType = ftInteger
        Name = 'AddressPost_id'
      end>
    object quSotrudAddressAddressPost_id: TIntegerField
      FieldName = 'AddressPost_id'
      Visible = False
    end
    object quSotrudAddressSotrud: TStringField
      DisplayLabel = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'Sotrud'
      LookupDataSet = dmDataModule.quSotrud
      LookupKeyFields = 'SotrudNo'
      LookupResultField = 'SotrudName'
      KeyFields = 'SotrudNo'
      Lookup = True
    end
    object quSotrudAddressOtdelName: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      DisplayWidth = 20
      FieldName = 'OtdelName'
      ReadOnly = True
      Visible = False
      Size = 30
    end
    object quSotrudAddressSotrudOtdelName: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      DisplayWidth = 20
      FieldName = 'SotrudOtdelName'
      ReadOnly = True
      Size = 30
    end
    object quSotrudAddressOtdel: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      FieldKind = fkLookup
      FieldName = 'Otdel'
      LookupDataSet = dmDataModule.quOtdel
      LookupKeyFields = 'OtdelNo'
      LookupResultField = 'OtdelName'
      KeyFields = 'OtdelNo'
      Visible = False
      Lookup = True
    end
    object quSotrudAddressSotrudName: TStringField
      DisplayLabel = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      FieldName = 'SotrudName'
      Visible = False
      Size = 30
    end
    object quSotrudAddressActive: TBooleanField
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'Active'
    end
    object quSotrudAddressDateBegOnActive: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      DisplayWidth = 20
      FieldName = 'DateBegOnActive'
      ReadOnly = True
    end
    object quSotrudAddressDateEndOnActive: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      DisplayWidth = 20
      FieldName = 'DateEndOnActive'
      ReadOnly = True
    end
    object quSotrudAddressSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
      Visible = False
    end
    object quSotrudAddressDocId: TIntegerField
      FieldName = 'DocId'
      Visible = False
    end
    object quSotrudAddressid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object quSotrudAddressDsaId: TIntegerField
      FieldName = 'DsaId'
      Visible = False
    end
    object quSotrudAddressOtdelNo: TIntegerField
      FieldName = 'OtdelNo'
      Visible = False
    end
    object quSotrudAddressOtdelNom: TIntegerField
      FieldName = 'OtdelNom'
      ReadOnly = True
      Visible = False
    end
  end
  object dsDalay: TMSDataSource
    DataSet = quDalay
    Left = 1425
    Top = 346
  end
  object quDalay: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO DocClientCardDelaySpec'
      
        '  (DocId, PostNo, NAME, DAY_DELAY, DAY_DELAY_EXT, PayBan, Buh, S' +
        'etArticleGroupId, Currency)'
      'VALUES'
      
        '  (:DocId, :PostNo, :NAME, :DAY_DELAY, :DAY_DELAY_EXT, :PayBan, ' +
        ':Buh, :SetArticleGroupId, :Currency)'
      'SET :id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM DocClientCardDelaySpec'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE DocClientCardDelaySpec'
      'SET'
      '   PostNo = :PostNo'
      ' , NAME = :NAME'
      ' , DAY_DELAY = :DAY_DELAY'
      ' , DAY_DELAY_EXT = :DAY_DELAY_EXT'
      ' , PayBan = :PayBan'
      ' , Buh = :Buh'
      ' , SetArticleGroupId = :SetArticleGroupId'
      ' , Currency = :Currency'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      'SELECT  DocClientCardDelaySpec.DocId'
      '      , DocClientCardDelaySpec.PostNo'
      '      , DocClientCardDelaySpec.NAME'
      '      , DocClientCardDelaySpec.DAY_DELAY'
      '      , DocClientCardDelaySpec.DAY_DELAY_EXT'
      '      , DocClientCardDelaySpec.PayBan'
      '      , DocClientCardDelaySpec.Buh'
      '      , DocClientCardDelaySpec.BuhName '
      '      , DocClientCardDelaySpec.Currency'
      ' FROM DocClientCardDelaySpec'
      '  WHERE id = :id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  Id'
      '      , DocId'
      '      , PostNo'
      '      , NAME'
      '      , Day_Delay'
      '      , Day_Delay_Ext'
      '      , PayBan'
      '      , Buh'
      '      , BuhName'
      '      , SetArticleGroupId'
      
        '      , isnull(Currency,(select c.l_code from D_CURRENCY c inner' +
        ' join CurrencyExchange ce on c.IsDefault = 1 and ce.IsActive = 1' +
        ' and ce.CurrencyId = c.ID and c.isTrash = 0)) as Currency'
      ' from DocClientCardDelaySpec d'
      '  where d.DocId = :DocId'
      ''
      '/*'
      'select convert(int,isnull(d.PostNo,lpsagd.PostNo)) as PostNo'
      '     , isnull(d.Name,dsag.NAME) as Name'
      '     , isnull(d.DAY_DELAY,lpsagd.DAY_DELAY) as DAY_DELAY'
      
        '     , isnull(d.DAY_DELAY_EXT,lpsagd.DAY_DELAY_EXT) as DAY_DELAY' +
        '_EXT'
      '     , isnull(d.PayBan,lpsagp.PayBan) as PayBan'
      '     , convert(int,isnull(d.BUH,lpsagd.BUH)) as BUH'
      
        '     , (select Buh_type_name from d_buh_type where buh = lpsagd.' +
        'BUH) as BuhName'
      ' from L_POST_SET_ARTGROUP_DELAY lpsagd left join'
      
        '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lpsagd.SET_ARTICLE_G' +
        'ROUP_ID left join'
      
        '      L_Post_Set_ArtGroup_PayBan lpsagp on lpsagp.PostNo_PayBan ' +
        '= lpsagd.PostNo and lpsagp.Set_Article_Group_Id_PayBan = lpsagd.' +
        'SET_ARTICLE_GROUP_ID and lpsagp.Buh = lpsagd.BUH left join'
      
        '      DocClientCardDelaySpec d on d.PostNo = lpsagd.PostNo and d' +
        '.Name = dsag.NAME and d.BUH = lpsagd.BUH and d.DocId = :DocId'
      '  where lpsagd.PostNo = :PostNo'
      '*/')
    BeforeOpen = quDalayBeforeOpen
    AfterOpen = quDalayAfterOpen
    AfterInsert = quDalayAfterInsert
    BeforePost = quDalayBeforePost
    Left = 1401
    Top = 346
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DocId'
      end>
    object quDalayNameGroup: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'NameGroup'
      LookupDataSet = quDSetArticleGroupId
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SetArticleGroupId'
      Lookup = True
    end
    object quDalayBuhName: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 8
      FieldKind = fkLookup
      FieldName = 'BuhTypeName'
      LookupDataSet = quDBuhType
      LookupKeyFields = 'buh'
      LookupResultField = 'Buh_type_name'
      KeyFields = 'BUH'
      Lookup = True
    end
    object quDalayNAME: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 30
      FieldName = 'NAME'
      Visible = False
      Size = 512
    end
    object quDalayDAY_DELAY: TIntegerField
      DisplayLabel = #1054#1090#1089#1088#1086#1095#1082#1072
      DisplayWidth = 8
      FieldName = 'DAY_DELAY'
    end
    object quDalayDAY_DELAY_EXT: TIntegerField
      DisplayLabel = #1044#1086#1087'. '#1086#1090#1089#1088#1086#1095#1082#1072
      DisplayWidth = 8
      FieldName = 'DAY_DELAY_EXT'
    end
    object quDalayPayBan: TIntegerField
      DisplayLabel = #1051#1080#1084#1080#1090
      DisplayWidth = 6
      FieldName = 'PayBan'
    end
    object quDalayPostNo: TIntegerField
      FieldName = 'PostNo'
      Visible = False
    end
    object quDalayBUH: TIntegerField
      FieldName = 'BUH'
      Visible = False
    end
    object quDalayDocId: TIntegerField
      FieldName = 'DocId'
      Visible = False
    end
    object quDalayid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object quDalaySetArticleGroupId: TLargeintField
      FieldName = 'SetArticleGroupId'
      Visible = False
    end
    object quDalayCurrency: TStringField
      FieldName = 'Currency'
      Visible = False
      Size = 5
    end
    object quDalayCyrrencyName: TStringField
      FieldKind = fkLookup
      FieldName = 'CyrrencyName'
      LookupDataSet = quCurrency
      LookupKeyFields = 'l_code'
      LookupResultField = 'Name'
      KeyFields = 'Currency'
      Lookup = True
    end
  end
  object quPrice: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO DocClientCardPriceSpec'
      
        '  (DocId, LpsagpId, NAME, ColName, ColNPrice, SetArticleGroupId,' +
        ' PostNo)'
      'VALUES'
      
        '  (:DocId, :LpsagpId, :NAME, :ColName, :ColNPrice, :SetArticleGr' +
        'oupId, :PostNo)'
      'SET :id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM DocClientCardPriceSpec'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE DocClientCardPriceSpec'
      'SET'
      
        '  LpsagpId = :LpsagpId, NAME = :NAME, ColName = :ColName, ColNPr' +
        'ice = :ColNPrice, PostNo = :PostNo, SetArticleGroupId = :SetArti' +
        'cleGroupId'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      
        'SELECT DocClientCardPriceSpec.DocId, DocClientCardPriceSpec.Lpsa' +
        'gpId, DocClientCardPriceSpec.NAME, DocClientCardPriceSpec.ColNam' +
        'e, DocClientCardPriceSpec.ColNPrice FROM DocClientCardPriceSpec'
      'WHERE'
      '  id = :id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from DocClientCardPriceSpec d'
      '  where d.DocId = :DocId'
      ''
      '/*'
      'select  isnull(d.NAME,dsag.NAME) as NAME'
      '      , isnull(d.ColName,dpt.ColName) as ColName'
      ' from L_POST_SET_ARTGROUP_PRICE lpsagp left join'
      
        '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lpsagp.SET_ARTICLE_G' +
        'ROUP_ID left join'
      
        '      D_Price_type dpt on dpt.ColNPrice = lpsagp.COLNPRICE left ' +
        'join'
      
        '      DocClientCardPriceSpec d on d.id = lpsagp.id and d.DocId =' +
        ' :DocId'
      '  where lpsagp.POSTNO = :PostNo'
      '*/')
    BeforeOpen = quPriceBeforeOpen
    BeforePost = quPriceBeforePost
    Left = 1403
    Top = 514
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DocId'
      end>
    object quPriceGroupName: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      FieldKind = fkLookup
      FieldName = 'GroupName'
      LookupDataSet = quDSetArticleGroupId
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'SetArticleGroupId'
      Lookup = True
    end
    object quPricePriceType: TStringField
      DisplayLabel = #1058#1080#1087' '#1094#1077#1085#1099
      FieldKind = fkLookup
      FieldName = 'PriceType'
      LookupDataSet = quPriceType
      LookupKeyFields = 'ColNPrice'
      LookupResultField = 'ColName'
      KeyFields = 'ColNPrice'
      Lookup = True
    end
    object quPriceNAME: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 20
      FieldName = 'NAME'
      Visible = False
      Size = 512
    end
    object quPriceColName: TStringField
      DisplayLabel = #1058#1080#1087' '#1094#1077#1085#1099
      DisplayWidth = 20
      FieldName = 'ColName'
      Visible = False
      Size = 64
    end
    object quPriceDocId: TIntegerField
      FieldName = 'DocId'
      Visible = False
    end
    object quPriceid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object quPriceLpsagpId: TLargeintField
      FieldName = 'LpsagpId'
      Visible = False
    end
    object quPriceColNPrice: TSmallintField
      FieldName = 'ColNPrice'
      Visible = False
    end
    object quPriceSetArticleGroupId: TLargeintField
      FieldName = 'SetArticleGroupId'
      Visible = False
    end
    object quPricePostNo: TIntegerField
      FieldName = 'PostNo'
      Visible = False
    end
  end
  object dsPrice: TMSDataSource
    DataSet = quPrice
    Left = 1427
    Top = 514
  end
  object quDocClientCardHead: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO DocClientCardHead'
      '  (id, PostNo, DocDate, UserNo, SotrudNo, Print3, TTN, IsApp)'
      'VALUES'
      
        '  (:id, :PostNo, :DocDate, :UserNo, :SotrudNo, :Print3, :TTN, :I' +
        'sApp)')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  *'
      
        '      , (select Name from Post where PostNo = dcch.PostNo) as Po' +
        'stName'
      
        '      , (select SotrudName from Sotrud where SotrudNo = dcch.Sot' +
        'rudNo) as SotrudName'
      
        '      , (select UserName from Users where UserNo = dcch.UserNo) ' +
        'as UserName'
      ' from DocClientCardHead dcch'
      '  where id = :id')
    Left = 1408
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
      end>
    object quDocClientCardHeadPostNo: TIntegerField
      FieldName = 'PostNo'
    end
    object quDocClientCardHeadDocDate: TDateTimeField
      FieldName = 'DocDate'
    end
    object quDocClientCardHeadUserNo: TIntegerField
      FieldName = 'UserNo'
    end
    object quDocClientCardHeadSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
    end
    object quDocClientCardHeadPrint3: TBooleanField
      FieldName = 'Print3'
    end
    object quDocClientCardHeadTTN: TBooleanField
      FieldName = 'TTN'
    end
    object quDocClientCardHeadIsApp: TBooleanField
      FieldName = 'IsApp'
    end
    object quDocClientCardHeadPostName: TStringField
      FieldName = 'PostName'
      Size = 30
    end
    object quDocClientCardHeadSotrudName: TStringField
      FieldName = 'SotrudName'
      Size = 30
    end
    object quDocClientCardHeadUserName: TStringField
      FieldName = 'UserName'
    end
    object quDocClientCardHeadid: TIntegerField
      FieldName = 'id'
    end
  end
  object dsDocClientCardHead: TMSDataSource
    DataSet = quDocClientCardHead
    Left = 1432
    Top = 96
  end
  object dsListUserForVidDoc: TMSDataSource
    DataSet = quListUserForVidDoc
    Left = 1056
    Top = 89
  end
  object quListUserForVidDoc: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      '      , Case when l.id is null then cast(0 as bit)'
      '        else cast(1 as bit) end as is_signature'
      ' from ListUserForVidDoc u left join'
      '      l_doc_signature l on l.UserNo = u.UserNo and l.DocId = :Id'
      '  where IdVidDoc = 1'
      '    and Active = 1')
    BeforeOpen = quListUserForVidDocBeforeOpen
    Left = 1032
    Top = 89
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Id'
      end>
    object quListUserForVidDocId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object quListUserForVidDocIdVidDoc: TIntegerField
      FieldName = 'IdVidDoc'
      Visible = False
    end
    object quListUserForVidDocOtdelNo: TIntegerField
      FieldName = 'OtdelNo'
      Visible = False
    end
    object quListUserForVidDocUserNo: TIntegerField
      FieldName = 'UserNo'
      Visible = False
    end
    object quListUserForVidDocActive: TBooleanField
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'Active'
      Visible = False
    end
    object quListUserForVidDocOtdel: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      FieldKind = fkLookup
      FieldName = 'Otdel'
      LookupDataSet = dmDataModule.quOtdel
      LookupKeyFields = 'OtdelNo'
      LookupResultField = 'OtdelName'
      KeyFields = 'OtdelNo'
      ReadOnly = True
      Lookup = True
    end
    object quListUserForVidDocUser: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'User'
      LookupDataSet = dmDataModule.quUsers
      LookupKeyFields = 'UserNo'
      LookupResultField = 'UserName'
      KeyFields = 'UserNo'
      ReadOnly = True
      Lookup = True
    end
    object quListUserForVidDocis_signature: TBooleanField
      DisplayLabel = 'V'
      DisplayWidth = 3
      FieldName = 'is_signature'
      ReadOnly = True
    end
  end
  object quDSetArticleGroupId: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from d_set_article_group'
      '  where Active = '#39'Y'#39)
    Left = 1465
    Top = 146
    object quDSetArticleGroupIdID: TLargeintField
      FieldName = 'ID'
    end
    object quDSetArticleGroupIdNAME: TStringField
      DisplayWidth = 30
      FieldName = 'NAME'
      Size = 512
    end
    object quDSetArticleGroupIdACTIVE: TStringField
      FieldName = 'ACTIVE'
      FixedChar = True
      Size = 1
    end
  end
  object dsDSetArticleGroupId: TMSDataSource
    DataSet = quDSetArticleGroupId
    Left = 1466
    Top = 173
  end
  object quDBuhType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from d_buh_type'
      '  where buh not in (3,4)')
    Left = 1465
    Top = 202
    object quDBuhTypebuh: TSmallintField
      FieldName = 'buh'
    end
    object quDBuhTypeBuh_type_name: TStringField
      FieldName = 'Buh_type_name'
    end
    object quDBuhTypeIS_FRACTION: TBooleanField
      FieldName = 'IS_FRACTION'
    end
  end
  object dsDBuhType: TMSDataSource
    DataSet = quDBuhType
    Left = 1465
    Top = 231
  end
  object quPriceType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from d_price_Type')
    Left = 1464
    Top = 403
    object quPriceTypeColNPrice: TSmallintField
      FieldName = 'ColNPrice'
      ReadOnly = True
    end
    object quPriceTypeColName: TStringField
      FieldName = 'ColName'
      Size = 64
    end
    object quPriceTypeOtdelNo: TIntegerField
      FieldName = 'OtdelNo'
    end
    object quPriceTypePRICE_LINE: TIntegerField
      FieldName = 'PRICE_LINE'
    end
    object quPriceTypePARENT_COLNPRICE: TSmallintField
      FieldName = 'PARENT_COLNPRICE'
    end
    object quPriceTypeFACTOR: TFloatField
      FieldName = 'FACTOR'
    end
    object quPriceTypetrash: TBooleanField
      FieldName = 'trash'
    end
    object quPriceTypeFACTOR_BASE: TFloatField
      FieldName = 'FACTOR_BASE'
    end
    object quPriceTypeCOLNPRICE_BASE: TSmallintField
      FieldName = 'COLNPRICE_BASE'
    end
  end
  object dsPriceType: TMSDataSource
    DataSet = quPriceType
    Left = 1464
    Top = 427
  end
  object dsDocClientCardPostGroupCuttingSpec: TMSDataSource
    DataSet = quDocClientCardPostGroupCuttingSpec
    Left = 753
    Top = 81
  end
  object quDocClientCardPostGroupCuttingSpec: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from DocClientCardPostGroupCuttingSpec'
      '  where DocId = :DocId')
    BeforeOpen = quDocClientCardPostGroupCuttingSpecBeforeOpen
    BeforePost = quDocClientCardPostGroupCuttingSpecBeforePost
    Left = 721
    Top = 81
    ParamData = <
      item
        DataType = ftInteger
        Name = 'DocId'
      end>
    object quDocClientCardPostGroupCuttingSpecVidName: TStringField
      DisplayLabel = #1042#1080#1076
      FieldKind = fkLookup
      FieldName = 'VidName'
      LookupDataSet = dmDataModule.quVidTov
      LookupKeyFields = 'VidNo'
      LookupResultField = 'VidName'
      KeyFields = 'GroupCuttingVidNo'
      Lookup = True
    end
    object quDocClientCardPostGroupCuttingSpecGroupCuttingName: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1099
      FieldKind = fkLookup
      FieldName = 'GroupCuttingName'
      LookupDataSet = dmDataModule.quGroupCutting
      LookupKeyFields = 'id'
      LookupResultField = 'NameGropCutting'
      KeyFields = 'GroupCuttingId'
      Lookup = True
    end
    object quDocClientCardPostGroupCuttingSpecId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
    end
    object quDocClientCardPostGroupCuttingSpecDocId: TIntegerField
      FieldName = 'DocId'
    end
    object quDocClientCardPostGroupCuttingSpecPostNo: TIntegerField
      FieldName = 'PostNo'
    end
    object quDocClientCardPostGroupCuttingSpecGroupCuttingId: TIntegerField
      FieldName = 'GroupCuttingId'
    end
    object quDocClientCardPostGroupCuttingSpecGroupCuttingVidNo: TIntegerField
      FieldName = 'GroupCuttingVidNo'
    end
    object quDocClientCardPostGroupCuttingSpecIsLock: TBooleanField
      DisplayLabel = 'Z'
      DisplayWidth = 3
      FieldName = 'IsLock'
    end
  end
  object dsCurrency: TMSDataSource
    DataSet = quCurrency
    Left = 1465
    Top = 298
  end
  object quCurrency: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Name, l_code from d_currency')
    Left = 1465
    Top = 266
    object quCurrencyName: TStringField
      FieldName = 'Name'
      Size = 100
    end
    object quCurrencyl_code: TStringField
      FieldName = 'l_code'
      Size = 3
    end
  end
end
