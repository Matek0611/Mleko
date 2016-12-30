inherited fmKartVerife: TfmKartVerife
  Left = 234
  Top = 207
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1086#1089#1090#1072#1090#1082#1072
  ClientHeight = 337
  ClientWidth = 547
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TDBGridEh [0]
    Left = 0
    Top = 0
    Width = 547
    Height = 296
    Align = alClient
    DataSource = DataSource1
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghClearSelection, dghFitRowHeightToText, dghTraceColSizing]
    RowHeight = 2
    RowLines = 1
    RowSizingAllowed = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDblClick = RxDBGrid1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TovarNo'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #8470
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 36
      end
      item
        EditButtons = <>
        FieldName = 'TovarName'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 321
      end
      item
        EditButtons = <>
        FieldName = 'OstatokRas'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1056#1072#1089#1095#1077#1090
        Title.TitleButton = True
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'Ostatok'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082
        Width = 80
      end>
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 296
    Width = 547
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 377
      Top = 8
      Width = 76
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      Default = True
      TabOrder = 0
      OnClick = bbOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbCancel: TBitBtn
      Left = 457
      Top = 8
      Width = 76
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = bbCancelClick
      Kind = bkCancel
    end
  end
  object quTovar: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Tovar.TovarNo, Tovar.NameTovar, Ostatok.Kol AS Ostato' +
        'k, SUM(Rashod.Kol) AS Rashod'
      'FROM         Tovar LEFT OUTER JOIN'
      
        '                      Rashod ON Tovar.TovarNo = Rashod.TovarNo L' +
        'EFT OUTER JOIN'
      '                      Ostatok ON Tovar.TovarNo = Ostatok.TovarNo'
      'WHERE     (Tovar.OtdelNo = 1) OR'
      '                      (Tovar.OtdelNo = 2)'
      'GROUP BY Tovar.TovarNo, Tovar.NameTovar, Ostatok.Kol'
      'ORDER BY Tovar.NameTovar DESC')
    Left = 30
    Top = 52
    object quTovarTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object quTovarOstatok: TFloatField
      FieldName = 'Ostatok'
    end
    object quTovarRashod: TFloatField
      FieldName = 'Rashod'
    end
  end
  object quPrihod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     SUM(Prihod.Kol) AS Kol'
      'FROM         Tovar LEFT OUTER JOIN'
      '                      Prihod ON Tovar.TovarNo = Prihod.TovarNo'
      'WHERE     (Tovar.TovarNo = :TovarNo)')
    Left = 28
    Top = 84
    ParamData = <
      item
        DataType = ftString
        Name = 'TovarNo'
        Size = 1
        Value = '0'
      end>
    object quPrihodKol: TFloatField
      FieldName = 'Kol'
      Origin = 'BASE.Prihod.Kol'
    end
  end
  object quRashod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     SUM(Rashod.Kol) AS Kol'
      'FROM         Tovar LEFT OUTER JOIN'
      '                      Rashod ON Tovar.TovarNo = Rashod.TovarNo'
      'WHERE     (Tovar.TovarNo = :TovarNo)')
    Left = 30
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'TovarNo'
        Size = 1
        Value = '0'
      end>
    object quRashodKol: TFloatField
      FieldName = 'Kol'
      Origin = 'BASE.Rashod.Kol'
    end
  end
  object mdTovarError: TRxMemoryData
    FieldDefs = <>
    Left = 86
    Top = 52
    object mdTovarErrorTovarNo: TIntegerField
      FieldName = 'TovarNo'
    end
    object mdTovarErrorTovarName: TStringField
      FieldName = 'TovarName'
      Size = 200
    end
    object mdTovarErrorOstatokRas: TFloatField
      FieldName = 'OstatokRas'
    end
    object mdTovarErrorOstatok: TFloatField
      FieldName = 'Ostatok'
    end
  end
  object DataSource1: TDataSource
    DataSet = mdTovarError
    Left = 86
    Top = 84
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 86
    Top = 150
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = DataSource1
    Left = 88
    Top = 118
  end
end
