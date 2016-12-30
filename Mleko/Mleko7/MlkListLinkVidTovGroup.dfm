inherited MlkListLinkVidTovGroupFrame: TMlkListLinkVidTovGroupFrame
  inherited PanelGrid: TPanel
    Height = 91
    inherited DBCxGrid: TcxGrid
      inherited DBCxGridDBTableView1: TcxGridDBTableView
        DataController.DataSource = DS
        DataController.DetailKeyFieldNames = 'VidtovGroupId'
        DataController.KeyFieldNames = 'id'
        DataController.MasterKeyFieldNames = 'id'
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
        OptionsView.GroupByBox = False
        object Clnid: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          FooterAlignmentHorz = taRightJustify
          GroupSummaryAlignment = taRightJustify
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
        object ClnGroupNameid: TcxGridDBColumn
          DataBinding.FieldName = 'id'
          Width = 29
        end
        object ClnGroupNameVidName: TcxGridDBColumn
          Caption = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
          DataBinding.FieldName = 'VidNo'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'VidNo'
          Properties.ListColumns = <
            item
              FieldName = 'VidName'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsVidTov
          Width = 221
        end
      end
      inherited DBCxGridLevel1: TcxGridLevel
        GridView = tblvwGroupName
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
          'PropClassName='
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
      DockedLeft = 410
      Visible = False
    end
    inherited ToolBarCustomer: TdxBar
      DockedLeft = 342
    end
    inherited BarSubItemGridRowView: TdxBarSubItem
      Visible = ivNever
    end
  end
  inherited VTSelection: TVirtualTable
    Data = {03000000000000000000}
  end
end
