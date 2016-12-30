inherited MlkListLinkArticleGroupFrame: TMlkListLinkArticleGroupFrame
  Width = 614
  Height = 445
  inherited PanelGrid: TPanel
    Width = 283
    Height = 307
    inherited DBCxGrid: TcxGrid
      Width = 277
      Height = 214
      inherited DBCxGridDBTableView1: TcxGridDBTableView
        DataController.DetailKeyFieldNames = 'VidtovGroupId'
        DataController.KeyFieldNames = 'id'
        DataController.MasterKeyFieldNames = 'id'
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        object Clnid: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          Width = 26
        end
        object ClnVidName: TcxGridDBColumn
          Caption = #1042#1080#1076
          DataBinding.FieldName = 'VidNo'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'VidNo'
          Properties.ListColumns = <
            item
              FieldName = 'VidName'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsVidTov
          FooterAlignmentHorz = taRightJustify
          GroupSummaryAlignment = taRightJustify
          Width = 286
        end
      end
      object tblvwGroupName: TcxGridDBTableView [1]
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DS
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object ClnLArtGrId: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          Width = 39
        end
        object ClnLArtGrACTIVE: TcxGridDBColumn
          Caption = #1040#1082#1090#1080#1074
          DataBinding.FieldName = 'ACTIVE'
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.DisplayGrayed = 'True'
          Properties.ImmediatePost = True
          Properties.ValueChecked = 'Y'
          Properties.ValueGrayed = ''
          Properties.ValueUnchecked = 'N'
          Width = 38
        end
      end
      inherited DBCxGridLevel1: TcxGridLevel
        GridView = tblvwGroupName
      end
    end
    inherited PageControlTop: TcxPageControl
      Width = 277
      ClientRectRight = 277
      inherited tsDynamicFilter: TcxTabSheet
        inherited DbFltControlMain: TcxFilterControl
          Width = 231
        end
      end
    end
    inherited SplFilter: TcxSplitter
      Width = 277
    end
  end
  inherited PageExt: TcxPageControl
    Top = 341
    Width = 614
    ClientRectRight = 613
    inherited TabSelection: TcxTabSheet
      inherited DBGridSelection: TcitDBGrid
        Width = 612
      end
    end
  end
  inherited SplitterExt: TcxSplitter
    Top = 333
    Width = 614
  end
  inherited PageSettings: TcxPageControl
    Height = 307
    ClientRectBottom = 306
    inherited TabProp1: TcxTabSheet
      inherited vgStyleSheets: TcxVerticalGrid
        Height = 259
      end
    end
    inherited TabProp2: TcxTabSheet
      inherited FrameProp: TValueListEditor
        Height = 259
        Strings.Strings = (
          'KEYFIELDS=ID'
          'CustomDMClassName=TMlekoDbDsMSSQLDm'
          'ResourceModuleClassName=TMlekoResDm'
          'PropClassName='
          'MultiSelect=False'
          'SelectStyle=LIST'
          'ViewStyle=LIST'
          'GRIDStyle=CXGRID'
          'GRIDDataSetName=QuLArticleGroup')
        ColWidths = (
          120
          83)
      end
    end
  end
  inherited PageDetails: TcxPageControl
    Left = 510
    Height = 307
    ClientRectBottom = 306
    inherited TabDetails1: TcxTabSheet
      inherited GridDetails: TcxDBVerticalGrid
        Height = 285
      end
    end
  end
  inherited SplitterDetails: TcxSplitter
    Left = 502
    Height = 307
  end
  inherited SplitterSettings: TcxSplitter
    Height = 307
  end
  inherited BarDockControlCommon: TdxBarDockControl
    Width = 614
  end
  inherited CustomActionList: TActionList
    inherited ActionItemCopy: TAction
      Visible = False
    end
    inherited ActionItemView: TAction
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
    DockControlHeights = (
      0
      0
      0
      0)
    inherited ToolBarPanels: TdxBar
      DockedLeft = 410
      Visible = False
    end
    inherited ToolBarGRIDView: TdxBar
      DockedLeft = 204
    end
    inherited ToolBarExport: TdxBar
      DockedLeft = 271
    end
  end
  inherited VTSelection: TVirtualTable
    Data = {03000000000000000000}
  end
end
