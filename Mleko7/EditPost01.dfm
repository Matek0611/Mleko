inherited fmEditPost: TfmEditPost
  Left = 407
  Top = 189
  BorderStyle = bsDialog
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072
  ClientHeight = 714
  ClientWidth = 955
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 955
    Height = 673
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 0
    object pgc: TPageControl
      Left = 5
      Top = 5
      Width = 945
      Height = 663
      ActivePage = tsDelayPay
      Align = alClient
      TabOrder = 0
      object tsMain: TTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1086#1077
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 397
          Height = 635
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
            Top = 376
            Width = 377
            Height = 249
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
              Top = 202
              Width = 120
              Height = 13
              Caption = #1040#1076#1088#1077#1089' '#1076#1086#1089#1090#1072#1074#1082#1080' '#1076#1086#1074#1072#1088#1072
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
              Top = 131
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
              Top = 220
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
        end
        object PanelBoolProp: TPanel
          Left = 397
          Top = 0
          Width = 540
          Height = 635
          Align = alClient
          Caption = 'PanelBoolProp'
          TabOrder = 1
          object ToolBar: TToolBar
            Left = 1
            Top = 1
            Width = 538
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
            Width = 538
            Height = 609
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
          Left = 471
          Top = 22
          Width = 4
          Height = 613
        end
        object CoolBar1: TCoolBar
          Left = 0
          Top = 0
          Width = 937
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
          Width = 471
          Height = 613
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
          TabOrder = 1
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
              Width = 293
            end
            item
              EditButtons = <>
              FieldName = 'RegionName'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1056#1072#1081#1086#1085
              Title.TitleButton = True
              Title.ToolTips = True
              Width = 107
            end
            item
              EditButtons = <>
              FieldName = 'Topic'
              Footers = <>
              Title.Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072
            end
            item
              EditButtons = <>
              FieldName = 'Message'
              Footers = <>
              Title.Caption = #1058#1077#1082#1089#1090' '#1087#1080#1089#1100#1084#1072
            end
            item
              EditButtons = <>
              FieldName = 'Mail1'
              Footers = <>
              Title.Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 1'
            end
            item
              EditButtons = <>
              FieldName = 'Mail2'
              Footers = <>
              Title.Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 2'
            end
            item
              EditButtons = <>
              FieldName = 'Mail3'
              Footers = <>
              Title.Caption = #1069#1083'. '#1072#1076#1088#1077#1089' 3'
            end>
        end
        object Panel4: TPanel
          Left = 475
          Top = 22
          Width = 462
          Height = 613
          Align = alClient
          Caption = 'Panel4'
          TabOrder = 2
          object DBGridEh3: TDBGridEh
            Left = 1
            Top = 30
            Width = 460
            Height = 582
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
            TabOrder = 0
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
              end>
          end
          object Panel5: TPanel
            Left = 1
            Top = 1
            Width = 460
            Height = 29
            Align = alTop
            TabOrder = 1
            object Label19: TLabel
              Left = 1
              Top = 1
              Width = 153
              Height = 13
              Align = alClient
              Caption = 'Ctrl-Del : '#1091#1076#1072#1083#1080#1090#1100' Ins: '#1076#1086#1073#1072#1074#1080#1090#1100
              Color = clInfoBk
              ParentColor = False
            end
          end
        end
      end
      object tsContract: TTabSheet
        Caption = #1044#1086#1075#1086#1074#1086#1088#1072
        ImageIndex = 2
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 24
          Width = 937
          Height = 611
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
          Width = 937
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
          Width = 937
          Height = 635
          Align = alClient
          PopupMenu = FrmDelayPay.PopupMenuGrid
          TabOrder = 0
          inherited PanelGrid: TPanel
            Width = 606
            Height = 497
            inherited DBCxGrid: TcxGrid
              Width = 600
              Height = 404
              inherited DBCxGridDBTableView1: TcxGridDBTableView
                inherited ClnPayBan: TcxGridDBColumn [3]
                  PropertiesClassName = 'TcxRichEditProperties'
                  Properties.AutoSelect = False
                  Properties.HideScrollBars = True
                  Properties.MaxLength = 6
                  Properties.RichEditClass = recRichEdit20
                  Properties.StreamModes = []
                  Properties.WantReturns = True
                  Properties.WordWrap = True
                  Properties.OnSelectionChange = nil
                end
                inherited Clnbuh_name: TcxGridDBColumn [4]
                end
              end
            end
            inherited PageControlTop: TcxPageControl
              Width = 600
              ActivePage = FrmDelayPay.tsDynamicFilter
              ClientRectRight = 600
              inherited tsDynamicFilter: TcxTabSheet
                inherited DbFltControlMain: TcxFilterControl
                  Width = 554
                end
              end
            end
            inherited SplFilter: TcxSplitter
              Width = 600
            end
          end
          inherited PageExt: TcxPageControl
            Top = 531
            Width = 937
            ClientRectRight = 936
            inherited TabSelection: TcxTabSheet
              inherited DBGridSelection: TcitDBGrid
                Width = 935
              end
            end
          end
          inherited SplitterExt: TcxSplitter
            Top = 523
            Width = 937
          end
          inherited PageSettings: TcxPageControl
            Height = 497
            ClientRectBottom = 496
            inherited TabProp1: TcxTabSheet
              inherited vgStyleSheets: TcxVerticalGrid
                Height = 449
              end
            end
            inherited TabProp2: TcxTabSheet
              inherited FrameProp: TValueListEditor
                Height = 449
                ColWidths = (
                  64
                  139)
              end
            end
          end
          inherited PageDetails: TcxPageControl
            Left = 833
            Height = 497
            ClientRectBottom = 496
            inherited TabDetails1: TcxTabSheet
              inherited GridDetails: TcxDBVerticalGrid
                Height = 475
              end
            end
          end
          inherited SplitterDetails: TcxSplitter
            Left = 825
            Height = 497
          end
          inherited SplitterSettings: TcxSplitter
            Height = 497
          end
          inherited BarDockControlCommon: TdxBarDockControl
            Width = 937
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
              DockedLeft = 770
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
          Width = 937
          Height = 635
          Align = alClient
          PopupMenu = FrmSetPriceType.PopupMenuGrid
          TabOrder = 0
          inherited PanelGrid: TPanel
            Width = 606
            Height = 497
            inherited DBCxGrid: TcxGrid
              Width = 600
              Height = 404
            end
            inherited PageControlTop: TcxPageControl
              Width = 600
              ClientRectRight = 600
            end
            inherited SplFilter: TcxSplitter
              Width = 600
            end
          end
          inherited PageExt: TcxPageControl
            Top = 531
            Width = 937
            ClientRectRight = 936
            inherited TabSelection: TcxTabSheet
              inherited DBGridSelection: TcitDBGrid
                Width = 935
              end
            end
          end
          inherited SplitterExt: TcxSplitter
            Top = 523
            Width = 937
          end
          inherited PageSettings: TcxPageControl
            Height = 497
            ClientRectBottom = 496
            inherited TabProp2: TcxTabSheet
              inherited FrameProp: TValueListEditor
                Height = 449
                ColWidths = (
                  64
                  139)
              end
            end
          end
          inherited PageDetails: TcxPageControl
            Left = 833
            Height = 497
            ClientRectBottom = 496
            inherited TabDetails1: TcxTabSheet
              inherited GridDetails: TcxDBVerticalGrid
                Height = 475
              end
            end
          end
          inherited SplitterDetails: TcxSplitter
            Left = 825
            Height = 497
          end
          inherited SplitterSettings: TcxSplitter
            Height = 497
          end
          inherited BarDockControlCommon: TdxBarDockControl
            Width = 937
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
            Top = 280
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
          inherited VTSelection: TVirtualTable
            Data = {03000000000000000000}
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
        ImageIndex = 5
        object AvtoLabel: TLabel
          Left = 27
          Top = 412
          Width = 65
          Height = 13
          Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100':'
        end
        object DriverLabel: TLabel
          Left = 28
          Top = 380
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
          Top = 352
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
          Top = 376
          Width = 121
          Height = 21
          DataField = 'Driver'
          DataSource = dsTTN_Record
          TabOrder = 2
        end
        object Cars: TDBEdit
          Left = 98
          Top = 408
          Width = 121
          Height = 21
          DataField = 'Cars'
          DataSource = dsTTN_Record
          TabOrder = 3
        end
        object Use_StoreKeeper: TDBCheckBox
          Left = 16
          Top = 445
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
          Top = 472
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
      end
    end
  end
  object Panel3: TPanel [1]
    Left = 0
    Top = 673
    Width = 955
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 238
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      OnClick = bbOkClick
      Kind = bkOK
    end
    object bbCancel: TBitBtn
      Left = 318
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object dsAddressPost: TDataSource
    DataSet = quAddressPost
    Left = 78
    Top = 300
  end
  object qu_Contract: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * '
      'from d_firm_contract v'
      'where v.PostNo = :p_PostNo')
    BeforePost = qu_ContractBeforePost
    Left = 16
    Top = 280
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
    Left = 48
    Top = 280
  end
  object qu_ContractType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * '
      'from d_contract_type v')
    Left = 80
    Top = 272
  end
  object ds_ContractType: TDataSource
    DataSet = qu_ContractType
    Left = 160
    Top = 288
  end
  object qu_Prop: TMSQuery
    SQLUpdate.Strings = (
      '{CALL sp_SetFirmProp(:PostNo, :Id, :is_prop)}')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select '
      'p.Name'
      ',Case when l.id is null then cast(0 as bit)'
      ' else cast(1 as bit) end as is_prop'
      ',p.id'
      ',l.PostNo'
      
        'from d_firm_prop p left outer join l_firm_prop l on l.Prop_id=p.' +
        'id and l.PostNo= :p_PostNo')
    Options.StrictUpdate = False
    Left = 464
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'p_PostNo'
        Size = 4
        Value = '1884'
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
    Top = 104
  end
  object spSetFirmProp: TMSStoredProc
    StoredProcName = 'sp_SetFirmProp;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_SetFirmProp;1(:p_postNo, :p_PropId, :p_' +
        'Value)}')
    Left = 440
    Top = 192
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
    Left = 436
    Top = 160
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
    Left = 112
    Top = 280
  end
  object DsOurFirm: TDataSource
    DataSet = qu_ContractType
    Left = 184
    Top = 320
  end
  object quAddressPost: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO AddressPost'
      '  (PostNo, AddressNo, Address, RegionNo, MarschrutNo)'
      'VALUES'
      '  (:PostNo, :AddressNo, :Address, :RegionNo, :MarschrutNo)'
      'SET :ID = SCOPE_IDENTITY()'
      ''
      'insert into Post_Mail'
      '   (PostNo,Topic,Message,Mail1,Mail2,Mail3,AddressNo)'
      'values'
      '   (:PostNo,:Topic,:Message,:Mail1,:Mail2,:Mail3,:AddressNo)'
      'set :id = scope_identity()')
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
      'where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo')
    SQLUpdate.Strings = (
      'declare'
      '  @cnt int'
      ''
      
        'select @cnt = count(*) from post_mail where PostNo = :Old_PostNo' +
        ' AND AddressNo = :Old_AddressNo'
      ''
      'UPDATE AddressPost'
      'SET'
      
        '  PostNo = :PostNo, AddressNo = :AddressNo, Address = :Address, ' +
        'RegionNo = :RegionNo, MarschrutNo = :MarschrutNo'
      'WHERE'
      '  PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      ''
      'if @cnt > 0 '
      'begin'
      '  update Post_mail'
      '  set'
      '    PostNo = :PostNo, Topic = :Topic, Message = :Message,'
      
        '    Mail1 = :Mail1, Mail2 = :Mail2, Mail3 = :Mail3, AddressNo = ' +
        ':AddressNo'
      '  where PostNo = :Old_PostNo AND AddressNo = :Old_AddressNo'
      'end'
      'else'
      'begin'
      'insert into Post_Mail'
      '   (PostNo,Topic,Message,Mail1,Mail2,Mail3,AddressNo)'
      'values'
      '   (:PostNo,:Topic,:Message,:Mail1,:Mail2,:Mail3,:AddressNo)'
      'set :id = scope_identity()'
      'end'
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
      
        ' from AddressPost ap left join Post_Mail pm on ap.AddressNo = pm' +
        '.AddressNo and ap.PostNo = pm.PostNo'
      '  where ap.PostNo = :PostNo'
      '/*'
      'SELECT     ID,PostNo, AddressNo, Address, RegionNo, MarschrutNo'
      'FROM         AddressPost'
      'where AddressPost.PostNo= :PostNo'
      '*/')
    FetchRows = 1
    BeforeOpen = quAddressPostBeforeOpen
    BeforePost = quAddressPostBeforePost
    Left = 48
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
        ParamType = ptInputOutput
        Value = 9
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
      Size = 50
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
      Size = 50
    end
    object quAddressPostMail2: TStringField
      FieldName = 'Mail2'
      Size = 50
    end
    object quAddressPostMail3: TStringField
      FieldName = 'Mail3'
      Size = 50
    end
    object quAddressPostTopic: TStringField
      FieldName = 'Topic'
      Size = 85
    end
    object quAddressPostMessage: TStringField
      FieldName = 'Message'
      Size = 256
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
      '  (AddressPost_id, SotrudNo)'
      'VALUES'
      '  (:AddressPost_id, :SotrudNo)'
      'SET :id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM d_sotrud_address'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE d_sotrud_address'
      'SET'
      '  AddressPost_id = :AddressPost_id, SotrudNo = :SotrudNo'
      'WHERE'
      '  id = :Old_id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_sotrud_address')
    FetchRows = 1
    MasterSource = dsAddressPost
    MasterFields = 'ID'
    DetailFields = 'AddressPost_id'
    Left = 544
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
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
    BeforePost = qu_Storekeeper_ListBeforePost
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
    Top = 64
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
    Top = 66
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
    Top = 546
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
    Top = 546
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
end
