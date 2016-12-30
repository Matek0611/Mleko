inherited MlkListPostArticleGroupDelayPayFrame: TMlkListPostArticleGroupDelayPayFrame
  Width = 585
  Height = 401
  inherited PanelGrid: TPanel
    Width = 254
    Height = 263
    inherited DBCxGrid: TcxGrid
      Width = 248
      Height = 170
      inherited DBCxGridDBTableView1: TcxGridDBTableView
        NewItemRow.InfoText = #1050#1083#1080#1082#1085#1080#1090#1077' '#1079#1076#1077#1089#1100' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1085#1086#1074#1086#1081' '#1079#1072#1087#1080#1089#1080
        NewItemRow.SeparatorColor = clBackground
        NewItemRow.SeparatorWidth = 5
        NewItemRow.Visible = True
        OptionsView.NavigatorOffset = 10
        OptionsView.NoDataToDisplayInfoText = ''
        OptionsView.ShowEditButtons = gsebForFocusedRecord
        object ClnVidtov_group_Name: TcxGridDBColumn
          Caption = #1053#1072#1073#1086#1088
          DataBinding.FieldName = 'SET_ARTICLE_GROUP_ID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              FieldName = 'name'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsSetArticleGroup
          Width = 155
        end
        object ClnDay_delay: TcxGridDBColumn
          Caption = #1054#1090#1089#1088#1086#1095#1082#1072
          DataBinding.FieldName = 'Day_delay'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.ImmediatePost = True
          Properties.MaxValue = 100.000000000000000000
          Width = 72
        end
        object ClnDay_delay_ext: TcxGridDBColumn
          Caption = #1044#1086#1087' '#1086#1090#1089#1088
          DataBinding.FieldName = 'Day_delay_ext'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.ImmediatePost = True
          Properties.MaxValue = 100.000000000000000000
          Width = 77
        end
        object ClnPayBan: TcxGridDBColumn
          Caption = #1051#1080#1084#1080#1090
          DataBinding.FieldName = 'PayBan'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.MaxValue = 999999.000000000000000000
          Properties.ValueType = vtInt
        end
        object Clnbuh_name: TcxGridDBColumn
          Caption = #1041#1091#1093' '#1074#1080#1076
          DataBinding.FieldName = 'buh'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'buh'
          Properties.ListColumns = <
            item
              FieldName = 'Buh_type_name'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsBuh
          Width = 99
        end
        object ClnCurrency: TcxGridDBColumn
          Caption = #1042#1072#1083#1102#1090#1072
          DataBinding.FieldName = 'Currency'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'L_CODE'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListSource = MlekoDbDsMSSQLDm.dsCurrency
        end
      end
    end
    inherited PageControlTop: TcxPageControl
      Width = 248
      ClientRectRight = 248
      inherited tsDynamicFilter: TcxTabSheet
        inherited DbFltControlMain: TcxFilterControl
          Width = 202
        end
      end
    end
    inherited SplFilter: TcxSplitter
      Width = 248
    end
  end
  inherited PageExt: TcxPageControl
    Top = 297
    Width = 585
    ClientRectRight = 584
    inherited TabSelection: TcxTabSheet
      inherited DBGridSelection: TcitDBGrid
        Width = 583
      end
    end
  end
  inherited SplitterExt: TcxSplitter
    Top = 289
    Width = 585
  end
  inherited PageSettings: TcxPageControl
    Height = 263
    ClientRectBottom = 262
    inherited TabProp1: TcxTabSheet
      inherited vgStyleSheets: TcxVerticalGrid
        Height = 215
      end
    end
    inherited TabProp2: TcxTabSheet
      inherited FrameProp: TValueListEditor
        Height = 215
        Strings.Strings = (
          'KEYFIELDS=ID'
          'CustomDMClassName=TMlekoDbDsMSSQLDm'
          'ResourceModuleClassName=TMlekoResDm'
          'PropClassName='
          'MultiSelect=False'
          'SelectStyle=LIST'
          'ViewStyle=LIST'
          'GRIDDataSetName=QuPostArtGroupDelayPay')
        ColWidths = (
          118
          85)
      end
    end
  end
  inherited PageDetails: TcxPageControl
    Left = 481
    Height = 263
    ClientRectBottom = 262
    inherited TabDetails1: TcxTabSheet
      inherited GridDetails: TcxDBVerticalGrid
        Height = 241
      end
    end
  end
  inherited SplitterDetails: TcxSplitter
    Left = 473
    Height = 263
  end
  inherited SplitterSettings: TcxSplitter
    Height = 263
  end
  inherited BarDockControlCommon: TdxBarDockControl
    Width = 585
  end
  inherited SaveDialog: TSaveDialog
    Left = 258
    Top = 357
  end
  inherited UserActionList: TActionList
    Left = 6
    Top = 350
  end
  inherited DS: TDataSource
    Left = 96
    Top = 350
  end
  inherited OpenDialog: TOpenDialog
    Left = 228
    Top = 357
  end
  inherited CustomActionList: TActionList
    Left = 66
    Top = 351
    inherited ActionItemCopy: TAction
      Visible = False
    end
    inherited ActionItemView: TAction
      Visible = False
    end
    inherited ActionItemPrint: TAction
      Visible = False
    end
  end
  inherited SysActionList: TActionList
    Left = 36
    Top = 350
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
    Left = 320
    Top = 360
    DockControlHeights = (
      0
      0
      0
      0)
    inherited ToolBarPanels: TdxBar
      DockedLeft = 377
    end
    inherited ToolBarGRIDView: TdxBar
      DockedLeft = 310
    end
    inherited ToolBarExport: TdxBar
      DockedLeft = 207
    end
  end
  inherited PropStore: TcxPropertiesStore
    Left = 128
    Top = 350
  end
  inherited PopupMenuGrid: TPopupMenu
    Left = 156
    Top = 351
  end
  inherited DSSelection: TDataSource
    Left = 380
    Top = 365
  end
  inherited VTSelection: TVirtualTable
    Left = 350
    Top = 365
    Data = {03000000000000000000}
  end
  inherited PopMenuGRID: TcxGridPopupMenu
    Left = 288
    Top = 357
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
    end
  end
end
