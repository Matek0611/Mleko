inherited MLekoListAdrInfoNewForm: TMLekoListAdrInfoNewForm
  Left = 265
  Top = 225
  Width = 1431
  Height = 749
  Caption = #1056#1072#1073#1086#1095#1077#1077' '#1084#1077#1089#1090#1086' '#1085#1072#1095#1072#1083#1100#1085#1080#1082#1072' '#1089#1083#1091#1078#1073#1099' '#1101#1082#1086#1085#1086#1084#1080#1095#1077#1089#1082#1086#1081' '#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080' '#1053#1086#1074#1086#1077
  KeyPreview = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 691
    Width = 1415
    Visible = False
  end
  inherited ToolBar: TToolBar
    Width = 1415
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
    object ToolButton6: TToolButton
      Left = 152
      Top = 0
      Action = ActionCopyToExcel
    end
    object ToolButton7: TToolButton
      Left = 176
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 13
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 184
      Top = 0
      Action = ActionSetStop
      Caption = 'repeat'
    end
    object ToolButton1: TToolButton
      Left = 208
      Top = 0
      Action = ActionStopCheckPost
    end
    object btn1: TToolButton
      Left = 232
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 31
      Style = tbsSeparator
    end
    object btnOneDate: TToolButton
      Left = 240
      Top = 0
      Action = ActionSetStrem
    end
    object btnControlStopPeriod: TToolButton
      Left = 264
      Top = 0
      Action = ActionControlStopPeriod
    end
    object btnControlAntiStopPeriod: TToolButton
      Left = 288
      Top = 0
      Action = ActionControlAntiStopPeriod
    end
    object bt: TToolButton
      Left = 312
      Top = 0
      Hint = #1057#1085#1103#1090#1100' '#1089#1088#1077#1079' '#1089' '#1076#1072#1085#1085#1099#1093' '#1085#1072' '#1076#1072#1085#1085#1099#1081' '#1084#1086#1084#1077#1085#1090
      Caption = 'bt'
      ImageIndex = 28
      OnClick = btClick
    end
  end
  inherited PageControlTop: TPageControl
    Width = 1415
    Height = 65
    inherited TabSheet1: TTabSheet
      inherited FilterPanel: TTargetFilter_Panel
        Width = 1407
        Height = 55
        object Label9: TLabel
          Left = 824
          Top = 11
          Width = 171
          Height = 13
          Caption = #1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1076#1072#1090#1072'/'#1089#1086#1079#1076#1072#1085#1080#1077' '#1089#1088#1077#1079#1072':'
        end
        object Flt_Post_buh_New: TcitDBComboEdit
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
          LocateKey = False
          KeyField = 'PostNo'
          Owner = 'MLekoListAdrInfoNewForm'
          EntityCode = 'POST_FOR_BLANK'
          EntityName = 'POST_BUH'
          multiselect = True
          EditStyle = edSelect
          AutoTabControl = True
        end
        object CBDolgAll: TCheckBox
          Left = 4
          Top = 31
          Width = 309
          Height = 17
          Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1074#1089#1077' '#1090#1086#1088#1075#1086#1074#1099#1077' '#1090#1086#1095#1082#1080
          TabOrder = 1
          OnClick = CBDolgAllClick
        end
        object fltDayProsr: TTargetFilter_NumberFilter
          Left = 317
          Top = 6
          Width = 306
          Height = 23
          BorderWidth = 0
          Constraints.MaxHeight = 23
          Constraints.MinHeight = 23
          Constraints.MinWidth = 285
          ParentColor = True
          TabOrder = 2
          OnEnter = fltDayProsrEnter
          a_Disable_ConditionType_Combo = False
          a_b_FieldName = 'Day_prosr_group'
          a_b_ServerFieldName = 'Day_prosr_group'
          a_Label = #1055#1088#1086#1089#1088#1086#1095#1077#1085#1086' '#1076#1085#1077#1081
          a_LabelWidth = 120
          a_ComboWidth = 120
          a_ShortCut = 16435
          a_ParamNames.Strings = (
            'tfSum_0'
            'tfSum_1')
          a_ServerType = tfst_MS_SQL
          a_EditAreaMinWidth = 10
          a_b_FieldName_Txt = 'Day_prosr_group'
        end
        object cbShowNakl: TCheckBox
          Left = 628
          Top = 8
          Width = 193
          Height = 17
          Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1087#1077#1088#1077#1089#1095#1077#1090' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
          TabOrder = 3
          OnClick = cbShowNaklClick
        end
        object cbVisiblePostStop: TCheckBox
          Left = 1085
          Top = 32
          Width = 289
          Height = 17
          Caption = #1053#1077' '#1074#1099#1074#1086#1076#1080#1090#1100' '#1087#1072#1088#1090#1085#1077#1088#1086#1074' '#1089' '#1079#1072#1087#1088#1077#1097#1077#1085#1085#1086#1081' '#1086#1090#1075#1088#1091#1079#1082#1086#1081
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = cbVisiblePostStopClick
        end
        object cbNaklOverLimit: TCheckBox
          Left = 627
          Top = 32
          Width = 233
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1077' '#1087#1088#1077#1074#1099#1096#1072#1102#1097#1080#1077' '#1083#1080#1084#1080#1090
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnClick = cbNaklOverLimitClick
        end
        object btShowListMinusPostForListAdrInfo: TButton
          Left = 315
          Top = 30
          Width = 217
          Height = 25
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1085#1077' '#1091#1095#1080#1090#1099#1074#1072#1077#1084#1099#1093' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
          TabOrder = 6
          OnClick = btShowListMinusPostForListAdrInfoClick
        end
        object cbVivibleMinusPost: TCheckBox
          Left = 861
          Top = 32
          Width = 215
          Height = 17
          Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1085#1077' '#1091#1095#1080#1090#1099#1074#1072#1077#1084#1099#1093' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
          TabOrder = 7
          OnClick = cbVivibleMinusPostClick
        end
        object DBEdit1: TDBEdit
          Left = 1000
          Top = 8
          Width = 121
          Height = 21
          DataField = 'LastDateSlice'
          DataSource = dsLastDateDataSlice
          ReadOnly = True
          TabOrder = 8
        end
        object cbVip: TCheckBox
          Left = 1133
          Top = 9
          Width = 130
          Height = 17
          Caption = #1058#1086#1083#1100#1082#1086' '#1074#1080#1087' '#1082#1083#1080#1077#1085#1090#1099
          TabOrder = 9
          OnClick = cbVipClick
        end
      end
    end
  end
  inherited PanelGrid: TPanel
    Top = 89
    Width = 1415
    Height = 279
    inherited DBGrid: TcitDBGrid
      Width = 1409
      Height = 273
      OnGetKey = DBGridGetKey
      MarkShortCut = 115
      OnCellClick = DBGridCellClick
      OnDrawDataCell = DBGridDrawDataCell
    end
  end
  object SplAddr: TcxSplitter [4]
    Left = 0
    Top = 368
    Width = 1415
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salBottom
    Control = PGExt
  end
  object PGExt: TcxPageControl [5]
    Left = 0
    Top = 376
    Width = 1415
    Height = 315
    ActivePage = tsFreeNakl
    Align = alBottom
    Style = 10
    TabOrder = 5
    ClientRectBottom = 315
    ClientRectRight = 1415
    ClientRectTop = 19
    object tsFreeNakl: TcxTabSheet
      Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
      ImageIndex = 1
      DesignSize = (
        1415
        296)
      object DbGridFreeNakl: TcitDBGrid
        Left = 0
        Top = 0
        Width = 1415
        Height = 296
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
            Width = 50
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
            FieldName = 'Buh_Type'
            Title.Caption = #1041#1091#1093'. '#1090#1080#1087
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
        Left = 1282
        Top = 5
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
        Width = 1415
        Height = 267
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
        Width = 1415
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
        Width = 1415
        Height = 296
        Align = alClient
        PopupMenu = frmstd_pst_dly_stp_cnt.PopupMenuGrid
        TabOrder = 0
        inherited PanelGrid: TPanel
          Width = 1084
          Height = 158
          inherited DBCxGrid: TcxGrid
            Width = 1078
            Height = 65
            inherited DBCxGridDBTableView1: TcxGridDBTableView
              inherited DBCxGridDBTableView1Day_Prosr: TcxGridDBColumn
                Visible = False
              end
            end
          end
          inherited PageControlTop: TcxPageControl
            Width = 1078
            ClientRectRight = 1078
            inherited tsDynamicFilter: TcxTabSheet
              inherited DbFltControlMain: TcxFilterControl
                Width = 1032
              end
            end
          end
          inherited SplFilter: TcxSplitter
            Width = 1078
          end
        end
        inherited PageExt: TcxPageControl
          Top = 192
          Width = 1415
          ClientRectRight = 1414
          inherited TabSelection: TcxTabSheet
            inherited DBGridSelection: TcitDBGrid
              Width = 1413
            end
          end
        end
        inherited SplitterExt: TcxSplitter
          Top = 184
          Width = 1415
        end
        inherited PageSettings: TcxPageControl
          Height = 158
          ClientRectBottom = 157
          inherited TabProp2: TcxTabSheet
            inherited FrameProp: TValueListEditor
              Height = 110
              ColWidths = (
                120
                66)
            end
          end
        end
        inherited PageDetails: TcxPageControl
          Left = 1311
          Height = 158
          ClientRectBottom = 157
          inherited TabDetails1: TcxTabSheet
            inherited GridDetails: TcxDBVerticalGrid
              Height = 136
            end
          end
        end
        inherited SplitterDetails: TcxSplitter
          Left = 1303
          Height = 158
        end
        inherited SplitterSettings: TcxSplitter
          Height = 158
        end
        inherited BarDockControlCommon: TdxBarDockControl
          Width = 1415
        end
        inherited SaveDialog: TSaveDialog
          Top = 205
        end
        inherited OpenDialog: TOpenDialog
          Top = 213
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
        inherited PopMenuGRID: TcxGridPopupMenu
          Left = 72
          Top = 205
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
      object cbShowOnlyActive: TCheckBox
        Left = 495
        Top = 5
        Width = 161
        Height = 17
        Caption = #1042#1099#1074#1077#1089#1090#1080' '#1090#1086#1083#1100#1082#1086' '#1072#1082#1090#1080#1074#1085#1099#1077
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = cbShowOnlyActiveClick
      end
    end
    object tsInfo: TcxTabSheet
      Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086' '#1076#1083#1103' '#1076#1080#1088#1077#1082#1090#1086#1088#1072' '#1089#1083#1091#1078#1073#1099' '#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080
      ImageIndex = 3
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 1415
        Height = 296
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
      object Label7: TLabel
        Left = 0
        Top = 223
        Width = 355
        Height = 13
        Caption = #1051#1080#1089#1090#1080#1082' '#1089' '#1090#1088#1077#1084#1103' '#1090#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082#1072#1084#1080' - '#1057#1086#1079#1076#1072#1085#1080#1103' '#1089#1088#1077#1079#1072' '#1076#1072#1085#1085#1099#1093' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox2: TGroupBox
        Left = -2
        Top = 240
        Width = 635
        Height = 49
        Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1087#1072#1088#1090#1085#1077#1088#1072' '#1087#1086' '#1074#1089#1077#1084' '#1085#1072#1073#1086#1088#1072#1084' '#1075#1088#1091#1087#1087' '#1090#1086#1074#1072#1088#1086#1074
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label2: TLabel
          Left = 212
          Top = 31
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
        object Label3: TLabel
          Left = 2
          Top = 31
          Width = 210
          Height = 16
          AutoSize = False
          Caption = #1047#1072#1087#1088#1077#1097#1077#1085#1072' '#1085#1072#1074#1089#1077#1075#1076#1072' '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1086#1090#1089#1088#1086#1095#1077#1082
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label4: TLabel
          Left = 212
          Top = 15
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
        end
        object Label5: TLabel
          Left = 2
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
        end
        object Label6: TLabel
          Left = 422
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
    end
    object cxTabSheet1: TcxTabSheet
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1073#1083#1086#1082#1080#1088#1086#1074#1086#1082' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1090#1086#1074#1072#1088#1072
      ImageIndex = 4
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1415
        Height = 33
        Align = alTop
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 0
        Top = 33
        Width = 1415
        Height = 263
        Align = alClient
        TabOrder = 1
        object DBGridEhHistoriBanShipment: TDBGridEh
          Left = 1
          Top = 1
          Width = 1413
          Height = 261
          Align = alClient
          DataSource = dsHistoriBanShipment
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
        end
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
      '*')
    From.Strings = (
      'FirstFreeNaklTmp a')
    Where.Strings = (
      '(a.PostNo in (select cast(Param_Value as int)'
      '               from e_Session_Params'
      '                where Userno = <USERNO>'
      '                  and Owner_Name = <OWNERNAME>'
      '                  and Param_Name = '#39'FLT_POST_BUH_NEW'#39
      '                  and Spid = <SPID>) or :is_all_post_buh = 1)'
      'and (a.KolDayDolg > isnull(day_Delay_Main,0)'
      '     or :is_all_dolg = 1 '
      '     or is_stop = 1 '
      '     or is_stop_check = 1'
      '     or is_enable_stop_period = 1)'
      'and (a.is_stop = 0 or :is_all_post = 0)'
      'and (a.PostNo not in (select PostNo '
      '                       from ListMinusPostForListAdrInfo '
      
        '                        where CheckMinus = 1) or (:is_not_minus_' +
        'post = 1))'
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
      'UPDATE L_POST_SET_ARTGROUP_DELAY'
      'SET  DAY_DELAY_EXT = :DAY_DELAY_EXT'
      'WHERE'
      '  ID = :ID')
    SQL.Strings = (
      'SELECT  pdel.id '
      ',a.name as PostName'
      ',a.PostNo'
      
        ',(select isnull(max(1),0) from l_firm_prop where postNo=a.PostNo' +
        ' and prop_id=14) as is_stop'
      
        ',(select isnull(max(1),0) from l_firm_prop where postNo=a.PostNo' +
        ' and prop_id=21) as is_stop_check'
      ',pdel.KolDayDolg'
      
        ',isnull(pdel.DAY_DELAY,0)+isnull(pdel.Day_delay_ext,0) as dayDel' +
        'ay'
      ',isnull(pdel.DAY_DELAY,0) as day_Delay_Main'
      ',pdel.Day_delay_ext as Day_delay_ext'
      ',pdel.SET_ARTICLE_GROUP_NAME as Set_Name'
      ',pdel.SET_ARTICLE_GROUP_ID'
      
        ',(select Buh_type_name from d_buh_type where buh=pdel.BUH) as Bu' +
        'h_type_name'
      
        ',DATEADD(DAY,  isnull(pdel.DAY_DELAY,0)+isnull(pdel.Day_delay_ex' +
        't,0), isnull(pdel.DateNakl,:DateNakl0)) as LastEnabledDay'
      ',DateNakl as FirstDateDolg'
      ' FROM post a INNER JOIN (select id'
      '                          ,DateNakl'
      
        '                          ,Datediff(dd,isnull(DateNakl, :DateNak' +
        'l1 ), :DateNakl2 ) as KolDayDolg'
      '                          ,DAY_DELAY'
      '                          ,Day_delay_ext'
      '                          ,SET_ARTICLE_GROUP_NAME'
      '                          ,SET_ARTICLE_GROUP_ID'
      '                          ,BUH'
      '                          ,PostNo'
      
        '                          from v_first_free_nakl) pdel on pdel.P' +
        'ostNo=a.PostNo'
      ' ORDER BY PostName,Set_Name,Buh_type_name')
    BeforeOpen = QueryBeforeOpen
    Options.CursorUpdate = False
    Options.StrictUpdate = False
    Left = 472
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateNakl0'
      end
      item
        DataType = ftUnknown
        Name = 'DateNakl1'
      end
      item
        DataType = ftUnknown
        Name = 'DateNakl2'
      end>
  end
  inherited DS: TDataSource [10]
  end
  inherited spCopyProfile: TMSStoredProc
    Left = 248
    Top = 128
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
    Left = 280
    Top = 128
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
      
        '       (select Buh_type_name from d_buh_type where buh = v.buh) ' +
        'as Buh_Type,'
      '       v.Currency'
      'FROM   v_dhead v'
      'WHERE  v.free_summa_eco <> 0'
      'and v.type_id = 12'
      'and v.our_firm_id=(select PostNo from d_our_firm)'
      '&_where'
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
        DataType = ftUnknown
        Name = 'PostNo'
      end>
    MacroData = <
      item
        Name = '_where'
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
      '@L_POST_SET_DELAY_ID dtFkey'
      ',@USER_ID dtFkey'
      ',@DATE_BEG SmallDateTime'
      ',@DATE_END SmallDateTime'
      ',@ReasonNo smallint'
      ',@Day_Prosr_group int'
      ',@Day_Prosr int'
      ',@SummaDolg decimal(18,2)'
      ''
      'set @L_POST_SET_DELAY_ID = :p1_L_POST_SET_DELAY_ID'
      'set @USER_ID = :p2_USER_ID'
      'set @DATE_BEG  = :p3_DATE_BEG'
      'set @DATE_END  = :p4_DATE_END'
      'set @ReasonNo  = :p5_ReasonNo'
      'set @Day_Prosr_group = :p6_Day_Prosr_group'
      'set @Day_Prosr = :p7_Day_Prosr'
      'set @SummaDolg = :p8_SummaDolg'
      ''
      ''
      'delete from D_POST_DELAY_STOP_CONTROL '
      
        'where L_POST_SET_DELAY_ID=@L_POST_SET_DELAY_ID  and DATE_BEG=@DA' +
        'TE_BEG and DATE_END=@DATE_END'
      ''
      
        'INSERT INTO D_POST_DELAY_STOP_CONTROL (L_POST_SET_DELAY_ID, USER' +
        '_ID, DATE_BEG, DATE_END, ACTION_DATE, ReasonNo, Day_Prosr_group,' +
        ' Day_Prosr, SummaDolg, ACTIVE) '
      
        ' VALUES (@L_POST_SET_DELAY_ID, @USER_ID , @DATE_BEG, @DATE_END, ' +
        'GetDate(), @ReasonNo, @Day_Prosr_group, @Day_Prosr, @SummaDolg,'#39 +
        'Y'#39')'
      ''
      'update FirstFreeNaklTmp'
      ' set  is_enable_stop_period = 1'
      '    , LastDayStopControlDelay = @DATE_END'
      'where id = @L_POST_SET_DELAY_ID'
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
      end
      item
        DataType = ftUnknown
        Name = 'p5_ReasonNo'
      end
      item
        DataType = ftUnknown
        Name = 'p6_Day_Prosr_group'
      end
      item
        DataType = ftUnknown
        Name = 'p7_Day_Prosr'
      end
      item
        DataType = ftUnknown
        Name = 'p8_SummaDolg'
      end>
  end
  object QuStartControl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '  @L_POST_SET_DELAY_ID dtFkey'
      ''
      'set @L_POST_SET_DELAY_ID = :p1_L_POST_SET_DELAY_ID'
      ''
      'update D_POST_DELAY_STOP_CONTROL '
      '  set active='#39'N'#39' '
      'where L_POST_SET_DELAY_ID = @L_POST_SET_DELAY_ID '
      '  and active='#39'Y'#39
      ''
      'update FirstFreeNaklTmp'
      ' set  is_enable_stop_period = 0'
      'where id = @L_POST_SET_DELAY_ID')
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
    Top = 412
  end
  object spInsInFirstFreeNaklTmp: TMSStoredProc
    StoredProcName = 'InsInFirstFreeNaklTmp;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL InsInFirstFreeNaklTmp;1(:DateNakl)}')
    Left = 1376
    Top = 118
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
        ParamType = ptInput
      end>
  end
  object quLastDateDataSlice: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from LastDateDataSlice')
    Left = 1320
    Top = 118
    object quLastDateDataSliceLastDateSlice: TDateTimeField
      FieldName = 'LastDateSlice'
    end
  end
  object dsLastDateDataSlice: TMSDataSource
    DataSet = quLastDateDataSlice
    Left = 1288
    Top = 118
  end
  object quChangeStopControl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '   @Cnt1 int'
      ' , @Cnt2 int'
      ' , @MaxIdEnabled int'
      ' , @MaxIdDisabled int'
      ' , @PostNo int'
      ' , @Val int'
      ' , @UserNo int'
      ' , @Description varchar(50)'
      ' , @DateChange datetime'
      ''
      'set @Val = :val'
      'set @UserNo = :UserNo'
      'set @Description = :Description'
      'set @PostNo = :PostNo'
      'set @DateChange = :DateChange'
      ''
      
        'select @MaxIdEnabled = isnull(max(id),0) from HistoriBanShipment' +
        ' where PostNo = @PostNo and DateEnabled is not null'
      ''
      
        'select @MaxIdDisabled = isnull(max(id),0) from HistoriBanShipmen' +
        't where PostNo = @PostNo and DateEnabled is not null and DateDis' +
        'abled is null'
      ''
      'if /*@MaxIdEnabled = 0 and*/ @Val = 1'
      
        ' insert into HistoriBanShipment (PostNo, EnabledUserNo, DateEnab' +
        'led, DescriptionEnabled)'
      '   values (@PostNo, @UserNo, @DateChange, @Description)'
      ''
      'if @MaxIdDisabled <> 0'
      ' update HistoriBanShipment'
      '  set  DisabledUserNo = @UserNo'
      '     , DateDisabled = @DateChange'
      '     , DescriptionDisabled = @Description'
      ' where id = @MaxIdDisabled')
    Left = 608
    Top = 321
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'val'
      end
      item
        DataType = ftUnknown
        Name = 'UserNo'
      end
      item
        DataType = ftUnknown
        Name = 'Description'
      end
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end
      item
        DataType = ftUnknown
        Name = 'DateChange'
      end>
  end
  object quHistoriBanShipment: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select   PostNo'
      
        '       , (select UserName from Users where UserNo = h.EnabledUse' +
        'rNo) as EnabledUserName'
      #9'   , DateEnabled'
      #9'   , DescriptionEnabled'
      
        #9'   , (select UserName from Users where UserNo = h.DisabledUserN' +
        'o) as DisabledUserName'
      #9'   , DateDisabled'
      #9'   , DescriptionDisabled'
      ' from HistoriBanShipment h'
      '  where 1=1'
      '&_where')
    Left = 1368
    Top = 436
    MacroData = <
      item
        Name = '_where'
      end>
  end
  object dsHistoriBanShipment: TMSDataSource
    DataSet = quHistoriBanShipment
    Left = 1336
    Top = 436
  end
end
