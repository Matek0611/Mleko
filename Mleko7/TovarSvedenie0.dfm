inherited fmTovarSvedenie: TfmTovarSvedenie
  Left = 336
  Top = 230
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1080#1079#1084#1077#1085#1077#1085#1085#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
  ClientHeight = 573
  ClientWidth = 992
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 1000
  Constraints.MinHeight = 600
  Constraints.MinWidth = 1000
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DbGridTovChange: TcxGrid [0]
    Left = 0
    Top = 26
    Width = 992
    Height = 547
    Align = alClient
    TabOrder = 4
    object dbGrdtvMain: TcxGridDBTableView
      OnDblClick = dbGrdtvMainDblClick
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsTovar
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.NavigatorHints = True
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      object dbGrdtvMainColumn2: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'NoRashod'
        Width = 56
      end
      object dbGrdtvMaintovarno: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1090#1086#1074
        DataBinding.FieldName = 'tovarno'
        Width = 58
      end
      object dbGrdtvMainnametovar: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
        DataBinding.FieldName = 'nametovar'
        Width = 268
      end
      object dbGrdtvMainedizm: TcxGridDBColumn
        Caption = #1045#1076'. '#1048#1079#1084
        DataBinding.FieldName = 'edizm'
        Width = 52
      end
      object dbGrdtvMainkolperpak: TcxGridDBColumn
        Caption = #1042' '#1103#1097
        DataBinding.FieldName = 'kolperpak'
        Width = 43
      end
      object dbGrdtvMainnamecompany: TcxGridDBColumn
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        DataBinding.FieldName = 'namecompany'
        Width = 98
      end
      object dbGrdtvMainvidname: TcxGridDBColumn
        Caption = #1041#1088#1101#1085#1076
        DataBinding.FieldName = 'vidname'
        Width = 93
      end
      object dbGrdtvMainkol: TcxGridDBColumn
        Caption = #1048#1079#1084' '#1082#1086#1083'. '#1086#1089#1090'.'
        DataBinding.FieldName = 'kol'
        Width = 76
      end
      object dbGrdtvMainUserName: TcxGridDBColumn
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        DataBinding.FieldName = 'UserName'
        Width = 104
      end
      object dbGrdtvMainColumn1: TcxGridDBColumn
        Caption = #1062#1077#1085#1072
        DataBinding.FieldName = 'PriceOut'
        Width = 50
      end
    end
    object DbGridTovChangeLevel1: TcxGridLevel
      GridView = dbGrdtvMain
    end
  end
  inherited ActionList: TActionList
    Left = 24
    Top = 80
  end
  object quTovar: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT   s.tovarno'
      '         ,s.nametovar'
      '         ,s.edizm'
      '         ,s.kolperpak'
      '         ,s.namecompany'
      '         ,s.vidname'
      '         ,s.qty_change as kol'
      '         ,s.action_user as UserName'
      '         ,s.PriceOut'
      '         ,s.NoRashod'
      'FROM     v_audit_dspec s'
      'WHERE (s.truncdatechange = :Date or :is_all_date = 1)'
      'and s.NaklNo= isnull(:NaklNo ,s.NaklNo)'
      'ORDER BY &_order')
    BeforeOpen = quTovarBeforeOpen
    Left = 162
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date'
      end
      item
        DataType = ftUnknown
        Name = 'is_all_date'
      end
      item
        DataType = ftUnknown
        Name = 'NaklNo'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = 'NoRashod'
      end>
  end
  object dsTovar: TDataSource
    DataSet = quTovar
    Left = 96
    Top = 84
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102)
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmDataModule.ImageListToolBar
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 272
    Top = 104
    DockControlHeights = (
      0
      0
      26
      0)
    object dxBarManagerBar1: TdxBar
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' 1'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 304
      FloatTop = 319
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'EdDateView'
        end
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object EdDateView: TdxBarDateCombo
      Caption = #1044#1072#1090#1072
      Category = 0
      Description = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      Hint = #1044#1072#1090#1072
      Visible = ivAlways
      Width = 100
    end
    object dxBarButton1: TdxBarButton
      Action = actView
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = ActionViewRefresh
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = ActionCloseForm
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = ActionCopyToExcel
      Category = 0
    end
    object dxBarGroup1: TdxBarGroup
      Items = ()
    end
  end
  object ActionListCur: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 368
    Top = 104
    object actView: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088
      ImageIndex = 20
      ShortCut = 13
      OnExecute = actViewExecute
    end
    object ActionViewRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecute
    end
    object ActionCloseForm: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 45
      ShortCut = 27
      OnExecute = ActionCloseFormExecute
    end
    object ActionCopyToExcel: TAction
      Caption = #1042' '#1069#1082#1089#1077#1083#1100
      Hint = #1042' '#1069#1082#1089#1077#1083#1100
      ImageIndex = 14
      OnExecute = ActionCopyToExcelExecute
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xls'
    FileName = 'Tovar.xls'
    Filter = '*.xls'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 464
    Top = 104
  end
end
