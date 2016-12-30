inherited MlkChildVidTovGroupForm: TMlkChildVidTovGroupForm
  Left = 880
  Top = 406
  Width = 800
  Height = 600
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1075#1088#1091#1087#1087#1072#1084#1080' '#1074#1080#1076#1086#1074' '#1090#1086#1074#1072#1088#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGroup: TPanel [0]
    Left = 0
    Top = 0
    Width = 792
    Height = 573
    Align = alClient
    Caption = 'pnlGroup'
    TabOrder = 0
    inline FrmVidTovGroup: TMlkListVidTovGroupFrame
      Left = 1
      Top = 1
      Width = 790
      Height = 571
      Align = alClient
      PopupMenu = FrmVidTovGroup.PopupMenuGrid
      TabOrder = 0
      inherited PageControlTop: TcxPageControl
        Width = 790
        ClientRectRight = 789
      end
      inherited PanelGrid: TPanel
        Width = 459
        Height = 385
        inherited DBCxGrid: TcxGrid
          Width = 453
          Height = 379
        end
      end
      inherited PageExt: TcxPageControl
        Top = 467
        Width = 790
        ClientRectRight = 789
        inherited TabSelection: TcxTabSheet
          inherited DBGridSelection: TcitDBGrid
            Width = 788
          end
        end
      end
      inherited SplitterExt: TcxSplitter
        Top = 459
        Width = 790
      end
      inherited PageSettings: TcxPageControl
        Height = 385
        ClientRectBottom = 384
        inherited TabProp2: TcxTabSheet
          inherited FrameProp: TValueListEditor
            Height = 337
            ColWidths = (
              64
              139)
          end
        end
      end
      inherited PageDetails: TcxPageControl
        Left = 686
        Height = 385
        ClientRectBottom = 384
        inherited TabDetails1: TcxTabSheet
          inherited GridDetails: TcxDBVerticalGrid
            Height = 363
          end
        end
      end
      inherited SplitterDetails: TcxSplitter
        Left = 678
        Height = 385
      end
      inherited SplitterSettings: TcxSplitter
        Height = 385
      end
      inherited BarDockControlCommon: TdxBarDockControl
        Width = 790
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
          DockedLeft = 409
        end
        inherited ToolBarCustomer: TdxBar
          DockedLeft = 746
        end
        inherited ToolBarGRIDView: TdxBar
          DockedLeft = 141
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
