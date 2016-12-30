inherited MlkListLinkAGGroupFrame: TMlkListLinkAGGroupFrame
  inherited PanelGrid: TPanel
    inherited DBCxGrid: TcxGrid
      inherited tblvwGroupName: TcxGridDBTableView
        inherited ClnLArtGrACTIVE: TcxGridDBColumn
          Properties.ImmediatePost = False
        end
        object ClnGroup: TcxGridDBColumn
          Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1086#1074
          DataBinding.FieldName = 'article_group_id'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsArticleGroup
          Width = 222
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
          'PropClassName='
          'MultiSelect=False'
          'SelectStyle=LIST'
          'ViewStyle=LIST'
          'GRIDStyle=CXGRID'
          'GRIDDataSetName=QuLAGGroup')
      end
    end
  end
  inherited DS: TDataSource
    DataSet = MlekoDbDsMSSQLDm.QuLAGGroup
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
end
