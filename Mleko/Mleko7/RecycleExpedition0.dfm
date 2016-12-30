inherited fmRecycleExpedition: TfmRecycleExpedition
  Left = 419
  Top = 209
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1048#1089#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1074' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
  ClientHeight = 447
  ClientWidth = 752
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh [0]
    Left = 0
    Top = 194
    Width = 752
    Height = 227
    Align = alClient
    DataSource = dsNakls
    Flat = True
    FooterColor = clBtnFace
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    SumList.Active = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    Columns = <
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'Nom'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 53
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'DateDel'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 130
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'TipName'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1042#1080#1076
        Width = 74
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
        Width = 220
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'Kol'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 59
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'UserName'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        Width = 160
      end>
  end
  object paBottom: TPanel [1]
    Left = 0
    Top = 421
    Width = 752
    Height = 26
    Align = alBottom
    TabOrder = 2
    object bbCancel: TBitBtn
      Left = 657
      Top = 1
      Width = 93
      Height = 24
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
    Width = 752
    Height = 194
    Align = alTop
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
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGridEh2CellClick
    OnDblClick = DBGridEh2DblClick
    OnDrawColumnCell = DBGridEh2DrawColumnCell
    OnTitleBtnClick = DBGridEh2TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TovarNo'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
        Width = 53
      end
      item
        EditButtons = <>
        FieldName = 'NameTovar'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
        Title.TitleButton = True
        Width = 246
      end
      item
        EditButtons = <>
        FieldName = 'NameCompany'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 125
      end
      item
        EditButtons = <>
        FieldName = 'EdIzm'
        Footers = <>
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'RashodOut'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1041#1099#1083#1086
        Title.TitleButton = True
        Width = 51
      end
      item
        EditButtons = <>
        FieldName = 'RashodReal'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1056#1077#1072#1083#1100#1085#1086
        Title.TitleButton = True
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'RashodRazn'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1079#1085#1080#1094#1072
        Title.TitleButton = True
        Width = 61
      end>
  end
  inherited ActionList: TActionList
    Top = 72
  end
  object quRashodTovarChange: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     s.TovarNo, s.NameTovar, s.NameCompany, s.EdIzm, SUM(s' +
        '.qty_change) AS Kol'
      'FROM       v_audit_dspec s'
      'WHERE     s.ExpeditionNo = :ExpeditionNo'
      'GROUP BY s.TovarNo, s.NameTovar, s.NameCompany, s.EdIzm'
      'HAVING      SUM(s.qty_change)<>0')
    Left = 304
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'ExpeditionNo'
        Size = 1
        Value = '0'
      end>
    object quRashodTovarChangeTovarNo: TSmallintField
      FieldName = 'TovarNo'
      Origin = 's.TovarNo'
    end
    object quRashodTovarChangeNameTovar: TStringField
      FieldName = 'NameTovar'
      Origin = 's.NameTovar'
      FixedChar = True
      Size = 128
    end
    object quRashodTovarChangeNameCompany: TStringField
      FieldName = 'NameCompany'
      Origin = 's.NameCompany'
      FixedChar = True
      Size = 30
    end
    object quRashodTovarChangeEdIzm: TStringField
      FieldName = 'EdIzm'
      Origin = 's.EdIzm'
      FixedChar = True
      Size = 5
    end
    object quRashodTovarChangeKol: TFloatField
      FieldName = 'Kol'
      Origin = '.'
    end
  end
  object dsNaklR: TDataSource
    DataSet = mdRashod
    Left = 48
    Top = 136
  end
  object quRashodTovarReal: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     Rashod.TovarNo, SUM(Rashod.Kol) AS Kol'
      'FROM         Rashod INNER JOIN'
      '                      NaklR ON Rashod.NaklNo = NaklR.NaklNo'
      'WHERE     (NaklR.ExpeditionNo = :ExpeditionNo)'
      'GROUP BY Rashod.TovarNo')
    Left = 304
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'ExpeditionNo'
        Size = 1
        Value = '0'
      end>
    object quRashodTovarRealTovarNo: TSmallintField
      FieldName = 'TovarNo'
      Origin = 'BASE.Rashod.TovarNo'
    end
    object quRashodTovarRealKol: TFloatField
      FieldName = 'Kol'
      Origin = 'BASE.Rashod.Kol'
    end
  end
  object mdRashod: TRxMemoryData
    FieldDefs = <>
    Left = 258
    Top = 54
    object mdRashodTovarNo: TIntegerField
      FieldName = 'TovarNo'
    end
    object mdRashodNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 50
    end
    object mdRashodNameCompany: TStringField
      FieldName = 'NameCompany'
      Size = 50
    end
    object mdRashodEdIzm: TStringField
      FieldName = 'EdIzm'
      Size = 10
    end
    object mdRashodRashodOut: TFloatField
      FieldName = 'RashodOut'
    end
    object mdRashodRashodReal: TFloatField
      FieldName = 'RashodReal'
    end
    object mdRashodRashodRazn: TFloatField
      FieldName = 'RashodRazn'
    end
  end
  object quNakl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     NaklNo'
      'FROM         NaklRChange'
      'WHERE     (ExpeditionNo = :ExpeditionNo)  '
      'ORDER BY NaklNo')
    Left = 150
    Top = 94
    ParamData = <
      item
        DataType = ftString
        Name = 'ExpeditionNo'
        Size = 1
        Value = '0'
      end>
    object quNaklNaklNo: TIntegerField
      FieldName = 'NaklNo'
      Origin = 'BASE.NaklRChange.NaklNo'
    end
  end
  object quNakls: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     s.NaklNo, s.NameTovar, s.EdIzm, s.qty_change as Kol, ' +
        's.Name, s.TruncDateChange as DateDel, s.Nom, '
      '                      s.TipName,  s.Action_User as UserName'
      'FROM  v_audit_dspec s'
      'ORDER BY s.Name, s.DateDel')
    Left = 112
    Top = 254
    object quNaklsNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quNaklsNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object quNaklsEdIzm: TStringField
      FieldName = 'EdIzm'
      FixedChar = True
      Size = 5
    end
    object quNaklsKol: TFloatField
      FieldName = 'Kol'
    end
    object quNaklsName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object quNaklsDateDel: TDateTimeField
      FieldName = 'DateDel'
    end
    object quNaklsNom: TIntegerField
      FieldName = 'Nom'
    end
    object quNaklsTipName: TStringField
      FieldName = 'TipName'
      FixedChar = True
      Size = 10
    end
    object quNaklsUserName: TStringField
      FieldName = 'UserName'
      FixedChar = True
    end
  end
  object dsNakls: TDataSource
    DataSet = quNakls
    Left = 158
    Top = 290
  end
end
