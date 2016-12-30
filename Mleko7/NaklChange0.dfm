inherited fmNaklChange: TfmNaklChange
  Left = 740
  Top = 337
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1048#1089#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
  ClientHeight = 401
  ClientWidth = 792
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar1: TPanel [0]
    Left = 0
    Top = 27
    Width = 792
    Height = 28
    Align = alTop
    TabOrder = 0
    object fltDateNakl: TTargetFilter_DateFilter
      Left = 1
      Top = 0
      Width = 330
      Height = 27
      BorderWidth = 2
      Constraints.MaxHeight = 27
      Constraints.MinHeight = 27
      Constraints.MinWidth = 233
      ParentColor = True
      TabOrder = 0
      a_Disable_ConditionType_Combo = False
      a_a_TableName = 'h'
      a_b_FieldName = 'order_date'
      a_b_ServerFieldName = 'order_date'
      a_Label = #1055#1077#1088#1080#1086#1076' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
      a_LabelWidth = 100
      a_ComboWidth = -1
      a_ShortCut = 49220
      a_ParamNames.Strings = (
        'fltDateNakl_param_0'
        'fltDateNakl_param_1')
      a_ServerType = tfst_MS_SQL
      a_Minimum = 38370.556012812500000000
      a_Maximum = 38370.556012812500000000
      a_Value = 38370.556012812500000000
      a_Parameter = 0
      a_ConditionType = dct_date_GE_LE
      a_SetDateTimeToNow = False
      a_DisableTime = True
      a_SetTodayOnLoad = False
    end
    object fltActionDate: TTargetFilter_DateFilter
      Left = 332
      Top = 0
      Width = 330
      Height = 27
      BorderWidth = 2
      Constraints.MaxHeight = 27
      Constraints.MinHeight = 27
      Constraints.MinWidth = 233
      ParentColor = True
      TabOrder = 1
      a_Disable_ConditionType_Combo = False
      a_a_TableName = 'h'
      a_b_FieldName = 'order_date'
      a_b_ServerFieldName = 'order_date'
      a_Label = #1055#1077#1088#1080#1086#1076' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      a_LabelWidth = 100
      a_ComboWidth = -1
      a_ShortCut = 49220
      a_ParamNames.Strings = (
        'DateNaklFilter_param_0'
        'DateNaklFilter_param_1')
      a_ServerType = tfst_MS_SQL
      a_Minimum = 38370.556012812500000000
      a_Maximum = 38370.556012812500000000
      a_Value = 38370.556012812500000000
      a_Parameter = 0
      a_ConditionType = dct_date_GE_LE
      a_SetDateTimeToNow = False
      a_DisableTime = True
      a_SetTodayOnLoad = False
    end
  end
  object DBGridEh1: TDBGridEh [1]
    Left = 0
    Top = 55
    Width = 792
    Height = 346
    Align = alClient
    DataSource = dsNaklR
    Flat = True
    FooterColor = clBtnFace
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnKeyDown = DBGridEh1KeyDown
    OnKeyPress = DBGridEh1KeyPress
    OnTitleBtnClick = DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Nom'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088
        Title.TitleButton = True
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'DateNakl'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'TipName'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 203
      end
      item
        EditButtons = <>
        FieldName = 'CarsName'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
        Title.TitleButton = True
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'Summa'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Title.TitleButton = True
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'Action_Date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1080#1079#1084
        Width = 76
      end>
  end
  object ToolBar: TToolBar [2]
    Left = 0
    Top = 0
    Width = 792
    Height = 27
    AutoSize = True
    ButtonHeight = 25
    ButtonWidth = 25
    Caption = 'ToolBar'
    Flat = True
    Images = dmDataModule.ImageListToolBar
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object ToolBtnProp: TToolButton
      Left = 0
      Top = 0
      Action = ActionItemProp
    end
    object ToolButton20: TToolButton
      Left = 25
      Top = 0
      Action = ActionViewRefresh
    end
    object ToolButton1: TToolButton
      Left = 50
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object bbCancel: TBitBtn
      Left = 58
      Top = 0
      Width = 25
      Height = 25
      Cancel = True
      ModalResult = 3
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  inherited ActionList: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 196
    Top = 144
    object ActionItemProp: TAction
      Category = 'Item'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1080#1083#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 1
      ShortCut = 113
      OnExecute = ActionItemPropExecute
    end
    object ActionViewRefresh: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1080#1079' '#1041#1044
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecute
    end
  end
  object quNaklR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT'
      '     h.NaklNo'
      '     , h.Nom'
      '     , h.DateNakl'
      '     , h.Summa'
      '     , h.ExpeditionNo'
      '     , h.Buh'
      '     , T.TipName'
      '     , P.Name'
      '     , c.CarsName'
      '     , h.Action_Key'
      '     , h.Datedel as Action_Date'
      '     , h.Ask'
      '     ,case '
      '      when h.pkey is not null then h.pkey'
      '      else (select pkey from NaklR where NaklNo=h.NaklNo)'
      '      end as pkey'
      'FROM  NaklRChange h'
      '      left outer join Post p ON h.PostNo = p.PostNo'
      '      left outer join TipNakl t ON h.Buh = t.TipNo'
      '      left outer join AddressPost a ON h.AddressNo = a.AddressNo'
      '      AND h.PostNo = a.PostNo'
      
        '      left outer join ExpeditionChange e ON e.ExpeditionNo = h.E' +
        'xpeditionNo'
      '      left outer join Cars c ON c.CarsNo = e.ExpeditionCarsNo'
      'WHERE (h.DateNakl between :DateNaklBeg and :DateNaklEnd)'
      'and (h.DateDel between :ActionDateBeg and :ActionDateEnd)'
      'ORDER BY &_order')
    BeforeOpen = quNaklRBeforeOpen
    Left = 48
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateNaklBeg'
      end
      item
        DataType = ftUnknown
        Name = 'DateNaklEnd'
      end
      item
        DataType = ftUnknown
        Name = 'ActionDateBeg'
      end
      item
        DataType = ftUnknown
        Name = 'ActionDateEnd'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = '1'
      end>
  end
  object dsNaklR: TDataSource
    DataSet = quNaklR
    Left = 48
    Top = 136
  end
end
