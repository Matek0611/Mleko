inherited MlekoListAdrInfoPayBanForm: TMlekoListAdrInfoPayBanForm
  Left = 420
  Top = 240
  Width = 996
  Height = 673
  Caption = 
    #1056#1072#1073#1086#1095#1077#1077' '#1084#1077#1089#1090#1086' '#1085#1072#1095#1072#1083#1100#1085#1080#1082#1072' '#1089#1083#1091#1078#1073#1099' '#1101#1082#1086#1085#1086#1084#1080#1095#1077#1089#1082#1086#1081' '#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080' '#1087#1086' '#1083#1080 +
    #1084#1080#1090#1072#1084' '#1086#1090#1075#1088#1091#1079#1082#1080
  KeyPreview = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 615
    Width = 980
    Visible = False
  end
  inherited ToolBar: TToolBar
    Width = 980
    ButtonWidth = 24
    inherited ToolBtnAdd: TToolButton
      Visible = False
    end
    inherited ToolBtnProp: TToolButton
      Left = 24
      Visible = False
    end
    inherited ToolBtnDel: TToolButton
      Left = 48
      Visible = False
    end
    inherited ToolButton4: TToolButton
      Left = 72
    end
    inherited ToolBtnRefresh: TToolButton
      Left = 80
    end
    inherited TBCopyProfile: TToolButton
      Left = 104
    end
    inherited BtnLayot: TToolButton
      Left = 128
    end
    object btn1: TToolButton
      Left = 152
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 31
      Style = tbsSeparator
    end
    object btnOneDate: TToolButton
      Left = 160
      Top = 0
      Action = ActionSetStrem
    end
    object btnControlStopPeriod: TToolButton
      Left = 184
      Top = 0
      Action = ActionControlStopPeriod
    end
    object btnControlAntiStopPeriod: TToolButton
      Left = 208
      Top = 0
      Action = ActionControlAntiStopPeriod
    end
    object btnExportExel: TToolButton
      Left = 232
      Top = 0
      Action = ActionCopyToExcel
      Visible = False
    end
  end
  inherited PageControlTop: TPageControl
    Width = 980
    Height = 86
    inherited TabSheet1: TTabSheet
      inherited FilterPanel: TTargetFilter_Panel
        Width = 972
        Height = 76
        object Flt_Post_buh: TcitDBComboEdit
          Left = 58
          Top = 6
          Width = 231
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
          LLblCaption = #1055#1072#1088#1090#1085#1077#1088
          LLblWidth = 50
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
          TabOrder = 0
          Visible = True
          OnChange = Flt_Post_buhChange
          LocateKey = False
          KeyField = 'PostNo'
          Owner = 'MlekoListAdrInfoPayBanForm'
          EntityCode = 'POST_FOR_BLANK'
          EntityName = 'POST_BUH'
          multiselect = True
          EditStyle = edSelect
          AutoTabControl = True
        end
        object CBDolgAll: TCheckBox
          Left = 4
          Top = 31
          Width = 209
          Height = 17
          Caption = #1055#1086#1082#1072#1099#1074#1072#1090#1100' '#1074#1089#1077' '#1090#1086#1088#1075#1086#1074#1099#1077' '#1090#1086#1095#1082#1080
          TabOrder = 1
          Visible = False
          OnClick = CBDolgAllClick
        end
        object GroupBox1: TGroupBox
          Left = 318
          Top = 1
          Width = 635
          Height = 49
          Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1087#1072#1088#1090#1085#1077#1088#1072' '#1087#1086' '#1074#1089#1077#1084' '#1085#1072#1073#1086#1088#1072#1084' '#1075#1088#1091#1087#1087' '#1090#1086#1074#1072#1088#1086#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object lbl2: TLabel
            Left = 210
            Top = 15
            Width = 210
            Height = 16
            AutoSize = False
            Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100' '#1087#1088#1077#1074#1099#1089#1080#1083#1072' '#1083#1080#1084#1080#1090
            Color = 16752127
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lbl3: TLabel
            Left = 2
            Top = 31
            Width = 210
            Height = 16
            AutoSize = False
            Caption = #1047#1072#1087#1088#1077#1097#1077#1085#1072' '#1085#1072#1074#1089#1077#1075#1076#1072' '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1083#1080#1084#1080#1090#1072
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lbl4: TLabel
            Left = 420
            Top = 31
            Width = 210
            Height = 16
            AutoSize = False
            Caption = #1050#1086#1085#1090#1088#1086#1083#1100' '#1076#1086#1083#1075#1072' '#1086#1090#1082#1083#1102#1095#1077#1085
            Color = clGreen
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Visible = False
          end
          object lbl5: TLabel
            Left = 426
            Top = 15
            Width = 210
            Height = 16
            AutoSize = False
            Caption = #1056#1077#1078#1080#1084' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1081' '#1086#1090#1089#1088#1086#1095#1082#1080
            Color = 8454143
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Visible = False
          end
          object lbl1: TLabel
            Left = 2
            Top = 15
            Width = 210
            Height = 16
            AutoSize = False
            Caption = #1056#1077#1078#1080#1084' '#1087#1077#1088#1080#1086#1076#1072' '#1086#1090#1082#1083#1102#1095#1077#1085#1085#1086#1075#1086' '#1082#1086#1085#1090#1088#1086#1083#1103
            Color = 16744576
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
        end
        object fltDayDelay: TTargetFilter_NumberFilter
          Left = 3
          Top = 51
          Width = 306
          Height = 23
          BorderWidth = 0
          Constraints.MaxHeight = 23
          Constraints.MinHeight = 23
          Constraints.MinWidth = 285
          ParentColor = True
          TabOrder = 3
          TabStop = True
          Visible = False
          a_Disable_ConditionType_Combo = False
          a_a_TableName = 'pdel'
          a_b_FieldName = 'postdaydelay'
          a_b_ServerFieldName = 'postdaydelay'
          a_Label = #1044#1086#1087#1091#1089#1090#1080#1084#1072#1103' '#1086#1089#1090#1088#1086#1095#1082#1072
          a_LabelWidth = 120
          a_ComboWidth = 120
          a_ShortCut = 16435
          a_ParamNames.Strings = (
            'tfSum_0'
            'tfSum_1')
          a_ServerType = tfst_MS_SQL
          a_EditAreaMinWidth = 10
          a_b_FieldName_Txt = 'postdaydelay'
        end
        object fltDayProsr: TTargetFilter_NumberFilter
          Left = 317
          Top = 51
          Width = 306
          Height = 23
          BorderWidth = 0
          Constraints.MaxHeight = 23
          Constraints.MinHeight = 23
          Constraints.MinWidth = 285
          ParentColor = True
          TabOrder = 4
          Visible = False
          a_Disable_ConditionType_Combo = False
          a_a_TableName = 'pdel'
          a_b_FieldName = 'Day_prosr'
          a_b_ServerFieldName = 'Day_prosr'
          a_Label = #1055#1088#1086#1089#1088#1086#1095#1077#1085#1086' '#1076#1085#1077#1081
          a_LabelWidth = 120
          a_ComboWidth = 120
          a_ShortCut = 16435
          a_ParamNames.Strings = (
            'tfSum_0'
            'tfSum_1')
          a_ServerType = tfst_MS_SQL
          a_EditAreaMinWidth = 10
          a_b_FieldName_Txt = 'Day_prosr'
        end
        object cbVip: TCheckBox
          Left = 630
          Top = 55
          Width = 128
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1074#1080#1087' '#1082#1083#1080#1077#1085#1090#1099
          TabOrder = 5
          OnClick = cbVipClick
        end
      end
    end
  end
  inherited PanelGrid: TPanel
    Top = 110
    Width = 980
    Height = 187
    inherited DBGrid: TcitDBGrid
      Width = 974
      Height = 181
      OnGetKey = DBGridGetKey
      MarkShortCut = 115
      OnCellClick = DBGridCellClick
      OnDrawDataCell = DBGridDrawDataCell
    end
  end
  object SplAddr: TcxSplitter [4]
    Left = 0
    Top = 297
    Width = 980
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salBottom
    Control = PGExt
    Visible = False
  end
  object PGExt: TcxPageControl [5]
    Left = 0
    Top = 305
    Width = 980
    Height = 310
    ActivePage = tsFreeNakl
    Align = alBottom
    Style = 10
    TabOrder = 5
    Visible = False
    ClientRectBottom = 310
    ClientRectRight = 980
    ClientRectTop = 19
    object tsFreeNakl: TcxTabSheet
      Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
      ImageIndex = 1
      DesignSize = (
        980
        291)
      object DbGridFreeNakl: TcitDBGrid
        Left = 0
        Top = 0
        Width = 980
        Height = 291
        MarkDisabled = False
        MarkColor = clAqua
        MarkFont.Charset = DEFAULT_CHARSET
        MarkFont.Color = clNavy
        MarkFont.Height = -11
        MarkFont.Name = 'MS Sans Serif'
        MarkFont.Style = []
        LightedFont.Charset = DEFAULT_CHARSET
        LightedFont.Color = clMaroon
        LightedFont.Height = -11
        LightedFont.Name = 'MS Sans Serif'
        LightedFont.Style = []
        LightedColor = clWindow
        DisabledFont.Charset = DEFAULT_CHARSET
        DisabledFont.Color = clSilver
        DisabledFont.Height = -11
        DisabledFont.Name = 'MS Sans Serif'
        DisabledFont.Style = []
        DisabledColor = clWindow
        MultiPress = False
        EnableTitlePress = False
        MarkShortCut = 115
        SaveOnClose = True
        TitleHeight = 17
        TitleColor = clBtnFace
        Align = alClient
        DataSource = DsFreeNakl
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DbGridFreeNaklDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'SUB_NUM'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUB_NUM_ACC'
            Title.Caption = #1053#1086#1084' '#1073#1091#1093
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'doc_date'
            Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'doc_date_acc_id'
            Title.Caption = #1041#1091#1093' '#1076#1072#1090#1072
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Currency'
            Title.Caption = #1042#1072#1083#1102#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TYPE_NAME'
            Title.Caption = #1058#1080#1087' '#1085#1072#1082#1083
            Width = 229
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FREE_SUMMA_ECO'
            Title.Caption = #1044#1086#1083#1075
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SET_ARTICLE_GROUP_NAME'
            Title.Caption = #1053#1072#1073#1086#1088' '#1075#1088#1091#1087#1087
            Width = 230
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OUT_TRADE_NAME'
            Title.Caption = #1040#1076#1088#1077#1089
            Width = 136
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Manager_dept_Name'
            Title.Caption = #1054#1090#1076#1077#1083
            Width = 122
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ACTIVITY_TYPE_ID'
            Title.Caption = #1055#1088#1086#1089#1088#1086#1095#1082#1072
            Visible = True
          end>
      end
      object StringGrid1: TStringGrid
        Left = 1218
        Top = 2
        Width = 66
        Height = 293
        Anchors = [akLeft]
        BorderStyle = bsNone
        ColCount = 1
        DefaultColWidth = 150
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 2
        FixedRows = 0
        ScrollBars = ssNone
        TabOrder = 1
      end
    end
    object tsAddr: TcxTabSheet
      Caption = #1040#1076#1088#1077#1089#1072
      ImageIndex = 0
      object DbGridAddr: TcitDBGrid
        Left = 0
        Top = 29
        Width = 965
        Height = 262
        MarkDisabled = False
        MarkColor = clAqua
        MarkFont.Charset = DEFAULT_CHARSET
        MarkFont.Color = clNavy
        MarkFont.Height = -11
        MarkFont.Name = 'MS Sans Serif'
        MarkFont.Style = []
        LightedFont.Charset = DEFAULT_CHARSET
        LightedFont.Color = clMaroon
        LightedFont.Height = -11
        LightedFont.Name = 'MS Sans Serif'
        LightedFont.Style = []
        LightedColor = clWindow
        DisabledFont.Charset = DEFAULT_CHARSET
        DisabledFont.Color = clSilver
        DisabledFont.Height = -11
        DisabledFont.Name = 'MS Sans Serif'
        DisabledFont.Style = []
        DisabledColor = clWindow
        OnGetKey = DbGridAddrGetKey
        MultiPress = False
        EnableTitlePress = False
        MarkShortCut = 115
        SaveOnClose = True
        TitleHeight = 17
        TitleColor = clBtnFace
        Align = alClient
        DataSource = dsAddr
        PopupMenu = pmAddr
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DbGridAddrDrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SectorName'
            Title.Caption = #1057#1077#1082#1090#1086#1088
            Width = 128
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'address'
            Title.Caption = #1040#1076#1088#1077#1089
            Width = 187
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SotrudName'
            Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OtdelName'
            Title.Caption = #1054#1090#1076#1077#1083
            Width = 91
            Visible = True
          end>
      end
      object tlbAddr: TToolBar
        Left = 0
        Top = 0
        Width = 965
        Height = 29
        Caption = 'tlbAddr'
        Images = dmDataModule.ImageListToolBar
        TabOrder = 1
        object btnRefr: TToolButton
          Left = 0
          Top = 2
          Action = ActionRefreshAddr
        end
        object btnSector: TToolButton
          Left = 23
          Top = 2
          Action = ActionChangeSector
        end
        object btnSotrud: TToolButton
          Left = 46
          Top = 2
          Action = ActionChangeSotrud
        end
      end
    end
    object tsStopControl: TcxTabSheet
      Caption = #1055#1077#1088#1080#1086#1076#1099' '#1079#1072#1087#1088#1077#1090' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1076#1086#1083#1075#1072
      ImageIndex = 2
      inline frmstd_pst_dly_stp_cnt: TMLKListD_POST_DELAY_STOP_CONTROLFrame
        Left = 0
        Top = 0
        Width = 980
        Height = 291
        Align = alClient
        PopupMenu = frmstd_pst_dly_stp_cnt.PopupMenuGrid
        TabOrder = 0
        inherited PanelGrid: TPanel
          Width = 649
          Height = 153
          inherited DBCxGrid: TcxGrid
            Width = 643
            Height = 60
          end
          inherited PageControlTop: TcxPageControl
            Width = 643
            ClientRectRight = 643
            inherited tsDynamicFilter: TcxTabSheet
              inherited DbFltControlMain: TcxFilterControl
                Width = 597
              end
            end
          end
          inherited SplFilter: TcxSplitter
            Width = 643
          end
        end
        inherited PageExt: TcxPageControl
          Top = 187
          Width = 980
          ClientRectRight = 979
          inherited TabSelection: TcxTabSheet
            inherited DBGridSelection: TcitDBGrid
              Width = 963
            end
          end
        end
        inherited SplitterExt: TcxSplitter
          Top = 179
          Width = 980
        end
        inherited PageSettings: TcxPageControl
          Height = 153
          ClientRectBottom = 152
          inherited TabProp2: TcxTabSheet
            inherited FrameProp: TValueListEditor
              Height = 105
            end
          end
        end
        inherited PageDetails: TcxPageControl
          Left = 876
          Height = 153
          ClientRectBottom = 152
          inherited TabDetails1: TcxTabSheet
            inherited GridDetails: TcxDBVerticalGrid
              Height = 131
            end
          end
        end
        inherited SplitterDetails: TcxSplitter
          Left = 868
          Height = 153
        end
        inherited SplitterSettings: TcxSplitter
          Height = 153
        end
        inherited BarDockControlCommon: TdxBarDockControl
          Width = 980
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
        end
        inherited VTSelection: TVirtualTable
          Data = {03000000000000000000}
        end
        inherited QuD_POST_DELAY_STOP_CONTROL: TMSQuery
          MasterSource = DS
          ParamData = <
            item
              DataType = ftUnknown
              Name = 'ID'
            end>
        end
      end
    end
    object tsInfo: TcxTabSheet
      Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086' '#1076#1083#1103' '#1076#1080#1088#1077#1082#1090#1086#1088#1072' '#1089#1083#1091#1078#1073#1099' '#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080
      ImageIndex = 3
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 925
        Height = 221
        Align = alClient
        Caption = 
          #1054#1089#1085#1086#1074#1085#1099#1077' '#1090#1077#1088#1084#1080#1085#1099#13#10#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1086#1090#1089#1088#1086#1095#1082#1072': - '#1090#1086#1090' "'#1087#1086#1093#1086#1076'" '#1082#1086#1090#1086#1088#1086#1075 +
          #1086' '#1090#1072#1082' '#1074#1089#1077#1084' '#1085#1077' '#1093#1074#1072#1090#1072#1077#1090'. '#1060#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1099#1081'. '#1052#1077#1085#1103#1077#1090#1089#1103' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077' '#1087#1072#1088 +
          #1090#1085#1077#1088#1086#1074'. '#1053#1077' '#1080#1089#1095#1077#1079#1072#1077#1090' '#1089#1086' '#1074#1088#1077#1084#1077#1085#1077#1084'.'#13#10#1055#1088#1077#1074#1099#1096#1077#1085#1080#1077' '#1083#1080#1084#1080#1090#1072' ('#1088#1086#1079#1086#1074#1099#1081'): '#1054 +
          #1089#1085#1086#1074#1085#1072#1103' '#1086#1090#1089#1088#1086#1095#1082#1072'+'#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1086#1090#1089#1088#1086#1095#1082#1072' '#1084#1077#1085#1100#1096#1077' '#1055#1088#1086#1089#1088#1086#1095#1082#1080' '#1083#1080#1084#1080#1090#1072 +
          ' '#1074' '#1076#1085#1103#1093#13#10#1056#1072#1079#1088#1077#1096#1077#1085#1099#1081' '#1087#1077#1088#1080#1086#1076' '#1086#1090#1075#1088#1091#1079#1082#1080': '#1047#1072#1082#1083#1072#1076#1082#1072' , '#1087#1077#1088#1080#1086#1076#1099' '#1079#1072#1087#1088#1077#1090#1072' ' +
          #1082#1086#1085#1090#1088#1086#1083#1103'. '#1055#1077#1088#1080#1086#1076' '#1074#1088#1077#1084#1077#1085#1080' '#1074' '#1090#1077#1095#1077#1085#1080#1080' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1087#1072#1088#1090#1085#1077#1088#1091' '#1088#1072#1079#1088#1077#1096#1072#1077#1090#1089#1103 +
          ' '#1086#1090#1075#1088#1091#1079#1082#1072'. '#13#10'                                                   ' +
          '  '#1042#1086#1079#1084#1086#1078#1077#1085' '#1074#1072#1088#1080#1072#1085#1090' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1087#1077#1088#1080#1086#1076#1086#1074' ('#1085#1072#1087#1088#1084#1077#1088' '#1085#1072' '#1073#1091#1076#1091#1097#1091#1102' '#1089#1091#1073#1073#1086 +
          #1090#1091' '#1074#1086#1089#1082#1088#1077#1089#1077#1085#1100#1077')'#13#10#1056#1077#1078#1080#1084' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1081' '#1086#1090#1089#1088#1086#1095#1082#1080': '#1082#1083#1080#1077#1085#1090' '#1074#1099#1096#1077#1083' '#1079#1072' ' +
          #1086#1089#1085#1086#1074#1085#1086#1081' '#1083#1080#1084#1080#1090' '#1085#1086' '#1084#1086#1078#1077#1090' '#1086#1090#1075#1088#1091#1078#1072#1090#1100#1089#1103' '#1087#1086' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1084#1091' ("'#1087#1086#1093#1086#1076#1091'"' +
          ')'#13#10#13#10#1043#1086#1088#1103#1095#1080#1077' '#1082#1083#1072#1074#1080#1096#1080':'#13#10'F4 - '#1042#1099#1076#1077#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100#13#10'* - '#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077' '#1079#1072 +
          #1087#1080#1089#1080#13#10#13#10#1053#1072#1079#1072#1085#1072#1095#1077#1085#1080#1077' '#1082#1085#1086#1087#1086#1082':'#13#10#1047#1072#1084#1086#1082' - '#1079#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1082#1083#1080#1077#1085#1090#1072' '#1085#1072#1074#1089#1077 +
          #1075#1076#1072' '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1074#1089#1077#1093' '#1092#1072#1082#1090#1086#1088#1086#1074#13#10#1057#1074#1077#1090#1086#1092#1086#1088' - '#1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1086#1090#1075#1088#1091#1079#1082#1091' '#1085#1072#1074#1089#1077 +
          #1075#1076#1072'  '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1074#1089#1077#1093' '#1092#1072#1082#1090#1086#1088#1086#1074#13#10#1056#1086#1078#1080#1094#1072' - '#1044#1086#1073#1072#1074#1080#1090#1100'  '#1087#1077#1088#1080#1086#1076' '#1089' '#1090#1077#1082#1091#1097#1077 +
          #1075#1086' '#1076#1085#1103' '#1087#1086' '#1090#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100' '#1076#1083#1103' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1087#1072#1088#1090#1077#1085#1088#1091' ('#1090#1077#1082#1091#1097#1072#1103' '#1080#1083#1080' '#1074#1099#1076#1077#1083#1077 +
          #1085#1085#1072#1103' '#1079#1072#1087#1080#1089#1100')'#13#10#1050#1091#1089#1086#1082' '#1090#1091#1072#1083#1077#1090#1085#1086#1081' '#1073#1091#1084#1072#1075#1080' '#1089' '#1087#1083#1102#1089#1086#1084' - '#1058#1086' '#1078#1077' '#1095#1090#1086' '#1080' '#1088#1086#1078#1080 +
          #1094#1072', '#1090#1086#1083#1100#1082#1086' '#1085#1072' '#1079#1072#1076#1072#1085#1085#1099#1081' '#1087#1077#1088#1080#1086#1076' ('#1090#1077#1082#1091#1097#1072#1103' '#1080#1083#1080' '#1074#1099#1076#1077#1083#1077#1085#1085#1072#1103' '#1079#1072#1087#1080#1089#1100')'#13#10#1050 +
          #1091#1089#1086#1082' '#1090#1091#1072#1083#1077#1090#1085#1086#1081' '#1073#1091#1084#1072#1075#1080' '#1089' '#1084#1080#1085#1091#1089#1086#1084' - '#1054#1090#1084#1077#1085#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1088#1072#1079#1088#1077#1096#1077#1085#1085#1099#1093' '#1086 +
          #1090#1075#1088#1091#1079#1086#1082' ('#1090#1077#1082#1091#1097#1072#1103' '#1080#1083#1080' '#1074#1099#1076#1077#1083#1077#1085#1085#1072#1103' '#1079#1072#1087#1080#1089#1100')'
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
  end
  inherited ComponentProps: TcitComponentProps [6]
    Properties.Strings = (
      'pnlAddr.Height')
  end
  inherited ActionList: TActionList [7]
    Images = dmDataModule.ImageListToolBar
    Left = 372
    object ActionCopyToExcel: TAction
      Category = 'View'
      Caption = 'ActionCopyToExcel'
      ImageIndex = 14
      OnExecute = ActionCopyToExcelExecute
    end
    object ActionChangeSector: TAction
      Category = 'Item'
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1089#1077#1082#1090#1086#1088
      Hint = #1057#1084#1077#1085#1080#1090#1100' '#1089#1077#1082#1090#1086#1088
      ImageIndex = 37
      OnExecute = ActionChangeSectorExecute
    end
    object ActionChangeAddress: TAction
      Category = 'Item'
      Caption = 'ActionChangeAddress'
      ImageIndex = 10
    end
    object ActionChangeSotrud: TAction
      Category = 'Item'
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      Hint = #1057#1084#1077#1085#1080#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      ImageIndex = 7
      OnExecute = ActionChangeSotrudExecute
    end
    object ActionChangeOtdel: TAction
      Category = 'Item'
      Caption = 'ActionChangeOtdel'
      ImageIndex = 27
    end
    object ActionSetStrem: TAction
      Category = 'Item'
      Caption = 'ActionSetStrem'
      Hint = #1056#1072#1079#1088#1077#1096#1080#1090#1100' '#1086#1090#1075#1088#1091#1079#1082#1091' '#1085#1072' 1 '#1076#1077#1085#1100
      ImageIndex = 26
      OnExecute = ActionSetStremExecute
    end
    object ActionSetStop: TAction
      Category = 'Item'
      Caption = 'ActionSetStop'
      Hint = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1086#1090#1075#1088#1091#1079#1082#1091' '#1085#1072#1074#1089#1077#1075#1076#1072
      ImageIndex = 17
      OnExecute = ActionSetStopExecute
    end
    object ActionStopCheckPost: TAction
      Category = 'Item'
      Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091' '#1086#1090#1089#1088#1086#1095#1082#1080' '#1076#1086#1083#1075#1072
      Hint = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1087#1088#1086#1074#1077#1088#1082#1091' '#1086#1090#1089#1088#1086#1095#1082#1080' '#1076#1086#1083#1075#1072
      ImageIndex = 44
      OnExecute = ActionStopCheckPostExecute
    end
    object ActionSetExtDelay: TAction
      Category = 'Item'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1089#1088#1086#1095#1082#1091' ('#1076#1085#1080')'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1090#1089#1088#1086#1095#1082#1091' ('#1076#1085#1080')'
      ImageIndex = 47
      OnExecute = ActionSetExtDelayExecute
    end
    object ActionRefreshAddr: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1072#1076#1088#1077#1089
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1072#1076#1088#1077#1089
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionRefreshAddrExecute
    end
    object ActionControlStopPeriod: TAction
      Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1082#1086#1085#1090#1088#1086#1083#1100' '#1076#1086#1083#1075#1072' '#1085#1072' '#1087#1077#1088#1080#1086#1076
      Hint = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1082#1086#1085#1090#1088#1086#1083#1100' '#1076#1086#1083#1075#1072' '#1085#1072' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 36
      OnExecute = ActionControlStopPeriodExecute
    end
    object ActionControlAntiStopPeriod: TAction
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1082#1086#1085#1090#1088#1086#1083#1100' '#1076#1086#1083#1075#1072' '#1085#1072' '#1087#1077#1088#1080#1086#1076
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1082#1086#1085#1090#1088#1086#1083#1100' '#1076#1086#1083#1075#1072' '#1085#1072' '#1087#1077#1088#1080#1086#1076
      ImageIndex = 34
      OnExecute = ActionControlAntiStopPeriodExecute
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder [8]
    Select.Strings = (
      ' pdel.id '
      ',a.name as PostName'
      ',a.PostNo'
      ',pdel.SET_ARTICLE_GROUP_NAME as Set_Name'
      ',pdel.SET_ARTICLE_GROUP_ID'
      ',pdel.PayBan'
      ',isnull((select SUMMA_ECO '
      '          from V_Dolg_ForPayBan v'
      '           where v.PostNo = a.PostNo'
      #9'     and v.SET_ARTICLE_GROUP_ID = pdel.set_article_group_id'
      #9'     and v.buh = pdel.buh),0) as SUMMA_ECO'
      
        ',(select Buh_type_name from d_buh_type where buh=pdel.BUH) as Bu' +
        'h_type_name'
      ',DateNakl as FirstDateDolg'
      ',pdel.CurDateNakl'
      ',pdel.is_enable_stop_period'
      ',pdel.is_stop'
      ',pdel.Currency')
    From.Strings = (
      'post a INNER JOIN (select v2.id'
      '                          ,v2.DateNakl'
      '                          ,v2.SET_ARTICLE_GROUP_NAME'
      '                          ,v2.SET_ARTICLE_GROUP_ID'
      '                          ,v2.BUH'
      '                          ,v2.PayBan'
      '                          ,v2.PostNo'
      '                          ,v2.CurDateNakl'
      '                          ,v2.is_all_group'
      '                          ,v2.is_stop'
      '                          ,is_enable_stop_period'
      '                          ,Currency'
      '                          from (select v1.id'
      '                          ,v1.DateNakl'
      '                          ,v1.CurDateNakl'
      '                          ,v1.SET_ARTICLE_GROUP_NAME'
      '                          ,v1.SET_ARTICLE_GROUP_ID'
      '                          ,v1.BUH'
      '                          ,v1.PayBan'
      '                          ,v1.PostNo'
      '                          ,v1.is_all_group'
      '                          ,v1.is_stop'
      '                          ,is_enable_stop_period'
      '                          ,Currency'
      
        '                          from dbo.fu_first_free_naklPayBan(:Dat' +
        'eNakl,-1,-1) v1'
      '                          ) v2) pdel on pdel.PostNo=a.PostNo'
      '')
    Where.Strings = (
      '(a.PostNo in (select cast(Param_Value as int)'
      '                      from e_Session_Params'
      '                     where Userno = <USERNO>'
      '                       and Owner_Name = <OWNERNAME>'
      '                       and Param_Name = '#39'FLT_POST_BUH'#39
      
        '                       and Spid = <SPID>) or :is_all_post_buh = ' +
        '1)'
      ''
      'and (a.Vip = 1 or :is_Vip = 0)')
    OrderBy.Strings = (
      'a.PostName,a.Set_Name,a.Buh_type_name')
    OnGetParams = SQLBuilderGetParams
    KeyFields.Strings = (
      'ID')
  end
  inherited Query: TMSQuery [9]
    SQLInsert.Strings = (
      'print 1')
    SQLUpdate.Strings = (
      'UPDATE L_Post_Set_ArtGroup_PayBan'
      'SET  PayBan = :PayBan'
      'WHERE'
      '  ID = :ID')
    SQL.Strings = (
      'SELECT  pdel.id '
      ',a.name as PostName'
      ',a.PostNo'
      
        ',(select isnull(max(1),0) from l_firm_prop where postNo=a.PostNo' +
        ' and prop_id=14) as is_stop'
      ',pdel.SET_ARTICLE_GROUP_NAME as Set_Name'
      ',pdel.SET_ARTICLE_GROUP_ID'
      ',pdel.payban'
      ',dolg.SUMMA_ECO'
      
        ',(select Buh_type_name from d_buh_type where buh=pdel.BUH) as Bu' +
        'h_type_name'
      ',DateNakl as FirstDateDolg'
      
        ',case when (sc.active = 1 and GETDATE() between sc.date_beg and ' +
        'sc.date_end) then 1 else 0 end as is_enable_stop_period'
      ',sc.date_end'
      ',pdel.Currency'
      ' FROM post a INNER JOIN (select id'
      '                          ,DateNakl'
      '                          ,PayBan'
      '                          ,SET_ARTICLE_GROUP_NAME'
      
        '                          ,SET_ARTICLE_GROUP_ID_PayBan as SET_AR' +
        'TICLE_GROUP_ID'
      '                          ,BUH'
      '                          ,PostNo_PayBan as PostNo'
      '                          ,Currency'
      
        '                          from v_first_free_naklPayBan) pdel on ' +
        'pdel.PostNo=a.PostNo'
      '             inner join (SELECT SUM(v.SUMMA_ECO) as SUMMA_ECO'
      '                              , v.CONTRACTOR_ACC_ID'
      '                              , v.SET_ARTICLE_GROUP_ID'
      '                              , v.Buh'
      '                          FROM   v_dhead v'
      '                           WHERE  v.free_summa_eco <> 0'
      '                             and v.type_id = 12'
      
        '                             and v.our_firm_id=(select PostNo fr' +
        'om D_Our_Firm)'
      '                         group by  v.CONTRACTOR_ACC_ID'
      '                                 , v.SET_ARTICLE_GROUP_ID'
      
        '                                 , v.Buh) dolg on dolg.CONTRACTO' +
        'R_ACC_ID = pdel.PostNo and dolg.SET_ARTICLE_GROUP_ID = pdel.SET_' +
        'ARTICLE_GROUP_ID'
      
        '                                                                ' +
        '                       and dolg.buh = pdel.buh'
      
        '             left join L_Post_Set_ArtGroup_PayBan l on l.PostNo_' +
        'PayBan = pdel.PostNo and l.Set_Article_Group_Id_PayBan = pdel.SE' +
        'T_ARTICLE_GROUP_ID'
      
        '                                                                ' +
        '                     and l.Buh = pdel.buh'
      
        '             left join d_post_payBan_stop_control sc on sc.L_Pos' +
        't_Set_ArtGroup_PayBan_Id = l.id'
      '                       '
      ' ORDER BY PostName,Set_Name,Buh_type_name')
    Options.CursorUpdate = False
    Options.StrictUpdate = False
    Left = 472
  end
  inherited DS: TDataSource [10]
  end
  inherited spCopyProfile: TMSStoredProc
    Left = 200
    Top = 144
  end
  object spChangeSector: TMSStoredProc
    StoredProcName = 'sp_ChangeSector'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_ChangeSector (:p_id, :p_sector_id)}')
    Left = 72
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'p_id'
        ParamType = ptInput
        Size = 64
      end
      item
        DataType = ftInteger
        Name = 'p_sector_id'
        ParamType = ptInput
      end>
  end
  object spChangeSotrud: TMSStoredProc
    StoredProcName = 'sp_ChangeSotrud;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_ChangeSotrud;1(:p_id, :p_sotrudNo)}')
    Left = 120
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'p_id'
        ParamType = ptInput
        Size = 64
      end
      item
        DataType = ftInteger
        Name = 'p_sotrudNo'
        ParamType = ptInput
      end>
  end
  object spSetFirmProp: TMSStoredProc
    StoredProcName = 'sp_SetFirmProp'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_SetFirmProp (:p_postNo, :p_PropId, :p_V' +
        'alue)}')
    Left = 160
    Top = 144
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
  object QuAddr: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select '
      'sa.id as ID'
      ',a.PostNo'
      ',r.Name as SectorName'
      ',a.address'
      ',s.SotrudName'
      ',o.OtdelName'
      ',a.AddressNo'
      ',a.MarschrutNo'
      ',s.SotrudNo'
      ',s.SotrudOtdel as OtdelNo'
      ',a.ID as AddressPost_id'
      'from addressPost a '
      ' inner join d_Sotrud_Address sa on a.id=AddressPost_id'
      ' left outer join Sotrud s on sa.SotrudNo=s.SotrudNo'
      ' left outer join d_sector_response r on a.MarschrutNo=r.id'
      ' left outer join VidOtdel o on s.SotrudOtdel=o.OtdelNo')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    MasterSource = DS
    MasterFields = 'PostNo'
    DetailFields = 'PostNo'
    Left = 420
    Top = 428
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'PostNo'
        ParamType = ptInput
        Value = 4324
      end>
  end
  object dsAddr: TDataSource
    DataSet = QuAddr
    Left = 468
    Top = 428
  end
  object pmAddr: TPopupMenu
    Left = 280
    Top = 428
    object MenuItem1: TMenuItem
      Action = ActionChangeSector
    end
    object MenuItem2: TMenuItem
      Action = ActionChangeSotrud
    end
    object MenuItem3: TMenuItem
      Action = ActionRefreshAddr
    end
  end
  object QuFreeNakl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT v.contractor_id,'
      '       v.SUB_NUM,'
      '       v.SUB_NUM_ACC,       '
      '       v.doc_date,'
      '       v.doc_date_acc_id,'
      '       v.TYPE_NAME,'
      '       v.FREE_SUMMA_ECO,'
      '       v.SET_ARTICLE_GROUP_NAME,'
      '       v.SET_ARTICLE_GROUP_ID,'
      '       v.OUT_TRADE_NAME,'
      '       v.Manager_dept_Name,'
      '       v.ACTIVITY_TYPE_ID,'
      '       v.Currency'
      'FROM   v_dhead v'
      'WHERE  v.free_summa_eco <> 0'
      'and v.type_id = 12'
      'and v.our_firm_id=490'
      'Order By doc_date')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    MasterSource = DS
    MasterFields = 'PostNo'
    DetailFields = 'contractor_id'
    Left = 412
    Top = 332
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'PostNo'
        ParamType = ptInput
        Value = 4324
      end>
  end
  object DsFreeNakl: TDataSource
    DataSet = QuFreeNakl
    Left = 460
    Top = 332
  end
  object DSD_POST_DELAY_STOP_CONTROL: TDataSource
    Left = 614
    Top = 218
  end
  object QuStopControl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'begin'
      'declare'
      '@L_Post_Set_ArtGroup_PayBan_Id int'
      ',@USERNO int'
      ',@DATE_BEG SmallDateTime'
      ',@DATE_END SmallDateTime'
      ',@Description Char(100)'
      ''
      'set @L_Post_Set_ArtGroup_PayBan_Id = :p1_L_POST_SET_DELAY_ID'
      'set @USERNO = :p2_USER_ID'
      'set @DATE_BEG  = :p3_DATE_BEG'
      'set @DATE_END  = :p4_DATE_END'
      ''
      ''
      'delete from d_post_payBan_stop_control '
      
        'where L_Post_Set_ArtGroup_PayBan_Id = @L_Post_Set_ArtGroup_PayBa' +
        'n_Id  '
      '  and DATE_BEG=@DATE_BEG '
      '  and DATE_END=@DATE_END'
      ''
      
        'INSERT INTO d_post_payBan_stop_control (L_Post_Set_ArtGroup_PayB' +
        'an_Id, USERNO, DATE_BEG, DATE_END, ACTIONDATE, ACTIVE, DESCRIPTI' +
        'ON) '
      
        ' VALUES (@L_Post_Set_ArtGroup_PayBan_Id, @USERNO, @DATE_BEG, @DA' +
        'TE_END, GetDate(),1,@Description)'
      ''
      'end')
    Left = 608
    Top = 292
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p1_L_POST_SET_DELAY_ID'
      end
      item
        DataType = ftUnknown
        Name = 'p2_USER_ID'
      end
      item
        DataType = ftUnknown
        Name = 'p3_DATE_BEG'
      end
      item
        DataType = ftUnknown
        Name = 'p4_DATE_END'
      end>
  end
  object QuStartControl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'update d_post_payBan_stop_control set active = 0 where L_Post_Se' +
        't_ArtGroup_PayBan_Id = :p1_L_POST_SET_DELAY_ID and active=1')
    Left = 640
    Top = 292
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p1_L_POST_SET_DELAY_ID'
      end>
  end
  object ApplicationEvents1: TApplicationEvents
    OnMessage = ApplicationEvents1Message
    Left = 160
    Top = 396
  end
end
