inherited MlkPropDbSetArticleGroupDlg: TMlkPropDbSetArticleGroupDlg
  Left = 531
  Top = 222
  Caption = #1053#1072#1073#1086#1088' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1093' '#1075#1088#1091#1087#1087
  ClientHeight = 518
  ClientWidth = 361
  PixelsPerInch = 96
  TextHeight = 13
  inherited ButtonOK: TButton
    Left = 135
    Top = 497
  end
  inherited ButtonCancel: TButton
    Left = 210
    Top = 497
  end
  inherited ButtonApply: TButton
    Left = 285
    Top = 497
  end
  inherited PageControl: TcxPageControl
    Width = 360
    Height = 495
    ActivePage = tsMainProp
    ClientRectBottom = 494
    ClientRectRight = 359
    inherited tsMainProp: TcxTabSheet
      object lbl1: TLabel
        Left = 8
        Top = 61
        Width = 76
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      object Label1: TLabel
        Left = 8
        Top = 18
        Width = 82
        Height = 13
        Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1082#1083#1102#1095#1072
      end
      object DbEdName: TcxDBTextEdit
        Left = 9
        Top = 77
        DataBinding.DataField = 'NAME'
        DataBinding.DataSource = DS
        TabOrder = 0
        Width = 296
      end
      object DBCBActive: TcxDBCheckBox
        Left = 16
        Top = 110
        Caption = #1040#1082#1090#1080#1074#1085#1086#1089#1090#1100
        DataBinding.DataField = 'ACTIVE'
        DataBinding.DataSource = DS
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        TabOrder = 1
        Width = 121
      end
      object DbEdId: TcxDBTextEdit
        Left = 9
        Top = 34
        DataBinding.DataField = 'ID'
        DataBinding.DataSource = DS
        TabOrder = 2
        Width = 144
      end
    end
    object tsArticleGroup: TcxTabSheet [1]
      Caption = #1042#1082#1083#1102#1095#1077#1085#1085#1099#1081' '#1089#1087#1080#1089#1086#1082' '#1075#1088#1091#1087#1087
      ImageIndex = 2
      inline FrmLinkSetArticleGroup: TMlkListLinkSetArticleGroupFrame
        Left = 0
        Top = 0
        Width = 358
        Height = 473
        Align = alClient
        PopupMenu = FrmLinkSetArticleGroup.PopupMenuGrid
        TabOrder = 0
        inherited PanelGrid: TPanel
          Width = 27
          Height = 335
          inherited DBCxGrid: TcxGrid
            Width = 21
            Height = 242
            inherited DBCxGridDBTableView1: TcxGridDBTableView
              inherited ClnDBCxGridDBTableView1ARTICLE_GROUP_ID: TcxGridDBColumn
                Properties.ListColumns = <
                  item
                    FieldName = 'NAME'
                  end>
                Width = 250
              end
            end
          end
          inherited PageControlTop: TcxPageControl
            Width = 21
            ActivePage = FrmLinkSetArticleGroup.tsDynamicFilter
            ClientRectRight = 21
            ClientRectTop = 2
            inherited tsDynamicFilter: TcxTabSheet
              inherited BarDockControlFlt: TdxBarDockControl
                Height = 77
              end
              inherited DbFltControlMain: TcxFilterControl
                Width = 72
                Height = 77
              end
            end
          end
          inherited SplFilter: TcxSplitter
            Width = 21
          end
        end
        inherited PageExt: TcxPageControl
          Top = 369
          Width = 358
          ClientRectRight = 357
          inherited TabSelection: TcxTabSheet
            inherited DBGridSelection: TcitDBGrid
              Width = 356
            end
          end
        end
        inherited SplitterExt: TcxSplitter
          Top = 361
          Width = 358
        end
        inherited PageSettings: TcxPageControl
          Height = 335
          ClientRectBottom = 334
          inherited TabProp2: TcxTabSheet
            inherited FrameProp: TValueListEditor
              Height = 287
              ColWidths = (
                64
                139)
            end
          end
        end
        inherited PageDetails: TcxPageControl
          Left = 254
          Height = 335
          ClientRectBottom = 334
          inherited TabDetails1: TcxTabSheet
            inherited GridDetails: TcxDBVerticalGrid
              Height = 313
            end
          end
        end
        inherited SplitterDetails: TcxSplitter
          Left = 246
          Height = 335
        end
        inherited SplitterSettings: TcxSplitter
          Height = 335
        end
        inherited BarDockControlCommon: TdxBarDockControl
          Width = 358
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
          Top = 280
          DockControlHeights = (
            0
            0
            0
            0)
          inherited ToolBarPanels: TdxBar
            DockedLeft = 167
          end
          inherited ToolBarCustomer: TdxBar
            DockedLeft = 770
          end
          inherited ToolBarGRIDView: TdxBar
            DockedLeft = 314
          end
          inherited ToolBarExport: TdxBar
            DockedLeft = 211
          end
        end
        inherited VTSelection: TVirtualTable
          Data = {03000000000000000000}
        end
      end
    end
  end
  inherited DS: TDataSource
    DataSet = MlekoDbDsMSSQLDm.QuSetArticleGroup
  end
end
