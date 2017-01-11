inherited fmEditPost: TfmEditPost
  Left = 369
  Top = 19
  BorderStyle = bsDialog
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072
  ClientHeight = 695
  ClientWidth = 1278
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1278
    Height = 669
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 0
    object pgc: TPageControl
      Left = 5
      Top = 5
      Width = 1268
      Height = 659
      ActivePage = tsAdress
      Align = alClient
      TabOrder = 0
      object tsMain: TTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1086#1077
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 397
          Height = 631
          Align = alLeft
          TabOrder = 0
          object Label10: TLabel
            Left = 108
            Top = 167
            Width = 28
            Height = 13
            Caption = #1052#1060#1054
            FocusControl = EditMFO
          end
          object Label11: TLabel
            Left = 189
            Top = 167
            Width = 25
            Height = 13
            Caption = #1041#1072#1085#1082
            FocusControl = EditNameBank
          end
          object Label12: TLabel
            Left = 12
            Top = 247
            Width = 86
            Height = 13
            Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
            FocusControl = deContact
          end
          object Label13: TLabel
            Left = 12
            Top = 87
            Width = 53
            Height = 13
            Caption = #1050#1086#1076' '#1054#1050#1055#1054
          end
          object Label16: TLabel
            Left = 12
            Top = 207
            Width = 58
            Height = 13
            Caption = #1040#1076#1088#1077#1089' '#1073#1072#1085#1082
          end
          object Label17: TLabel
            Left = 276
            Top = 207
            Width = 81
            Height = 13
            Caption = #1054#1090#1089#1088#1086#1095#1082#1072' ('#1076#1085#1077#1081')'
          end
          object Label18: TLabel
            Left = 276
            Top = 247
            Width = 53
            Height = 13
            Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          end
          object Label2: TLabel
            Left = 12
            Top = 7
            Width = 19
            Height = 13
            Caption = #1050#1086#1076
            FocusControl = EditName
          end
          object Label3: TLabel
            Left = 12
            Top = 47
            Width = 89
            Height = 13
            Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
            FocusControl = EditNameLong
          end
          object Label5: TLabel
            Left = 12
            Top = 127
            Width = 93
            Height = 13
            Caption = #8470' '#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1072' '
            FocusControl = EditNoSvidNDS
          end
          object Label6: TLabel
            Left = 110
            Top = 127
            Width = 117
            Height = 13
            Caption = #1050#1086#1076' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082#1072' '#1053#1044#1057
            FocusControl = EditCodeNds
          end
          object Label7: TLabel
            Left = 108
            Top = 87
            Width = 31
            Height = 13
            Caption = #1040#1076#1088#1077#1089
            FocusControl = EditAddress
          end
          object Label8: TLabel
            Left = 308
            Top = 87
            Width = 45
            Height = 13
            Caption = #1058#1077#1083#1077#1092#1086#1085
            FocusControl = EditPhone
          end
          object Label9: TLabel
            Left = 12
            Top = 167
            Width = 80
            Height = 13
            Caption = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
            FocusControl = EditRS
          end
          object DBText1: TDBText
            Left = 12
            Top = 26
            Width = 41
            Height = 17
            DataField = 'PostNo'
            DataSource = fmPost.dsPost
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 56
            Top = 7
            Width = 50
            Height = 13
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            FocusControl = EditName
          end
          object Label15: TLabel
            Left = 16
            Top = 348
            Width = 34
            Height = 13
            Caption = #1057#1090#1072#1090#1091#1089
          end
          object Label20: TLabel
            Left = 246
            Top = 127
            Width = 96
            Height = 13
            Caption = #1062#1077#1085#1099' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
          end
          object Label21: TLabel
            Left = 287
            Top = 8
            Width = 106
            Height = 13
            Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1094#1077#1085#1099
          end
          object Label27: TLabel
            Left = 8
            Top = 373
            Width = 113
            Height = 13
            Caption = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1073#1086#1088' '#1090#1086#1074#1072#1088#1072
          end
          object Label28: TLabel
            Left = 9
            Top = 397
            Width = 114
            Height = 13
            Caption = #1042#1074#1077#1076#1080#1090#1077' '#1083#1080#1084#1080#1090' '#1090#1086#1074#1072#1088#1072
          end
          object cbAccountCash: TDBCheckBox
            Left = 238
            Top = 295
            Width = 153
            Height = 17
            Caption = #1052#1072#1090'. '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1077' '#1083#1080#1094#1086
            DataField = 'AccountCash'
            DataSource = fmPost.dsPost
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object cbExport1C: TDBCheckBox
            Left = 12
            Top = 319
            Width = 145
            Height = 17
            Caption = #1053#1077' '#1086#1090#1087#1088#1072#1074#1083#1103#1090#1100' '#1074' "1'#1057'"'
            DataField = 'Export1C'
            DataSource = fmPost.dsPost
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object cbNotPlatNDS: TDBCheckBox
            Left = 12
            Top = 295
            Width = 129
            Height = 17
            Caption = #1053#1077#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1053#1044#1057
            DataField = 'NotPlatNDS'
            DataSource = fmPost.dsPost
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object cbPrint: TDBCheckBox
            Left = 156
            Top = 295
            Width = 65
            Height = 17
            Caption = #1055#1077#1095#1072#1090#1100
            DataField = 'PrintPost'
            DataSource = fmPost.dsPost
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object deAddressBank: TDBEdit
            Left = 12
            Top = 223
            Width = 249
            Height = 21
            DataField = 'AddressBank'
            DataSource = fmPost.dsPost
            TabOrder = 4
          end
          object deCategorName: TDBEdit
            Left = 271
            Top = 263
            Width = 120
            Height = 21
            DataField = 'CategorName'
            DataSource = fmPost.dsPost
            TabOrder = 5
          end
          object deContact: TDBEdit
            Left = 12
            Top = 263
            Width = 249
            Height = 21
            DataField = 'Contact'
            DataSource = fmPost.dsPost
            TabOrder = 6
          end
          object deDayDelay: TDBEdit
            Left = 271
            Top = 223
            Width = 120
            Height = 21
            DataField = 'DayDelay'
            DataSource = fmPost.dsPost
            TabOrder = 7
          end
          object EditAddress: TDBEdit
            Left = 108
            Top = 103
            Width = 189
            Height = 21
            DataField = 'Address'
            DataSource = fmPost.dsPost
            TabOrder = 8
          end
          object EditCodeNds: TDBEdit
            Left = 108
            Top = 145
            Width = 83
            Height = 21
            DataField = 'CodeNds'
            DataSource = fmPost.dsPost
            TabOrder = 9
          end
          object EditMFO: TDBEdit
            Left = 108
            Top = 183
            Width = 65
            Height = 21
            DataField = 'MFO'
            DataSource = fmPost.dsPost
            TabOrder = 10
          end
          object EditName: TDBEdit
            Left = 56
            Top = 23
            Width = 217
            Height = 21
            AutoSelect = False
            DataField = 'Name'
            DataSource = fmPost.dsPost
            TabOrder = 11
          end
          object EditNameBank: TDBEdit
            Left = 182
            Top = 183
            Width = 209
            Height = 21
            DataField = 'NameBank'
            DataSource = fmPost.dsPost
            TabOrder = 12
          end
          object EditNameLong: TDBEdit
            Left = 12
            Top = 63
            Width = 379
            Height = 21
            DataField = 'NameLong'
            DataSource = fmPost.dsPost
            TabOrder = 13
          end
          object EditNoSvidNDS: TDBEdit
            Left = 12
            Top = 145
            Width = 85
            Height = 21
            DataField = 'NoSvidNDS'
            DataSource = fmPost.dsPost
            TabOrder = 14
          end
          object EditOKPO: TDBEdit
            Left = 12
            Top = 103
            Width = 90
            Height = 21
            DataField = 'OKPO'
            DataSource = fmPost.dsPost
            TabOrder = 15
          end
          object EditPhone: TDBEdit
            Left = 304
            Top = 103
            Width = 87
            Height = 21
            DataField = 'Phone'
            DataSource = fmPost.dsPost
            TabOrder = 16
          end
          object EditRS: TDBEdit
            Left = 12
            Top = 183
            Width = 91
            Height = 21
            DataField = 'RS'
            DataSource = fmPost.dsPost
            TabOrder = 17
          end
          object DBCheckBox1: TDBCheckBox
            Left = 238
            Top = 316
            Width = 153
            Height = 17
            Caption = #1055#1077#1095#1072#1090#1100' '#1074' '#1090#1088#1077#1093' '#1082#1086#1087#1080#1103#1093
            DataField = 'Print3'
            DataSource = fmPost.dsPost
            TabOrder = 18
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox2: TDBCheckBox
            Left = 238
            Top = 336
            Width = 145
            Height = 16
            Caption = #1057#1087#1088#1103#1090#1072#1090#1100
            DataField = 'Visible'
            DataSource = fmPost.dsPost
            TabOrder = 19
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 156
            Top = 319
            Width = 65
            Height = 17
            Caption = 'VIP'
            DataField = 'VIP'
            DataSource = fmPost.dsPost
            TabOrder = 20
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object cxDBLookupComboBox1: TcxDBLookupComboBox
            Left = 54
            Top = 344
            DataBinding.DataField = 'trash'
            DataBinding.DataSource = fmPost.dsPost
            Properties.KeyFieldNames = 'trash'
            Properties.ListColumns = <
              item
                FieldName = 'name'
              end>
            Properties.ListSource = dsTrash
            Properties.MaxLength = 0
            Properties.OnCloseUp = cxDBLookupComboBox1PropertiesCloseUp
            TabOrder = 21
            Width = 171
          end
          object Use_Price: TDBComboBox
            Left = 247
            Top = 145
            Width = 56
            Height = 21
            DataField = 'Accept'
            DataSource = fmPost.dsPost
            ItemHeight = 13
            Items.Strings = (
              'Y'
              'N')
            TabOrder = 22
            OnKeyPress = Use_PriceKeyPress
          end
          object Edit_Price: TDBComboBox
            Left = 288
            Top = 24
            Width = 57
            Height = 21
            DataField = 'PriceChange'
            DataSource = fmPost.dsPost
            ItemHeight = 13
            Items.Strings = (
              'N'
              'Y')
            TabOrder = 23
          end
          object MailGroupBox: TGroupBox
            Left = 8
            Top = 417
            Width = 377
            Height = 232
            Caption = #1069#1083'. '#1040#1076#1088#1077#1089#1072
            TabOrder = 24
            TabStop = True
            object Label22: TLabel
              Left = 4
              Top = 15
              Width = 113
              Height = 13
              Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089' 1.'
              FocusControl = Mail1
            end
            object Label23: TLabel
              Left = 4
              Top = 40
              Width = 113
              Height = 13
              Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089' 2.'
              FocusControl = Mail2
            end
            object Label24: TLabel
              Left = 4
              Top = 63
              Width = 113
              Height = 13
              Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089' 3.'
              FocusControl = Mail3
            end
            object Label25: TLabel
              Left = 4
              Top = 85
              Width = 68
              Height = 13
              Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072
              FocusControl = TopicMail
            end
            object Label26: TLabel
              Left = 5
              Top = 105
              Width = 73
              Height = 13
              Caption = #1058#1077#1082#1089#1090' '#1055#1080#1089#1100#1084#1072
              FocusControl = Message
            end
            object lb_AddressPostForMail: TLabel
              Left = 8
              Top = 183
              Width = 119
              Height = 13
              Caption = #1040#1076#1088#1077#1089' '#1076#1086#1089#1090#1072#1074#1082#1080' '#1090#1086#1074#1072#1088#1072
              FocusControl = AddessPostForMail
            end
            object Mail1: TDBEdit
              Left = 124
              Top = 10
              Width = 240
              Height = 21
              Hint = 
                #1054#1089#1085#1086#1074#1085#1086#1081' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089'. '#13#10#1054#1073#1103#1079#1072#1090#1077#1083#1077#1085' '#1082' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1102' '#1074' '#1087#1077#1088#1074#1091#1102' '#1086 +
                #1095#1077#1088#1077#1076#1100'.'
              DataField = 'Mail1'
              DataSource = ds_Post_Mail
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnExit = Mail1Exit
            end
            object Mail2: TDBEdit
              Left = 124
              Top = 34
              Width = 240
              Height = 21
              Hint = #1047#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1086#1083#1103' "'#1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089' 1."'
              DataField = 'Mail2'
              DataSource = ds_Post_Mail
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              OnExit = Mail2Exit
            end
            object Mail3: TDBEdit
              Left = 124
              Top = 57
              Width = 240
              Height = 21
              Hint = 
                #1047#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1086#1083#1103' "'#1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089' 1." ' +
                #1080'  '#1087#1086#1083#1103' "'#1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089' 2."'
              DataField = 'Mail3'
              DataSource = ds_Post_Mail
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              OnExit = Mail3Exit
            end
            object TopicMail: TDBEdit
              Left = 124
              Top = 79
              Width = 240
              Height = 21
              Hint = #1047#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1086#1083#1103' "'#1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089' 1."'
              DataField = 'Topic'
              DataSource = ds_Post_Mail
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object Message: TDBMemo
              Left = 8
              Top = 119
              Width = 361
              Height = 65
              Hint = #1047#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1090#1086#1083#1100#1082#1086' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1086#1083#1103' "'#1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089' 1."'
              DataField = 'Message'
              DataSource = ds_Post_Mail
              ParentShowHint = False
              ScrollBars = ssVertical
              ShowHint = True
              TabOrder = 4
            end
            object AddessPostForMail: TDBLookupComboboxEh
              Left = 8
              Top = 196
              Width = 353
              Height = 21
              EditButtons = <>
              KeyField = 'AddressNo'
              ListField = 'Address'
              ListSource = ds_AddressPostForMail
              TabOrder = 5
              Visible = True
              OnChange = AddessPostForMailChange
              OnExit = AddessPostForMailExit
            end
          end
          object cbToMail: TCheckBox
            Left = 238
            Top = 354
            Width = 145
            Height = 17
            Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1083#1080' '#1089#1082#1088#1099#1090#1100' '#1087#1086#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1081' '#1087#1086#1095#1090#1099
            Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1099#1077' '#1072#1076#1088#1077#1089#1072
            ParentShowHint = False
            ShowHint = True
            TabOrder = 25
            OnClick = cbToMailClick
          end
          object DBEditPostBanPay: TDBEdit
            Left = 136
            Top = 397
            Width = 65
            Height = 21
            DataField = 'PayBan'
            DataSource = dsPostBanPay
            MaxLength = 10
            TabOrder = 26
          end
          object Set_Article_Group: TDBLookupComboboxEh
            Left = 136
            Top = 369
            Width = 249
            Height = 21
            EditButtons = <>
            KeyField = 'id2'
            ListField = 'NameFull'
            ListSource = dsPostBanPay
            TabOrder = 27
            Visible = True
            OnChange = Set_Article_GroupChange
            OnClick = Set_Article_GroupClick
          end
        end
        object PanelBoolProp: TPanel
          Left = 397
          Top = 0
          Width = 863
          Height = 631
          Align = alClient
          Caption = 'PanelBoolProp'
          TabOrder = 1
          object ToolBar: TToolBar
            Left = 1
            Top = 1
            Width = 895
            Height = 24
            AutoSize = True
            Caption = 'ToolBar'
            Flat = True
            Images = dmDataModule.ImageListToolBar
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            object ToolBtnAdd: TToolButton
              Left = 0
              Top = 0
              Action = ActionViewRefresh
            end
          end
          object DBGridEh2: TDBGridEh
            Left = 1
            Top = 25
            Width = 895
            Height = 619
            Align = alClient
            BorderStyle = bsNone
            DataSource = ds_Prop
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
            OptionsEh = [dghFixed3D, dghClearSelection]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            VertScrollBar.VisibleMode = sbAlwaysShowEh
            OnExit = DBGridEh2Exit
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Name'
                Footers = <>
                Title.Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1092#1080#1088#1084#1099
                Width = 289
              end
              item
                Alignment = taCenter
                EditButtons = <>
                FieldName = 'is_prop'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = 'V'
                Width = 20
                OnUpdateData = DBGridEh2Columns1UpdateData
              end>
          end
        end
      end
      object tsAdress: TTabSheet
        Caption = #1040#1076#1088#1077#1089#1072' '#1076#1086#1089#1090#1072#1074#1082#1080
        ImageIndex = 1
        object Splitter1: TSplitter
          Left = 313
          Top = 22
          Width = 8
          Height = 586
        end
        object CoolBar1: TCoolBar
          Left = 0
          Top = 0
          Width = 1260
          Height = 22
          Bands = <>
          EdgeOuter = esNone
          object SpeedButton1: TSpeedButton
            Left = 1
            Top = 0
            Width = 21
            Height = 20
            Action = ActionViewRefAddress
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF008400000084000000840000008400
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF0084000000840000008400000084000000840000008400
              00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00
              FF00840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
              FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
              FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
              FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF008400
              0000FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF008400000084000000FF00FF00FF00FF00FF00FF00FF00FF008400
              0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008400
              00008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008400
              0000840000008400000084000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
            ParentShowHint = False
            ShowHint = True
          end
          object Label14: TLabel
            Left = 24
            Top = 1
            Width = 153
            Height = 13
            Caption = 'Ctrl-Del : '#1091#1076#1072#1083#1080#1090#1100' Ins: '#1076#1086#1073#1072#1074#1080#1090#1100
            Color = clInfoBk
            ParentColor = False
          end
        end
        object RxDBGrid1: TDBGridEh
          Left = 0
          Top = 22
          Width = 313
          Height = 586
          TabStop = False
          Align = alLeft
          BorderStyle = bsNone
          DataSource = dsAddressPost
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete]
          OptionsEh = [dghFixed3D, dghClearSelection]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          VertScrollBar.VisibleMode = sbAlwaysShowEh
          OnExit = RxDBGrid1Exit
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ID'
              Footers = <>
              Title.Alignment = taCenter
              Width = 63
            end
            item
              EditButtons = <>
              FieldName = 'AddressNo'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #8470
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 26
            end
            item
              EditButtons = <>
              FieldName = 'Address'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1040#1076#1088#1077#1089
              Title.TitleButton = True
              Width = 151
            end
            item
              EditButtons = <>
              FieldName = 'AddressNoPost'
              Footers = <>
              Title.Caption = #8470' '#1072#1076#1088#1077#1089#1072' '#1074' '#1073#1072#1079#1077' '#1091' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'AddressPost'
              Footers = <>
              Title.Caption = #1040#1076#1088#1077#1089' '#1074' '#1073#1072#1079#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
              Visible = False
            end
            item
              EditButtons = <
                item
                  OnClick = RxDBGrid1Columns3EditButtons0Click
                end>
              FieldName = 'CategoryName'
              Footers = <>
              Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1058#1058
              Visible = False
              Width = 78
            end
            item
              ButtonStyle = cbsNone
              EditButtons = <>
              EditMask = '!90:00;1;_'
              FieldName = 'TimeBeg'
              Footers = <>
              Title.Caption = #1056#1072#1073#1086#1090#1072' '#1089
              Visible = False
            end
            item
              ButtonStyle = cbsNone
              DblClickNextVal = True
              EditButtons = <>
              EditMask = '!90:00;1;_'
              FieldName = 'TimeEnd'
              Footers = <>
              Title.Caption = #1056#1072#1073#1086#1090#1072' '#1087#1086
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Unloading'
              Footers = <>
              Title.Caption = #1056#1072#1079#1075#1088#1091#1079#1082#1072'('#1084#1080#1085'.)'
              Visible = False
              Width = 89
            end
            item
              EditButtons = <>
              FieldName = 'RegionName'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1056#1072#1081#1086#1085
              Title.TitleButton = True
              Title.ToolTips = True
              Visible = False
              Width = 107
            end
            item
              EditButtons = <>
              FieldName = 'City'
              Footers = <>
              Title.Caption = #1043#1086#1088#1086#1076
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Street'
              Footers = <>
              Title.Caption = #1059#1083#1080#1094#1072
              Visible = False
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'HouseNo'
              Footers = <>
              Title.Caption = #8470' '#1044#1086#1084#1072
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Topic'
              Footers = <>
              Title.Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Message'
              Footers = <>
              Title.Caption = #1058#1077#1082#1089#1090' '#1087#1080#1089#1100#1084#1072
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Mail1'
              Footers = <>
              Title.Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 1'
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Mail2'
              Footers = <>
              Title.Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 2'
              ToolTips = True
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Mail3'
              Footers = <>
              Title.Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 3'
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Car'
              Footers = <>
              Title.Caption = #1052#1072#1096#1080#1085#1072
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Driver'
              Footers = <>
              Title.Caption = #1042#1086#1076#1080#1090#1077#1083#1100
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'DateDeparture'
              Footers = <>
              ReadOnly = True
              Title.Alignment = taCenter
              Title.Caption = #1044#1072#1090#1072' '#1074#1099#1077#1079#1076#1072
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Degrees'
              Footers = <>
              Title.Caption = #1043#1088#1072#1076#1091#1089#1099
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Mminutes'
              Footers = <>
              Title.Caption = #1052#1080#1085#1091#1090#1099
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Seconds'
              Footers = <>
              Title.Caption = #1057#1077#1082#1091#1085#1076#1099
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'X'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1064#1080#1088#1086#1090#1072
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Y'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1044#1086#1083#1075#1086#1090#1072
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'Active'
              Footers = <>
            end>
        end
        object Panel4: TPanel
          Left = 321
          Top = 22
          Width = 500
          Height = 586
          Align = alLeft
          Caption = 'Panel4'
          TabOrder = 3
          object DBGridEh3: TDBGridEh
            Left = 1
            Top = 30
            Width = 498
            Height = 555
            Align = alClient
            BorderStyle = bsNone
            DataSource = ds_sotrud_address
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            Options = [dgEditing, dgTitles, dgColLines, dgRowLines, dgConfirmDelete]
            OptionsEh = [dghFixed3D, dghClearSelection]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            VertScrollBar.VisibleMode = sbAlwaysShowEh
            OnExit = DBGridEh3Exit
            Columns = <
              item
                DropDownShowTitles = True
                DropDownSizing = True
                EditButtons = <>
                FieldName = 'Sotrud'
                Footers = <>
                Width = 155
              end
              item
                DropDownRows = 10
                EditButtons = <>
                FieldName = 'OtdelName'
                Footers = <>
                ReadOnly = True
                Width = 106
              end
              item
                EditButtons = <>
                FieldName = 'Active'
                Footers = <>
                Title.Alignment = taCenter
                Width = 21
              end
              item
                EditButtons = <>
                FieldName = 'DateBegOnActive'
                Footers = <>
                Title.Alignment = taCenter
                Width = 98
              end
              item
                EditButtons = <>
                FieldName = 'DateEndOnActive'
                Footers = <>
                Title.Alignment = taCenter
                Width = 94
              end>
          end
          object Panel5: TPanel
            Left = 1
            Top = 1
            Width = 498
            Height = 29
            Align = alTop
            TabOrder = 0
            object Label19: TLabel
              Left = 1
              Top = 1
              Width = 496
              Height = 27
              Align = alClient
              Caption = 'Ctrl-Del : '#1091#1076#1072#1083#1080#1090#1100' Ins: '#1076#1086#1073#1072#1074#1080#1090#1100
              Color = clInfoBk
              ParentColor = False
            end
          end
        end
        object Panel7: TPanel
          Left = 821
          Top = 22
          Width = 439
          Height = 586
          Align = alClient
          TabOrder = 2
          object Splitter2: TSplitter
            Left = 1
            Top = 1
            Height = 584
          end
          object GroupBoxAddressPostProp: TGroupBox
            Left = 4
            Top = 1
            Width = 434
            Height = 584
            Align = alClient
            Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1072#1076#1088#1077#1089#1072' '#1076#1086#1089#1090#1072#1074#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnExit = GroupBoxAddressPostPropExit
            object lbAddressNoPost: TLabel
              Left = 16
              Top = 32
              Width = 190
              Height = 13
              Caption = #8470' '#1072#1076#1088#1077#1089#1072' '#1074' '#1073#1072#1079#1077' '#1091' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
            end
            object lbCategoryName: TLabel
              Left = 16
              Top = 80
              Width = 83
              Height = 13
              Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1058#1058
            end
            object lbAddressPost: TLabel
              Left = 16
              Top = 56
              Width = 158
              Height = 13
              Caption = #1040#1076#1088#1077#1089' '#1074' '#1073#1072#1079#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
            end
            object lbTimeBeg: TLabel
              Left = 16
              Top = 104
              Width = 58
              Height = 13
              Caption = #1056#1072#1073#1086#1090#1072' '#1089' '
            end
            object lbTimeEnd: TLabel
              Left = 256
              Top = 101
              Width = 23
              Height = 13
              Caption = ' '#1087#1086' '
            end
            object lbUnloading: TLabel
              Left = 320
              Top = 102
              Width = 98
              Height = 13
              Caption = #1056#1072#1079#1075#1088#1091#1079#1082#1072'('#1084#1080#1085'.)'
            end
            object lbRegionName: TLabel
              Left = 16
              Top = 176
              Width = 37
              Height = 13
              Caption = #1056#1072#1081#1086#1085
            end
            object lbCity: TLabel
              Left = 16
              Top = 200
              Width = 36
              Height = 13
              Caption = #1043#1086#1088#1086#1076
            end
            object lbStreet: TLabel
              Left = 16
              Top = 224
              Width = 38
              Height = 13
              Caption = #1059#1083#1080#1094#1072
            end
            object lbHouseNo: TLabel
              Left = 16
              Top = 248
              Width = 50
              Height = 13
              Caption = #8470' '#1044#1086#1084#1072
            end
            object lbTopic: TLabel
              Left = 16
              Top = 488
              Width = 80
              Height = 13
              Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072
            end
            object lbMessage: TLabel
              Left = 16
              Top = 512
              Width = 84
              Height = 13
              Caption = #1058#1077#1082#1089#1090' '#1087#1080#1089#1100#1084#1072
            end
            object lbMail1: TLabel
              Left = 16
              Top = 416
              Width = 70
              Height = 13
              Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 1'
            end
            object lbMail2: TLabel
              Left = 16
              Top = 440
              Width = 70
              Height = 13
              Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 2'
            end
            object lbMail3: TLabel
              Left = 16
              Top = 464
              Width = 70
              Height = 13
              Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 3'
            end
            object lbCar: TLabel
              Left = 16
              Top = 272
              Width = 48
              Height = 13
              Caption = #1052#1072#1096#1080#1085#1072
            end
            object lbDriver: TLabel
              Left = 16
              Top = 296
              Width = 57
              Height = 13
              Caption = #1042#1086#1076#1080#1090#1077#1083#1100
            end
            object lbDateDeparture: TLabel
              Left = 16
              Top = 320
              Width = 79
              Height = 13
              Caption = #1044#1072#1090#1072' '#1074#1099#1077#1079#1076#1072
            end
            object lbX: TLabel
              Left = 16
              Top = 344
              Width = 45
              Height = 13
              Caption = #1064#1080#1088#1086#1090#1072
            end
            object lbY: TLabel
              Left = 16
              Top = 368
              Width = 51
              Height = 13
              Caption = #1044#1086#1083#1075#1086#1090#1072
            end
            object lbClassifierName: TLabel
              Left = 16
              Top = 392
              Width = 142
              Height = 13
              Caption = 'ABCDZ '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088' '
            end
            object Label33: TLabel
              Left = 16
              Top = 557
              Width = 71
              Height = 13
              Caption = #1058#1077#1088#1088#1080#1090#1086#1088#1080#1080
            end
            object Label34: TLabel
              Left = 16
              Top = 537
              Width = 77
              Height = 13
              Caption = #1050#1072#1085#1072#1083' '#1089#1073#1099#1090#1072
            end
            object Label35: TLabel
              Left = 16
              Top = 580
              Width = 88
              Height = 13
              Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1089#1077#1090#1100
            end
            object Label37: TLabel
              Left = 16
              Top = 152
              Width = 139
              Height = 13
              Caption = #1057#1087#1077#1094#1076#1086#1089#1090#1072#1074#1082#1072'  '#1086#1090' ('#1082#1075'): '
            end
            object DBEditEhAddressNoPost: TDBEditEh
              Left = 216
              Top = 26
              Width = 41
              Height = 21
              DataField = 'AddressNoPost'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 0
              Visible = True
            end
            object DBEditEhAddressPost: TDBEditEh
              Left = 216
              Top = 48
              Width = 225
              Height = 21
              DataField = 'AddressPost'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 1
              Visible = True
            end
            object DBEditEhCategoryName: TDBEditEh
              Left = 216
              Top = 72
              Width = 29
              Height = 21
              DataField = 'CategoryName'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 2
              Visible = True
              OnChange = DBEditEhCategoryNameChange
              OnCheckDrawRequiredState = DBEditEhCategoryNameCheckDrawRequiredState
              OnDblClick = DBEditEhCategoryNameDblClick
            end
            object DBEditEhTimeBeg: TDBEditEh
              Left = 216
              Top = 96
              Width = 37
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
              Left = 280
              Top = 96
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
              Left = 424
              Top = 96
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
            object DBLookupComboboxEhRegionNo: TDBLookupComboboxEh
              Left = 216
              Top = 168
              Width = 137
              Height = 21
              DataField = 'RegionNo'
              DataSource = dsAddressPost
              EditButtons = <>
              KeyField = 'RegionNo'
              ListField = 'RegionName'
              ListSource = dmDataModule.dsRegions
              TabOrder = 6
              Visible = True
              OnChange = DBLookupComboboxEhRegionNoChange
              OnCheckDrawRequiredState = DBLookupComboboxEhRegionNoCheckDrawRequiredState
            end
            object DBEditEhCity: TDBEditEh
              Left = 216
              Top = 192
              Width = 137
              Height = 21
              DataField = 'City'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 7
              Visible = True
              OnChange = DBEditEhCityChange
              OnCheckDrawRequiredState = DBEditEhCityCheckDrawRequiredState
            end
            object DBEditEhStreet: TDBEditEh
              Left = 216
              Top = 216
              Width = 225
              Height = 21
              DataField = 'Street'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 8
              Visible = True
              OnChange = DBEditEhStreetChange
              OnCheckDrawRequiredState = DBEditEhStreetCheckDrawRequiredState
            end
            object DBEditEhHouseNo: TDBEditEh
              Left = 216
              Top = 240
              Width = 33
              Height = 21
              DataField = 'HouseNo'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 9
              Visible = True
              OnChange = DBEditEhHouseNoChange
              OnCheckDrawRequiredState = DBEditEhHouseNoCheckDrawRequiredState
            end
            object DBEditEhCar: TDBEditEh
              Left = 216
              Top = 264
              Width = 225
              Height = 21
              DataField = 'Car'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 10
              Visible = True
            end
            object DBEditEhDriver: TDBEditEh
              Left = 216
              Top = 288
              Width = 225
              Height = 21
              DataField = 'Driver'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 11
              Visible = True
            end
            object DBEditEhDateDeparture: TDBEditEh
              Left = 216
              Top = 312
              Width = 121
              Height = 21
              DataField = 'DateDeparture'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 12
              Visible = True
            end
            object DBEditEhX: TDBEditEh
              Left = 216
              Top = 336
              Width = 121
              Height = 21
              DataField = 'X'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 13
              Visible = True
              OnChange = DBEditEhXChange
              OnCheckDrawRequiredState = DBEditEhXCheckDrawRequiredState
            end
            object DBEditEhY: TDBEditEh
              Left = 216
              Top = 360
              Width = 121
              Height = 21
              DataField = 'Y'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 14
              Visible = True
              OnChange = DBEditEhYChange
              OnCheckDrawRequiredState = DBEditEhYCheckDrawRequiredState
            end
            object DBEditEhClassifierName: TDBEditEh
              Left = 216
              Top = 384
              Width = 25
              Height = 21
              DataField = 'ClassifierName'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 15
              Visible = True
              OnDblClick = DBEditEhClassifierNameDblClick
            end
            object DBEditEhMail1: TDBEditEh
              Left = 216
              Top = 408
              Width = 121
              Height = 21
              DataField = 'Mail1'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 16
              Visible = True
            end
            object DBEditEhMail2: TDBEditEh
              Left = 216
              Top = 432
              Width = 121
              Height = 21
              DataField = 'Mail2'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 17
              Visible = True
            end
            object DBEditEhMail3: TDBEditEh
              Left = 216
              Top = 456
              Width = 121
              Height = 21
              DataField = 'Mail3'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 18
              Visible = True
            end
            object DBEditEhTopic: TDBEditEh
              Left = 216
              Top = 480
              Width = 225
              Height = 21
              DataField = 'Topic'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 19
              Visible = True
            end
            object DBEditEhMessage: TDBEditEh
              Left = 216
              Top = 504
              Width = 225
              Height = 21
              DataField = 'Message'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 20
              Visible = True
              WordWrap = True
            end
            object DBEditEhSalesChannelsOfPepsico: TDBEditEh
              Left = 216
              Top = 530
              Width = 225
              Height = 21
              DataField = 'Code'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 21
              Visible = True
              WordWrap = True
              OnDblClick = DBEditEhSalesChannelsOfPepsicoDblClick
            end
            object DBEditEhKOATUU: TDBEditEh
              Left = 216
              Top = 553
              Width = 225
              Height = 21
              DataField = 'KOATUU_ID_CODE'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 22
              Visible = True
              WordWrap = True
              OnDblClick = DBEditEhKOATUUDblClick
            end
            object DBEditEh1: TDBEditEh
              Left = 216
              Top = 576
              Width = 225
              Height = 21
              Alignment = taLeftJustify
              DataField = 'Commerce_Network'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 23
              Visible = True
              WordWrap = True
              OnDblClick = DBEditEh1DblClick
            end
            object DBCheckBox5: TDBCheckBox
              Left = 266
              Top = 147
              Width = 122
              Height = 17
              Caption = #1057#1087#1077#1094' '#1076#1086#1089#1090#1072#1074#1082#1072
              DataField = 'SpecialDelivery'
              DataSource = dsAddressPost
              TabOrder = 24
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object DBEditEh2: TDBEditEh
              Left = 216
              Top = 146
              Width = 41
              Height = 21
              DataField = 'QuantityDelivery'
              DataSource = dsAddressPost
              EditButtons = <>
              TabOrder = 25
              Visible = True
            end
            object DBCheckBoxEhRefrezherator: TDBCheckBoxEh
              Left = 16
              Top = 125
              Width = 115
              Height = 17
              Caption = #1056#1077#1092#1088#1077#1078#1077#1088#1072#1090#1086#1088
              DataField = 'Refrezherator'
              DataSource = dsAddressPost
              TabOrder = 26
              ValueChecked = 'True'
              ValueUnchecked = 'False'
            end
            object Button1: TButton
              Left = 296
              Top = 16
              Width = 161
              Height = 25
              Caption = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1080#1089#1090#1086#1088#1080#1102
              TabOrder = 27
              OnClick = Button1Click
            end
            object Button2: TButton
              Left = 264
              Top = 71
              Width = 185
              Height = 21
              Caption = #1058#1086#1088#1075#1086#1074#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
              TabOrder = 28
              Visible = False
            end
            object DBCheckBoxEh1: TDBCheckBoxEh
              Left = 216
              Top = 124
              Width = 153
              Height = 17
              Caption = #1062#1077#1085#1090#1088#1072#1083#1100#1085#1072#1103' '#1079#1072#1103#1074#1082#1072
              TabOrder = 29
              ValueChecked = 'True'
              ValueUnchecked = 'False'
              Visible = False
            end
          end
        end
        object Panel9: TPanel
          Left = 0
          Top = 608
          Width = 1260
          Height = 23
          Align = alBottom
          TabOrder = 4
          DesignSize = (
            1260
            23)
          object cbIsAllSotrud: TCheckBox
            Left = 328
            Top = 1
            Width = 172
            Height = 17
            Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
            TabOrder = 0
          end
          object cbIsAllAddress: TCheckBox
            Left = -1
            Top = -2
            Width = 138
            Height = 25
            Anchors = [akBottom]
            BiDiMode = bdLeftToRight
            Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1074#1089#1077' '#1072#1076#1088#1077#1089#1072
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
            TabOrder = 1
          end
        end
      end
      object tsContract: TTabSheet
        Caption = #1044#1086#1075#1086#1074#1086#1088#1072
        ImageIndex = 2
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 24
          Width = 1294
          Height = 621
          Align = alClient
          BorderStyle = bsNone
          DataSource = ds_contract
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete]
          OptionsEh = [dghFixed3D, dghClearSelection]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          TitleHeight = 50
          UseMultiTitle = True
          VertScrollBar.VisibleMode = sbAlwaysShowEh
          Columns = <
            item
              EditButtons = <>
              FieldName = 'num'
              Footers = <>
              Title.Caption = #8470' '#1044#1086#1075#1086#1074#1086#1088#1072
              Width = 77
            end
            item
              EditButtons = <>
              FieldName = 'OurFirmName'
              Footers = <>
              Title.Caption = 'C '#1085#1072#1096#1077#1081' '#1092#1080#1088#1084#1086#1081
              Width = 101
            end
            item
              EditButtons = <>
              FieldName = 'Create_Date'
              Footers = <>
              Width = 94
            end
            item
              EditButtons = <>
              FieldName = 'Expire_Date'
              Footers = <>
              Width = 86
            end
            item
              DropDownShowTitles = True
              DropDownSizing = True
              EditButtons = <>
              FieldName = 'TypeName'
              Footers = <>
              LookupDisplayFields = 'name'
              Title.Caption = #1058#1080#1087' '#1076#1086#1075#1086#1074#1086#1088#1072
              Width = 135
            end
            item
              EditButtons = <>
              FieldName = 'Description'
              Footers = <>
              Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              Width = 190
            end
            item
              EditButtons = <>
              FieldName = 'print_on_naklR'
              Footers = <>
              Title.Caption = #1055#1077#1095#1072#1090#1072#1090#1100'| '#1085#1072' '#1088#1072#1089#1093'. '#1085#1072#1082#1083'.'
              Width = 40
              WordWrap = True
            end
            item
              EditButtons = <>
              FieldName = 'print_on_naklP'
              Footers = <>
              Title.Caption = #1055#1077#1095#1072#1090#1072#1090#1100'| '#1085#1072' '#1087#1088#1080#1093'. '#1085#1072#1082#1083'.'
              WordWrap = True
            end>
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 1294
          Height = 24
          Align = alTop
          TabOrder = 1
          object Label4: TLabel
            Left = 1
            Top = 1
            Width = 153
            Height = 13
            Caption = 'Ctrl-Del : '#1091#1076#1072#1083#1080#1090#1100' Ins: '#1076#1086#1073#1072#1074#1080#1090#1100
            Color = clInfoBk
            ParentColor = False
          end
        end
      end
      object tsDelayPay: TTabSheet
        Caption = #1054#1090#1089#1088#1086#1095#1082#1080
        ImageIndex = 3
        inline FrmDelayPay: TMlkListPostArticleGroupDelayPayFrame
          Left = 0
          Top = 0
          Width = 1260
          Height = 631
          Align = alClient
          PopupMenu = FrmDelayPay.PopupMenuGrid
          TabOrder = 0
          inherited PanelGrid: TPanel
            Width = 929
            Height = 493
            inherited DBCxGrid: TcxGrid
              Width = 923
              Height = 400
              inherited DBCxGridDBTableView1: TcxGridDBTableView
                inherited ClnPayBan: TcxGridDBColumn
                  Properties.ImmediatePost = True
                  Properties.Increment = 2.000000000000000000
                end
                inherited ClnCurrency: TcxGridDBColumn
                  Width = 153
                end
              end
            end
            inherited PageControlTop: TcxPageControl
              Width = 923
              ClientRectRight = 923
            end
            inherited SplFilter: TcxSplitter
              Width = 923
            end
          end
          inherited PageExt: TcxPageControl
            Top = 527
            Width = 1260
            ClientRectRight = 1259
            inherited TabSelection: TcxTabSheet
              inherited DBGridSelection: TcitDBGrid
                Width = 1258
              end
            end
          end
          inherited SplitterExt: TcxSplitter
            Top = 519
            Width = 1260
          end
          inherited PageSettings: TcxPageControl
            Height = 493
            ClientRectBottom = 492
            inherited TabProp2: TcxTabSheet
              inherited FrameProp: TValueListEditor
                Height = 445
                ColWidths = (
                  77
                  126)
              end
            end
          end
          inherited PageDetails: TcxPageControl
            Left = 1156
            Height = 493
            ClientRectBottom = 492
            inherited TabDetails1: TcxTabSheet
              inherited GridDetails: TcxDBVerticalGrid
                Height = 471
              end
            end
          end
          inherited SplitterDetails: TcxSplitter
            Left = 1148
            Height = 493
          end
          inherited SplitterSettings: TcxSplitter
            Height = 493
          end
          inherited BarDockControlCommon: TdxBarDockControl
            Width = 1260
          end
          inherited BarManager: TdxBarManager
            Categories.ItemsVisibles = (
              2
              2
              2
              2
              2
              2
              2
              2
              2)
            Categories.Visibles = (
              True
              True
              True
              True
              True
              True
              True
              True
              True)
            DockControlHeights = (
              0
              0
              0
              0)
            inherited ToolBarPanels: TdxBar
              DockedLeft = 274
            end
            inherited ToolBarCustomer: TdxBar
              DockedLeft = 490
            end
            inherited ToolBarGRIDView: TdxBar
              DockedLeft = 207
            end
            inherited ToolBarExport: TdxBar
              DockedLeft = 387
            end
          end
          inherited VTSelection: TVirtualTable
            Data = {03000000000000000000}
          end
        end
      end
      object tsPriceType: TTabSheet
        Caption = #1062#1077#1085#1099
        ImageIndex = 4
        inline FrmSetPriceType: TMlkListPostArticleGroupPriceTypeFrame
          Left = 0
          Top = 0
          Width = 1260
          Height = 631
          Align = alClient
          PopupMenu = FrmSetPriceType.PopupMenuGrid
          TabOrder = 0
          inherited PanelGrid: TPanel
            Width = 929
            Height = 493
            inherited DBCxGrid: TcxGrid
              Width = 923
              Height = 400
            end
            inherited PageControlTop: TcxPageControl
              Width = 923
              ClientRectRight = 923
              inherited tsDynamicFilter: TcxTabSheet
                inherited DbFltControlMain: TcxFilterControl
                  Width = 877
                end
              end
            end
            inherited SplFilter: TcxSplitter
              Width = 923
            end
          end
          inherited PageExt: TcxPageControl
            Top = 527
            Width = 1260
            ClientRectRight = 1259
            inherited TabSelection: TcxTabSheet
              inherited DBGridSelection: TcitDBGrid
                Width = 1292
              end
            end
          end
          inherited SplitterExt: TcxSplitter
            Top = 519
            Width = 1260
          end
          inherited PageSettings: TcxPageControl
            Height = 493
            ClientRectBottom = 492
            inherited TabProp2: TcxTabSheet
              inherited FrameProp: TValueListEditor
                Height = 445
                ColWidths = (
                  64
                  139)
              end
            end
          end
          inherited PageDetails: TcxPageControl
            Left = 1156
            Height = 493
            ClientRectBottom = 492
            inherited TabDetails1: TcxTabSheet
              inherited GridDetails: TcxDBVerticalGrid
                Height = 485
              end
            end
          end
          inherited SplitterDetails: TcxSplitter
            Left = 1148
            Height = 493
          end
          inherited SplitterSettings: TcxSplitter
            Height = 493
          end
          inherited BarDockControlCommon: TdxBarDockControl
            Width = 1260
          end
          inherited SaveDialog: TSaveDialog
            Left = 42
            Top = 341
          end
          inherited UserActionList: TActionList
            Top = 366
          end
          inherited DS: TDataSource
            Top = 366
          end
          inherited OpenDialog: TOpenDialog
            Left = 12
            Top = 341
          end
          inherited CustomActionList: TActionList
            Top = 367
          end
          inherited SysActionList: TActionList
            Top = 366
          end
          inherited BarManager: TdxBarManager
            Categories.ItemsVisibles = (
              2
              2
              2
              2
              2
              2
              2
              2
              2)
            Categories.Visibles = (
              True
              True
              True
              True
              True
              True
              True
              True
              True)
            Left = 152
            Top = 272
            DockControlHeights = (
              0
              0
              0
              0)
            inherited ToolBarPanels: TdxBar
              DockedLeft = 274
            end
            inherited ToolBarCustomer: TdxBar
              DockedLeft = 770
            end
            inherited ToolBarGRIDView: TdxBar
              DockedLeft = 207
            end
            inherited ToolBarExport: TdxBar
              DockedLeft = 387
            end
          end
          inherited PropStore: TcxPropertiesStore
            Left = 128
            Top = 366
          end
          inherited PopupMenuGrid: TPopupMenu
            Left = 156
            Top = 367
          end
          inherited DSSelection: TDataSource
            Left = 132
            Top = 341
          end
          inherited VTSelection: TVirtualTable
            Left = 102
            Top = 341
            Data = {03000000000000000000}
          end
          inherited PopMenuGRID: TcxGridPopupMenu
            Left = 72
            Top = 341
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
        ImageIndex = 5
        object AvtoLabel: TLabel
          Left = 27
          Top = 230
          Width = 65
          Height = 13
          Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100':'
        end
        object DriverLabel: TLabel
          Left = 28
          Top = 199
          Width = 51
          Height = 13
          Caption = #1042#1086#1076#1080#1090#1077#1083#1100':'
        end
        object BanDescriptionLabel: TLabel
          Left = 23
          Top = 76
          Width = 46
          Height = 13
          Caption = #1055#1088#1080#1095#1080#1085#1072':'
        end
        object Label29: TLabel
          Left = 234
          Top = 345
          Width = 149
          Height = 13
          Caption = #1054#1050#1055#1054' '#1042#1072#1085#1090#1072#1078#1086#1074'i'#1076#1087#1088#1072#1074#1085#1080#1082#1072' : '
        end
        object Label30: TLabel
          Left = 234
          Top = 400
          Width = 100
          Height = 13
          Caption = #1054#1050#1055#1054' '#1047#1072#1084#1086#1074#1085#1080#1082#1072' : '
        end
        object Label31: TLabel
          Left = 22
          Top = 135
          Width = 68
          Height = 13
          Caption = #1044#1086#1074#1077#1088#1077#1085#1085#1099#1081':'
        end
        object Label32: TLabel
          Left = 112
          Top = 11
          Width = 231
          Height = 13
          Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1080#1083#1080' '#1085#1077#1090' '#1058#1058#1053' '#1076#1083#1103' '#1101#1090#1086#1075#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
        end
        object Label36: TLabel
          Left = 234
          Top = 451
          Width = 189
          Height = 13
          Caption = #1054#1050#1055#1054' '#1040#1074#1090#1086#1084#1086#1073'i'#1083#1100#1085#1086#1075#1086' '#1087#1077#1088#1077#1074'i'#1079#1085#1080#1082#1072' : '
        end
        object DBCheckBox4: TDBCheckBox
          Left = 16
          Top = 8
          Width = 97
          Height = 17
          Caption = #1055#1077#1095#1072#1090#1100' '#1058#1058#1053
          DataField = 'TTN'
          DataSource = fmPost.dsPost
          TabOrder = 0
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object Use_it: TDBCheckBox
          Left = 16
          Top = 171
          Width = 209
          Height = 17
          Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1089#1083#1077#1076#1091#1102#1097#1080#1077' '#1076#1072#1085#1085#1099#1077':'
          DataField = 'Check1'
          DataSource = dsTTN_Record
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object Driver: TDBEdit
          Left = 98
          Top = 195
          Width = 121
          Height = 21
          DataField = 'Driver'
          DataSource = dsTTN_Record
          TabOrder = 2
        end
        object Cars: TDBEdit
          Left = 98
          Top = 227
          Width = 121
          Height = 21
          DataField = 'Cars'
          DataSource = dsTTN_Record
          TabOrder = 3
        end
        object Use_StoreKeeper: TDBCheckBox
          Left = 16
          Top = 264
          Width = 153
          Height = 17
          Caption = #1058#1077#1082#1091#1097#1080#1081' '#1082#1083#1072#1076#1086#1074#1097#1080#1082' :'
          DataField = 'Check1'
          DataSource = ds_Storekeeper
          TabOrder = 4
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object StoreKeeper: TDBEdit
          Left = 16
          Top = 291
          Width = 201
          Height = 21
          DataField = 'Storekeeper'
          DataSource = ds_Storekeeper
          TabOrder = 5
        end
        object Use_Post_Ban: TDBCheckBox
          Left = 16
          Top = 48
          Width = 273
          Height = 17
          Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1074#1086#1079#1074#1088#1072#1090' '#1090#1086#1074#1072#1088#1072' '#1074' '#1078#1091#1088#1085#1072#1083#1077' '#1079#1072#1082#1072#1079#1086#1074
          DataField = 'Check1'
          DataSource = ds_Post_Ban
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object BanDescription: TDBEdit
          Left = 71
          Top = 71
          Width = 288
          Height = 21
          DataField = 'Description'
          DataSource = ds_Post_Ban
          TabOrder = 7
        end
        object Shipper: TDBEdit
          Left = 23
          Top = 362
          Width = 201
          Height = 21
          DataField = 'Shipper'
          DataSource = ds_Shipper
          TabOrder = 8
        end
        object Use_Shipper: TDBCheckBox
          Left = 15
          Top = 335
          Width = 153
          Height = 17
          Caption = #1042#1072#1085#1090#1072#1078#1086#1074#1110#1076#1087#1088#1072#1074#1085#1080#1082
          DataField = 'Check1'
          DataSource = ds_Shipper
          TabOrder = 9
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object ShipperOKPO: TDBEdit
          Left = 235
          Top = 361
          Width = 149
          Height = 21
          AutoSelect = False
          DataField = 'ShipperOKPO'
          DataSource = ds_Shipper
          MaxLength = 100
          TabOrder = 10
        end
        object Use_Customer: TDBCheckBox
          Left = 15
          Top = 390
          Width = 153
          Height = 17
          Caption = #1047#1072#1084#1086#1074#1085#1080#1082
          DataField = 'Check1'
          DataSource = ds_Customer
          TabOrder = 11
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object Customer: TDBEdit
          Left = 23
          Top = 417
          Width = 201
          Height = 21
          DataField = 'Customer'
          DataSource = ds_Customer
          TabOrder = 12
        end
        object CustomerOKPO: TDBEdit
          Left = 235
          Top = 416
          Width = 149
          Height = 21
          AutoSelect = False
          DataField = 'CustomerOKPO'
          DataSource = ds_Customer
          MaxLength = 100
          TabOrder = 13
        end
        object Use_Confidant: TDBCheckBox
          Left = 15
          Top = 107
          Width = 186
          Height = 17
          Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1077' '#1083#1080#1094#1086
          DataField = 'Check1'
          DataSource = ds_Confidant
          TabOrder = 14
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object Confidant: TDBEdit
          Left = 94
          Top = 130
          Width = 267
          Height = 21
          DataField = 'Confidant'
          DataSource = ds_Confidant
          TabOrder = 15
        end
        object BDescription: TButton
          Left = 720
          Top = 600
          Width = 75
          Height = 25
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          TabOrder = 16
          OnClick = BDescriptionClick
        end
        object GroupBox1: TGroupBox
          Left = 416
          Top = 61
          Width = 305
          Height = 327
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1092#1072#1081#1083#1072' '#1086#1090#1087#1088#1072#1074#1082#1080' '
          TabOrder = 17
          object DBGridEhVidExportExelFile: TDBGridEh
            Left = 2
            Top = 15
            Width = 301
            Height = 310
            Align = alClient
            DataSource = dsVidExportExelFile
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
                FieldName = 'Column_Name'
                Footers = <>
                Title.Alignment = taCenter
                Width = 168
              end
              item
                EditButtons = <>
                FieldName = 'Is_Checked'
                Footers = <>
                Title.Alignment = taCenter
              end
              item
                EditButtons = <>
                FieldName = 'N_pp'
                Footers = <>
                Title.Alignment = taCenter
              end>
          end
        end
        object DBCheckBoxEhExportInExcelFile: TDBCheckBoxEh
          Left = 416
          Top = 8
          Width = 233
          Height = 17
          Caption = #1054#1090#1087#1088#1072#1074#1083#1103#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1099#1077' '#1074' '#1092#1086#1088#1084#1072#1090#1077' Excel'
          DataField = 'Check1'
          DataSource = dsExportInExcelFile
          TabOrder = 18
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = DBCheckBoxEhExportInExcelFileClick
          OnMouseDown = DBCheckBoxEhExportInExcelFileMouseDown
        end
        object DBCheckBoxEhSeparationFile: TDBCheckBoxEh
          Left = 416
          Top = 32
          Width = 337
          Height = 17
          Caption = #1056#1072#1079#1076#1077#1083#1103#1090#1100' '#1092#1072#1081#1083' '#1087#1086' '#1086#1090#1076#1077#1083#1072#1084' '#1087#1088#1080' '#1074#1099#1075#1088#1091#1079#1082#1077' '#1086#1076#1085#1080#1084' '#1092#1072#1081#1083#1086#1084
          DataField = 'CheckSeparationFile'
          DataSource = dsExportInExcelFile
          TabOrder = 19
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = DBCheckBoxEhExportInExcelFileClick
          OnMouseDown = DBCheckBoxEhExportInExcelFileMouseDown
        end
        object Use_CarCarrier: TDBCheckBox
          Left = 15
          Top = 441
          Width = 170
          Height = 17
          Caption = #1040#1074#1090#1086#1084#1086#1073'i'#1083#1100#1085#1080#1081' '#1087#1077#1088#1077#1074'i'#1079#1085#1080#1082
          DataField = 'Check1'
          DataSource = ds_CarCarrier
          TabOrder = 20
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object CarCarrier: TDBEdit
          Left = 23
          Top = 468
          Width = 201
          Height = 21
          DataField = 'CarCarrier'
          DataSource = ds_CarCarrier
          TabOrder = 21
        end
        object CarCarrierOKPO: TDBEdit
          Left = 235
          Top = 467
          Width = 149
          Height = 21
          AutoSelect = False
          DataField = 'CarCarrierOKPO'
          DataSource = ds_CarCarrier
          MaxLength = 100
          TabOrder = 22
        end
        object GroupBox2: TGroupBox
          Left = 760
          Top = 64
          Width = 289
          Height = 321
          Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1076#1083#1103' '#1087#1088#1080#1093#1086#1076#1085#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
          TabOrder = 23
          object DBGridEh4: TDBGridEh
            Left = 2
            Top = 15
            Width = 285
            Height = 304
            Align = alClient
            DataSource = dsVidImportExelFileForNaklP
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
            TitleLines = 2
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Name'
                Footers = <>
                Title.Alignment = taCenter
              end
              item
                EditButtons = <>
                FieldName = 'Column_Name_Post'
                Footers = <>
                Title.Alignment = taCenter
              end>
          end
        end
        object GroupBox4: TGroupBox
          Left = 416
          Top = 400
          Width = 313
          Height = 185
          Caption = #1043#1088#1091#1087#1087#1072' '#1087#1086#1088#1077#1079#1082#1080' '#1079#1072#1082#1072#1079#1086#1074
          TabOrder = 24
          object DBGridEh5: TDBGridEh
            Left = 2
            Top = 15
            Width = 309
            Height = 168
            Align = alClient
            DataSource = dsl_PostGroupCutting
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
            OnKeyDown = DBGridEh5KeyDown
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
      object TabSheet2: TTabSheet
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
        ImageIndex = 6
        object DescriptionDjob: TDBMemo
          Left = 0
          Top = 7
          Width = 361
          Height = 106
          Hint = #1054#1087#1080#1089#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1086#1074
          DataField = 'DescriptionDjob'
          DataSource = dsDescriptionDjobSupplier
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = True
          TabOrder = 0
        end
      end
    end
  end
  object Panel3: TPanel [1]
    Left = 0
    Top = 669
    Width = 1278
    Height = 26
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 238
      Top = 1
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = bbOkClick
      Kind = bkOK
    end
    object bbCancel: TBitBtn
      Left = 318
      Top = 1
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dsAddressPost: TDataSource
    DataSet = quAddressPost
    Left = 61
    Top = 288
  end
  object qu_Contract: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * '
      'from d_firm_contract v'
      'where v.PostNo = :p_PostNo')
    BeforePost = qu_ContractBeforePost
    Left = 8
    Top = 400
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
        Value = 1884
      end>
    object qu_Contractid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qu_ContractPostNo: TIntegerField
      FieldName = 'PostNo'
    end
    object qu_ContractType_id: TIntegerField
      FieldName = 'Type_id'
    end
    object qu_ContractDescription: TStringField
      FieldName = 'Description'
      Size = 1024
    end
    object qu_ContractCreate_Date: TDateTimeField
      DisplayLabel = #1055#1077#1088#1080#1086#1076'|'#1089' '#1076#1072#1090#1099
      FieldName = 'Create_Date'
    end
    object qu_Contractnum: TStringField
      FieldName = 'num'
      Size = 24
    end
    object qu_ContractTypeName: TStringField
      FieldKind = fkLookup
      FieldName = 'TypeName'
      LookupDataSet = qu_ContractType
      LookupKeyFields = 'id'
      LookupResultField = 'Name'
      KeyFields = 'Type_id'
      Size = 1024
      Lookup = True
    end
    object qu_ContractExpire_Date: TDateTimeField
      DisplayLabel = #1055#1077#1088#1080#1086#1076'|'#1087#1086' '#1076#1072#1090#1091
      FieldName = 'Expire_Date'
    end
    object qu_Contractprint_on_nakl: TBooleanField
      FieldName = 'print_on_naklR'
    end
    object qu_Contractprint_on_naklP: TBooleanField
      FieldName = 'print_on_naklP'
    end
    object qu_ContractOurFirmNo: TIntegerField
      FieldName = 'OurFirmNo'
      Required = True
    end
    object qu_ContractOurFirmName: TStringField
      FieldKind = fkLookup
      FieldName = 'OurFirmName'
      LookupDataSet = quOurFirm
      LookupKeyFields = 'PostNo'
      LookupResultField = 'name'
      KeyFields = 'OurFirmNo'
      Lookup = True
    end
    object qu_Contractpkey: TLargeintField
      FieldName = 'pkey'
    end
  end
  object ds_contract: TDataSource
    DataSet = qu_Contract
    Left = 64
    Top = 440
  end
  object qu_ContractType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * '
      'from d_contract_type v')
    Left = 88
    Top = 440
  end
  object ds_ContractType: TDataSource
    DataSet = qu_ContractType
    Left = 112
    Top = 440
  end
  object qu_Prop: TMSQuery
    SQLUpdate.Strings = (
      '{CALL sp_SetFirmProp(:PostNo, :Id, :is_prop)}')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  p.Name'
      '      , Case when l.id is null then cast(0 as bit)'
      '             else cast(1 as bit) end as is_prop'
      '      , p.id'
      '      , l.PostNo'
      'from d_firm_prop p left outer join '
      '     l_firm_prop l on l.Prop_id=p.id and l.PostNo= :p_PostNo')
    Options.StrictUpdate = False
    Left = 464
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'p_PostNo'
        Size = 4
        Value = ''
      end>
    object qu_PropName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 50
    end
    object qu_Propis_prop: TBooleanField
      FieldName = 'is_prop'
    end
    object qu_Propid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object qu_PropPostNo: TIntegerField
      FieldName = 'PostNo'
      Visible = False
    end
  end
  object ds_Prop: TDataSource
    DataSet = qu_Prop
    Left = 432
    Top = 152
  end
  object spSetFirmProp: TMSStoredProc
    StoredProcName = 'sp_SetFirmProp;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_SetFirmProp;1(:p_postNo, :p_PropId, :p_' +
        'Value)}')
    Left = 416
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_postNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_PropId'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Value'
        ParamType = ptInput
      end>
  end
  object ActionListCur: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 540
    Top = 304
    object ActionItemAdd: TAction
      Category = 'Item'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 0
      ShortCut = 45
    end
    object ActionItemProp: TAction
      Category = 'Item'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
      ShortCut = 113
    end
    object ActionItemDel: TAction
      Category = 'Item'
      AutoCheck = True
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 2
      ShortCut = 16430
    end
    object ActionViewRefresh: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1080#1079' '#1041#1044
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecute
    end
    object ActionViewLayout: TAction
      Category = 'View'
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1074#1080#1076#1072' '#1090#1072#1073#1083#1080#1094#1099
      ImageIndex = 4
    end
    object ActionViewFilter: TAction
      Category = 'View'
      Caption = #1060#1080#1083#1100#1090#1088#1099
      Hint = #1055#1077#1088#1077#1093#1086#1076' '#1084#1077#1078#1076#1091' '#1092#1080#1083#1100#1090#1088#1072#1084#1080' '#1080' '#1089#1087#1080#1089#1082#1086#1084' '#1080' '#1085#1072#1079#1072#1076
      ImageIndex = 5
      ShortCut = 118
    end
    object ActionViewFilterOff: TAction
      Category = 'View'
      Caption = #1054#1095#1080#1089#1090#1082#1072' '#1092#1080#1083#1100#1090#1088#1086#1074
      ImageIndex = 6
      ShortCut = 16502
    end
    object ActionRowSelect: TAction
      Category = 'View'
      Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1089#1090#1088#1086#1082#1091
      Checked = True
      ShortCut = 16466
    end
    object ActionDebugAll: TAction
      Caption = 'ActionDebugAll'
      ShortCut = 57412
    end
    object ActionFind: TAction
      Category = 'Search'
      Caption = #1053#1072#1081#1090#1080
      Enabled = False
      Hint = #1053#1072#1081#1090#1080
      ShortCut = 16454
    end
    object ActionFindNext: TAction
      Category = 'Search'
      Caption = #1053#1072#1081#1090#1080' '#1089#1083#1077#1076#1091#1102#1097#1080#1081
      Enabled = False
      Hint = #1053#1072#1081#1090#1080' '#1089#1083#1077#1076#1091#1102#1097#1080#1081
      ShortCut = 114
    end
    object ActionFindReverse: TAction
      Category = 'Search'
      Caption = #1054#1073#1088#1072#1090#1085#1099#1081' '#1087#1086#1080#1089#1082
      Enabled = False
      Hint = #1054#1073#1088#1072#1090#1085#1099#1081' '#1087#1086#1080#1089#1082
      ShortCut = 8306
    end
    object ActionShowContextValues: TAction
      Caption = 'ActionShowContextValues'
      ShortCut = 57411
    end
    object ActionDebugBuilder: TAction
      Caption = 'ActionDebugBuilder'
      ShortCut = 24642
    end
    object ActionCopyProfile: TAction
      Category = 'View'
      Caption = 'ActionCopyProfile'
      Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ImageIndex = 7
    end
    object ActionRestoreFormat: TAction
      Category = 'View'
      Caption = 'ActionRestoreFormat'
      ImageIndex = 5
    end
    object ActionViewRefAddress: TAction
      Category = 'View'
      ImageIndex = 3
      OnExecute = ActionViewRefAddressExecSQL
    end
  end
  object ds_sotrud_address: TDataSource
    DataSet = Tsotrud_address
    Left = 584
    Top = 160
  end
  object quOurFirm: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select p.name,p.PostNo '
      'from Post p,d_our_firm o'
      'where p.PostNo=o.PostNo')
    Left = 136
    Top = 440
  end
  object DsOurFirm: TDataSource
    DataSet = qu_ContractType
    Left = 168
    Top = 440
  end
  object quAddressPost: TMSQuery
    SQLInsert.Strings = (
      'declare '
      '    @AddressId int'
      '   ,@CategoryId int'
      '   ,@ClassifierNo int'
      '   ,@cnt int'
      '   ,@cnt1 int'
      '   ,@cnt2 int'
      '   ,@KOATUU int'
      '   ,@SalesChannelsOfPepsico int'
      '   ,@Commerce_Network int'
      ''
      
        'select @KOATUU = count(*) from L_AddressPostKOATUUOfPepsico wher' +
        'e PostNo = :PostNo and AddressNo = :AddressNo'
      ''
      
        'select @SalesChannelsOfPepsico = count(*) from L_AddressPostSale' +
        'sChannelsOfPepsico where PostNo = :PostNo and AddressNo = :Addre' +
        'ssNo'
      ''
      
        'select @Commerce_Network = count(*) from L_AddressPost_CODE_Comm' +
        'erce_Network_Of_Pepsico where PostNo = :PostNo and AddressNo = :' +
        'AddressNo'
      ''
      
        'select @cnt2 = count(*) from AddressPost where PostNo = :PostNo ' +
        'and AddressNo = :AddressNo'
      ''
      'if @cnt2 is null set @cnt2 = 0'
      ''
      'if @cnt2 = 0'
      'begin'
      
        '  INSERT INTO AddressPost (PostNo, AddressNo, Address, RegionNo,' +
        ' MarschrutNo, Active, SpecialDelivery, QuantityDelivery, Refrezh' +
        'erator)'
      
        '   VALUES (:PostNo, :AddressNo, :Address, :RegionNo, :MarschrutN' +
        'o, 1, :SpecialDelivery, :QuantityDelivery, :Refrezherator)'
      '  SET :ID = SCOPE_IDENTITY()'
      '  set @AddressId = :ID'
      'end'
      ''
      'insert into Post_Mail'
      
        '   (PostNo,Topic,Message,Mail1,Mail2,Mail3,AddressNo,City,Street' +
        ',HouseNo)'
      'values'
      
        '   (:PostNo,:Topic,:Message,:Mail1,:Mail2,:Mail3,:AddressNo,:Cit' +
        'y,:Street,:HouseNo)'
      '-- set :id = scope_identity()'
      ''
      'if (len(:Car)+len(:Driver)>2)'
      'begin'
      '  insert into CarForAdressPost'
      '      (PostNo,AddressNo,AddressId,Car,Driver,DateDeparture)'
      '   values'
      
        '      (:PostNo,:AddressNo,@AddressId,:Car,:Driver,:DateDeparture' +
        ')'
      '--   set :id = scope_identity()'
      'end'
      ''
      
        'select @cnt = count(*) from CoordinatesAddressPost where PostNo ' +
        '= :PostNo and AddressNo = :AddressNo'
      ''
      'if @cnt = 0'
      'if (len(:Degrees)>1) or (len(:X)+len(:Y) > 2)'
      'begin'
      '  insert into CoordinatesAddressPost'
      
        '      (PostNo,AddressNo,Degrees,Mminutes,Seconds,Coordinates,X,Y' +
        ')'
      '   values '
      
        '      (:PostNo,:AddressNo,:Degrees,:Mminutes,:Seconds,:Coordinat' +
        'es,:X,:Y)'
      '--   set :id = scope_identity()'
      'end'
      ''
      'if (len(:CategoryName)>0)'
      'begin'
      
        '  select @CategoryId = CategoryTTNo from D_CategoryTT where Cate' +
        'goryTTName = :CategoryName'
      '  insert into L_CategoryAddressPost'
      '      (PostNo,AddressNo,CategoryId)'
      '   values(:PostNo,:AddressNo,@CategoryId)'
      'end'
      ''
      
        'select @cnt1 = count(*) from L_AddressPostProp where PostNo = :P' +
        'ostNo and AddressNo = :AddressNo'
      ''
      'if @cnt1 = 0'
      'if (len(:TimeBeg)+len(:TimeEnd)+len(:Unloading)>3)'
      'begin'
      '  insert into L_AddressPostProp'
      '      (PostNo,AddressNo,TimeBeg,TimeEnd,Unloading)'
      '   values (:PostNo,:AddressNo,:TimeBeg,:TimeEnd,:Unloading)'
      'end'
      ''
      'if (len(:AddressPost)>0)'
      'begin'
      '  insert into AddressCorrespondence'
      '      (PostNo,AddressNo,AddressPost,AddressNoPost)'
      '   values (:PostNo,:AddressNo,:AddressPost,:AddressNoPost)'
      'end'
      ''
      'if (len(:ClassifierName)>0)'
      'begin'
      
        '  select @ClassifierNo = ClassifierNo from ClassifierABCDZ where' +
        ' ClassifierName = :ClassifierName'
      '  insert into L_AddressPostClassifierABCDZ'
      '      (PostNo,AddressNo,ClassifierNo)'
      '   values(:PostNo,:AddressNo,@ClassifierNo)'
      'end'
      ''
      'if ((@KOATUU = 0) and (len(:KOATUU_ID_CODE) > 8))'
      'begin'
      '  insert into L_AddressPostKOATUUOfPepsico'
      '      (PostNo,AddressNo,KOATUU_ID_CODE)'
      '   values(:PostNo,:AddressNo,:KOATUU_ID_CODE)'
      'end '
      ''
      'if ((@SalesChannelsOfPepsico = 0) and (len(:Code) > 1))'
      'begin'
      '  insert into L_AddressPostSalesChannelsOfPepsico'
      '      (PostNo,AddressNo,Code)'
      '   values(:PostNo,:AddressNo,:Code) '
      'end'
      ''
      'if ((@Commerce_Network = 0) and (len(:Commerce_Network) > 1))'
      'begin'
      '  insert into L_AddressPost_CODE_Commerce_Network_Of_Pepsico'
      '      (PostNo,AddressNo,Commerce_Network)'
      '   values(:PostNo,:AddressNo,:Commerce_Network) '
      'end')
    SQLDelete.Strings = (
      'DELETE FROM d_sotrud_address'
      'WHERE'
      '  addressPost_id = :Old_id'
      ''
      'DELETE FROM AddressPost'
      'WHERE'
      '  PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from Post_Mail'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from CarForAdressPost'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from CoordinatesAddressPost'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from L_CategoryAddressPost'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from L_AddressPostProp'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from AddressCorrespondence'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from L_AddressPostClassifierABCDZ'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from L_AddressPostKOATUUOfPepsico'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from L_AddressPostSalesChannelsOfPepsico'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from L_AddressPost_CODE_Commerce_Network_Of_Pepsico'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo')
    SQLUpdate.Strings = (
      'declare'
      '  @cnt  int'
      ' ,@cnt1 int'
      ' ,@cnt2 int'
      ' ,@cnt3 int'
      ' ,@cnt4 int'
      ' ,@cnt5 int'
      ' ,@cnt6 int'
      ' ,@cnt7 int'
      ' ,@AddressId int'
      ' ,@CategoryId int'
      ' ,@ClassifierNo int'
      ' ,@KOATUU int'
      ' ,@SalesChannelsOfPepsico int'
      ' ,@Commerce_Network int'
      ''
      
        'select @KOATUU = count(*) from L_AddressPostKOATUUOfPepsico wher' +
        'e PostNo = :PostNo and AddressNo = :AddressNo'
      
        'select @SalesChannelsOfPepsico = count(*) from L_AddressPostSale' +
        'sChannelsOfPepsico where PostNo = :PostNo and AddressNo = :Addre' +
        'ssNo'
      
        'select @Commerce_Network = count(*) from L_AddressPost_CODE_Comm' +
        'erce_Network_Of_Pepsico where PostNo = :PostNo and AddressNo = :' +
        'AddressNo'
      
        'select @cnt = count(*) from post_mail where PostNo = :PostNo AND' +
        ' AddressNo = :AddressNo'
      
        'select @cnt1 = count(*) from CarForAdressPost where PostNo = :Po' +
        'stNo AND AddressNo = :AddressNo'
      
        'select @cnt2 = isnull(count(*),0) from CoordinatesAddressPost wh' +
        'ere PostNo = :PostNo AND AddressNo = :AddressNo'
      
        'select @cnt3 = isnull(count(*),0) from L_CategoryAddressPost whe' +
        're PostNo = :PostNo AND AddressNo = :AddressNo'
      
        'select @cnt4 = isnull(count(*),0) from L_AddressPostProp where P' +
        'ostNo = :PostNo AND AddressNo = :AddressNo'
      
        'select @cnt5 = isnull(count(*),0) from AddressCorrespondence whe' +
        're PostNo = :PostNo AND AddressNo = :AddressNo'
      
        'select @cnt6 = isnull(count(*),0) from AddressPost where PostNo ' +
        '= :PostNo AND AddressNo = :AddressNo'
      
        'select @cnt7 = isnull(count(*),0) from L_AddressPostClassifierAB' +
        'CDZ where PostNo = :PostNo AND AddressNo = :AddressNo'
      ''
      'if @cnt6 > 0'
      'begin '
      '  UPDATE AddressPost'
      
        '   SET PostNo = :PostNo, AddressNo = :AddressNo, Address = :Addr' +
        'ess, RegionNo = :RegionNo, MarschrutNo = :MarschrutNo, Active = ' +
        ':Active, SpecialDelivery = :SpecialDelivery, QuantityDelivery = ' +
        ':QuantityDelivery, Refrezherator = :Refrezherator'
      '  WHERE PostNo = :PostNo AND AddressNo = :AddressNo'
      'end'
      'else'
      'begin'
      
        '  INSERT INTO AddressPost (PostNo, AddressNo, Address, RegionNo,' +
        ' MarschrutNo, Active, SpecialDelivery, QuantityDelivery, Refrezh' +
        'erator)'
      
        '   VALUES (:PostNo, :AddressNo, :Address, :RegionNo, :MarschrutN' +
        'o, 1, :SpecialDelivery, :QuantityDelivery, :Refrezherator)'
      '  SET :ID = SCOPE_IDENTITY()'
      '  set @AddressId = :ID'
      'end'
      ''
      'if @cnt > 0 '
      'begin'
      '  update Post_mail'
      '  set'
      '    PostNo = :PostNo, Topic = :Topic, Message = :Message,'
      
        '    Mail1 = :Mail1, Mail2 = :Mail2, Mail3 = :Mail3, AddressNo = ' +
        ':AddressNo,'
      '    City = :City, Street = :Street, HouseNo = :HouseNo'
      '  where PostNo = :PostNo AND AddressNo = :AddressNo'
      'end'
      'else'
      'begin'
      
        '  insert into Post_Mail (PostNo,Topic,Message,Mail1,Mail2,Mail3,' +
        'AddressNo,City,Street,HouseNo)'
      
        '    values  (:PostNo,:Topic,:Message,:Mail1,:Mail2,:Mail3,:Addre' +
        'ssNo,:City,:Street,:HouseNo)'
      '-- set :id = scope_identity()'
      'end'
      ''
      'if @cnt1 > 0 '
      'begin'
      
        '  select @AddressId = Id from AddressPost where PostNo = :PostNo' +
        ' AND AddressNo = :AddressNo'
      '  if (len(:Car)+len(:Driver)>2)'
      '  update CarForAdressPost'
      '  set'
      
        '    PostNo = :PostNo, AddressNo = :AddressNo, Car = :Car, Driver' +
        ' = :Driver, AddressId = @AddressId, DateDeparture = :DateDepartu' +
        're'
      '  where PostNo = :PostNo AND AddressNo = :AddressNo'
      'end'
      'else'
      'begin'
      
        '  select @AddressId =  Id from AddressPost where PostNo = :Old_P' +
        'ostNo AND AddressNo = :Old_AddressNo'
      '  if (len(:Car)+len(:Driver)>2)'
      '   begin'
      '      insert into CarForAdressPost'
      '         (PostNo,AddressNo,AddressId,Car,Driver,DateDeparture)'
      '      values'
      
        '         (:PostNo,:AddressNo,@AddressId,:Car,:Driver,:DateDepart' +
        'ure)'
      '--      set :id = scope_identity()'
      '   end'
      'end'
      ''
      'if @cnt2 = 0'
      'begin'
      '  if (len(:Degrees)>1) or (len(:X)+len(:Y) > 2)'
      '   begin'
      '     insert into CoordinatesAddressPost'
      
        '         (PostNo,AddressNo,Degrees,Mminutes,Seconds,Coordinates,' +
        'X,Y)'
      '     values '
      
        '         (:PostNo,:AddressNo,:Degrees,:Mminutes,:Seconds,:Coordi' +
        'nates,:X,:Y)'
      '--     set :id = scope_identity()'
      '   end'
      'end'
      'else'
      'begin'
      '  update CoordinatesAddressPost'
      '   set Degrees = :Degrees'
      '      ,Mminutes = :Mminutes'
      '      ,Seconds = :Seconds'
      '      ,Coordinates = :Coordinates'
      '      ,X = :X'
      '      ,Y = :Y'
      '   where PostNo = :PostNo'
      '     and AddressNo = :AddressNo'
      'end'
      ''
      'if @cnt3 = 0'
      'begin'
      '  if (len(:CategoryName)>=1)'
      '   begin'
      
        '      select @CategoryId = CategoryTTNo from D_CategoryTT where ' +
        'CategoryTTName = :CategoryName'
      '      insert into L_CategoryAddressPost'
      '             (PostNo,AddressNo,CategoryId)'
      '       values(:PostNo,:AddressNo,@CategoryId)'
      '   end'
      'end'
      'else'
      'begin'
      
        '  select @CategoryId = CategoryTTNo from D_CategoryTT where Cate' +
        'goryTTName = :CategoryName'
      '  update L_CategoryAddressPost'
      '   set CategoryId = @CategoryId'
      '  where PostNo = :PostNo'
      '    and AddressNo = :AddressNo    '
      'end'
      ''
      'if @cnt4 = 0'
      'begin'
      '  if (len(:TimeBeg)+len(:TimeEnd)+len(:Unloading)>3)'
      '      insert into L_AddressPostProp'
      '              (PostNo,AddressNo,TimeBeg,TimeEnd,Unloading)'
      '       values (:PostNo,:AddressNo,:TimeBeg,:TimeEnd,:Unloading)'
      'end'
      'else'
      'begin'
      '  Update L_AddressPostProp'
      '   set TimeBeg = :TimeBeg'
      '      ,TimeEnd = :TimeEnd'
      '      ,Unloading = :Unloading'
      '  where PostNo = :PostNo'
      '    and AddressNo = :AddressNo'
      'end'
      ''
      'if @cnt5 = 0'
      'begin'
      '  if (len(:AddressPost)>0)'
      '      insert into AddressCorrespondence'
      '              (PostNo,AddressNo,AddressPost,AddressNoPost)'
      '       values (:PostNo,:AddressNo,:AddressPost,:AddressNoPost)'
      'end'
      'else'
      'begin'
      '  Update AddressCorrespondence'
      '   set AddressPost = :AddressPost'
      '      ,AddressNoPost = :AddressNoPost '
      '  where PostNo = :PostNo'
      '    and AddressNo = :AddressNo'
      'end'
      ''
      ''
      'if @cnt7 = 0'
      'begin'
      '  if (len(:ClassifierName)>0)'
      '   begin'
      
        '     select @ClassifierNo = ClassifierNo from ClassifierABCDZ wh' +
        'ere ClassifierName = :ClassifierName'
      
        '     insert into L_AddressPostClassifierABCDZ(PostNo,AddressNo,C' +
        'lassifierNo)'
      '      values(:PostNo,:AddressNo,@ClassifierNo)'
      '   end '
      'end'
      'else'
      'begin'
      
        '  select @ClassifierNo = ClassifierNo from ClassifierABCDZ where' +
        ' ClassifierName = :ClassifierName'
      '  update L_AddressPostClassifierABCDZ'
      '   set ClassifierNo = @ClassifierNo'
      '  where PostNo = :PostNo'
      '    and AddressNo = :AddressNo'
      'end'
      ''
      'if (@KOATUU = 0)'
      'begin'
      '  if (len(:KOATUU_ID_CODE) > 8)'
      '   begin'
      '     insert into L_AddressPostKOATUUOfPepsico'
      '      (PostNo,AddressNo,KOATUU_ID_CODE)'
      '     values'
      '      (:PostNo,:AddressNo,:KOATUU_ID_CODE)     '
      '   end'
      'end'
      'else'
      'begin'
      '  update L_AddressPostKOATUUOfPepsico'
      '   set KOATUU_ID_CODE = :KOATUU_ID_CODE'
      '  where PostNo = :PostNo'
      '    and AddressNo = :AddressNo '
      'end'
      ''
      'if (@SalesChannelsOfPepsico = 0)'
      'begin'
      '  if (len(:Code) > 1)'
      '   begin'
      '     insert into L_AddressPostSalesChannelsOfPepsico'
      '      (PostNo,AddressNo,Code)'
      '     values'
      '      (:PostNo,:AddressNo,:Code)'
      '   end'
      'end'
      'else'
      'begin'
      '  update L_AddressPostSalesChannelsOfPepsico'
      '   set Code = :Code'
      '  where PostNo = :PostNo'
      '    and AddressNo = :AddressNo'
      'end'
      ''
      'if ((@Commerce_Network = 0) and (len(:Commerce_Network) > 1))'
      'begin'
      '  insert into L_AddressPost_CODE_Commerce_Network_Of_Pepsico'
      '      (PostNo,AddressNo,Commerce_Network)'
      '   values(:PostNo,:AddressNo,:Commerce_Network) '
      'end'
      'else'
      'begin'
      '  update L_AddressPost_CODE_Commerce_Network_Of_Pepsico'
      '   set Commerce_Network = :Commerce_Network'
      '  where PostNo = :PostNo'
      '    and AddressNo = :AddressNo'
      'end;'
      ''
      '/*'
      ''
      'update Post_mail'
      'set'
      '  PostNo = :PostNo, Topic = :Topic, Message = :Message,'
      
        '  Mail1 = :Mail1, Mail2 = :Mail2, Mail3 = :Mail3, AddressNo = :A' +
        'ddressNo'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      '*/')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '    @PostNo smallint'
      '   ,@DateDeperture smalldatetime '
      '   ,@IsAllAddress int'
      ''
      ''
      'set @IsAllAddress = :IsAllAddress'
      ''
      'set @PostNo = :PostNo'
      'set @DateDeperture = :DateDeperture'
      ''
      'select ap.ID '
      '      ,ap.PostNo '
      '      ,ap.AddressNo '
      '      ,ap.Address '
      '      ,ap.Active'
      '      ,isnull(ap.RegionNo,0) as RegionNo'
      '      ,pm.City'
      '      ,pm.Street'
      '      ,pm.HouseNo'
      '      ,ap.MarschrutNo'
      '      ,pm.Topic'
      '      ,pm.Message '
      '      ,pm.Mail1'
      '      ,pm.Mail2'
      '      ,pm.Mail3'
      
        '      ,(select cfa.Car from CarForAdressPost cfa where cfa.Addre' +
        'ssNo = ap.AddressNo and cfa.PostNo = ap.PostNo and DateDeparture' +
        ' = @DateDeperture) as Car'
      
        '      ,(select cfa.Driver from CarForAdressPost cfa where cfa.Ad' +
        'dressNo = ap.AddressNo and cfa.PostNo = ap.PostNo and DateDepart' +
        'ure = @DateDeperture) as Driver'
      
        '      ,(select cfa.DateDeparture from CarForAdressPost cfa where' +
        ' cfa.AddressNo = ap.AddressNo and cfa.PostNo = ap.PostNo and Dat' +
        'eDeparture = @DateDeperture) as DateDeparture'
      '      ,cap.Degrees'
      '      ,cap.Mminutes'
      '      ,cap.Seconds'
      '      ,cap.Coordinates'
      '      ,cap.X'
      '      ,cap.Y '
      
        '      ,(select CategoryTTName from D_CategoryTT where CategoryTT' +
        'No = lcap.CategoryId) as CategoryName'
      '      ,lapp.TimeBeg'
      '      ,lapp.TimeEnd'
      '      ,lapp.Unloading'
      '      ,ac.AddressPost'
      '      ,ac.AddressNoPost'
      
        '      ,(select ClassifierName from ClassifierABCDZ where Classif' +
        'ierNo = lapc.ClassifierNo) as ClassifierName'
      '      ,lapkop.KOATUU_ID_CODE'
      '      ,lapscop.Code'
      '      ,lapccnop.Commerce_Network'
      '      ,SpecialDelivery'
      '      ,QuantityDelivery'
      '      ,Refrezherator'
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
        'No'
      '  where ap.PostNo = isnull(@PostNo,ap.PostNo)'
      '    and (ap.Active = 1 or @IsAllAddress = 1)'
      ''
      'order by ap.AddressNo'
      ''
      ''
      '/*'
      'select ap.ID '
      '      ,ap.PostNo '
      '      ,ap.AddressNo '
      '      ,ap.Address '
      '      ,ap.RegionNo'
      '      ,pm.City'
      '      ,pm.Street'
      '      ,pm.HouseNo'
      '      ,ap.MarschrutNo'
      '      ,pm.Topic'
      '      ,pm.Message '
      '      ,pm.Mail1'
      '      ,pm.Mail2'
      '      ,pm.Mail3'
      '      ,cfa.Car'
      '      ,cfa.Driver'
      '      ,cfa.DateDeparture'
      '      ,cap.Degrees'
      '      ,cap.Mminutes'
      '      ,cap.Seconds'
      '      ,cap.Coordinates'
      '      ,cap.X'
      '      ,cap.Y '
      
        '      ,(select CategoryTTName from D_CategoryTT where CategoryTT' +
        'No = lcap.CategoryId) as CategoryName'
      '      ,lapp.TimeBeg'
      '      ,lapp.TimeEnd'
      '      ,lapp.Unloading'
      '      ,ac.AddressPost'
      '      ,ac.AddressNoPost'
      ' from AddressPost ap left join '
      
        '      Post_Mail pm on ap.AddressNo = pm.AddressNo and ap.PostNo ' +
        '= pm.PostNo left join'
      
        '      CarForAdressPost cfa on cfa.AddressNo = ap.AddressNo and c' +
        'fa.PostNo = ap.PostNo left join'
      
        '      CoordinatesAddressPost cap on cap.PostNo = ap.PostNo and c' +
        'ap.AddressNo = ap.AddressNo left join'
      
        '      L_CategoryAddressPost lcap on lcap.PostNo = ap.PostNo and ' +
        'lcap.AddressNo = ap.AddressNo left join'
      
        '      L_AddressPostProp lapp on lapp.PostNo = ap.PostNo and lapp' +
        '.AddressNo = ap.AddressNo left join'
      
        '      AddressCorrespondence ac on ac.PostNo = ap.PostNo and ac.A' +
        'ddressNo = ap.AddressNo'
      '  where ap.PostNo = isnull(@PostNo,ap.PostNo)'
      
        '    and (cfa.DateDeparture = isnull(@DateDeperture,cfa.DateDepar' +
        'ture) or (cfa.Car is null and cfa.Driver is null))'
      'order by ap.AddressNo'
      '        ,cfa.DateDeparture '
      '*/        '
      '/*'
      'select ap.ID '
      '      ,ap.PostNo '
      '      ,ap.AddressNo '
      '      ,ap.Address '
      '      ,ap.RegionNo'
      '      ,ap.MarschrutNo'
      '      ,pm.Topic'
      '      ,pm.Message '
      '      ,pm.Mail1'
      '      ,pm.Mail2'
      '      ,pm.Mail3'
      '      ,cfa.Car'
      '      ,cfa.Driver'
      '      ,cfa.DateDeparture'
      ' from AddressPost ap left join '
      
        '      Post_Mail pm on ap.AddressNo = pm.AddressNo and ap.PostNo ' +
        '= pm.PostNo left join'
      
        '      CarForAdressPost cfa on cfa.AddressNo = ap.AddressNo and c' +
        'fa.PostNo = ap.PostNo'
      '  where ap.PostNo = :PostNo'
      '    and cfa.DateDeparture = :DateDeparture'
      '*/'
      '/*'
      'SELECT     ID,PostNo, AddressNo, Address, RegionNo, MarschrutNo'
      'FROM         AddressPost'
      'where AddressPost.PostNo= :PostNo'
      '*/')
    FetchRows = 1
    BeforeOpen = quAddressPostBeforeOpen
    BeforePost = quAddressPostBeforePost
    Left = 32
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IsAllAddress'
      end
      item
        DataType = ftInteger
        Name = 'PostNo'
        ParamType = ptInputOutput
      end
      item
        DataType = ftDateTime
        Name = 'DateDeperture'
      end>
    object quAddressPostID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Origin = 'AddressPost.ID'
      ReadOnly = True
    end
    object quAddressPostPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'AddressPost.PostNo'
    end
    object quAddressPostAddressNo: TSmallintField
      FieldName = 'AddressNo'
      Origin = 'AddressPost.AddressNo'
    end
    object quAddressPostAddress: TStringField
      FieldName = 'Address'
      Origin = 'AddressPost.Address'
      Size = 256
    end
    object quAddressPostRegionNo: TWordField
      FieldName = 'RegionNo'
      Origin = 'AddressPost.RegionNo'
    end
    object quAddressPostMarschrutNo: TSmallintField
      FieldName = 'MarschrutNo'
      Origin = 'AddressPost.MarschrutNo'
    end
    object quAddressPostRegionName: TStringField
      FieldKind = fkLookup
      FieldName = 'RegionName'
      LookupDataSet = quRegion
      LookupKeyFields = 'RegionNo'
      LookupResultField = 'RegionName'
      KeyFields = 'RegionNo'
      Lookup = True
    end
    object quAddressPostMail1: TStringField
      FieldName = 'Mail1'
      Origin = 'Post_Mail.Mail1'
      Size = 50
    end
    object quAddressPostMail2: TStringField
      FieldName = 'Mail2'
      Origin = 'Post_Mail.Mail2'
      Size = 50
    end
    object quAddressPostMail3: TStringField
      FieldName = 'Mail3'
      Origin = 'Post_Mail.Mail3'
      Size = 50
    end
    object quAddressPostTopic: TStringField
      FieldName = 'Topic'
      Origin = 'Post_Mail.Topic'
      Size = 85
    end
    object quAddressPostMessage: TStringField
      FieldName = 'Message'
      Origin = 'Post_Mail.Message'
      Size = 256
    end
    object quAddressPostCar: TStringField
      FieldName = 'Car'
      Origin = '.'
      FixedChar = True
      Size = 50
    end
    object quAddressPostDriver: TStringField
      FieldName = 'Driver'
      Origin = '.'
      FixedChar = True
      Size = 50
    end
    object quAddressPostDateDeparture: TDateTimeField
      FieldName = 'DateDeparture'
      Origin = '.'
    end
    object quAddressPostCity: TStringField
      FieldName = 'City'
      Origin = 'Post_Mail.City'
    end
    object quAddressPostStreet: TStringField
      FieldName = 'Street'
      Origin = 'Post_Mail.Street'
      Size = 126
    end
    object quAddressPostHouseNo: TStringField
      FieldName = 'HouseNo'
      Origin = 'Post_Mail.HouseNo'
      Size = 10
    end
    object quAddressPostDegrees: TStringField
      FieldName = 'Degrees'
      Origin = 'CoordinatesAddressPost.Degrees'
      Size = 3
    end
    object quAddressPostMminutes: TStringField
      FieldName = 'Mminutes'
      Origin = 'CoordinatesAddressPost.Mminutes'
      Size = 5
    end
    object quAddressPostSeconds: TStringField
      FieldName = 'Seconds'
      Origin = 'CoordinatesAddressPost.Seconds'
      Size = 5
    end
    object quAddressPostCoordinates: TBlobField
      FieldName = 'Coordinates'
      Origin = 'CoordinatesAddressPost.Coordinates'
    end
    object quAddressPostX: TStringField
      FieldName = 'X'
      Origin = 'CoordinatesAddressPost.X'
    end
    object quAddressPostY: TStringField
      FieldName = 'Y'
      Origin = 'CoordinatesAddressPost.Y'
    end
    object quAddressPostCategoryName: TStringField
      FieldName = 'CategoryName'
      LookupDataSet = dmDataModule.quCategoryTT
      LookupKeyFields = 'Id'
      LookupCache = True
      Origin = '.'
      ReadOnly = True
      Size = 50
    end
    object quAddressPostUnloading: TIntegerField
      FieldName = 'Unloading'
      Origin = 'L_AddressPostProp.Unloading'
    end
    object quAddressPostAddressPost: TStringField
      FieldName = 'AddressPost'
      Origin = 'AddressCorrespondence.AddressPost'
      Size = 1024
    end
    object quAddressPostAddressNoPost: TIntegerField
      FieldName = 'AddressNoPost'
      Origin = 'AddressCorrespondence.AddressNoPost'
    end
    object quAddressPostTimeBeg: TWideStringField
      FieldName = 'TimeBeg'
      Origin = 'L_AddressPostProp.TimeBeg'
      Size = 16
    end
    object quAddressPostTimeEnd: TWideStringField
      FieldName = 'TimeEnd'
      Origin = 'L_AddressPostProp.TimeEnd'
      FixedChar = True
      Size = 16
    end
    object quAddressPostClassifierName: TStringField
      FieldName = 'ClassifierName'
      Size = 50
    end
    object quAddressPostActive: TBooleanField
      FieldName = 'Active'
    end
    object quAddressPostKOATUU_ID_CODE: TStringField
      FieldName = 'KOATUU_ID_CODE'
      FixedChar = True
      Size = 12
    end
    object quAddressPostCode: TIntegerField
      FieldName = 'Code'
    end
    object quAddressPostCommerce_Network: TStringField
      FieldName = 'Commerce_Network'
      FixedChar = True
      Size = 12
    end
    object quAddressPostSpecialDelivery: TBooleanField
      FieldName = 'SpecialDelivery'
    end
    object quAddressPostQuantityDelivery: TFloatField
      FieldName = 'QuantityDelivery'
    end
    object quAddressPostRefrezherator: TBooleanField
      FieldName = 'Refrezherator'
    end
  end
  object quRegion: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from Regions')
    Left = 128
    Top = 304
  end
  object Tsotrud_address: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO d_sotrud_address'
      
        '  (AddressPost_id, SotrudNo, Active, DateBegOnActive, DateEndOnA' +
        'ctive)'
      'VALUES'
      '  (:AddressPost_id, :SotrudNo, 1, getdate(), null)'
      'SET :id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'UPDATE d_sotrud_address'
      'SET'
      
        '  AddressPost_id = :AddressPost_id, SotrudNo = :SotrudNo, Active' +
        ' = 0, DateBegOnActive = :DateBegOnActive, DateEndOnActive = getd' +
        'ate()'
      'WHERE'
      '  id = :Old_id'
      '/*'
      'update d_sotrud_address'
      ' set Active = 0'
      'WHERE  id = :Old_id'
      '*/'
      '/*'
      'DELETE FROM d_sotrud_address'
      'WHERE'
      '  id = :Old_id'
      '*/')
    SQLUpdate.Strings = (
      'declare'
      '    @Active  int'
      '  , @MaxId  int'
      ''
      
        'select @MaxId = max(id) from d_sotrud_address where AddressPost_' +
        'id = :AddressPost_id and SotrudNo = :SotrudNo'
      ''
      'select @Active = Active from d_sotrud_address where id = @MaxId'
      ''
      'if @Active is null set @Active = 0'
      ''
      'if @MaxId is not null '
      ' begin'
      ''
      '   if @Active = 1 '
      '    UPDATE d_sotrud_address'
      '     SET AddressPost_id = :AddressPost_id'
      '       , SotrudNo = :SotrudNo'
      '       , Active = 0'
      '       , DateBegOnActive = :DateBegOnActive'
      '       , DateEndOnActive = getdate()'
      '     WHERE id = :Old_id'
      ''
      '    if @Active = 0'
      '     UPDATE d_sotrud_address'
      '      SET AddressPost_id = :AddressPost_id'
      '        , SotrudNo = :SotrudNo'
      '        , Active = 1'
      '        , DateBegOnActive = getdate()'
      '        , DateEndOnActive = null'
      '     WHERE id = :Old_id'
      ' end'
      'else'
      ' begin'
      
        '   INSERT INTO d_sotrud_address  (AddressPost_id, SotrudNo, Acti' +
        've, DateBegOnActive, DateEndOnActive)'
      '    VALUES (:AddressPost_id, :SotrudNo, 1, getdate(), null)'
      '   SET :id = SCOPE_IDENTITY()'
      ' end '
      ''
      ''
      '/*'
      'declare'
      '    @Active  int'
      '  , @MaxId  int'
      ''
      
        'select @MaxId = max(id) from d_sotrud_address where AddressPost_' +
        'id = :AddressPost_id and SotrudNo = :SotrudNo'
      ''
      'select @Active = Active from d_sotrud_address where id = @MaxId'
      ''
      ''
      'if @Active = 1 '
      'UPDATE d_sotrud_address'
      'SET'
      
        '  AddressPost_id = :AddressPost_id, SotrudNo = :SotrudNo, Active' +
        ' = 0, DateBegOnActive = :DateBegOnActive, DateEndOnActive = getd' +
        'ate()'
      'WHERE'
      '  id = :Old_id'
      ''
      'if @Active = 0'
      'INSERT INTO d_sotrud_address'
      
        '  (AddressPost_id, SotrudNo, Active, DateBegOnActive, DateEndOnA' +
        'ctive)'
      'VALUES'
      '  (:AddressPost_id, :SotrudNo, 1, getdate(), null)'
      'SET :id = SCOPE_IDENTITY()'
      '*/')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '   @IsAllSotrud int'
      '   '
      'set @IsAllSotrud = :IsAllSotrud'
      ''
      'select * '
      ' from d_sotrud_address'
      '  where ((active = 1) or @IsAllSotrud = 1)')
    FetchRows = 1
    BeforeOpen = Tsotrud_addressBeforeOpen
    AfterPost = Tsotrud_addressAfterPost
    MasterSource = dsAddressPost
    MasterFields = 'ID'
    DetailFields = 'AddressPost_id'
    Left = 536
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IsAllSotrud'
      end
      item
        DataType = ftInteger
        Name = 'ID'
      end>
    object Tsotrud_addressid: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id'
      Origin = 'd_sotrud_address.id'
      ReadOnly = True
    end
    object Tsotrud_addressAddressPost_id: TIntegerField
      FieldName = 'AddressPost_id'
      Origin = 'd_sotrud_address.AddressPost_id'
    end
    object Tsotrud_addressSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
      Origin = 'd_sotrud_address.SotrudNo'
    end
    object Tsotrud_addressSotrudName: TStringField
      FieldKind = fkLookup
      FieldName = 'Sotrud'
      LookupDataSet = dmDataModule.quSotrud
      LookupKeyFields = 'SotrudNo'
      LookupResultField = 'SotrudName'
      KeyFields = 'SotrudNo'
      Size = 200
      Lookup = True
    end
    object Tsotrud_addressOtdelName: TStringField
      FieldKind = fkLookup
      FieldName = 'OtdelName'
      LookupDataSet = dmDataModule.quSotrud
      LookupKeyFields = 'SotrudNo'
      LookupResultField = 'OtdelName'
      KeyFields = 'SotrudNo'
      Size = 200
      Lookup = True
    end
    object Tsotrud_addressActive: TBooleanField
      DisplayLabel = 'V'
      FieldName = 'Active'
    end
    object Tsotrud_addressDateBegOnActive: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '
      FieldName = 'DateBegOnActive'
    end
    object Tsotrud_addressDateEndOnActive: TDateTimeField
      DisplayLabel = #1054#1082#1086#1085#1095#1072#1085#1080#1077
      FieldName = 'DateEndOnActive'
    end
  end
  object quTrash: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_trash')
    FetchRows = 1
    Left = 306
    Top = 298
  end
  object dsTrash: TDataSource
    DataSet = quTrash
    Left = 344
    Top = 296
  end
  object quTTN_Record: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @ID dtPkey'
      ''
      'select @ID=isnull(max(ID),0)+1 from TTN_Record'
      'set :id = @ID'
      ''
      ''
      'INSERT INTO TTN_Record'
      '  (ID, PostNo, Driver, Cars, Check1)'
      'VALUES'
      '  (@ID, :PostNo, :Driver, :Cars, :Check1)'
      'SET :Old_ID = ident_current('#39'TTN_Record'#39')'
      'end')
    SQLDelete.Strings = (
      'DELETE FROM TTN_Record'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE TTN_Record'
      'SET'
      
        '  ID = :ID, PostNo = :PostNo, Driver = :Driver, Cars = :Cars, Ch' +
        'eck1 = :Check1'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT TTN_Record.ID, TTN_Record.PostNo, TTN_Record.Driver, TTN_' +
        'Record.Cars, TTN_Record.Check1 FROM TTN_Record'
      'WHERE'
      '  ID = :ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from TTN_Record where PostNo = :p_PostNo')
    BeforePost = quTTN_RecordBeforePost
    Left = 585
    Top = 389
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
      end>
    object quTTN_RecordPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quTTN_RecordDriver: TStringField
      FieldName = 'Driver'
      Size = 64
    end
    object quTTN_RecordCars: TStringField
      FieldName = 'Cars'
      Size = 64
    end
    object quTTN_RecordCheck1: TBooleanField
      FieldName = 'Check1'
    end
    object quTTN_RecordID: TIntegerField
      FieldName = 'ID'
    end
  end
  object dsTTN_Record: TDataSource
    DataSet = quTTN_Record
    Left = 617
    Top = 389
  end
  object ds_Storekeeper: TDataSource
    DataSet = qu_Storekeeper
    Left = 433
    Top = 493
  end
  object qu_Storekeeper: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @ID dtPkey'
      ''
      'select @ID=isnull(max(ID),0)+1 from Storekeeper_List'
      'set :id = @ID'
      ''
      ''
      'INSERT INTO Storekeeper_List'
      '  (ID, PostNo, Storekeeper, Check1)'
      'VALUES'
      '  (@ID, :PostNo, :Storekeeper, :Check1)'
      'SET :Old_ID = ident_current('#39'Storekeeper_List'#39')'
      'end')
    SQLDelete.Strings = (
      'DELETE FROM Storekeeper_List'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE Storekeeper_List'
      'SET'
      
        '  ID = :ID, PostNo = :PostNo, Storekeeper = :Storekeeper, Check1' +
        ' = :Check1'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      'SELECT Storekeeper_List.ID, '
      '       Storekeeper_List.PostNo, '
      '       Storekeeper_List.Storekeeper, '
      '       Storekeeper_List.Check1 '
      ' FROM Storekeeper_List'
      '  WHERE ID = :ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * From Storekeeper_List where PostNo = :p_PostNo')
    BeforePost = qu_Storekeeper_ListBefrePost
    Left = 401
    Top = 493
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
      end>
    object qu_StorekeeperID: TIntegerField
      FieldName = 'ID'
      Origin = 'Storekeeper_List.ID'
    end
    object qu_StorekeeperPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'Storekeeper_List.PostNo'
    end
    object qu_StorekeeperStorekeeper: TStringField
      FieldName = 'Storekeeper'
      Origin = 'Storekeeper_List.Storekeeper'
      Size = 64
    end
    object qu_StorekeeperCheck1: TBooleanField
      FieldName = 'Check1'
      Origin = 'Storekeeper_List.Check1'
    end
  end
  object ds_Post_Ban: TDataSource
    DataSet = qu_Post_Ban
    Left = 345
    Top = 104
  end
  object qu_Post_Ban: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO Post_Ban_Return'
      '  (PostNo, Description, Check1)'
      'VALUES'
      '  (:PostNo, :Description, :Check1)'
      'SET :ID = SCOPE_IDENTITY()'
      ''
      '/*'
      'Begin'
      'declare @ID int'
      ''
      'select @ID=isnull(max(ID),0)+1 from Post_Ban_Return'
      'set :id = @ID'
      ''
      'INSERT INTO Post_Ban_Return'
      '  (id, PostNo, Description, Check1)'
      'VALUES'
      '  (:id, :PostNo, :Description, :Check1)'
      ''
      'SET :Old_ID = ident_current('#39'Post_Ban_Return'#39')'
      'end'
      '*/')
    SQLDelete.Strings = (
      'DELETE FROM Post_Ban_Return'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE Post_Ban_Return'
      'SET'
      
        '   PostNo = :PostNo, Description = :Description, Check1 = :Check' +
        '1'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      'SELECT Post_Ban_Return.id, '
      '       Post_Ban_Return.PostNo, '
      '       Post_Ban_Return.Description, '
      '       Post_Ban_Return.Check1 '
      ' FROM Post_Ban_Return'
      '  WHERE id = :id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * From Post_Ban_Return where PostNo = :p_PostNo')
    BeforePost = qu_Post_BanBeforePost
    Left = 313
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
      end>
    object qu_Post_Banid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object qu_Post_BanPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qu_Post_BanDescription: TStringField
      FieldName = 'Description'
      Size = 85
    end
    object qu_Post_BanCheck1: TBooleanField
      FieldName = 'Check1'
    end
  end
  object qu_Post_Mail: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO Post_Mail'
      '  (PostNo, Topic, Message, Mail1, Mail2, Mail3, AddressNo)'
      'VALUES'
      
        '  (:PostNo, :Topic, :Message, :Mail1, :Mail2, :Mail3, :AddressNo' +
        ')'
      'SET :ID = SCOPE_IDENTITY()'
      ''
      '/*'
      'Begin'
      'declare @ID dtPkey'
      ''
      'select @ID=isnull(max(ID),0)+1 from Post_Mail'
      'set :id = @ID'
      ''
      'end'
      'INSERT INTO Post_Mail'
      '  (id, PostNo, Topic, Message, Mail1, Mail2, Mail3)'
      'VALUES'
      '  (:id, :PostNo, :Topic, :Message, :Mail1, :Mail2, :Mail3)'
      ''
      'SET :Old_ID = ident_current('#39'Post_Mail'#39')'
      ''
      'End'
      '*/')
    SQLDelete.Strings = (
      'DELETE FROM Post_Mail'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE Post_Mail'
      'SET'
      
        '  PostNo = :PostNo, Topic = :Topic, Message = :Message, Mail1 = ' +
        ':Mail1, Mail2 = :Mail2, Mail3 = :Mail3, AddressNo = :AddressNo'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      'SELECT Post_Mail.id, '
      '       Post_Mail.PostNo, '
      '       Post_Mail.Topic, '
      '       Post_Mail.Message, '
      '       Post_Mail.Mail1, '
      '       Post_Mail.Mail2, '
      '       Post_Mail.Mail3,'
      '       Post_Mail.AddressNo '
      ' FROM Post_Mail'
      '  WHERE id = :id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * '
      ' From Post_Mail '
      '  where PostNo = :p_PostNo'
      '    and AddressNo = Isnull(:AddressNo,AddressNo)')
    BeforePost = qu_Post_MailBeforePost
    AfterPost = qu_Post_MailAfterPost
    MasterSource = dsAddressPost
    Left = 405
    Top = 554
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
      end
      item
        DataType = ftInteger
        Name = 'AddressNo'
      end>
    object qu_Post_Mailid: TIntegerField
      FieldName = 'id'
    end
    object qu_Post_MailPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qu_Post_MailTopic: TStringField
      FieldName = 'Topic'
      Size = 1
    end
    object qu_Post_MailMessage: TStringField
      FieldName = 'Message'
      Size = 1
    end
    object qu_Post_MailMail1: TStringField
      FieldName = 'Mail1'
      Size = 1
    end
    object qu_Post_MailMail2: TStringField
      FieldName = 'Mail2'
      Size = 1
    end
    object qu_Post_MailMail3: TStringField
      FieldName = 'Mail3'
      Size = 1
    end
    object qu_Post_MailAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
  end
  object ds_Post_Mail: TDataSource
    DataSet = qu_Post_Mail
    Left = 433
    Top = 554
  end
  object qu_AddressPostForMail: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select PostNo'
      '      ,AddressNo '
      '      ,Address   '
      ' from AddressPost'
      '  where PostNO = Isnull( :PostNo, PostNo)'
      '    and AddressNo = Isnull( :AddressNo, AddressNo)'
      'order by PostNo'
      '        ,AddressNo')
    Left = 406
    Top = 589
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftInteger
        Name = 'AddressNo'
      end>
    object qu_AddressPostForMailPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qu_AddressPostForMailAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object qu_AddressPostForMailAddress: TStringField
      FieldName = 'Address'
      Size = 256
    end
  end
  object ds_AddressPostForMail: TDataSource
    DataSet = qu_AddressPostForMail
    Left = 438
    Top = 589
  end
  object dsPostBanPay: TDataSource
    DataSet = quPostBanPay
    Left = 790
    Top = 13
  end
  object quPostBanPay: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO L_Post_Set_ArtGroup_PayBan'
      '  (PostNo_PayBan, SET_ARTICLE_GROUP_ID_PayBan, Buh, PayBan)'
      'VALUES'
      '  (:PostNo_PayBan, :SET_ARTICLE_GROUP_ID_PayBan, :Buh, :PayBan)'
      'SET :id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM L_Post_Set_ArtGroup_PayBan'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE L_Post_Set_ArtGroup_PayBan'
      'SET'
      '  PostNo_PayBan = :PostNo_PayBan, '
      '  SET_ARTICLE_GROUP_ID_PayBan = :SET_ARTICLE_GROUP_ID_PayBan,'
      '  Buh = :Buh,  '
      '  PayBan = :PayBan'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      
        'SELECT L_Post_Set_ArtGroup_PayBan.PostNo_PayBan, L_Post_Set_ArtG' +
        'roup_PayBan.SET_ARTICLE_GROUP_ID_PayBan, L_Post_Set_ArtGroup_Pay' +
        'Ban.PayBan FROM L_Post_Set_ArtGroup_PayBan'
      'WHERE'
      '  id = :id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select lp.id,'
      '       ds.id as id1,'
      '       ds.id+lp.buh as id2,'
      '       ds.name,'
      '       lp.SET_ARTICLE_GROUP_ID_PayBan,'
      '       lp.PostNo_PayBan,'
      '       lp.Buh, '
      '       lp.PayBan,'
      '       ds.name +'#39' ('#39'+ (select Buh_type_name '
      '                        from d_buh_type bt'
      '                         where bt.Buh = lp.Buh)+'#39')'#39' NameFull'
      ' from L_Post_Set_ArtGroup_PayBan lp inner join'
      
        '      D_SET_ARTICLE_GROUP ds on ds.ID = lp.SET_ARTICLE_GROUP_ID_' +
        'PayBan'
      '  where lp.PostNo_PayBan = isNull(:p_PostNo,lp.PostNo_PayBan)'
      '    and ds.active = '#39'Y'#39
      
        '    and lp.Set_Article_Group_Id_PayBan = isNull(:Set_Article_Gro' +
        'up_Id_PayBan,lp.Set_Article_Group_Id_PayBan)'
      '--    and lp.Buh = isNull(:Buh,lp.Buh)')
    BeforePost = quPostBanPayBeforePost
    Left = 814
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'Set_Article_Group_Id_PayBan'
        ParamType = ptInput
      end>
    object quPostBanPayid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object quPostBanPayid1: TLargeintField
      FieldName = 'id1'
    end
    object quPostBanPayname: TStringField
      FieldName = 'name'
      Size = 512
    end
    object quPostBanPaySET_ARTICLE_GROUP_ID_PayBan: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID_PayBan'
    end
    object quPostBanPayPostNo_PayBan: TSmallintField
      FieldName = 'PostNo_PayBan'
    end
    object quPostBanPayPayBan: TIntegerField
      FieldName = 'PayBan'
    end
    object quPostBanPayBuh: TLargeintField
      FieldName = 'Buh'
    end
    object quPostBanPayNameFull: TStringField
      FieldName = 'NameFull'
      ReadOnly = True
      Size = 532
    end
    object quPostBanPayid2: TLargeintField
      FieldName = 'id2'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    Left = 622
    Top = 461
  end
  object qu_Shipper: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @ID dtPkey'
      ''
      'select @ID=isnull(max(ID),0)+1 from Shipper_List'
      'set :id = @ID'
      ''
      ''
      'INSERT INTO Shipper_List'
      '  (ID, PostNo, Shipper, ShipperOKPO, Check1)'
      'VALUES'
      '  (@ID, :PostNo, :Shipper, :ShipperOKPO, :Check1)'
      'SET :Old_ID = ident_current('#39'Shipper_List'#39')'
      'end')
    SQLDelete.Strings = (
      'DELETE FROM Shipper_List'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE Shipper_List'
      'SET'
      '    ID = :ID'
      '  , PostNo = :PostNo'
      '  , Shipper = :Shipper'
      '  , ShipperOKPO = :ShipperOKPO'
      '  , Check1 = :Check1'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      'SELECT Shipper_List.ID, '
      '       Shipper_List.PostNo, '
      '       Shipper_List.Shipper,'
      '       Shipper_List.ShipperOKPO, '
      '       Shipper_List.Check1 '
      ' FROM Shipper_List'
      '  WHERE ID = :ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select  isnull (ID,0) as Id'
      '      , isnull (PostNo,0) as PostNo'
      '      , isnull (Shipper,'#39#39') as Shipper'
      '      , isnull (ShipperOKPO,'#39#39') as ShipperOKPO'
      '      , isnull (Check1,0) as Check1'
      ' From Shipper_List '
      '  where PostNo = isnull(:p_PostNo, PostNo)')
    BeforePost = qu_ShipperBeforePost
    Left = 401
    Top = 520
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
      end>
    object qu_ShipperId: TIntegerField
      FieldName = 'Id'
    end
    object qu_ShipperPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qu_ShipperShipper: TStringField
      FieldName = 'Shipper'
      Size = 64
    end
    object qu_ShipperShipperOKPO: TStringField
      FieldName = 'ShipperOKPO'
      Size = 10
    end
    object qu_ShipperCheck1: TBooleanField
      FieldName = 'Check1'
    end
  end
  object ds_Shipper: TDataSource
    DataSet = qu_Shipper
    Left = 433
    Top = 520
  end
  object qu_Customer: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @ID dtPkey'
      ''
      'select @ID=isnull(max(ID),0)+1 from Customer_List'
      'set :id = @ID'
      ''
      ''
      'INSERT INTO Customer_List'
      '  (ID, PostNo, Customer, CustomerOKPO, Check1)'
      'VALUES'
      '  (@ID, :PostNo, :Customer, :CustomerOKPO, :Check1)'
      'SET :Old_ID = ident_current('#39'Customer_List'#39')'
      'end')
    SQLDelete.Strings = (
      'DELETE FROM Customer_List'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE Customer_List'
      'SET'
      '    ID = :ID'
      '  , PostNo = :PostNo'
      '  , Customer = :Customer'
      '  , CustomerOKPO = :CustomerOKPO'
      '  , Check1 = :Check1'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      'SELECT Customer_List.ID, '
      '       Customer_List.PostNo, '
      '       Customer_List.Shipper,'
      '       Customer_List.ShipperOKPO, '
      '       Customer_List.Check1 '
      ' FROM Customer_List'
      '  WHERE ID = :ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select  isnull (ID,0) as Id'
      '      , isnull (PostNo,0) as PostNo'
      '      , isnull (Customer,'#39#39') as Customer'
      '      , isnull (CustomerOKPO,'#39#39') as CustomerOKPO'
      '      , isnull (Check1,0) as Check1'
      ' From Customer_List '
      '  where PostNo = isnull(:p_PostNo, PostNo)')
    BeforePost = qu_CustomerBeforePost
    Left = 401
    Top = 622
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
      end>
    object qu_CustomerId: TIntegerField
      FieldName = 'Id'
    end
    object qu_CustomerPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qu_CustomerCustomer: TStringField
      FieldName = 'Customer'
      Size = 64
    end
    object qu_CustomerCustomerOKPO: TStringField
      FieldName = 'CustomerOKPO'
      Size = 10
    end
    object qu_CustomerCheck1: TBooleanField
      FieldName = 'Check1'
    end
  end
  object ds_Customer: TDataSource
    DataSet = qu_Customer
    Left = 433
    Top = 622
  end
  object qu_Confidant: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @ID dtPkey'
      ''
      'select @ID=isnull(max(ID),0)+1 from Confidant_List'
      'set :id = @ID'
      ''
      ''
      'INSERT INTO Confidant_List'
      '  (ID, PostNo, Confidant, Check1)'
      'VALUES'
      '  (@ID, :PostNo, :Confidant, :Check1)'
      'SET :Old_ID = ident_current('#39'Confidant_List'#39')'
      'end')
    SQLDelete.Strings = (
      'DELETE FROM Confidant_List'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE Confidant_List'
      'SET'
      
        '  ID = :ID, PostNo = :PostNo, Confidant = :Confidant, Check1 = :' +
        'Check1'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      'SELECT Confidant_List.ID, '
      '       Confidant_List.PostNo, '
      '       Confidant_List.Confidant, '
      '       Confidant_List.Check1 '
      ' FROM Confidant_List'
      '  WHERE ID = :ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * From Confidant_List where PostNo = :p_PostNo')
    BeforePost = qu_ConfidantBeforePost
    Left = 353
    Top = 164
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
      end>
    object qu_ConfidantID: TIntegerField
      FieldName = 'ID'
    end
    object qu_ConfidantPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qu_ConfidantConfidant: TStringField
      FieldName = 'Confidant'
      Size = 64
    end
    object qu_ConfidantCheck1: TBooleanField
      FieldName = 'Check1'
    end
    object qu_ConfidantConfidantOKPO: TStringField
      FieldName = 'ConfidantOKPO'
      Size = 10
    end
  end
  object ds_Confidant: TDataSource
    DataSet = qu_Confidant
    Left = 393
    Top = 172
  end
  object quDescriptionDjobSupplier: TMSQuery
    SQLInsert.Strings = (
      'insert into DescriptionDjobSupplier (PostNo,DescriptionDjob)'
      '  values (:PostNo,:DescriptionDjob)')
    SQLUpdate.Strings = (
      'declare'
      ' @cnt int'
      ''
      
        'select @cnt = count(*) from DescriptionDjobSupplier where PostNo' +
        ' = :PostNo'
      ''
      'if @cnt = 0'
      ' insert into DescriptionDjobSupplier (PostNo,DescriptionDjob)'
      '  values (:PostNo,:DescriptionDjob)'
      ''
      'if @cnt > 0'
      ' update DescriptionDjobSupplier'
      '  set DescriptionDjob = :DescriptionDjob'
      ' where PostNo = :PostNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from DescriptionDjobSupplier'
      '  where PostNo = :PostNo')
    BeforePost = quDescriptionDjobSupplierBeforePost
    Left = 425
    Top = 61
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end>
    object quDescriptionDjobSupplierId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
    object quDescriptionDjobSupplierPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quDescriptionDjobSupplierDescriptionDjob: TStringField
      FieldName = 'DescriptionDjob'
      Size = 1024
    end
  end
  object dsDescriptionDjobSupplier: TMSDataSource
    DataSet = quDescriptionDjobSupplier
    Left = 449
    Top = 61
  end
  object dsVidExportExelFile: TMSDataSource
    DataSet = quVidExportExelFile
    Left = 697
    Top = 389
  end
  object quVidExportExelFile: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '  @Cnt int'
      ''
      'select @Cnt = count(*)'
      ' from L_VidExportExelFile'
      '  where PostNo = :PostNo'
      '    and Column_Name = :Column_Name'
      ''
      'if @Cnt = 0'
      
        'insert into L_VidExportExelFile (PostNo, Column_Name, Is_Checked' +
        ', N_pp)'
      '       values (:PostNo, :Column_Name, :Is_Checked, :N_pp)')
    SQLUpdate.Strings = (
      'declare'
      '  @Cnt int'
      ''
      'select @Cnt = count(*)'
      ' from L_VidExportExelFile'
      '  where PostNo = :PostNo'
      '    and Column_Name = :Column_Name'
      ''
      'if @Cnt = 0'
      
        'insert into L_VidExportExelFile (PostNo, Column_Name, Is_Checked' +
        ', N_pp)'
      '       values (:PostNo, :Column_Name, :Is_Checked, :N_pp)'
      ''
      'if @Cnt = 1'
      'update L_VidExportExelFile'
      ' set Is_Checked = :Is_Checked'
      '    ,N_pp = :N_pp'
      'where PostNo = :PostNo'
      '  and Column_Name = :Column_Name')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  l.id'
      '       ,l.PostNo'
      '       ,i.Column_Name'
      '       ,isnull(l.Is_Checked,0) as Is_Checked'
      '       ,l.N_pp'
      
        ' from information_schema.columns /*INFORMATION_SCHEMA.COLUMNS*/ ' +
        'i left join'
      
        '      L_VidExportExelFile l on l.Column_Name = i.COLUMN_NAME and' +
        ' l.PostNo = isnull(:PostNo,l.PostNo)'
      '  where TABLE_NAME = '#39'V_NaklRPost_Export'#39)
    BeforePost = quVidExportExelFileBeforePost
    Left = 729
    Top = 389
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
    object quVidExportExelFileid: TLargeintField
      FieldName = 'id'
      ReadOnly = True
    end
    object quVidExportExelFilePostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quVidExportExelFileColumn_Name: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1083#1086#1085#1082#1080
      DisplayWidth = 50
      FieldName = 'Column_Name'
      ReadOnly = True
      Size = 128
    end
    object quVidExportExelFileIs_Checked: TBooleanField
      DisplayLabel = 'V'
      FieldName = 'Is_Checked'
    end
    object quVidExportExelFileN_pp: TSmallintField
      DisplayLabel = #8470#1087#1087
      FieldName = 'N_pp'
    end
  end
  object dsExportInExcelFile: TMSDataSource
    DataSet = quExportInExcelFile
    Left = 657
    Top = 29
  end
  object quExportInExcelFile: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '  @Cnt int'
      ''
      'select @Cnt = count(*) '
      ' from L_ExportInExcelFile '
      '  where PostNo = :PostNo'
      ''
      'if @Cnt = 0'
      
        ' insert into L_ExportInExcelFile (PostNo,Check1,CheckSeparationF' +
        'ile)'
      '  values (:PostNo,:Check1,:CheckSeparationFile)')
    SQLUpdate.Strings = (
      'declare'
      '  @Cnt int'
      ''
      'select @Cnt = count(*) '
      ' from L_ExportInExcelFile '
      '  where PostNo = :PostNo'
      ''
      'if @Cnt = 0'
      
        ' insert into L_ExportInExcelFile (PostNo,Check1,CheckSeparationF' +
        'ile)'
      '  values (:PostNo,:Check1,:CheckSeparationFile)'
      ''
      'if @Cnt = 1'
      ' update L_ExportInExcelFile'
      '  set Check1 = :Check1'
      '     ,CheckSeparationFile = :CheckSeparationFile'
      ' where PostNo = :PostNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * '
      ' from L_ExportInExcelFile'
      '  where PostNo = isnull(:PostNo,PostNo)')
    BeforePost = quExportInExcelFileBeforePost
    Left = 689
    Top = 29
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
    object quExportInExcelFilePostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quExportInExcelFileCheck1: TBooleanField
      FieldName = 'Check1'
    end
    object quExportInExcelFileCheckSeparationFile: TBooleanField
      FieldName = 'CheckSeparationFile'
    end
  end
  object quAddressPostForCheck: TMSQuery
    SQLInsert.Strings = (
      'declare '
      '    @AddressId int'
      '   ,@CategoryId int'
      '   ,@cnt int'
      '   ,@cnt1 int'
      '   ,@cnt2 int'
      ''
      
        'select @cnt2 = count(*) from AddressPost where PostNo = :PostNo ' +
        'and AddressNo = :AddressNo'
      ''
      'if @cnt2 = 0'
      'INSERT INTO AddressPost'
      '  (PostNo, AddressNo, Address, RegionNo, MarschrutNo)'
      'VALUES'
      '  (:PostNo, :AddressNo, :Address, :RegionNo, :MarschrutNo)'
      'SET :ID = SCOPE_IDENTITY()'
      'set @AddressId = :ID'
      ''
      'insert into Post_Mail'
      
        '   (PostNo,Topic,Message,Mail1,Mail2,Mail3,AddressNo,City,Street' +
        ',HouseNo)'
      'values'
      
        '   (:PostNo,:Topic,:Message,:Mail1,:Mail2,:Mail3,:AddressNo,:Cit' +
        'y,:Street,:HouseNo)'
      '-- set :id = scope_identity()'
      ''
      'if (len(:Car)+len(:Driver)>2)'
      'begin'
      '  insert into CarForAdressPost'
      '      (PostNo,AddressNo,AddressId,Car,Driver,DateDeparture)'
      '   values'
      
        '      (:PostNo,:AddressNo,@AddressId,:Car,:Driver,:DateDeparture' +
        ')'
      '--   set :id = scope_identity()'
      'end'
      ''
      
        'select @cnt = count(*) from CoordinatesAddressPost where PostNo ' +
        '= :PostNo and AddressNo = :AddressNo'
      ''
      'if @cnt = 0'
      
        'if (len(:Degrees)+len(:Mminutes)+len(:Seconds)>3) or (len(:X)+le' +
        'n(:Y) > 2)'
      'begin'
      '  insert into CoordinatesAddressPost'
      
        '      (PostNo,AddressNo,Degrees,Mminutes,Seconds,Coordinates,X,Y' +
        ')'
      '   values '
      
        '      (:PostNo,:AddressNo,:Degrees,:Mminutes,:Seconds,:Coordinat' +
        'es,:X,:Y)'
      '--   set :id = scope_identity()'
      'end'
      ''
      'if (len(:CategoryName)>0)'
      'begin'
      
        '  select @CategoryId = CategoryTTNo from D_CategoryTT where Cate' +
        'goryTTName = :CategoryName'
      '  insert into L_CategoryAddressPost'
      '      (PostNo,AddressNo,CategoryId)'
      '   values(:PostNo,:AddressNo,@CategoryId)'
      'end'
      ''
      
        'select @cnt1 = count(*) from L_AddressPostProp where PostNo = :P' +
        'ostNo and AddressNo = :AddressNo'
      ''
      'if @cnt1 = 0'
      'if (len(:TimeBeg)+len(:TimeEnd)+len(:Unloading)>3)'
      'begin'
      '  insert into L_AddressPostProp'
      '      (PostNo,AddressNo,TimeBeg,TimeEnd,Unloading)'
      '   values (:PostNo,:AddressNo,:TimeBeg,:TimeEnd,:Unloading)'
      'end'
      ''
      'if (len(:AddressPost)>0)'
      'begin'
      '  insert into AddressCorrespondence'
      '      (PostNo,AddressNo,AddressPost,AddressNoPost)'
      '   values (:PostNo,:AddressNo,:AddressPost,:AddressNoPost)'
      'end')
    SQLDelete.Strings = (
      'DELETE FROM d_sotrud_address'
      'WHERE'
      '  addressPost_id = :Old_id'
      ''
      'DELETE FROM AddressPost'
      'WHERE'
      '  PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from Post_Mail'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from CarForAdressPost'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from CoordinatesAddressPost'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from L_CategoryAddressPost'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from L_AddressPostProp'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'delete from AddressCorrespondence'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo')
    SQLUpdate.Strings = (
      'declare'
      '  @cnt  int'
      ' ,@cnt1 int'
      ' ,@cnt2 int'
      ' ,@cnt3 int'
      ' ,@cnt4 int'
      ' ,@cnt5 int'
      ' ,@cnt6 int'
      ' ,@AddressId int'
      ' ,@CategoryId int'
      
        'select @cnt = count(*) from post_mail where PostNo = :PostNo AND' +
        ' AddressNo = :AddressNo'
      
        'select @cnt1 = count(*) from CarForAdressPost where PostNo = :Po' +
        'stNo AND AddressNo = :AddressNo'
      
        'select @cnt2 = isnull(count(*),0) from CoordinatesAddressPost wh' +
        'ere PostNo = :PostNo AND AddressNo = :AddressNo'
      
        'select @cnt3 = isnull(count(*),0) from L_CategoryAddressPost whe' +
        're PostNo = :PostNo AND AddressNo = :AddressNo'
      
        'select @cnt4 = isnull(count(*),0) from L_AddressPostProp where P' +
        'ostNo = :PostNo AND AddressNo = :AddressNo'
      
        'select @cnt5 = isnull(count(*),0) from AddressCorrespondence whe' +
        're PostNo = :PostNo AND AddressNo = :AddressNo'
      
        'select @cnt5 = isnull(count(*),0) from AddressPost where PostNo ' +
        '= :PostNo AND AddressNo = :AddressNo'
      ''
      'if @cnt5 > 0'
      'begin '
      '  UPDATE AddressPost'
      
        '   SET PostNo = :PostNo, AddressNo = :AddressNo, Address = :Addr' +
        'ess, RegionNo = :RegionNo, MarschrutNo = :MarschrutNo'
      '  WHERE PostNo = :PostNo AND AddressNo = :AddressNo'
      'end'
      'else'
      'begin'
      'end'
      ''
      'if @cnt > 0 '
      'begin'
      '  update Post_mail'
      '  set'
      '    PostNo = :PostNo, Topic = :Topic, Message = :Message,'
      
        '    Mail1 = :Mail1, Mail2 = :Mail2, Mail3 = :Mail3, AddressNo = ' +
        ':AddressNo,'
      '    City = :City, Street = :Street, HouseNo = :HouseNo'
      '  where PostNo = :PostNo AND AddressNo = :AddressNo'
      'end'
      'else'
      'begin'
      
        '  insert into Post_Mail (PostNo,Topic,Message,Mail1,Mail2,Mail3,' +
        'AddressNo,City,Street,HouseNo)'
      
        '    values  (:PostNo,:Topic,:Message,:Mail1,:Mail2,:Mail3,:Addre' +
        'ssNo,:City,:Street,:HouseNo)'
      '-- set :id = scope_identity()'
      'end'
      ''
      'if @cnt1 > 0 '
      'begin'
      
        '  select @AddressId = Id from AddressPost where PostNo = :PostNo' +
        ' AND AddressNo = :AddressNo'
      '  if (len(:Car)+len(:Driver)>2)'
      '  update CarForAdressPost'
      '  set'
      
        '    PostNo = :PostNo, AddressNo = :AddressNo, Car = :Car, Driver' +
        ' = :Driver, AddressId = @AddressId, DateDeparture = :DateDepartu' +
        're'
      '  where PostNo = :PostNo AND AddressNo = :AddressNo'
      'end'
      'else'
      'begin'
      
        '  select @AddressId =  Id from AddressPost where PostNo = :Old_P' +
        'ostNo AND AddressNo = :Old_AddressNo'
      '  if (len(:Car)+len(:Driver)>2)'
      '   begin'
      '      insert into CarForAdressPost'
      '         (PostNo,AddressNo,AddressId,Car,Driver,DateDeparture)'
      '      values'
      
        '         (:PostNo,:AddressNo,@AddressId,:Car,:Driver,:DateDepart' +
        'ure)'
      '--      set :id = scope_identity()'
      '   end'
      'end'
      ''
      'if @cnt2 = 0'
      'begin'
      
        '  if (len(:Degrees)+len(:Mminutes)+len(:Seconds)>3) or (len(:X)+' +
        'len(:Y) > 2)'
      '   begin'
      '     insert into CoordinatesAddressPost'
      
        '         (PostNo,AddressNo,Degrees,Mminutes,Seconds,Coordinates,' +
        'X,Y)'
      '     values '
      
        '         (:PostNo,:AddressNo,:Degrees,:Mminutes,:Seconds,:Coordi' +
        'nates,:X,:Y)'
      '--     set :id = scope_identity()'
      '   end'
      'end'
      'else'
      'begin'
      '  update CoordinatesAddressPost'
      '   set Degrees = :Degrees'
      '      ,Mminutes = :Mminutes'
      '      ,Seconds = :Seconds'
      '      ,Coordinates = :Coordinates'
      '      ,X = :X'
      '      ,Y = :Y'
      '   where PostNo = :PostNo'
      '     and AddressNo = :AddressNo'
      'end'
      ''
      'if @cnt3 = 0'
      'begin'
      '  if (len(:CategoryName)>=1)'
      '   begin'
      
        '      select @CategoryId = CategoryTTNo from D_CategoryTT where ' +
        'CategoryTTName = :CategoryName'
      '      insert into L_CategoryAddressPost'
      '             (PostNo,AddressNo,CategoryId)'
      '       values(:PostNo,:AddressNo,@CategoryId)'
      '   end'
      'end'
      'else'
      'begin'
      
        '  select @CategoryId = CategoryTTNo from D_CategoryTT where Cate' +
        'goryTTName = :CategoryName'
      '  update L_CategoryAddressPost'
      '   set CategoryId = @CategoryId'
      '  where PostNo = :PostNo'
      '    and AddressNo = :AddressNo    '
      'end'
      ''
      'if @cnt4 = 0'
      'begin'
      '  if (len(:TimeBeg)+len(:TimeEnd)+len(:Unloading)>3)'
      '      insert into L_AddressPostProp'
      '              (PostNo,AddressNo,TimeBeg,TimeEnd,Unloading)'
      '       values (:PostNo,:AddressNo,:TimeBeg,:TimeEnd,:Unloading)'
      'end'
      'else'
      'begin'
      '  Update L_AddressPostProp'
      '   set TimeBeg = :TimeBeg'
      '      ,TimeEnd = :TimeEnd'
      '      ,Unloading = :Unloading'
      '  where PostNo = :PostNo'
      '    and AddressNo = :AddressNo'
      'end'
      ''
      'if @cnt5 = 0'
      'begin'
      '  if (len(:AddressPost)>0)'
      '      insert into AddressCorrespondence'
      '              (PostNo,AddressNo,AddressPost,AddressNoPost)'
      '       values (:PostNo,:AddressNo,:AddressPost,:AddressNoPost)'
      'end'
      'else'
      'begin'
      '  Update AddressCorrespondence'
      '   set AddressPost = :AddressPost'
      '      ,AddressNoPost = :AddressNoPost '
      '  where PostNo = :PostNo'
      '    and AddressNo = :AddressNo'
      'end'
      ''
      ''
      '/*'
      ''
      'update Post_mail'
      'set'
      '  PostNo = :PostNo, Topic = :Topic, Message = :Message,'
      
        '  Mail1 = :Mail1, Mail2 = :Mail2, Mail3 = :Mail3, AddressNo = :A' +
        'ddressNo'
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      '*/')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '    @PostNo smallint'
      '   ,@DateDeperture smalldatetime '
      '   ,@IsAllAddress int'
      '   ,@IsAllSotrud int'
      ''
      'set @IsAllAddress = :IsAllAddress'
      'set @IsAllSotrud = :IsAllSotrud'
      '   '
      'set @PostNo = :PostNo'
      'set @DateDeperture = :DateDeperture'
      ''
      'select ap.ID '
      '      ,ap.PostNo '
      '      ,ap.AddressNo '
      '      ,ap.Address'
      '      ,ap.Active '
      '      ,isnull(ap.RegionNo,0) as RegionNo'
      '      ,pm.City'
      '      ,pm.Street'
      '      ,pm.HouseNo'
      '      ,ap.MarschrutNo'
      '      ,pm.Topic'
      '      ,pm.Message '
      '      ,pm.Mail1'
      '      ,pm.Mail2'
      '      ,pm.Mail3'
      
        '      ,(select cfa.Car from CarForAdressPost cfa where cfa.Addre' +
        'ssNo = ap.AddressNo and cfa.PostNo = ap.PostNo and DateDeparture' +
        ' = @DateDeperture) as Car'
      
        '      ,(select cfa.Driver from CarForAdressPost cfa where cfa.Ad' +
        'dressNo = ap.AddressNo and cfa.PostNo = ap.PostNo and DateDepart' +
        'ure = @DateDeperture) as Driver'
      
        '      ,(select cfa.DateDeparture from CarForAdressPost cfa where' +
        ' cfa.AddressNo = ap.AddressNo and cfa.PostNo = ap.PostNo and Dat' +
        'eDeparture = @DateDeperture) as DateDeparture'
      '      ,cap.Degrees'
      '      ,cap.Mminutes'
      '      ,cap.Seconds'
      '      ,cap.Coordinates'
      '      ,cap.X'
      '      ,cap.Y '
      
        '      ,(select CategoryTTName from D_CategoryTT where CategoryTT' +
        'No = lcap.CategoryId) as CategoryName'
      '      ,lapp.TimeBeg'
      '      ,lapp.TimeEnd'
      '      ,lapp.Unloading'
      '      ,ac.AddressPost'
      '      ,ac.AddressNoPost'
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
        'ddressNo = ap.AddressNo'
      '  where ap.PostNo = isnull(@PostNo,ap.PostNo)'
      '    and (ap.Active = 1 or @IsAllAddress = 1)'
      '    and (ap.id in (select AddressPost_id '
      '                    from d_sotrud_address'
      '                     where active = 1) or @IsAllSotrud = 1)'
      'order by ap.AddressNo'
      ''
      ''
      '/*'
      'select ap.ID '
      '      ,ap.PostNo '
      '      ,ap.AddressNo '
      '      ,ap.Address '
      '      ,ap.RegionNo'
      '      ,pm.City'
      '      ,pm.Street'
      '      ,pm.HouseNo'
      '      ,ap.MarschrutNo'
      '      ,pm.Topic'
      '      ,pm.Message '
      '      ,pm.Mail1'
      '      ,pm.Mail2'
      '      ,pm.Mail3'
      '      ,cfa.Car'
      '      ,cfa.Driver'
      '      ,cfa.DateDeparture'
      '      ,cap.Degrees'
      '      ,cap.Mminutes'
      '      ,cap.Seconds'
      '      ,cap.Coordinates'
      '      ,cap.X'
      '      ,cap.Y '
      
        '      ,(select CategoryTTName from D_CategoryTT where CategoryTT' +
        'No = lcap.CategoryId) as CategoryName'
      '      ,lapp.TimeBeg'
      '      ,lapp.TimeEnd'
      '      ,lapp.Unloading'
      '      ,ac.AddressPost'
      '      ,ac.AddressNoPost'
      ' from AddressPost ap left join '
      
        '      Post_Mail pm on ap.AddressNo = pm.AddressNo and ap.PostNo ' +
        '= pm.PostNo left join'
      
        '      CarForAdressPost cfa on cfa.AddressNo = ap.AddressNo and c' +
        'fa.PostNo = ap.PostNo left join'
      
        '      CoordinatesAddressPost cap on cap.PostNo = ap.PostNo and c' +
        'ap.AddressNo = ap.AddressNo left join'
      
        '      L_CategoryAddressPost lcap on lcap.PostNo = ap.PostNo and ' +
        'lcap.AddressNo = ap.AddressNo left join'
      
        '      L_AddressPostProp lapp on lapp.PostNo = ap.PostNo and lapp' +
        '.AddressNo = ap.AddressNo left join'
      
        '      AddressCorrespondence ac on ac.PostNo = ap.PostNo and ac.A' +
        'ddressNo = ap.AddressNo'
      '  where ap.PostNo = isnull(@PostNo,ap.PostNo)'
      
        '    and (cfa.DateDeparture = isnull(@DateDeperture,cfa.DateDepar' +
        'ture) or (cfa.Car is null and cfa.Driver is null))'
      'order by ap.AddressNo'
      '        ,cfa.DateDeparture '
      '*/        '
      '/*'
      'select ap.ID '
      '      ,ap.PostNo '
      '      ,ap.AddressNo '
      '      ,ap.Address '
      '      ,ap.RegionNo'
      '      ,ap.MarschrutNo'
      '      ,pm.Topic'
      '      ,pm.Message '
      '      ,pm.Mail1'
      '      ,pm.Mail2'
      '      ,pm.Mail3'
      '      ,cfa.Car'
      '      ,cfa.Driver'
      '      ,cfa.DateDeparture'
      ' from AddressPost ap left join '
      
        '      Post_Mail pm on ap.AddressNo = pm.AddressNo and ap.PostNo ' +
        '= pm.PostNo left join'
      
        '      CarForAdressPost cfa on cfa.AddressNo = ap.AddressNo and c' +
        'fa.PostNo = ap.PostNo'
      '  where ap.PostNo = :PostNo'
      '    and cfa.DateDeparture = :DateDeparture'
      '*/'
      '/*'
      'SELECT     ID,PostNo, AddressNo, Address, RegionNo, MarschrutNo'
      'FROM         AddressPost'
      'where AddressPost.PostNo= :PostNo'
      '*/')
    FetchRows = 1
    BeforeOpen = quAddressPostForCheckBeforeOpen
    Left = 48
    Top = 330
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IsAllAddress'
      end
      item
        DataType = ftUnknown
        Name = 'IsAllSotrud'
      end
      item
        DataType = ftInteger
        Name = 'PostNo'
        ParamType = ptInputOutput
      end
      item
        DataType = ftDateTime
        Name = 'DateDeperture'
      end>
    object quAddressPostForCheckID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object quAddressPostForCheckPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quAddressPostForCheckAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object quAddressPostForCheckAddress: TStringField
      FieldName = 'Address'
      Size = 256
    end
    object quAddressPostForCheckRegionNo: TWordField
      FieldName = 'RegionNo'
    end
    object quAddressPostForCheckCity: TStringField
      FieldName = 'City'
    end
    object quAddressPostForCheckStreet: TStringField
      FieldName = 'Street'
      Size = 126
    end
    object quAddressPostForCheckHouseNo: TStringField
      FieldName = 'HouseNo'
      Size = 10
    end
    object quAddressPostForCheckMarschrutNo: TSmallintField
      FieldName = 'MarschrutNo'
    end
    object quAddressPostForCheckTopic: TStringField
      FieldName = 'Topic'
      Size = 85
    end
    object quAddressPostForCheckMessage: TStringField
      FieldName = 'Message'
      Size = 256
    end
    object quAddressPostForCheckMail1: TStringField
      FieldName = 'Mail1'
      Size = 50
    end
    object quAddressPostForCheckMail2: TStringField
      FieldName = 'Mail2'
      Size = 50
    end
    object quAddressPostForCheckMail3: TStringField
      FieldName = 'Mail3'
      Size = 50
    end
    object quAddressPostForCheckCar: TStringField
      FieldName = 'Car'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object quAddressPostForCheckDriver: TStringField
      FieldName = 'Driver'
      ReadOnly = True
      FixedChar = True
      Size = 50
    end
    object quAddressPostForCheckDateDeparture: TDateTimeField
      FieldName = 'DateDeparture'
      ReadOnly = True
    end
    object quAddressPostForCheckDegrees: TStringField
      FieldName = 'Degrees'
      Size = 3
    end
    object quAddressPostForCheckMminutes: TStringField
      FieldName = 'Mminutes'
      Size = 5
    end
    object quAddressPostForCheckSeconds: TStringField
      FieldName = 'Seconds'
      Size = 5
    end
    object quAddressPostForCheckCoordinates: TBlobField
      FieldName = 'Coordinates'
    end
    object quAddressPostForCheckX: TStringField
      FieldName = 'X'
    end
    object quAddressPostForCheckY: TStringField
      FieldName = 'Y'
    end
    object quAddressPostForCheckCategoryName: TStringField
      FieldName = 'CategoryName'
      ReadOnly = True
      Size = 50
    end
    object quAddressPostForCheckTimeBeg: TWideStringField
      FieldName = 'TimeBeg'
      Size = 16
    end
    object quAddressPostForCheckTimeEnd: TWideStringField
      FieldName = 'TimeEnd'
      Size = 16
    end
    object quAddressPostForCheckUnloading: TIntegerField
      FieldName = 'Unloading'
    end
    object quAddressPostForCheckAddressPost: TStringField
      FieldName = 'AddressPost'
      Size = 1024
    end
    object quAddressPostForCheckAddressNoPost: TIntegerField
      FieldName = 'AddressNoPost'
    end
    object quAddressPostForCheckRegionName: TStringField
      FieldKind = fkLookup
      FieldName = 'RegionName'
      LookupDataSet = quRegion
      LookupKeyFields = 'RegionName'
      LookupResultField = 'RegionName'
      KeyFields = 'RegionNo'
      Lookup = True
    end
    object quAddressPostForCheckActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object dsAddressPostForCheck: TDataSource
    DataSet = quAddressPostForCheck
    Left = 77
    Top = 330
  end
  object qu_CarCarrier: TMSQuery
    SQLInsert.Strings = (
      'Begin'
      'declare @ID dtPkey'
      ''
      'select @ID=isnull(max(ID),0)+1 from CarCarrier_List'
      'set :id = @ID'
      ''
      ''
      'INSERT INTO CarCarrier_List'
      '  (ID, PostNo, CarCarrier, CarCarrierOKPO, Check1)'
      'VALUES'
      '  (@ID, :PostNo, :CarCarrier, :CarCarrierOKPO, :Check1)'
      'SET :Old_ID = ident_current('#39'CarCarrier_List'#39')'
      'end')
    SQLDelete.Strings = (
      'DELETE FROM CarCarrier_List'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE CarCarrier_List'
      'SET'
      '    ID = :ID'
      '  , PostNo = :PostNo'
      '  , CarCarrier = :CarCarrier'
      '  , CarCarrierOKPO = :CarCarrierOKPO'
      '  , Check1 = :Check1'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      'SELECT CarCarrier_List.ID, '
      '       CarCarrier_List.PostNo, '
      '       CarCarrier_List.CarCarrier,'
      '       CarCarrier_List.CarCarrierOKPO, '
      '       CarCarrier_List.Check1 '
      ' FROM CarCarrier_List'
      '  WHERE ID = :ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select  isnull (ID,0) as Id'
      '      , isnull (PostNo,0) as PostNo'
      '      , isnull (CarCarrier,'#39#39') as CarCarrier'
      '      , isnull (CarCarrierOKPO,'#39#39') as CarCarrierOKPO'
      '      , isnull (Check1,0) as Check1'
      ' From CarCarrier_List '
      '  where PostNo = isnull(:p_PostNo, PostNo)')
    BeforePost = qu_CarCarrierBeforePost
    Left = 475
    Top = 520
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
      end>
    object qu_CarCarrierId: TIntegerField
      FieldName = 'Id'
    end
    object qu_CarCarrierPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qu_CarCarrierCarCarrier: TStringField
      FieldName = 'CarCarrier'
      Size = 64
    end
    object qu_CarCarrierCarCarrierOKPO: TStringField
      FieldName = 'CarCarrierOKPO'
      Size = 10
    end
    object qu_CarCarrierCheck1: TBooleanField
      FieldName = 'Check1'
    end
  end
  object ds_CarCarrier: TDataSource
    DataSet = qu_CarCarrier
    Left = 507
    Top = 520
  end
  object sp_CorrectPostPayBan: TMSStoredProc
    StoredProcName = 'sp_CorrectPOstPayBan;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_CorrectPOstPayBan;1(:PostNo)}')
    Left = 878
    Top = 61
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'PostNo'
        ParamType = ptInput
      end>
  end
  object quVidImportExelFileForNaklP: TMSQuery
    SQLInsert.Strings = (
      'declare'
      '  @Cnt int'
      ''
      'select @Cnt = count(*)'
      ' from L_VidImportExelFileForNaklP'
      '  where PostNo = :PostNo'
      '    and Column_Name = :Name'
      ''
      'if @Cnt = 0'
      
        'insert into L_VidImportExelFileForNaklP (PostNo,d_VidImportExelF' +
        'ileForNaklP_id, Column_Name, Column_Name_Post)'
      '       values (:PostNo, :Id, :Name, :Column_Name_Post)')
    SQLDelete.Strings = (
      'L_VidImportExelFileForNaklP'
      '  where PostNo = :PostNo'
      '    and Column_Name = :Name')
    SQLUpdate.Strings = (
      'declare'
      '  @Cnt int'
      ''
      'select @Cnt = count(*)'
      ' from L_VidImportExelFileForNaklP'
      '  where PostNo = :PostNo'
      '    and Column_Name = :Name'
      ''
      'if @Cnt = 0'
      
        'insert into L_VidImportExelFileForNaklP (PostNo,d_VidImportExelF' +
        'ileForNaklP_id, Column_Name, Column_Name_Post)'
      '       values (:PostNo, :Id, :Name, :Column_Name_Post)'
      ''
      'if @Cnt = 1'
      'update L_VidImportExelFileForNaklP'
      ' set Column_Name = :Name'
      '    ,Column_Name_Post = :Column_Name_Post'
      'where PostNo = :PostNo'
      '  and Column_Name = :Name')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare @PostNo int'
      ''
      'set @PostNo = :PostNo'
      ''
      'select  dviefnp.ID '
      '      , dviefnp.Name'
      '      , lviefnp.Column_Name_Post'
      '      , isnull(lviefnp.PostNo,@PostNo) as PostNo'
      ' from d_VidImportExelFileForNaklP dviefnp left join'
      
        '      L_VidImportExelFileForNaklP lviefnp on lviefnp.d_VidImport' +
        'ExelFileForNaklP_id = dviefnp.ID and lviefnp.PostNo = @PostNo')
    AfterPost = quVidImportExelFileForNaklPAfterPost
    Left = 1009
    Top = 381
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
    object quVidImportExelFileForNaklPID: TIntegerField
      FieldName = 'ID'
      ReadOnly = True
    end
    object quVidImportExelFileForNaklPName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1083#1086#1085#1082#1080
      DisplayWidth = 20
      FieldName = 'Name'
      Size = 50
    end
    object quVidImportExelFileForNaklPColumn_Name_Post: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1083#1086#1085#1082#1080' '#1091' '#1087#1072#1088#1090#1085#1077#1088#1072
      DisplayWidth = 20
      FieldName = 'Column_Name_Post'
      Size = 50
    end
    object quVidImportExelFileForNaklPPostNo: TIntegerField
      FieldName = 'PostNo'
    end
  end
  object dsVidImportExelFileForNaklP: TMSDataSource
    DataSet = quVidImportExelFileForNaklP
    Left = 985
    Top = 381
  end
  object qul_PostGroupCutting: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO l_PostGroupCutting'
      '  (PostNo, GroupCuttingId, GroupCuttingVidNo, IsLock)'
      'VALUES'
      '  (:PostNo, :GroupCuttingId, :GroupCuttingVidNo, :IsLock)'
      'SET :Id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM l_PostGroupCutting'
      'WHERE'
      '  Id = :Id')
    SQLUpdate.Strings = (
      'UPDATE l_PostGroupCutting'
      'SET'
      
        '  PostNo = :PostNo, GroupCuttingId = :GroupCuttingId, GroupCutti' +
        'ngVidNo = :GroupCuttingVidNo, IsLock = :IsLock'
      'WHERE'
      '  Id = :Id')
    SQLRefresh.Strings = (
      
        'SELECT l_PostGroupCutting.PostNo, l_PostGroupCutting.GroupCuttin' +
        'gId, l_PostGroupCutting.GroupCuttingVidNo, l_PostGroupCutting.Is' +
        'Lock FROM l_PostGroupCutting'
      'WHERE'
      '  Id = :Id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from l_PostGroupCutting l '
      '  where PostNo = :PostNo')
    BeforePost = qul_PostGroupCuttingBeforePost
    AfterPost = qul_PostGroupCuttingAfterPost
    Left = 721
    Top = 453
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
    object qul_PostGroupCuttingId: TLargeintField
      FieldName = 'Id'
    end
    object qul_PostGroupCuttingPostNo: TIntegerField
      FieldName = 'PostNo'
    end
    object qul_PostGroupCuttingGroupCuttingId: TIntegerField
      FieldName = 'GroupCuttingId'
    end
    object qul_PostGroupCuttingGroupCuttingVidNo: TIntegerField
      FieldName = 'GroupCuttingVidNo'
    end
    object qul_PostGroupCuttingIsLock: TBooleanField
      DisplayLabel = 'Z'
      DisplayWidth = 3
      FieldName = 'IsLock'
    end
    object qul_PostGroupCuttingGroupCuttingName: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1099
      FieldKind = fkLookup
      FieldName = 'GroupCuttingName'
      LookupDataSet = dmDataModule.quGroupCutting
      LookupKeyFields = 'id'
      LookupResultField = 'NameGropCutting'
      KeyFields = 'GroupCuttingId'
      Lookup = True
    end
    object qul_PostGroupCuttingVidName: TStringField
      DisplayLabel = #1042#1080#1076
      FieldKind = fkLookup
      FieldName = 'VidName'
      LookupDataSet = dmDataModule.quVidTov
      LookupKeyFields = 'VidNo'
      LookupResultField = 'VidName'
      KeyFields = 'GroupCuttingVidNo'
      Lookup = True
    end
  end
  object dsl_PostGroupCutting: TMSDataSource
    DataSet = qul_PostGroupCutting
    Left = 750
    Top = 453
  end
end
