inherited CFLMLKEditReportForm: TCFLMLKEditReportForm
  Left = 448
  Top = 83
  Width = 1120
  Height = 696
  Caption = 'CFLMLKEditReportForm'
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 639
    Width = 1104
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 103
    Width = 273
    Height = 536
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 1
      Top = 100
      Width = 271
      Height = 4
      Cursor = crVSplit
      Align = alTop
    end
    object PanelRepDataSet: TPanel
      Left = 1
      Top = 1
      Width = 271
      Height = 99
      Align = alTop
      Caption = 'PanelRepDataSet'
      TabOrder = 0
      object DBGridEh1: TDBGridEh
        Left = 1
        Top = 25
        Width = 269
        Height = 73
        Align = alClient
        DataSource = DSTemplates
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
            FieldName = 'ID'
            Footers = <>
            Width = 71
          end
          item
            EditButtons = <>
            FieldName = 'num'
            Footers = <>
            Width = 43
          end>
      end
      object ToolBar2: TToolBar
        Left = 1
        Top = 1
        Width = 269
        Height = 24
        AutoSize = True
        Caption = 'ToolBar1'
        Flat = True
        Images = dmDataModule.ImageListToolBar
        TabOrder = 1
        object ToolButton5: TToolButton
          Left = 0
          Top = 0
          Action = ActionAddTemplate
        end
        object ToolButton9: TToolButton
          Left = 23
          Top = 0
          Action = ActionDelTemplate
        end
        object ToolButton8: TToolButton
          Left = 46
          Top = 0
          Action = ActionTemplateRefresh
        end
        object ToolButton13: TToolButton
          Left = 69
          Top = 0
          Width = 8
          Caption = 'ToolButton13'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object Label4: TLabel
          Left = 77
          Top = 0
          Width = 69
          Height = 22
          Caption = 'SQL '#1047#1072#1087#1088#1086#1089#1099
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 104
      Width = 271
      Height = 431
      Align = alClient
      Caption = 'Panel3'
      TabOrder = 1
      object DBGridEh2: TDBGridEh
        Left = 1
        Top = 25
        Width = 269
        Height = 162
        Align = alClient
        DataSource = DSParams
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
            FieldName = 'name'
            Footers = <>
            Width = 104
          end
          item
            EditButtons = <>
            FieldName = 'is_multiselect'
            Footers = <>
            Title.Caption = 'm/s'
            Width = 29
          end
          item
            ButtonStyle = cbsUpDown
            EditButtons = <>
            FieldName = 'num_order'
            Footers = <>
            Title.Caption = 'order'
            Width = 31
          end
          item
            EditButtons = <>
            FieldName = 'Enity_name'
            Footers = <>
            ReadOnly = True
            Width = 83
          end>
      end
      object ToolBar3: TToolBar
        Left = 1
        Top = 1
        Width = 269
        Height = 24
        AutoSize = True
        Caption = 'ToolBar1'
        Flat = True
        Images = dmDataModule.ImageListToolBar
        TabOrder = 1
        object ToolButton10: TToolButton
          Left = 0
          Top = 0
          Action = ActionAddParam
        end
        object ToolButton12: TToolButton
          Left = 23
          Top = 0
          Action = ActionDelParam
        end
        object ToolButton20: TToolButton
          Left = 46
          Top = 0
          Width = 4
          Caption = 'ToolButton20'
          ImageIndex = 9
          Style = tbsSeparator
        end
        object ToolButton11: TToolButton
          Left = 50
          Top = 0
          Action = ActionParamsRefresh
        end
        object ToolButton3: TToolButton
          Left = 73
          Top = 0
          Action = ActionAutoPlace
        end
      end
      object Panel7: TPanel
        Left = 1
        Top = 187
        Width = 269
        Height = 243
        Align = alBottom
        TabOrder = 2
        object Label6: TLabel
          Left = 14
          Top = 58
          Width = 35
          Height = 13
          Caption = #1057#1074#1077#1088#1093#1091
        end
        object Label7: TLabel
          Left = 11
          Top = 82
          Width = 39
          Height = 13
          Caption = #1064#1080#1088#1080#1085#1072
        end
        object Label8: TLabel
          Left = 143
          Top = 59
          Width = 31
          Height = 13
          Caption = 'C'#1083#1077#1074#1072
          WordWrap = True
        end
        object Label9: TLabel
          Left = 141
          Top = 81
          Width = 38
          Height = 13
          Caption = #1042#1099#1089#1086#1090#1072
        end
        object Label10: TLabel
          Left = 11
          Top = 34
          Width = 36
          Height = 13
          Caption = 'Caption'
        end
        object Label11: TLabel
          Left = 10
          Top = 12
          Width = 43
          Height = 13
          Caption = #1058#1080#1087' '#1087#1072#1088'.'
        end
        object Label15: TLabel
          Left = 3
          Top = 108
          Width = 51
          Height = 13
          Caption = 'Default val'
        end
        object Label17: TLabel
          Left = 200
          Top = 160
          Width = 61
          Height = 13
          Caption = 'SQL '#1092#1080#1083#1100#1090#1088
        end
        object Label5: TLabel
          Left = 3
          Top = 138
          Width = 30
          Height = 13
          Caption = #1057#1090#1080#1083#1100
        end
        object par_top: TDBNumberEditEh
          Left = 59
          Top = 56
          Width = 72
          Height = 21
          DataField = 'pos_top'
          DataSource = DSParams
          DecimalPlaces = 0
          EditButton.Style = ebsUpDownEh
          EditButton.Visible = True
          EditButtons = <>
          ParentShowHint = False
          TabOrder = 0
          Visible = True
        end
        object par_left: TDBNumberEditEh
          Left = 188
          Top = 56
          Width = 73
          Height = 21
          DataField = 'pos_left'
          DataSource = DSParams
          DecimalPlaces = 0
          EditButton.Style = ebsUpDownEh
          EditButton.Visible = True
          EditButtons = <>
          ParentShowHint = False
          TabOrder = 1
          Visible = True
        end
        object par_width: TDBNumberEditEh
          Left = 58
          Top = 80
          Width = 74
          Height = 21
          DataField = 'width'
          DataSource = DSParams
          DecimalPlaces = 0
          EditButton.Style = ebsUpDownEh
          EditButton.Visible = True
          EditButtons = <>
          ParentShowHint = False
          TabOrder = 2
          Visible = True
        end
        object par_height: TDBNumberEditEh
          Left = 188
          Top = 80
          Width = 73
          Height = 21
          DataField = 'height'
          DataSource = DSParams
          DecimalPlaces = 0
          EditButton.Style = ebsUpDownEh
          EditButton.Visible = True
          EditButtons = <>
          ParentShowHint = False
          TabOrder = 3
          Visible = True
        end
        object DBEdit2: TDBEdit
          Left = 59
          Top = 31
          Width = 202
          Height = 21
          DataField = 'caption'
          DataSource = DSParams
          TabOrder = 4
        end
        object DBLookupComboboxEh1: TDBLookupComboboxEh
          Left = 59
          Top = 6
          Width = 203
          Height = 21
          DataField = 'entity_type_id'
          DataSource = DSParams
          DropDownBox.Columns = <
            item
              FieldName = 'name'
            end
            item
              FieldName = 'code'
            end
            item
              FieldName = 'control_code'
            end>
          DropDownBox.ListSource = DSParamType
          DropDownBox.ShowTitles = True
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'ID'
          ListField = 'name'
          ListSource = DSParamType
          TabOrder = 5
          Visible = True
        end
        object DBEdit3: TDBEdit
          Left = 60
          Top = 105
          Width = 202
          Height = 21
          DataField = 'def_value'
          DataSource = DSParams
          TabOrder = 6
        end
        object DBMemo2: TDBMemo
          Left = 1
          Top = 176
          Width = 267
          Height = 66
          Align = alBottom
          DataField = 'filter_sql'
          DataSource = DSParams
          TabOrder = 7
        end
        object DBComboBox1: TDBComboBox
          Left = 60
          Top = 132
          Width = 201
          Height = 21
          DataField = 'style'
          DataSource = DSParams
          ItemHeight = 13
          Items.Strings = (
            'DEFAULT')
          TabOrder = 8
        end
        object DBCheckBox2: TDBCheckBox
          Left = 5
          Top = 157
          Width = 52
          Height = 17
          Caption = 'Visible'
          DataField = 'visible'
          DataSource = DSParams
          TabOrder = 9
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object EdInc: TEdit
        Left = 95
        Top = 5
        Width = 25
        Height = 21
        TabOrder = 3
        Text = '50'
      end
      object Edit1: TEdit
        Left = 195
        Top = 7
        Width = 70
        Height = 16
        BorderStyle = bsNone
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = #1055#1072#1088#1072#1084#1077#1090#1088#1099
      end
      object Edit3: TEdit
        Left = 125
        Top = 7
        Width = 48
        Height = 16
        BorderStyle = bsNone
        Ctl3D = False
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 5
        Text = #1057#1084#1077#1097#1077#1085'.'
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 281
    Top = 103
    Width = 823
    Height = 536
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 515
      Height = 534
      Align = alClient
      Caption = 'Panel6'
      TabOrder = 0
      object PageControlQuery: TPageControl
        Left = 1
        Top = 23
        Width = 513
        Height = 382
        ActivePage = TSSQLREPORT
        Align = alClient
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TSSQLREPORT: TTabSheet
          Caption = 'SQL_DATASET_REPORT'
          object ReTemplateSQL: TDBRichEdit
            Left = 0
            Top = 0
            Width = 505
            Height = 352
            Align = alClient
            DataField = 'SQL_TEXT'
            DataSource = DSTemplates
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            PlainText = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object TabSheetShowDlg: TTabSheet
          Caption = 'SQL_SHOW_DLG'
          ImageIndex = 1
          object PageShowDlg: TPageControl
            Left = 0
            Top = 0
            Width = 505
            Height = 352
            ActivePage = TabShowDlg
            Align = alClient
            TabOrder = 0
            TabPosition = tpBottom
            object TabShowDlg: TTabSheet
              Caption = 'Edit'
              object ReShowEditSQL: TDBRichEdit
                Left = 0
                Top = 0
                Width = 505
                Height = 335
                Align = alClient
                DataField = 'sql_edit'
                DataSource = DSReport
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                PlainText = True
                ScrollBars = ssBoth
                TabOrder = 0
              end
            end
            object TabSheet10: TTabSheet
              Caption = 'Insert'
              ImageIndex = 1
              object ReShowInsertSQL: TDBRichEdit
                Left = 0
                Top = 0
                Width = 505
                Height = 335
                Align = alClient
                DataField = 'sql_insert'
                DataSource = DSReport
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                PlainText = True
                ScrollBars = ssBoth
                TabOrder = 0
              end
            end
          end
        end
        object TabSheetCmdDlg: TTabSheet
          Caption = 'SQL_CMD_DLG'
          ImageIndex = 3
          object PageCmdDlg: TPageControl
            Left = 0
            Top = 0
            Width = 505
            Height = 352
            ActivePage = TabSheet6
            Align = alClient
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            MultiLine = True
            ParentFont = False
            TabOrder = 0
            TabPosition = tpBottom
            object TabSheet6: TTabSheet
              Caption = 'INSERT'
              object ReCMDInsertSQL: TDBRichEdit
                Left = 0
                Top = 0
                Width = 505
                Height = 335
                Align = alClient
                DataField = 'sql_cmd_insert'
                DataSource = DSReport
                Font.Charset = RUSSIAN_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                PlainText = True
                ScrollBars = ssBoth
                TabOrder = 0
              end
            end
            object TabSheet7: TTabSheet
              Caption = 'EDIT'
              ImageIndex = 1
              object ReCMDEditSQL: TDBRichEdit
                Left = 0
                Top = 0
                Width = 393
                Height = 276
                Align = alClient
                DataField = 'sql_cmd_edit'
                DataSource = DSReport
                PlainText = True
                ScrollBars = ssBoth
                TabOrder = 0
              end
            end
            object TabSheet8: TTabSheet
              Caption = 'DELETE'
              ImageIndex = 2
              object ReCMDDeleteSQL: TDBRichEdit
                Left = 0
                Top = 0
                Width = 393
                Height = 276
                Align = alClient
                DataField = 'sql_cmd_delete'
                DataSource = DSReport
                PlainText = True
                ScrollBars = ssBoth
                TabOrder = 0
              end
            end
          end
        end
        object TabSheet3: TTabSheet
          Caption = #1056#1072#1079#1086#1073#1088#1072#1085#1085#1099#1081' '#1089#1082#1088#1080#1087#1090
          ImageIndex = 3
          object MemParsingScript: TcxMemo
            Left = 0
            Top = 0
            Align = alClient
            Lines.Strings = (
              'MemParsingScript')
            Properties.ScrollBars = ssBoth
            TabOrder = 0
            Height = 352
            Width = 505
          end
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 1
        Top = 405
        Width = 513
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = DBGridSelect
      end
      object ToolBar5: TToolBar
        Left = 1
        Top = 1
        Width = 513
        Height = 22
        AutoSize = True
        Caption = 'ToolBar1'
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        Images = dmDataModule.ImageListToolBar
        TabOrder = 2
        object ToolButton15: TToolButton
          Left = 0
          Top = 0
          Action = ActionExecSql
        end
        object ToolButton21: TToolButton
          Left = 23
          Top = 0
          Action = ActionViewSQL
        end
      end
      object DBGridSelect: TDBGridEh
        Left = 1
        Top = 413
        Width = 513
        Height = 120
        Align = alBottom
        AutoFitColWidths = True
        DataSource = DsExecSql
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind]
        RowHeight = 4
        RowLines = 1
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object PrPanel: TPanel
      Left = 524
      Top = 1
      Width = 298
      Height = 534
      Align = alRight
      Caption = 'Preview'
      TabOrder = 1
      object PanelPrintTemplate: TPanel
        Left = 1
        Top = 411
        Width = 296
        Height = 122
        Align = alBottom
        Caption = 'PanelPrintTemplate'
        TabOrder = 0
        object DBGridEh3: TDBGridEh
          Left = 1
          Top = 28
          Width = 294
          Height = 93
          Align = alClient
          DataSource = DSPrintTemplate
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
              FieldName = 'Name'
              Footers = <>
              Title.Caption = #1048#1084#1103' '#1074#1080#1076#1072
              Width = 212
            end
            item
              EditButtons = <>
              FieldName = 'is_main'
              Footers = <>
              Title.Caption = #1054#1089#1085#1086#1074#1085'.'
              Width = 26
            end>
        end
        object ToolBar4: TToolBar
          Left = 1
          Top = 1
          Width = 294
          Height = 27
          Caption = 'ToolBar1'
          Images = dmDataModule.ImageListToolBar
          TabOrder = 1
          object ToolButton16: TToolButton
            Left = 0
            Top = 2
            Action = ActionPrintTemplateAdd
          end
          object ToolButton17: TToolButton
            Left = 23
            Top = 2
            Action = ActionPrintTemplateEdit
          end
          object ToolButton18: TToolButton
            Left = 46
            Top = 2
            Action = ActionPrintTemplateDel
          end
          object ToolButton7: TToolButton
            Left = 69
            Top = 2
            Width = 5
            Caption = 'ToolButton7'
            ImageIndex = 4
            Style = tbsSeparator
          end
          object ToolButton4: TToolButton
            Left = 74
            Top = 2
            Action = ActionPrintTemplateRefresh
          end
          object ToolButton19: TToolButton
            Left = 97
            Top = 2
            Width = 8
            Caption = 'ToolButton19'
            ImageIndex = 7
            Style = tbsSeparator
          end
          object Label12: TLabel
            Left = 105
            Top = 2
            Width = 97
            Height = 22
            Caption = #1042#1080#1076#1099' '#1086#1090#1086#1073#1088#1072#1078#1077#1085#1080#1103
            WordWrap = True
          end
        end
      end
      object PageControl2: TPageControl
        Left = 1
        Top = 1
        Width = 296
        Height = 402
        ActivePage = TabSheet1
        Align = alClient
        TabOrder = 1
        object TabSheet1: TTabSheet
          Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1086#1088#1084#1099
          object PageControl: TPageControl
            Left = 0
            Top = 0
            Width = 288
            Height = 326
            ActivePage = TBPreview
            TabOrder = 0
            object TBPreview: TTabSheet
              Caption = #1060#1086#1088#1084#1072
            end
          end
        end
        object TabSheet2: TTabSheet
          Caption = #1040#1074#1090#1086#1075#1077#1085#1077#1088#1072#1094#1080#1103
          ImageIndex = 1
          object ToolBar1: TToolBar
            Left = 0
            Top = 0
            Width = 288
            Height = 22
            AutoSize = True
            Caption = 'ToolBar1'
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Images = dmDataModule.ImageListToolBar
            TabOrder = 0
            object ToolButton14: TToolButton
              Left = 0
              Top = 0
              Action = ActionGenParamByProc
            end
          end
          object citDBComboEdit1: TcitDBComboEdit
            Left = 68
            Top = 28
            Width = 196
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
            LLblCaption = #1055#1088#1086#1094#1077#1076#1091#1088#1072
            LLblWidth = 65
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
            Text = 'citDBComboEdit1'
            Visible = True
            DataSet = MetaStoredProcs
            LocateKey = False
            KeyField = 'PROCEDURE_NAME'
            TextField = 'PROCEDURE_NAME'
            EditStyle = edCombo
            AutoTabControl = False
          end
        end
      end
      object cxSplitter3: TcxSplitter
        Left = 1
        Top = 403
        Width = 296
        Height = 8
        HotZoneClassName = 'TcxSimpleStyle'
        AlignSplitter = salBottom
        Control = PanelPrintTemplate
      end
    end
    object cxSplitter2: TcxSplitter
      Left = 516
      Top = 1
      Width = 8
      Height = 534
      HotZoneClassName = 'TcxSimpleStyle'
      AlignSplitter = salRight
      Control = PrPanel
    end
  end
  object Panel5: TPanel [3]
    Left = 0
    Top = 26
    Width = 1104
    Height = 77
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 364
      Top = 1
      Width = 34
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object Label2: TLabel
      Left = 6
      Top = 2
      Width = 112
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1095#1077#1090#1072
    end
    object Label3: TLabel
      Left = 423
      Top = 1
      Width = 33
      Height = 13
      Caption = 'Enable'
    end
    object Label13: TLabel
      Left = 17
      Top = 39
      Width = 39
      Height = 13
      Caption = #1064#1080#1088#1080#1085#1072
    end
    object Label14: TLabel
      Left = 93
      Top = 39
      Width = 38
      Height = 13
      Caption = #1042#1099#1089#1086#1090#1072
    end
    object Label16: TLabel
      Left = 158
      Top = 39
      Width = 57
      Height = 13
      Caption = #1059#1088' '#1076#1086#1089#1090#1091#1087#1072
    end
    object Label18: TLabel
      Left = 281
      Top = 39
      Width = 19
      Height = 13
      Caption = #1058#1080#1087
    end
    object Label19: TLabel
      Left = 448
      Top = 38
      Width = 47
      Height = 13
      Caption = 'Dlg_Class'
    end
    object DBMemo1: TDBMemo
      Left = 820
      Top = 1
      Width = 283
      Height = 75
      Align = alRight
      DataField = 'DESCRIPTION'
      DataSource = DSReport
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 3
      Top = 17
      Width = 342
      Height = 21
      DataField = 'NAME'
      DataSource = DSReport
      TabOrder = 1
    end
    object DBNumberEditEh1: TDBNumberEditEh
      Left = 350
      Top = 16
      Width = 69
      Height = 21
      DataField = 'NUM'
      DataSource = DSReport
      DecimalPlaces = 0
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      ParentShowHint = False
      TabOrder = 2
      Visible = True
    end
    object DBCheckBox1: TDBCheckBox
      Left = 430
      Top = 18
      Width = 16
      Height = 16
      DataField = 'ACTIVE'
      DataSource = DSReport
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object rep_width: TDBNumberEditEh
      Left = 1
      Top = 53
      Width = 74
      Height = 21
      DataField = 'width'
      DataSource = DSReport
      DecimalPlaces = 0
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      ParentShowHint = False
      TabOrder = 4
      Visible = True
    end
    object rep_height: TDBNumberEditEh
      Left = 77
      Top = 53
      Width = 73
      Height = 21
      DataField = 'height'
      DataSource = DSReport
      DecimalPlaces = 0
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      ParentShowHint = False
      TabOrder = 5
      Visible = True
    end
    object DBNumberEditEh2: TDBNumberEditEh
      Left = 152
      Top = 53
      Width = 69
      Height = 21
      DataField = 'CodeAccess'
      DataSource = DSReport
      DecimalPlaces = 0
      EditButton.Style = ebsUpDownEh
      EditButton.Visible = True
      EditButtons = <>
      ParentShowHint = False
      TabOrder = 6
      Visible = True
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 224
      Top = 52
      Width = 138
      Height = 21
      DataField = 'type_id'
      DataSource = DSReport
      KeyField = 'id'
      ListField = 'name'
      ListSource = DsPropDlgType
      TabOrder = 7
    end
    object DBComboBox2: TDBComboBox
      Left = 364
      Top = 52
      Width = 221
      Height = 21
      DataField = 'class'
      DataSource = DSReport
      ItemHeight = 13
      Items.Strings = (
        'TCFLMLKCustomRepDlg'
        'TCFLMLKPropDbDlg')
      TabOrder = 8
    end
  end
  inherited ToolBar: TToolBar
    Width = 1104
    Height = 26
    ButtonWidth = 25
    TabOrder = 4
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = ActionTemplateCommit
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 0
      Action = ActionReportRefresh
    end
    object ToolButton6: TToolButton
      Left = 50
      Top = 0
      Action = ActionPreviewRefresh
    end
  end
  object cxSplitter4: TcxSplitter [5]
    Left = 273
    Top = 103
    Width = 8
    Height = 536
    HotZoneClassName = 'TcxSimpleStyle'
    Control = Panel1
  end
  inherited ActionList: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 628
    Top = 136
    object ActionGenParamByProc: TAction
      Caption = 'ActionGenParamByProc'
      Hint = #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086' '#1087#1088#1086#1094#1077#1076#1091#1088#1077
      ImageIndex = 28
      OnExecute = ActionGenParamByProcExecute
    end
    object ActionExecSql: TAction
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      ImageIndex = 9
      ShortCut = 120
      OnExecute = ActionExecSqlExecute
    end
    object ActionViewSQL: TAction
      Caption = 'ActionViewSQL'
      ImageIndex = 22
      OnExecute = ActionViewSQLExecute
    end
  end
  object ActionList1: TActionList
    Left = 352
    Top = 120
    object ActionTemplateCommit: TAction
      Caption = #1047#1072#1082#1086#1084#1080#1090#1080#1090#1100' '#1074#1089#1077
      Hint = #1047#1072#1082#1086#1084#1080#1090#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 11
      ShortCut = 16467
      OnExecute = ActionTemplateCommitExecute
    end
    object ActionTemplateRefresh: TAction
      Caption = 'ActionRefresh'
      ImageIndex = 3
      OnExecute = ActionTemplateRefreshExecute
    end
    object ActionDelTemplate: TAction
      Caption = 'ActionDelTemplate'
      ImageIndex = 2
      OnExecute = ActionDelTemplateExecute
    end
    object ActionAddTemplate: TAction
      Caption = 'ActionAddTemplate'
      ImageIndex = 0
      OnExecute = ActionAddTemplateExecute
    end
    object ActionParamsRefresh: TAction
      Caption = 'ActionParamsRefresh'
      ImageIndex = 3
      OnExecute = ActionParamsRefreshExecute
    end
    object ActionReportRefresh: TAction
      Caption = 'ActionRefresh'
      ImageIndex = 3
      OnExecute = ActionReportRefreshExecute
    end
    object ActionEditParam: TAction
      Caption = 'ActionEditParam'
      ImageIndex = 1
    end
    object ActionAddParam: TAction
      Caption = 'ActionParamsCommit'
      ImageIndex = 0
      OnExecute = ActionAddParamExecute
    end
    object ActionDelParam: TAction
      Caption = 'ActionDelParam'
      ImageIndex = 2
      OnExecute = ActionDelParamExecute
    end
    object ActionAutoAddParam: TAction
      Caption = 'ActionAutoAddParam'
      ImageIndex = 10
    end
    object ActionPreviewRefresh: TAction
      Caption = 'ActionPreviewRefresh'
      ImageIndex = 4
      OnExecute = ActionPreviewRefreshExecute
    end
    object ActionAutoPlace: TAction
      Caption = 'ActionAutoPlace'
      ImageIndex = 8
      OnExecute = ActionAutoPlaceExecute
    end
    object ActionPrintTemplateRefresh: TAction
      Caption = 'ActionPrintTemplateRefresh'
      ImageIndex = 3
      OnExecute = ActionPrintTemplateRefreshExecute
    end
    object ActionPrintTemplateAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1095#1072#1090#1085#1091#1102' '#1092#1086#1088#1084#1091
      ImageIndex = 0
      OnExecute = ActionPrintTemplateAddExecute
    end
    object ActionPrintTemplateDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1077#1095#1072#1090#1085#1091#1102' '#1092#1086#1088#1084#1091
      ImageIndex = 2
      OnExecute = ActionPrintTemplateDelExecute
    end
    object ActionPrintTemplateEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1077#1095#1072#1090#1085#1091#1102' '#1092#1086#1088#1084#1091
      ImageIndex = 1
      OnExecute = ActionPrintTemplateEditExecute
    end
  end
  object quReport: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_prop_dlg where id = :p_report_id')
    Left = 240
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_report_id'
      end>
  end
  object quTemplates: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO d_report_template'
      '  (PROP_DLG_ID, SQL_TEXT, num)'
      'VALUES'
      '  (:PROP_DLG_ID, :SQL_TEXT, :num)'
      'SET :ID = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM d_report_template'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE d_report_template'
      'SET'
      '  PROP_DLG_ID = :PROP_DLG_ID, SQL_TEXT = :SQL_TEXT, num = :num'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT d_report_template.PROP_DLG_ID, d_report_template.SQL_TEXT' +
        ', d_report_template.num FROM d_report_template'
      'WHERE'
      '  ID = :ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_report_template where prop_dlg_id = :p_report_id')
    BeforeOpen = quTemplatesBeforeOpen
    Left = 104
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_report_id'
      end>
  end
  object quParams: TMSQuery
    SQLDelete.Strings = (
      'Exec Sp_Del_prop_dlg_attribute :id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select tp.*,pt.name as code,pt.data_type_code as data_type,pt.de' +
        'scription as entity_name'
      'from D_PROP_DLG_ATTRIBUTE tp, D_ENTITY_TYPE pt'
      'where tp.prop_dlg_id= :p_report_id'
      'and tp.entity_type_id=pt.id'
      'order by tp.num_order')
    Left = 192
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_report_id'
      end>
  end
  object DSTemplates: TDataSource
    DataSet = quTemplates
    Left = 56
    Top = 136
  end
  object DSParams: TDataSource
    DataSet = quParams
    Left = 136
    Top = 288
  end
  object DSReport: TDataSource
    DataSet = quReport
    OnDataChange = DSReportDataChange
    Left = 280
    Top = 16
  end
  object SpAddReport: TMSStoredProc
    StoredProcName = 'Sp_Add_prop_dlg'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL Sp_Add_prop_dlg (:p_id, :prop_dlg_type_cod' +
        'e)}')
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'prop_dlg_type_code'
        ParamType = ptInput
        Size = 64
      end>
  end
  object quParamType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from D_ENTITY_TYPE')
    Left = 128
    Top = 488
  end
  object DSParamType: TDataSource
    DataSet = quParamType
    Left = 176
    Top = 488
  end
  object DSPrintTemplate: TDataSource
    DataSet = QuPrintTemplate
    Left = 560
    Top = 520
  end
  object QuPrintTemplate: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO D_REPORT_PRINT_TEMPLATE'
      '  (Name, PROP_DLG_ID, is_main)'
      'VALUES'
      '  (:Name, :PROP_DLG_ID, :is_main)'
      'SET :ID = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM D_REPORT_PRINT_TEMPLATE'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE D_REPORT_PRINT_TEMPLATE'
      'SET'
      '  Name = :Name, PROP_DLG_ID = :PROP_DLG_ID, is_main = :is_main'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT D_REPORT_PRINT_TEMPLATE.TEMPLATE, D_REPORT_PRINT_TEMPLATE' +
        '.Name, D_REPORT_PRINT_TEMPLATE.PROP_DLG_ID, D_REPORT_PRINT_TEMPL' +
        'ATE.is_main FROM D_REPORT_PRINT_TEMPLATE'
      'WHERE D_REPORT_PRINT_TEMPLATE.ID = :ID ')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from D_REPORT_PRINT_TEMPLATE '
      'where prop_dlg_id = :p_report_id')
    FetchRows = 1
    BeforeOpen = QuPrintTemplateBeforeOpen
    BeforePost = QuPrintTemplateBeforePost
    Left = 592
    Top = 520
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_report_id'
      end>
  end
  object QuPropDlgType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_prop_dlg_type')
    Left = 560
    Top = 40
  end
  object DsPropDlgType: TDataSource
    DataSet = QuPropDlgType
    Left = 520
    Top = 40
  end
  object MetaProcParam: TMSMetadata
    Connection = dmDataModule.DB
    Left = 878
    Top = 225
    object MetaProcParamPROCEDURE_CATALOG: TWideStringField
      FieldName = 'PROCEDURE_CATALOG'
      ReadOnly = True
      Size = 128
    end
    object MetaProcParamPROCEDURE_SCHEMA: TWideStringField
      FieldName = 'PROCEDURE_SCHEMA'
      ReadOnly = True
      Size = 128
    end
    object MetaProcParamPROCEDURE_NAME: TWideStringField
      FieldName = 'PROCEDURE_NAME'
      ReadOnly = True
      Size = 134
    end
    object MetaProcParamPARAMETER_NAME: TWideStringField
      FieldName = 'PARAMETER_NAME'
      ReadOnly = True
      Size = 128
    end
    object MetaProcParamORDINAL_POSITION: TIntegerField
      FieldName = 'ORDINAL_POSITION'
      ReadOnly = True
    end
    object MetaProcParamPARAMETER_TYPE: TIntegerField
      FieldName = 'PARAMETER_TYPE'
      ReadOnly = True
    end
    object MetaProcParamPARAMETER_HASDEFAULT: TBooleanField
      FieldName = 'PARAMETER_HASDEFAULT'
      ReadOnly = True
    end
    object MetaProcParamPARAMETER_DEFAULT: TWideStringField
      FieldName = 'PARAMETER_DEFAULT'
      ReadOnly = True
      Size = 255
    end
    object MetaProcParamIS_NULLABLE: TBooleanField
      FieldName = 'IS_NULLABLE'
      ReadOnly = True
    end
    object MetaProcParamDATA_TYPE: TIntegerField
      FieldName = 'DATA_TYPE'
      ReadOnly = True
    end
    object MetaProcParamCHARACTER_MAXIMUM_LENGTH: TIntegerField
      FieldName = 'CHARACTER_MAXIMUM_LENGTH'
      ReadOnly = True
    end
    object MetaProcParamCHARACTER_OCTET_LENGTH: TIntegerField
      FieldName = 'CHARACTER_OCTET_LENGTH'
      ReadOnly = True
    end
    object MetaProcParamNUMERIC_PRECISION: TIntegerField
      FieldName = 'NUMERIC_PRECISION'
      ReadOnly = True
    end
    object MetaProcParamNUMERIC_SCALE: TSmallintField
      FieldName = 'NUMERIC_SCALE'
      ReadOnly = True
    end
    object MetaProcParamDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      ReadOnly = True
      Size = 50
    end
    object MetaProcParamTYPE_NAME: TWideStringField
      FieldName = 'TYPE_NAME'
      ReadOnly = True
      Size = 128
    end
    object MetaProcParamLOCAL_TYPE_NAME: TWideStringField
      FieldName = 'LOCAL_TYPE_NAME'
      Size = 128
    end
  end
  object MetaStoredProcs: TMSMetadata
    Connection = dmDataModule.DB
    Left = 878
    Top = 169
    object MetaStoredProcsPROCEDURE_NAME: TWideStringField
      FieldName = 'PROCEDURE_NAME'
      ReadOnly = True
      Size = 134
    end
  end
  object SpAddPropDlgAttribute: TMSStoredProc
    StoredProcName = 'Sp_Add_Prop_dlg_Attribute;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL Sp_Add_Prop_dlg_Attribute;1(:p_id, :p_prop' +
        '_dlg_id, :p_name, :p_entity_type_id, :p_caption, :p_pos_left, :p' +
        '_pos_top, :p_width, :p_height, :p_is_multiselect, :p_style)}')
    Left = 712
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'p_prop_dlg_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_name'
        ParamType = ptInput
        Size = 50
      end
      item
        DataType = ftInteger
        Name = 'p_entity_type_id'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_caption'
        ParamType = ptInput
        Size = 50
      end
      item
        DataType = ftInteger
        Name = 'p_pos_left'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_pos_top'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_width'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_height'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_is_multiselect'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_style'
        ParamType = ptInput
        Size = 64
      end>
  end
  object DsExecSql: TDataSource
    DataSet = QuExecSql
    Left = 464
    Top = 472
  end
  object QuExecSql: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO D_REPORT_PRINT_TEMPLATE'
      '  (TEMPLATE, Name, PROP_DLG_ID, is_main)'
      'VALUES'
      '  (:TEMPLATE, :Name, :PROP_DLG_ID, :is_main)'
      'SET :ID = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM D_REPORT_PRINT_TEMPLATE'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE D_REPORT_PRINT_TEMPLATE'
      'SET'
      
        '  TEMPLATE = :TEMPLATE, Name = :Name, PROP_DLG_ID = :PROP_DLG_ID' +
        ', is_main = :is_main'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      
        'SELECT D_REPORT_PRINT_TEMPLATE.TEMPLATE, D_REPORT_PRINT_TEMPLATE' +
        '.Name, D_REPORT_PRINT_TEMPLATE.PROP_DLG_ID, D_REPORT_PRINT_TEMPL' +
        'ATE.is_main FROM D_REPORT_PRINT_TEMPLATE'
      'WHERE D_REPORT_PRINT_TEMPLATE.ID = :ID ')
    Connection = dmDataModule.DB
    FetchRows = 1
    BeforeOpen = QuPrintTemplateBeforeOpen
    BeforePost = QuPrintTemplateBeforePost
    Left = 432
    Top = 472
  end
end
