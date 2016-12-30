inherited MlkListLinkSetArticleGroupFrame: TMlkListLinkSetArticleGroupFrame
  Width = 801
  Height = 487
  inherited PanelGrid: TPanel
    Width = 470
    Height = 349
    inherited DBCxGrid: TcxGrid
      Width = 464
      Height = 256
      inherited DBCxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = DS
        NewItemRow.InfoText = #1050#1083#1080#1082#1085#1080#1090#1077' '#1079#1076#1077#1089#1100' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1085#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
        NewItemRow.SeparatorColor = clBackground
        NewItemRow.SeparatorWidth = 5
        NewItemRow.Visible = True
        OptionsView.NavigatorOffset = 10
        OptionsView.NoDataToDisplayInfoText = ''
        OptionsView.ShowEditButtons = gsebForFocusedRecord
        OptionsView.GroupByBox = False
        object ClnDBCxGridDBTableView1ARTICLE_GROUP_ID: TcxGridDBColumn
          Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1086#1074
          DataBinding.FieldName = 'ARTICLE_GROUP_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              FieldName = 'NAME'
            end
            item
              Caption = #1050#1086#1076
              FieldName = 'CODE_NUM'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsArticleGroup
          Width = 288
        end
      end
    end
    inherited PageControlTop: TcxPageControl
      Width = 464
      ClientRectRight = 464
      inherited tsDynamicFilter: TcxTabSheet
        inherited DbFltControlMain: TcxFilterControl
          Width = 418
        end
      end
    end
    inherited SplFilter: TcxSplitter
      Width = 464
    end
  end
  inherited PageExt: TcxPageControl
    Top = 383
    Width = 801
    ClientRectRight = 800
    inherited TabSelection: TcxTabSheet
      inherited DBGridSelection: TcitDBGrid
        Width = 799
      end
    end
  end
  inherited SplitterExt: TcxSplitter
    Top = 375
    Width = 801
  end
  inherited PageSettings: TcxPageControl
    Height = 349
    ClientRectBottom = 348
    inherited TabProp1: TcxTabSheet
      inherited vgStyleSheets: TcxVerticalGrid
        Height = 301
      end
    end
    inherited TabProp2: TcxTabSheet
      inherited FrameProp: TValueListEditor
        Height = 301
        Strings.Strings = (
          'KEYFIELDS=ID'
          'CustomDMClassName=TMlekoDbDsMSSQLDm'
          'ResourceModuleClassName=TMlekoResDm'
          'PropClassName='
          'MultiSelect=False'
          'SelectStyle=LIST'
          'ViewStyle=LIST'
          'GRIDStyle=CXGRID'
          'GRIDDataSetName=QuLSetArticleGroup')
        ColWidths = (
          64
          139)
      end
    end
  end
  inherited PageDetails: TcxPageControl
    Left = 697
    Height = 349
    ClientRectBottom = 348
    inherited TabDetails1: TcxTabSheet
      inherited GridDetails: TcxDBVerticalGrid
        Height = 327
      end
    end
  end
  inherited SplitterDetails: TcxSplitter
    Left = 689
    Height = 349
  end
  inherited SplitterSettings: TcxSplitter
    Height = 349
  end
  inherited BarDockControlCommon: TdxBarDockControl
    Width = 801
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
      DockedLeft = 271
    end
    inherited ToolBarGRIDView: TdxBar
      DockedLeft = 204
    end
    inherited ToolBarExport: TdxBar
      DockedLeft = 384
    end
  end
  inherited VTSelection: TVirtualTable
    Data = {03000000000000000000}
  end
end
