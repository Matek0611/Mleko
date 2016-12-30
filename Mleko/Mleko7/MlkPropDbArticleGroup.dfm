inherited MlkPropDbArticleGroupDlg: TMlkPropDbArticleGroupDlg
  Top = 223
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1072#1103' '#1075#1088#1091#1087#1087#1072
  ClientHeight = 381
  ClientWidth = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TcxPageControl [0]
    Width = 383
    ActivePage = tsMainProp
    Align = alTop
    TabOrder = 0
    ClientRectRight = 382
    inherited tsMainProp: TcxTabSheet
      object DbEdName: TcxDBTextEdit
        Left = 16
        Top = 85
        DataBinding.DataField = 'NAME'
        DataBinding.DataSource = DS
        TabOrder = 0
        Width = 345
      end
      object DbEdCode: TcxDBTextEdit
        Left = 16
        Top = 135
        DataBinding.DataField = 'CODE_NUM'
        DataBinding.DataSource = DS
        TabOrder = 1
        Width = 185
      end
      object LBName: TcxLabel
        Left = 16
        Top = 68
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      object LBCode: TcxLabel
        Left = 16
        Top = 118
        Caption = #1050#1086#1076
      end
      object DBCBActive: TcxDBCheckBox
        Left = 16
        Top = 226
        Caption = #1040#1082#1090#1080#1074#1085#1086#1089#1090#1100
        DataBinding.DataField = 'ACTIVE'
        DataBinding.DataSource = DS
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        TabOrder = 4
        Width = 105
      end
      object DBCBCanDelay: TcxDBCheckBox
        Left = 16
        Top = 253
        Caption = #1052#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1074#1099#1073#1088#1072#1085#1072' '#1076#1083#1103' '#1086#1089#1090#1088#1086#1095#1082#1080' '#1087#1072#1088#1090#1085#1077#1088#1072
        DataBinding.DataField = 'CAN_SELECT_DELAY_PAY'
        DataBinding.DataSource = DS
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        TabOrder = 5
        Width = 289
      end
      object DBCBCanPrice: TcxDBCheckBox
        Left = 16
        Top = 280
        Caption = #1052#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1074#1099#1073#1088#1072#1085#1072' '#1076#1083#1103' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' '#1082#1086#1083#1086#1085#1082#1080' '#1094#1077#1085' '#1087#1088#1072#1090#1085#1077#1088#1072
        DataBinding.DataField = 'CAN_SELECT_PRICE_TYPE'
        DataBinding.DataSource = DS
        Properties.ValueChecked = 'Y'
        Properties.ValueUnchecked = 'N'
        TabOrder = 6
        Width = 352
      end
      object cbbParent: TcxDBLookupComboBox
        Left = 19
        Top = 189
        DataBinding.DataField = 'PARENT_ID'
        DataBinding.DataSource = DS
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = MlekoDbDsMSSQLDm.dsArticleGroupForSelect
        TabOrder = 7
        Width = 350
      end
      object LBParent: TcxLabel
        Left = 16
        Top = 168
        Caption = #1056#1086#1076#1080#1090#1077#1083#1100#1089#1082#1072#1103' '#1075#1088#1091#1087#1087#1072
      end
      object DbEdId: TcxDBTextEdit
        Left = 15
        Top = 37
        DataBinding.DataField = 'ID'
        DataBinding.DataSource = DS
        TabOrder = 9
        Width = 186
      end
      object cxLabel1: TcxLabel
        Left = 15
        Top = 20
        Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1082#1083#1102#1095#1072
      end
    end
    object tsListArticle: TcxTabSheet [1]
      Caption = #1057#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1086#1074
      ImageIndex = 2
      inline FrmArticle: TMlkListLinkAGArticleFrame
        Left = 0
        Top = 0
        Width = 381
        Height = 317
        Align = alClient
        PopupMenu = FrmArticle.PopupMenuGrid
        TabOrder = 0
        inherited PanelGrid: TPanel
          Width = 50
          Height = 179
          inherited DBCxGrid: TcxGrid
            Width = 44
            Height = 86
          end
          inherited PageControlTop: TcxPageControl
            Width = 44
            ClientRectRight = 44
            ClientRectTop = 2
          end
          inherited SplFilter: TcxSplitter
            Width = 44
          end
        end
        inherited PageExt: TcxPageControl
          Top = 213
          Width = 381
          ClientRectRight = 380
          inherited TabSelection: TcxTabSheet
            inherited DBGridSelection: TcitDBGrid
              Width = 379
            end
          end
        end
        inherited SplitterExt: TcxSplitter
          Top = 205
          Width = 381
        end
        inherited PageSettings: TcxPageControl
          Height = 179
          ClientRectBottom = 178
          inherited TabProp2: TcxTabSheet
            inherited FrameProp: TValueListEditor
              Height = 131
            end
          end
        end
        inherited PageDetails: TcxPageControl
          Left = 277
          Height = 179
          ClientRectBottom = 178
          inherited TabDetails1: TcxTabSheet
            inherited GridDetails: TcxDBVerticalGrid
              Height = 157
            end
          end
        end
        inherited SplitterDetails: TcxSplitter
          Left = 269
          Height = 179
        end
        inherited SplitterSettings: TcxSplitter
          Height = 179
        end
        inherited BarDockControlCommon: TdxBarDockControl
          Width = 381
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
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 340
    Width = 383
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  inherited ButtonOK: TButton [2]
    Left = 37
    Top = 348
    TabOrder = 2
  end
  inherited ButtonCancel: TButton [3]
    Left = 136
    Top = 348
    TabOrder = 3
  end
  inherited ButtonApply: TButton [4]
    Left = 227
    Top = 348
    TabOrder = 4
  end
  inherited DS: TDataSource
    DataSet = MlekoDbDsMSSQLDm.QuArticleGroup
  end
end
