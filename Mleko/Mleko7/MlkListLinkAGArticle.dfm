inherited MlkListLinkAGArticleFrame: TMlkListLinkAGArticleFrame
  Width = 780
  inherited PanelGrid: TPanel
    Width = 449
    inherited DBCxGrid: TcxGrid
      Width = 443
      inherited tblvwGroupName: TcxGridDBTableView
        object ClnArticle: TcxGridDBColumn
          Caption = #1058#1086#1074#1072#1088
          DataBinding.FieldName = 'ARTICLE_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'TovarNo'
          Properties.ListColumns = <
            item
              FieldName = 'NameTovar'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsTovar
          Width = 253
        end
      end
    end
    inherited PageControlTop: TcxPageControl
      Width = 443
      ClientRectRight = 443
      inherited tsDynamicFilter: TcxTabSheet
        inherited DbFltControlMain: TcxFilterControl
          Width = 397
        end
      end
    end
    inherited SplFilter: TcxSplitter
      Width = 443
    end
  end
  inherited PageExt: TcxPageControl
    Width = 780
    ClientRectRight = 779
    inherited TabSelection: TcxTabSheet
      inherited DBGridSelection: TcitDBGrid
        Width = 778
      end
    end
  end
  inherited SplitterExt: TcxSplitter
    Width = 780
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
          'GRIDDataSetName=QuLAGArticle')
        ColWidths = (
          64
          123)
      end
    end
  end
  inherited PageDetails: TcxPageControl
    Left = 676
  end
  inherited SplitterDetails: TcxSplitter
    Left = 668
  end
  inherited BarDockControlCommon: TdxBarDockControl
    Width = 780
  end
  inherited DS: TDataSource
    DataSet = MlekoDbDsMSSQLDm.QuLAGArticle
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
