inherited MlkChildSetArticleGroupForm: TMlkChildSetArticleGroupForm
  Left = 807
  Top = 128
  Width = 599
  Height = 448
  Caption = #1053#1072#1073#1086#1088#1099' '#1075#1088#1091#1087#1087
  PixelsPerInch = 96
  TextHeight = 13
  inline FrmSetArticleGroup: TMlkListSetArticleGroupFrame [0]
    Left = 0
    Top = 0
    Width = 583
    Height = 410
    Align = alClient
    PopupMenu = FrmSetArticleGroup.PopupMenuGrid
    TabOrder = 0
    inherited PanelGrid: TPanel
      Width = 252
      Height = 272
      inherited DBCxGrid: TcxGrid
        Width = 246
        Height = 179
      end
      inherited PageControlTop: TcxPageControl
        Width = 246
        ClientRectRight = 246
      end
      inherited SplFilter: TcxSplitter
        Width = 246
      end
    end
    inherited PageExt: TcxPageControl
      Top = 306
      Width = 583
      ClientRectRight = 582
      inherited TabSelection: TcxTabSheet
        inherited DBGridSelection: TcitDBGrid
          Width = 581
        end
      end
    end
    inherited SplitterExt: TcxSplitter
      Top = 298
      Width = 583
    end
    inherited PageSettings: TcxPageControl
      Height = 272
      ClientRectBottom = 271
      inherited TabProp2: TcxTabSheet
        inherited FrameProp: TValueListEditor
          Height = 224
          ColWidths = (
            120
            83)
        end
      end
    end
    inherited PageDetails: TcxPageControl
      Left = 479
      Height = 272
      ClientRectBottom = 271
      inherited TabDetails1: TcxTabSheet
        inherited GridDetails: TcxDBVerticalGrid
          Height = 250
        end
      end
    end
    inherited SplitterDetails: TcxSplitter
      Left = 471
      Height = 272
    end
    inherited SplitterSettings: TcxSplitter
      Height = 272
    end
    inherited BarDockControlCommon: TdxBarDockControl
      Width = 583
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
      Left = 96
      DockControlHeights = (
        0
        0
        0
        0)
      inherited ToolBarPanels: TdxBar
        DockedLeft = 274
      end
      inherited ToolBarCustomer: TdxBar
        DockedLeft = 503
      end
      inherited ToolBarGRIDView: TdxBar
        DockedLeft = 207
      end
      inherited ToolBarExport: TdxBar
        DockedLeft = 387
      end
    end
    inherited VTSelection: TVirtualTable
      Data = {03000000000000000000}
    end
  end
end
