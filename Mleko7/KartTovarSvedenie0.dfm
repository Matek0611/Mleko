inherited fmKartTovarSvedenie: TfmKartTovarSvedenie
  Left = 300
  Top = 248
  BorderStyle = bsDialog
  Caption = #1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1074' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
  ClientHeight = 400
  ClientWidth = 1007
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TcitDBGrid [0]
    Left = 0
    Top = 0
    Width = 1007
    Height = 373
    MarkDisabled = False
    MarkColor = clAqua
    MarkFont.Charset = DEFAULT_CHARSET
    MarkFont.Color = clNavy
    MarkFont.Height = -11
    MarkFont.Name = 'MS Sans Serif'
    MarkFont.Style = []
    LightedFont.Charset = DEFAULT_CHARSET
    LightedFont.Color = clMaroon
    LightedFont.Height = -11
    LightedFont.Name = 'MS Sans Serif'
    LightedFont.Style = []
    LightedColor = clWindow
    DisabledFont.Charset = DEFAULT_CHARSET
    DisabledFont.Color = clSilver
    DisabledFont.Height = -11
    DisabledFont.Name = 'MS Sans Serif'
    DisabledFont.Style = []
    DisabledColor = clWindow
    MultiPress = False
    EnableTitlePress = False
    MarkShortCut = 116
    SaveOnClose = True
    TitleHeight = 17
    TitleColor = clBtnFace
    Align = alClient
    Options = [dgTitles, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NaklNo'
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 54
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateNakl'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Width = 191
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameFirst'
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Address'
        Title.Alignment = taCenter
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 202
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Weight'
        Title.Alignment = taCenter
        Title.Caption = #1042#1077#1089
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KolPerPak'
        Title.Alignment = taCenter
        Title.Caption = #1071#1097#1080#1082
        Width = 53
        Visible = True
      end>
  end
  object paBottom: TPanel [1]
    Left = 0
    Top = 373
    Width = 1007
    Height = 27
    Align = alBottom
    TabOrder = 1
    object bbCancel: TBitBtn
      Left = 708
      Top = 3
      Width = 83
      Height = 22
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
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
  object DBGridEh2: TDBGridEh [2]
    Left = 0
    Top = 0
    Width = 1007
    Height = 373
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
    SumList.Active = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'nom'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088
        Title.TitleButton = True
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'datenakl'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
        Width = 176
      end
      item
        EditButtons = <>
        FieldName = 'address'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 153
      end
      item
        EditButtons = <>
        FieldName = 'carsname'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
        Width = 155
      end
      item
        EditButtons = <>
        FieldName = 'qty_change'
        Footers = <>
        Title.Caption = #1050#1086#1083' '#1080#1079#1084
        Width = 47
      end
      item
        EditButtons = <>
        FieldName = 'qty_before'
        Footers = <>
        Title.Caption = #1050#1086#1083' '#1076#1086
        Width = 46
      end
      item
        EditButtons = <>
        FieldName = 'qty_after'
        Footers = <>
        Title.Caption = #1050#1086#1083' '#1087#1086#1089
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'qty_rest_before'
        Footers = <>
        Title.Caption = #1054#1089#1090' '#1076#1086
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'qty_rest_after'
        Footers = <>
        Title.Caption = #1054#1089#1090' '#1087#1086#1089
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'Action_date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1080#1079#1084
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'Action_User'
        Footers = <>
        Title.Caption = #1054#1087#1077#1088#1072#1090#1086#1088
        Width = 102
      end>
  end
  inherited ActionList: TActionList
    Top = 48
  end
  object quNaklR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT    s.NaklNo'
      '         ,s.nom'
      '         ,s.datenakl'
      '         ,s.tipname'
      '         ,s.name'
      '         ,s.carsname'
      '         ,s.qty_after'
      '         ,s.qty_before'
      '         ,s.qty_rest_after'
      '         ,s.qty_rest_before'
      '         ,s.qty_change'
      '         ,s.address'
      '         ,s.Action_User'
      '         ,s.Action_date'
      'FROM     v_audit_dspec s '
      'WHERE    s.TruncDateChange= :DateNakl'
      'AND s.tovarno = :TovarNo'
      'ORDER BY s.name')
    FetchRows = 1
    Left = 48
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'DateNakl'
        Size = 10
        Value = '01.01.2004'
      end
      item
        DataType = ftString
        Name = 'TovarNo'
        Size = 1
        Value = '1'
      end>
  end
  object dsNaklR: TDataSource
    DataSet = quNaklR
    Left = 48
    Top = 136
  end
end
