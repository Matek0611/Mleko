inherited MlkListVidTovGroupFrame: TMlkListVidTovGroupFrame
  inherited PanelGrid: TPanel
    Height = 91
    inherited DBCxGrid: TcxGrid
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = cxcbsNone
      inherited DBCxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = DS
        OptionsView.GroupByBox = False
        object Clnid: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          Width = 26
        end
        object Clnname: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1074#1080#1076#1086#1074
          DataBinding.FieldName = 'name'
          Width = 350
        end
      end
    end
  end
  inherited PageExt: TcxPageControl
    Top = 173
  end
  inherited SplitterExt: TcxSplitter
    Top = 165
  end
  inherited PageSettings: TcxPageControl
    Height = 91
    ClientRectBottom = 90
    inherited TabProp1: TcxTabSheet
      inherited vgStyleSheets: TcxVerticalGrid
        Height = 43
      end
    end
    inherited TabProp2: TcxTabSheet
      inherited FrameProp: TValueListEditor
        Height = 43
        Strings.Strings = (
          'KEYFIELDS=ID'
          'CustomDMClassName=TMlekoDbDsMSSQLDm'
          'ResourceModuleClassName=TMlekoResDm'
          'PropClassName=TMlkPropDbVidGroupDlg'
          'MultiSelect=False'
          'SelectStyle=LIST'
          'ViewStyle=LIST'
          'GRIDStyle=CXGRID'
          'GRIDDataSetName=QuVidTovGroup')
        ColWidths = (
          64
          123)
      end
    end
  end
  inherited PageDetails: TcxPageControl
    Height = 91
    ClientRectBottom = 90
    inherited TabDetails1: TcxTabSheet
      inherited GridDetails: TcxDBVerticalGrid
        Height = 69
      end
    end
  end
  inherited SplitterDetails: TcxSplitter
    Height = 91
  end
  inherited SplitterSettings: TcxSplitter
    Height = 91
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
      DockedLeft = 227
    end
    inherited ToolBarCustomer: TdxBar
      DockedLeft = 564
    end
    inherited ToolBarGRIDView: TdxBar
      DockedLeft = 144
    end
    inherited ToolBarExport: TdxBar
      DockedLeft = 465
    end
  end
  inherited VTSelection: TVirtualTable
    Data = {03000000000000000000}
  end
end
