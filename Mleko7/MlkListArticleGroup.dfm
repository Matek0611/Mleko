inherited MlkListArticleGroupFrame: TMlkListArticleGroupFrame
  inherited PanelGrid: TPanel
    inherited DBTreeList: TcxDBTreeList
      Bands = <
        item
        end>
      DataController.ParentField = 'PARENT_ID'
      DataController.KeyField = 'ID'
      object DBTrColDBTreeListID: TcxDBTreeListColumn
        DataBinding.FieldName = 'ID'
        Width = 39
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object DBTrColDBTreeListCODE_NUM: TcxDBTreeListColumn
        Caption.Text = #1050#1086#1076
        DataBinding.FieldName = 'CODE_NUM'
        Width = 47
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object DBTrColDBTreeListNAME: TcxDBTreeListColumn
        Caption.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'NAME'
        Width = 221
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
      end
      object DBTrColDBTreeListParentId: TcxDBTreeListColumn
        Caption.Text = 'ID '#1088#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'PARENT_ID'
        Width = 69
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
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
          'PropClassName=TMlkPropDbArticleGroupDlg'
          'MultiSelect=False'
          'SelectStyle=LIST'
          'ViewStyle=LIST'
          'GRIDStyle=CXTREE'
          'GRIDDataSetName=QuArticleGroup')
      end
    end
  end
  inherited DS: TDataSource
    DataSet = MlekoDbDsMSSQLDm.QuArticleGroup
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
      DockedLeft = 358
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
