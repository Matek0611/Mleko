inherited MlkChildArticleGroupForm: TMlkChildArticleGroupForm
  Left = 586
  Top = 249
  Width = 800
  Height = 600
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1077' '#1075#1088#1091#1087#1087#1099
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGroup: TPanel [0]
    Left = 0
    Top = 0
    Width = 784
    Height = 561
    Align = alClient
    Caption = 'pnlGroup'
    TabOrder = 0
    inline FrmArticleGroup: TMlkListArticleGroupFrame
      Left = 1
      Top = 1
      Width = 782
      Height = 559
      Align = alClient
      PopupMenu = FrmArticleGroup.PopupMenuGrid
      TabOrder = 0
      inherited PanelGrid: TPanel
        Width = 451
        Height = 421
        inherited PageControlTop: TcxPageControl
          Width = 445
          ClientRectRight = 445
        end
        inherited SplFilter: TcxSplitter
          Width = 445
        end
        inherited DBTreeList: TcxDBTreeList
          Width = 445
          Height = 337
        end
      end
      inherited PageExt: TcxPageControl
        Top = 455
        Width = 782
        ClientRectRight = 781
        inherited TabSelection: TcxTabSheet
          inherited DBGridSelection: TcitDBGrid
            Width = 780
          end
        end
      end
      inherited SplitterExt: TcxSplitter
        Top = 447
        Width = 782
      end
      inherited PageSettings: TcxPageControl
        Height = 421
        ClientRectBottom = 420
        inherited TabProp2: TcxTabSheet
          inherited FrameProp: TValueListEditor
            Height = 373
            ColWidths = (
              64
              139)
          end
        end
      end
      inherited PageDetails: TcxPageControl
        Left = 678
        Height = 421
        ClientRectBottom = 420
        inherited TabDetails1: TcxTabSheet
          inherited GridDetails: TcxDBVerticalGrid
            Height = 399
          end
        end
      end
      inherited SplitterDetails: TcxSplitter
        Left = 670
        Height = 421
      end
      inherited SplitterSettings: TcxSplitter
        Height = 421
      end
      inherited BarDockControlCommon: TdxBarDockControl
        Width = 782
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
          DockedLeft = 365
        end
        inherited ToolBarCustomer: TdxBar
          DockedLeft = 746
        end
        inherited ToolBarGRIDView: TdxBar
          DockedLeft = 207
        end
        inherited ToolBarExport: TdxBar
          DockedLeft = 647
        end
      end
      inherited VTSelection: TVirtualTable
        Data = {03000000000000000000}
      end
    end
  end
end
