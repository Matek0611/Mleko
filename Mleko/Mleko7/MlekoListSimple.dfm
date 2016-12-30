inherited MlekoListSimpleForm: TMlekoListSimpleForm
  Left = 1032
  Top = 181
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081' '#1092#1080#1085#1072#1085#1089#1086#1074#1086#1081' '#1086#1090#1074#1077#1090#1089#1074#1077#1085#1085#1086#1089#1090#1080
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 136
    Top = 120
    Width = 51
    Height = 13
    Caption = 'PayDriving'
  end
  object Label2: TLabel [1]
    Left = 248
    Top = 120
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  inherited ToolBar: TToolBar
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = ActionViewRefresh
    end
  end
  object DBGrid: TcxGrid [4]
    Left = 0
    Top = 29
    Width = 539
    Height = 341
    Align = alClient
    TabOrder = 2
    object DBGridDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.InfoText = #1055#1088#1080#1074#1077#1090
      OptionsBehavior.AlwaysShowEditor = True
      OptionsView.ShowEditButtons = gsebAlways
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.HeaderHeight = 35
      OptionsView.Indicator = True
      OptionsView.ShowColumnFilterButtons = sfbAlways
      object DBGridDBTableView1ID: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'ID'
        Options.Editing = False
        Width = 40
      end
      object DBGridDBTableView1NAME: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAME'
        Width = 350
      end
    end
    object DBGridLevel1: TcxGridLevel
      GridView = DBGridDBTableView1
    end
  end
  object ActionList1: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 16
    object Action1: TAction
      Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1089#1080#1089#1090#1077#1084#1085#1091#1102' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102
      ShortCut = 57417
      OnExecute = ActionShowSysInfoExecute
    end
    object Action2: TAction
      Caption = 'ActionObjectInspector'
      ShortCut = 57423
      OnExecute = ActionObjectInspectorExecute
    end
    object Action3: TAction
      Caption = #1056#1077#1078#1080#1084' '#1086#1090#1083#1072#1076#1082#1080
      OnExecute = ActionDebugExecute
    end
    object Action4: TAction
      Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1092#1086#1088#1084#1091
      ShortCut = 49218
      OnExecute = ActionBlockFormExecute
    end
    object ActionViewRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecute
    end
  end
  object DS: TDataSource
    DataSet = Query
    Left = 160
    Top = 144
  end
  object Query: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO &TableName'
      '  (NAME)'
      'VALUES'
      '  (:NAME)')
    SQLDelete.Strings = (
      'DELETE FROM &TableName'
      'WHERE'
      '  ID = :Old_ID')
    SQLUpdate.Strings = (
      'UPDATE &TableName'
      'SET'
      '  NAME = :NAME'
      'WHERE'
      '  ID = :Old_ID')
    SQLRefresh.Strings = (
      'SELECT d_response_dept.ID, d_response_dept.NAME FROM &TableName'
      'WHERE'
      '  ID = :ID')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from &TableName')
    FetchRows = 1
    MasterFields = 'route_id'
    DetailFields = 'id'
    Left = 192
    Top = 145
    MacroData = <
      item
        Name = 'TableName'
        Value = 'd_response_dept'
      end>
  end
end
