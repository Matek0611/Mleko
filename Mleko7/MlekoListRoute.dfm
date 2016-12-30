inherited MlekoListRouteForm: TMlekoListRouteForm
  Left = 273
  Top = 154
  Width = 846
  Caption = #1052#1072#1088#1096#1088#1091#1090#1099
  WindowState = wsMaximized
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
  inherited StatusBar: TStatusBar
    Width = 838
  end
  inherited ToolBar: TToolBar
    Width = 838
  end
  object DBGrid: TcxGrid [4]
    Left = 0
    Top = 29
    Width = 838
    Height = 352
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
      object DBGridDBTableView1id: TcxGridDBColumn
        DataBinding.FieldName = 'id'
        Visible = False
      end
      object DBGridDBTableView1Name: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'Name'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 229
      end
      object DBGridDBTableView1PayDriving: TcxGridDBColumn
        Caption = #1054#1087#1083#1072#1090#1072' '#1079#1072' '#1076#1086#1089#1090#1072#1074#1082#1091
        DataBinding.FieldName = 'PayDriving'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 113
      end
      object DBGridDBTableView1Distance: TcxGridDBColumn
        Caption = #1044#1080#1089#1090#1072#1085#1094#1080#1103
        DataBinding.FieldName = 'Distance'
        PropertiesClassName = 'TcxSpinEditProperties'
      end
      object DBGridDBTableView1PayForwarding: TcxGridDBColumn
        Caption = #1054#1087#1083#1072#1090#1072' '#1079#1072' '#1101#1082#1089#1087#1077#1076#1080#1094#1080#1102
        DataBinding.FieldName = 'PayForwarding'
        PropertiesClassName = 'TcxCalcEditProperties'
        Width = 84
      end
      object DBGridDBTableView1Code: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'Code'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 50
      end
    end
    object DBGridLevel1: TcxGridLevel
      GridView = DBGridDBTableView1
    end
  end
  object DS: TDataSource
    DataSet = quRoute
    Left = 160
    Top = 144
  end
  object quRoute: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_expedition_route')
    FetchRows = 1
    MasterFields = 'route_id'
    DetailFields = 'id'
    Left = 192
    Top = 145
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'route_id'
      end>
  end
end
