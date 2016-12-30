inherited MlkPropDbVidGroupDlg: TMlkPropDbVidGroupDlg
  Left = 468
  Top = 183
  Caption = 'MlkPropDbVidGroupDlg'
  ClientHeight = 497
  ClientWidth = 430
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 204
    Top = 476
  end
  inherited ButtonCancel: TButton
    Left = 279
    Top = 476
  end
  inherited ButtonApply: TButton
    Left = 354
    Top = 476
  end
  inherited PageControl: TcxPageControl
    Width = 429
    Height = 474
    ClientRectBottom = 474
    ClientRectRight = 429
    inherited tsMainProp: TcxTabSheet
      inline FrmLinkVidTovGroup: TMlkListLinkVidTovGroupFrame
        Left = 0
        Top = 0
        Width = 429
        Height = 450
        Align = alClient
        PopupMenu = FrmLinkVidTovGroup.PopupMenuGrid
        TabOrder = 0
        inherited PageControlTop: TcxPageControl
          Width = 429
          ClientRectRight = 429
        end
        inherited PanelGrid: TPanel
          Width = 98
          Height = 264
          inherited DBCxGrid: TcxGrid
            Width = 92
            Height = 258
            inherited tblvwGroupName: TcxGridDBTableView
              inherited ClnGroupNameVidName: TcxGridDBColumn
                Properties.KeyFieldNames = ''
                Properties.ListSource = nil
              end
            end
          end
        end
        inherited PageExt: TcxPageControl
          Top = 346
          Width = 429
          ClientRectRight = 429
          inherited TabSelection: TcxTabSheet
            inherited DBGridSelection: TcitDBGrid
              Width = 429
            end
          end
        end
        inherited SplitterExt: TcxSplitter
          Top = 338
          Width = 429
        end
        inherited PageSettings: TcxPageControl
          Height = 264
          ClientRectBottom = 264
          inherited TabProp2: TcxTabSheet
            inherited FrameProp: TValueListEditor
              Height = 214
              ColWidths = (
                64
                141)
            end
          end
        end
        inherited PageDetails: TcxPageControl
          Left = 325
          Height = 264
          ClientRectBottom = 264
          inherited TabDetails1: TcxTabSheet
            inherited GridDetails: TcxDBVerticalGrid
              Height = 240
            end
          end
        end
        inherited SplitterDetails: TcxSplitter
          Left = 317
          Height = 264
        end
        inherited SplitterSettings: TcxSplitter
          Height = 264
        end
        inherited BarDockControlCommon: TdxBarDockControl
          Width = 429
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
          inherited ToolBarCustomer: TdxBar
            DockedLeft = 385
          end
          inherited ToolBarGRIDView: TdxBar
            DockedLeft = 109
          end
          inherited ToolBarExport: TdxBar
            DockedLeft = 286
          end
        end
        inherited VTSelection: TVirtualTable
          Data = {03000000000000000000}
        end
      end
    end
  end
end
