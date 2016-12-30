inherited MlkListSetArticleGroupFrame: TMlkListSetArticleGroupFrame
  inherited PanelGrid: TPanel
    inherited DBCxGrid: TcxGrid
      inherited DBCxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = DS
        object ClnDBCxGridDBTableView1ID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Width = 134
        end
        object ClnDBCxGridDBTableView1NAME: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'NAME'
          Width = 132
        end
        object ClnDBCxGridDBTableView1ACTIVE: TcxGridDBColumn
          Caption = #1040#1082#1090#1080#1074#1085#1086#1089#1090#1100
          DataBinding.FieldName = 'ACTIVE'
          Width = 64
        end
      end
    end
  end
  inherited PageSettings: TcxPageControl
    inherited TabProp2: TcxTabSheet
      inherited FrameProp: TValueListEditor
        Strings.Strings = (
          'KEYFIELDS=ID'
          'CustomDMClassName=TMlekoDbDsMSSQLDm'
          'ResourceModuleClassName=TMlekoResDm'
          'PropClassName=TMlkPropDbSetArticleGroupDlg'
          'MultiSelect=False'
          'SelectStyle=LIST'
          'ViewStyle=LIST'
          'GRIDStyle=CXGRID'
          'GRIDDataSetName=QuSetArticleGroup')
      end
    end
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
      2)
    Categories.Visibles = (
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
      DockedLeft = 271
    end
    inherited ToolBarGRIDView: TdxBar
      DockedLeft = 204
    end
    inherited ToolBarExport: TdxBar
      DockedLeft = 465
    end
  end
  inherited VTSelection: TVirtualTable
    Data = {03000000000000000000}
  end
end
