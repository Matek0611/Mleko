inherited MlkListPostArticleGroupPriceTypeFrame: TMlkListPostArticleGroupPriceTypeFrame
  Width = 664
  Height = 458
  inherited PanelGrid: TPanel
    Width = 333
    Height = 320
    inherited DBCxGrid: TcxGrid
      Width = 327
      Height = 227
      inherited DBCxGridDBTableView1: TcxGridDBTableView
        NewItemRow.InfoText = #1050#1083#1080#1082#1085#1080#1090#1077' '#1079#1076#1077#1089#1100' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1085#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
        NewItemRow.SeparatorColor = clBackground
        NewItemRow.SeparatorWidth = 5
        NewItemRow.Visible = True
        OptionsView.NavigatorOffset = 10
        OptionsView.NoDataToDisplayInfoText = ''
        OptionsView.ShowEditButtons = gsebForFocusedRecord
        object ClnVidtov_group_Name: TcxGridDBColumn
          Caption = #1053#1072#1073#1086#1088
          DataBinding.FieldName = 'SET_ARTICLE_GROUP_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              FieldName = 'name'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsSetArticleGroup
          Width = 155
        end
        object ClnDBCxGridDBTableView1COLNPRICE: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1094#1077#1085#1099' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
          DataBinding.FieldName = 'COLNPRICE'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ColNPrice'
          Properties.ListColumns = <
            item
              Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1090#1080#1087' '#1094#1077#1085#1099
              FieldName = 'ColName'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsPriceType
          Width = 156
        end
      end
    end
    inherited PageControlTop: TcxPageControl
      Width = 327
      ActivePage = tsDynamicFilter
      ClientRectRight = 327
      inherited tsDynamicFilter: TcxTabSheet
        inherited DbFltControlMain: TcxFilterControl
          Width = 281
        end
      end
    end
    inherited SplFilter: TcxSplitter
      Width = 327
    end
  end
  inherited PageExt: TcxPageControl
    Top = 354
    Width = 664
    ClientRectRight = 663
    inherited TabSelection: TcxTabSheet
      inherited DBGridSelection: TcitDBGrid
        Width = 662
      end
    end
  end
  inherited SplitterExt: TcxSplitter
    Top = 346
    Width = 664
  end
  inherited PageSettings: TcxPageControl
    Height = 320
    ClientRectBottom = 319
    inherited TabProp1: TcxTabSheet
      inherited vgStyleSheets: TcxVerticalGrid
        Height = 272
      end
    end
    inherited TabProp2: TcxTabSheet
      inherited FrameProp: TValueListEditor
        Height = 272
        Strings.Strings = (
          'KEYFIELDS=ID'
          'CustomDMClassName=TMlekoDbDsMSSQLDm'
          'ResourceModuleClassName=TMlekoResDm'
          'PropClassName='
          'MultiSelect=False'
          'SelectStyle=LIST'
          'ViewStyle=LIST'
          'GRIDStyle=CXGRID'
          'GRIDDataSetName=QuPostArtGroupPriceType')
        ColWidths = (
          74
          129)
      end
    end
  end
  inherited PageDetails: TcxPageControl
    Left = 560
    Height = 320
    ClientRectBottom = 319
    inherited TabDetails1: TcxTabSheet
      inherited GridDetails: TcxDBVerticalGrid
        Height = 298
      end
    end
  end
  inherited SplitterDetails: TcxSplitter
    Left = 552
    Height = 320
  end
  inherited SplitterSettings: TcxSplitter
    Height = 320
  end
  inherited BarDockControlCommon: TdxBarDockControl
    Width = 664
  end
  inherited DS: TDataSource
    DataSet = MlekoDbDsMSSQLDm.QuPostArtGroupPriceType
  end
  inherited CustomActionList: TActionList
    inherited ActionItemCopy: TAction
      Visible = False
    end
    inherited ActionItemView: TAction
      Visible = False
    end
    inherited ActionItemPrint: TAction
      Visible = False
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
    Top = 208
    DockControlHeights = (
      0
      0
      0
      0)
    inherited ToolBarPanels: TdxBar
      DockedLeft = 377
    end
    inherited ToolBarGRIDView: TdxBar
      DockedLeft = 310
    end
    inherited ToolBarExport: TdxBar
      DockedLeft = 207
    end
  end
  inherited VTSelection: TVirtualTable
    Data = {03000000000000000000}
  end
end
