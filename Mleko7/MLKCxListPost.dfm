inherited MLKCxListPostFrame: TMLKCxListPostFrame
  inherited PanelGrid: TPanel
    inherited DBCxGrid: TcxGrid
      inherited DBCxGridDBTableView1: TcxGridDBTableView
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.ShowEditButtons = gsebForFocusedRecord
        OptionsView.HeaderHeight = 35
        OptionsView.Indicator = True
        object ClnDBCxGridDBTableView1Name: TcxGridDBColumn
          Caption = #1050#1088#1072#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'Name'
          Options.Editing = False
          Width = 174
        end
        object ClnDBCxGridDBTableView1NameLong: TcxGridDBColumn
          Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'NameLong'
          Options.Editing = False
          Width = 216
        end
        object ClnDBCxGridDBTableView1Address: TcxGridDBColumn
          Caption = #1040#1076#1088#1077#1089' '#1102#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081
          DataBinding.FieldName = 'Address'
          Options.Editing = False
          Width = 71
        end
        object ClnDBCxGridDBTableView1AddressFact: TcxGridDBColumn
          Caption = #1040#1076#1088#1077#1089' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081
          DataBinding.FieldName = 'AddressFact'
          Options.Editing = False
          Width = 76
        end
        object ClnDBCxGridDBTableView1DayDelay: TcxGridDBColumn
          Caption = #1054#1090#1089#1088' '#1086#1073#1097
          DataBinding.FieldName = 'DayDelay'
          Width = 40
        end
        object ClnDBCxGridDBTableView1Visible: TcxGridDBColumn
          Caption = #1053#1077#1074#1080#1076#1080#1084
          DataBinding.FieldName = 'Visible'
          Width = 55
        end
        object ClnDBCxGridDBTableView1trash: TcxGridDBColumn
          Caption = #1059#1076#1072#1083#1077#1085
          DataBinding.FieldName = 'trash'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'trash'
          Properties.ListColumns = <
            item
              FieldName = 'name'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsTrash
          Width = 61
        end
      end
    end
  end
  inherited PageSettings: TcxPageControl
    inherited TabProp2: TcxTabSheet
      inherited FrameProp: TValueListEditor
        Strings.Strings = (
          'KEYFIELDS=PostNo'
          'CustomDMClassName=TMlekoDbDsMSSQLDm'
          'ResourceModuleClassName=TMlekoResDm'
          'PropClassName='
          'MultiSelect=False'
          'SelectStyle=LIST'
          'ViewStyle=LIST'
          'GRIDDataSetName=QuPost')
        ColWidths = (
          64
          123)
      end
    end
  end
  inherited BarDockControlCommon: TdxBarDockControl
    UseOwnSunkenBorder = True
  end
  inherited DS: TDataSource
    DataSet = MlekoDbDsMSSQLDm.quPost
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
    inherited ToolBarCustomer: TdxBar
      DockedLeft = 398
    end
    inherited ToolBarGRIDView: TdxBar
      DockedLeft = 399
    end
    inherited ToolBarExport: TdxBar
      DockedLeft = 300
    end
  end
  inherited VTSelection: TVirtualTable
    Data = {03000000000000000000}
  end
end
