inherited MlkChildArticleForm: TMlkChildArticleForm
  Left = 744
  Top = 259
  Width = 781
  Height = 782
  Caption = #1058#1086#1074#1072#1088#1099
  PixelsPerInch = 96
  TextHeight = 13
  object pnlArticle: TPanel [0]
    Left = 0
    Top = 0
    Width = 765
    Height = 340
    Align = alClient
    Caption = 'pnlArticle'
    TabOrder = 0
    inline FrmArticle: TMLKCxListArticleFrame
      Left = 1
      Top = 1
      Width = 763
      Height = 338
      Align = alClient
      PopupMenu = FrmArticle.PopupMenuGrid
      TabOrder = 0
      inherited PanelGrid: TPanel
        Width = 432
        Height = 200
        inherited DBCxGrid: TcxGrid
          Width = 426
          Height = 107
          inherited DBCxGridDBTableView1: TcxGridDBTableView
            inherited DBCxGridDBTableView1SrokReal: TcxGridDBColumn [6]
            end
            inherited DBCxGridDBTableView1Weight: TcxGridDBColumn [7]
            end
            inherited DBCxGridDBTableView1OtdelNo: TcxGridDBColumn [8]
            end
            inherited DBCxGridDBTableView1TaraNo: TcxGridDBColumn [9]
            end
            inherited DBCxGridDBTableView1KolPerPak: TcxGridDBColumn [10]
            end
          end
        end
        inherited PageControlTop: TcxPageControl
          Width = 426
          ActivePage = FrmArticle.tsDynamicFilter
          ClientRectRight = 426
          inherited tsDynamicFilter: TcxTabSheet
            inherited DbFltControlMain: TcxFilterControl
              Width = 380
            end
          end
        end
        inherited SplFilter: TcxSplitter
          Width = 426
        end
      end
      inherited PageExt: TcxPageControl
        Top = 234
        Width = 763
        ClientRectRight = 762
        inherited TabSelection: TcxTabSheet
          inherited DBGridSelection: TcitDBGrid
            Width = 761
          end
        end
      end
      inherited SplitterExt: TcxSplitter
        Top = 226
        Width = 763
      end
      inherited PageSettings: TcxPageControl
        Height = 200
        ClientRectBottom = 199
        inherited TabProp2: TcxTabSheet
          inherited FrameProp: TValueListEditor
            Height = 152
            Strings.Strings = (
              'KEYFIELDS=ID'
              'CustomDMClassName=TMlekoDbDsMSSQLDm'
              'ResourceModuleClassName=TMlekoResDm'
              'PropClassName=TfmEditTovar'
              'MultiSelect=False'
              'SelectStyle=LIST'
              'ViewStyle=LIST'
              'GRIDDataSetName=quTovar')
          end
        end
      end
      inherited PageDetails: TcxPageControl
        Left = 659
        Height = 200
        ClientRectBottom = 199
        inherited TabDetails1: TcxTabSheet
          inherited GridDetails: TcxDBVerticalGrid
            Height = 178
          end
        end
      end
      inherited SplitterDetails: TcxSplitter
        Left = 651
        Height = 200
      end
      inherited SplitterSettings: TcxSplitter
        Height = 200
      end
      inherited BarDockControlCommon: TdxBarDockControl
        Width = 763
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
        Left = 128
        DockControlHeights = (
          0
          0
          0
          0)
        inherited ToolBarGRIDView: TdxBar
          DockedLeft = 423
        end
        inherited ToolBarExport: TdxBar
          DockedLeft = 320
        end
      end
      inherited VTSelection: TVirtualTable
        Data = {03000000000000000000}
      end
    end
  end
  object pnlGroup: TPanel [1]
    Left = 0
    Top = 348
    Width = 765
    Height = 395
    Align = alBottom
    Caption = 'pnlGroup'
    TabOrder = 1
    inline FrmArticleGroup: TMlkListLinkAGGroupFrame
      Left = 1
      Top = 1
      Width = 763
      Height = 393
      Align = alClient
      PopupMenu = FrmArticleGroup.PopupMenuGrid
      TabOrder = 0
      inherited PanelGrid: TPanel
        Width = 432
        Height = 255
        inherited DBCxGrid: TcxGrid
          Width = 426
          Height = 162
        end
        inherited PageControlTop: TcxPageControl
          Width = 426
          ClientRectRight = 426
        end
        inherited SplFilter: TcxSplitter
          Width = 426
        end
      end
      inherited PageExt: TcxPageControl
        Top = 289
        Width = 763
        ClientRectRight = 762
        inherited TabSelection: TcxTabSheet
          inherited DBGridSelection: TcitDBGrid
            Width = 761
          end
        end
      end
      inherited SplitterExt: TcxSplitter
        Top = 281
        Width = 763
      end
      inherited PageSettings: TcxPageControl
        Height = 255
        ClientRectBottom = 254
        inherited TabProp2: TcxTabSheet
          inherited FrameProp: TValueListEditor
            Height = 207
            ColWidths = (
              120
              83)
          end
        end
      end
      inherited PageDetails: TcxPageControl
        Left = 659
        Height = 255
        ClientRectBottom = 254
        inherited TabDetails1: TcxTabSheet
          inherited GridDetails: TcxDBVerticalGrid
            Height = 233
          end
        end
      end
      inherited SplitterDetails: TcxSplitter
        Left = 651
        Height = 255
      end
      inherited SplitterSettings: TcxSplitter
        Height = 255
      end
      inherited BarDockControlCommon: TdxBarDockControl
        Width = 763
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
      end
      inherited VTSelection: TVirtualTable
        Data = {03000000000000000000}
      end
    end
  end
  object SplGroup: TcxSplitter [2]
    Left = 0
    Top = 340
    Width = 765
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salBottom
    Control = pnlGroup
  end
end
