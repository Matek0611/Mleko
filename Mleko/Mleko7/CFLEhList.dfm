inherited CFLEHListForm: TCFLEHListForm
  Left = 342
  Top = 254
  Width = 626
  ActiveControl = DBGrid
  Caption = 'CFLEHListForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Width = 610
  end
  inherited ToolBar: TToolBar
    Width = 610
    Height = 24
    AutoSize = True
    object ToolBtnAdd: TToolButton
      Left = 0
      Top = 0
      Action = ActionItemAdd
    end
    object ToolBtnProp: TToolButton
      Left = 23
      Top = 0
      Action = ActionItemProp
    end
    object ToolBtnDel: TToolButton
      Left = 46
      Top = 0
      Action = ActionItemDel
    end
    object ToolButton4: TToolButton
      Left = 69
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolBtnRefresh: TToolButton
      Left = 77
      Top = 0
      Action = ActionViewRefresh
    end
    object ToolBtnLayout: TToolButton
      Left = 100
      Top = 0
      Action = ActionViewLayout
    end
    object ToolButton8: TToolButton
      Left = 123
      Top = 0
      Action = ActionViewFilterOff
    end
    object ToolButton2: TToolButton
      Left = 146
      Top = 0
      Action = ActionPrint
    end
    object ToolButton1: TToolButton
      Left = 169
      Top = 0
      Action = ActionSave
    end
  end
  object PageControlTop: TPageControl [2]
    Left = 0
    Top = 24
    Width = 610
    Height = 95
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1060#1080#1083#1100#1090#1088#1099
      object FilterPanel: TTargetFilter_Panel
        Left = 0
        Top = 0
        Width = 602
        Height = 67
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvNone
        TabOrder = 0
        a_Filter_MultilineFilter = False
        a_OrAnd = oaOr
        a_OrAnd_AutoColors = False
      end
    end
  end
  object PanelGrid: TPanel [3]
    Left = 0
    Top = 119
    Width = 610
    Height = 250
    Align = alClient
    BorderWidth = 2
    Caption = 'PanelGrid'
    TabOrder = 3
    object DBGrid: TDBGridEh
      Left = 3
      Top = 3
      Width = 604
      Height = 244
      Align = alClient
      DataSource = DS
      EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      HorzScrollBar.Tracking = True
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      VertScrollBar.Tracking = True
    end
  end
  inherited ActionList: TActionList
    Top = 168
    inherited ActionDebug: TAction
      Caption = #1054#1090#1083#1072#1076#1082#1072
      ShortCut = 24644
    end
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
      OnExecute = ActionViewLayoutExecute
    end
    object ActionViewFilter: TAction
      Category = 'View'
      Caption = #1060#1080#1083#1100#1090#1088#1099
      Hint = #1055#1077#1088#1077#1093#1086#1076' '#1084#1077#1078#1076#1091' '#1092#1080#1083#1100#1090#1088#1072#1084#1080' '#1080' '#1089#1087#1080#1089#1082#1086#1084' '#1080' '#1085#1072#1079#1072#1076
      ImageIndex = 5
      ShortCut = 118
      OnExecute = ActionViewFilterExecute
    end
    object ActionViewFilterOff: TAction
      Category = 'View'
      Caption = #1054#1095#1080#1089#1090#1082#1072' '#1092#1080#1083#1100#1090#1088#1086#1074
      ImageIndex = 6
      ShortCut = 16502
      OnExecute = ActionViewFilterOffExecute
    end
    object ActionRowSelect: TAction
      Category = 'View'
      Caption = #1042#1099#1076#1077#1083#1103#1090#1100' '#1089#1090#1088#1086#1082#1091
      Checked = True
      ShortCut = 16466
      OnExecute = ActionRowSelectExecute
    end
    object ActionDebugAll: TAction
      Caption = 'ActionDebugAll'
      ShortCut = 57412
      OnExecute = ActionDebugAllExecute
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
    object ActionPrint: TAction
      Category = 'View'
      Caption = 'ActionPrint'
      ImageIndex = 15
      OnExecute = ActionPrintExecute
    end
    object ActionSave: TAction
      Caption = 'ActionSave'
      ImageIndex = 29
      OnExecute = ActionSaveExecute
    end
  end
  object Query: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from Post')
    AfterOpen = QueryAfterOpen
    AfterScroll = QueryAfterScroll
    AfterRefresh = QueryAfterRefresh
    Left = 364
    Top = 140
  end
  object PopupMenuGrid: TPopupMenu
    Left = 336
    Top = 140
    object pmiInsert: TMenuItem
      Action = ActionItemAdd
    end
    object pmiProp: TMenuItem
      Action = ActionItemProp
    end
    object pmiDelete: TMenuItem
      Action = ActionItemDel
    end
    object pmiDiv1: TMenuItem
      Caption = '-'
    end
    object pmiRefresh: TMenuItem
      Action = ActionViewRefresh
    end
    object pmiLayout: TMenuItem
      Action = ActionViewLayout
    end
    object pmiRowSelect: TMenuItem
      Action = ActionRowSelect
    end
    object pmiDiv2: TMenuItem
      Caption = '-'
    end
    object pmiClearFilter: TMenuItem
      Action = ActionViewFilterOff
    end
  end
  object IniPropStorageMan: TIniPropStorageManEh
    Left = 168
    Top = 128
  end
  object DS: TDataSource
    DataSet = Query
    Left = 392
    Top = 140
  end
  object PrintDBGridEh1: TPrintDBGridEh
    DBGridEh = DBGrid
    Options = [pghFitGridToPageWidth, pghColored, pghFitingByColWidths]
    Page.BottomMargin = 1.000000000000000000
    Page.LeftMargin = 1.000000000000000000
    Page.RightMargin = 1.000000000000000000
    Page.TopMargin = 1.000000000000000000
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    PrintFontName = 'Arial'
    Units = MM
    Left = 419
    Top = 139
  end
  object SaveDialog1: TSaveDialog
    FileName = 'file1'
    Filter = 
      'Text files (*.txt)|*.TXT|Comma separated values (*.csv)|*.CSV|HT' +
      'ML file (*.htm)|*.HTM|Rich Text Format (*.rtf)|*.RTF|Microsoft E' +
      'xcel Workbook (*.xls)|*.XLS'
    Left = 186
    Top = 182
  end
end
