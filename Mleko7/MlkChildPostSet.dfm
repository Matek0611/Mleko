inherited MlkChildPostSetForm: TMlkChildPostSetForm
  Left = 303
  Top = 175
  Width = 1351
  Height = 807
  Caption = #1054#1090#1089#1088#1086#1095#1082#1080' '#1080' '#1090#1080#1087#1099' '#1094#1077#1085' '#1087#1086' '#1087#1072#1088#1090#1085#1077#1088#1072#1084
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPost: TPanel [0]
    Left = 0
    Top = 0
    Width = 926
    Height = 768
    Align = alClient
    Caption = 'pnlPost'
    TabOrder = 0
    inline FrmPost: TMLKCxListPostFrame
      Left = 1
      Top = 1
      Width = 924
      Height = 766
      Align = alClient
      PopupMenu = FrmPost.PopupMenuGrid
      TabOrder = 0
      inherited PanelGrid: TPanel
        Width = 593
        Height = 628
        inherited DBCxGrid: TcxGrid
          Width = 587
          Height = 535
        end
        inherited PageControlTop: TcxPageControl
          Width = 587
          ClientRectRight = 587
        end
        inherited SplFilter: TcxSplitter
          Width = 587
        end
      end
      inherited PageExt: TcxPageControl
        Top = 662
        Width = 924
        ClientRectRight = 923
        inherited TabSelection: TcxTabSheet
          inherited DBGridSelection: TcitDBGrid
            Width = 922
          end
        end
      end
      inherited SplitterExt: TcxSplitter
        Top = 654
        Width = 924
      end
      inherited PageSettings: TcxPageControl
        Height = 628
        ClientRectBottom = 627
        inherited TabProp2: TcxTabSheet
          inherited FrameProp: TValueListEditor
            Height = 580
            ColWidths = (
              95
              108)
          end
        end
      end
      inherited PageDetails: TcxPageControl
        Left = 820
        Height = 628
        ClientRectBottom = 627
        inherited TabDetails1: TcxTabSheet
          inherited GridDetails: TcxDBVerticalGrid
            Height = 606
          end
        end
      end
      inherited SplitterDetails: TcxSplitter
        Left = 812
        Height = 628
      end
      inherited SplitterSettings: TcxSplitter
        Height = 628
      end
      inherited BarDockControlCommon: TdxBarDockControl
        Width = 924
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
        inherited ToolBarCustomer: TdxBar
          DockedLeft = 269
        end
        inherited ToolBarGRIDView: TdxBar
          DockedLeft = 320
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
  object SplitterDetails: TcxSplitter [1]
    Left = 926
    Top = 0
    Width = 8
    Height = 768
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salRight
    PositionAfterOpen = 60
    Control = pnlSet
  end
  object pnlSet: TPanel [2]
    Left = 934
    Top = 0
    Width = 401
    Height = 768
    Align = alRight
    Caption = 'pnlSet'
    TabOrder = 2
    object pnlDelay: TPanel
      Left = 1
      Top = 1
      Width = 399
      Height = 368
      Align = alTop
      Caption = 'pnlDelay'
      TabOrder = 0
      inline FrmDelayPay: TMlkListPostArticleGroupDelayPayFrame
        Left = 1
        Top = 22
        Width = 397
        Height = 345
        Align = alClient
        PopupMenu = FrmDelayPay.PopupMenuGrid
        TabOrder = 0
        inherited PanelGrid: TPanel
          Width = 66
          Height = 207
          inherited DBCxGrid: TcxGrid
            Width = 60
            Height = 114
            inherited DBCxGridDBTableView1: TcxGridDBTableView
              inherited ClnCurrency: TcxGridDBColumn
                Properties.KeyFieldNames = ''
                Properties.ListColumns = <>
                Properties.ListSource = nil
              end
            end
          end
          inherited PageControlTop: TcxPageControl
            Width = 60
            ClientRectRight = 60
            inherited tsDynamicFilter: TcxTabSheet
              inherited DbFltControlMain: TcxFilterControl
                Width = 52
              end
            end
          end
          inherited SplFilter: TcxSplitter
            Width = 60
          end
        end
        inherited PageExt: TcxPageControl
          Top = 241
          Width = 397
          ClientRectRight = 396
          inherited TabSelection: TcxTabSheet
            inherited DBGridSelection: TcitDBGrid
              Width = 395
            end
          end
        end
        inherited SplitterExt: TcxSplitter
          Top = 233
          Width = 397
        end
        inherited PageSettings: TcxPageControl
          Height = 207
          ClientRectBottom = 206
          inherited TabProp1: TcxTabSheet
            inherited vgStyleSheets: TcxVerticalGrid
              Height = 79
            end
          end
          inherited TabProp2: TcxTabSheet
            inherited FrameProp: TValueListEditor
              Height = 159
              ColWidths = (
                118
                68)
            end
          end
        end
        inherited PageDetails: TcxPageControl
          Left = 293
          Height = 207
          ClientRectBottom = 206
          inherited TabDetails1: TcxTabSheet
            inherited GridDetails: TcxDBVerticalGrid
              Height = 185
            end
          end
        end
        inherited SplitterDetails: TcxSplitter
          Left = 285
          Height = 207
        end
        inherited SplitterSettings: TcxSplitter
          Height = 207
        end
        inherited BarDockControlCommon: TdxBarDockControl
          Width = 397
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
            DockedLeft = 353
          end
          inherited ToolBarCustomer: TdxBar
            DockedLeft = 334
          end
          inherited ToolBarGRIDView: TdxBar
            DockedLeft = 309
          end
          inherited ToolBarExport: TdxBar
            DockedLeft = 206
          end
        end
        inherited VTSelection: TVirtualTable
          Data = {03000000000000000000}
        end
      end
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 397
        Height = 21
        Align = alTop
        Caption = #1054#1090#1089#1088#1086#1095#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object pnlPrice: TPanel
      Left = 1
      Top = 377
      Width = 399
      Height = 390
      Align = alClient
      Caption = 'pnlDelay'
      TabOrder = 1
      inline FrmPriceType: TMlkListPostArticleGroupPriceTypeFrame
        Left = 1
        Top = 21
        Width = 397
        Height = 368
        Align = alClient
        PopupMenu = FrmPriceType.PopupMenuGrid
        TabOrder = 0
        inherited PanelGrid: TPanel
          Width = 66
          Height = 230
          inherited DBCxGrid: TcxGrid
            Width = 60
            Height = 137
          end
          inherited PageControlTop: TcxPageControl
            Width = 60
            ClientRectRight = 60
            inherited tsDynamicFilter: TcxTabSheet
              inherited DbFltControlMain: TcxFilterControl
                Width = 14
              end
            end
          end
          inherited SplFilter: TcxSplitter
            Width = 60
          end
        end
        inherited PageExt: TcxPageControl
          Top = 264
          Width = 397
          ClientRectRight = 396
          inherited TabSelection: TcxTabSheet
            inherited DBGridSelection: TcitDBGrid
              Width = 395
            end
          end
        end
        inherited SplitterExt: TcxSplitter
          Top = 256
          Width = 397
        end
        inherited PageSettings: TcxPageControl
          Height = 230
          ClientRectBottom = 229
          inherited TabProp2: TcxTabSheet
            inherited FrameProp: TValueListEditor
              Height = 182
            end
          end
        end
        inherited PageDetails: TcxPageControl
          Left = 293
          Height = 230
          ClientRectBottom = 229
          inherited TabDetails1: TcxTabSheet
            inherited GridDetails: TcxDBVerticalGrid
              Height = 208
            end
          end
        end
        inherited SplitterDetails: TcxSplitter
          Left = 285
          Height = 230
        end
        inherited SplitterSettings: TcxSplitter
          Height = 230
        end
        inherited BarDockControlCommon: TdxBarDockControl
          Width = 397
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
            DockedLeft = 353
          end
          inherited ToolBarCustomer: TdxBar
            DockedLeft = 334
          end
          inherited ToolBarGRIDView: TdxBar
            DockedLeft = 309
          end
          inherited ToolBarExport: TdxBar
            DockedLeft = 206
          end
        end
        inherited VTSelection: TVirtualTable
          Data = {03000000000000000000}
        end
      end
      object pnl1: TPanel
        Left = 1
        Top = 1
        Width = 397
        Height = 20
        Align = alTop
        Caption = #1062#1077#1085#1099
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object SplSet: TcxSplitter
      Left = 1
      Top = 369
      Width = 399
      Height = 8
      HotZoneClassName = 'TcxSimpleStyle'
      AlignSplitter = salTop
      PositionAfterOpen = 60
      Control = pnlDelay
    end
  end
end
