inherited fmInfoDolgNam: TfmInfoDolgNam
  Left = 200
  Top = 108
  Width = 517
  Height = 396
  ActiveControl = RxDBGrid1
  Caption = #1044#1086#1083#1075#1080
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 161
    Width = 509
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object RxDBGrid1: TRxDBGrid [1]
    Left = 0
    Top = 0
    Width = 509
    Height = 161
    Align = alTop
    DataSource = dsNaklR
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nom'
        Title.Caption = #8470
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BuhName'
        Title.Caption = #1058#1080#1087
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateNakl'
        Title.Caption = #1044#1072#1090#1072
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateOpl'
        Title.Caption = #1054#1087#1083#1072#1090#1072
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SummaDolg'
        Title.Caption = #1044#1086#1083#1075
        Width = 86
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid [2]
    Left = 0
    Top = 164
    Width = 509
    Height = 164
    Align = alClient
    DataSource = dsRashod
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RasNo'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameTovar'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 264
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceOut'
        Title.Caption = #1062#1077#1085#1072
        Width = 80
        Visible = True
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 328
    Width = 509
    Height = 41
    Align = alBottom
    TabOrder = 2
    object bbExit: TBitBtn
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 2
      TabOrder = 0
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
  end
  object quNaklR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select NaklNo,Nom,SummaDolg,NaklR.DateNakl,Summa,DateOpl,'
      '       TipNakl.TipName BuhName'
      'from NaklR join TipNakl on (NaklR.Buh=TipNakl.TipNo)'
      'where (SummaDolg<>0) and'
      '      (PostNo=:PostNo)'
      'order by NaklR.DateNakl')
    Left = 88
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
    object quNaklRNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quNaklRNom: TIntegerField
      FieldName = 'Nom'
    end
    object quNaklRSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'NaklR.Summa'
      DisplayFormat = '#,##0.00'
    end
    object quNaklRSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      Origin = 'NaklR.SummaDolg'
      DisplayFormat = '#,##0.00'
    end
    object quNaklRDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklR.DateNakl'
    end
    object quNaklRDateOpl: TDateTimeField
      FieldName = 'DateOpl'
      Origin = 'NaklR.DateOpl'
    end
    object quNaklRBuhName: TStringField
      FieldName = 'BuhName'
      Origin = 'TipNakl.TipName'
      Size = 10
    end
  end
  object quRashod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Rashod.RasNo,Rashod.Kol,Rashod.PriceOut,Tovar.NameTovar'
      'from Rashod,Tovar'
      'where (Rashod.NaklNo=:NaklNo) and'
      '      (Rashod.TovarNo=Tovar.TovarNo)')
    MasterSource = dsNaklR
    Left = 168
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
      end>
    object quRashodNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 30
    end
    object quRashodRasNo: TSmallintField
      FieldName = 'RasNo'
      Origin = 'Rashod.RasNo'
    end
    object quRashodKol: TFloatField
      FieldName = 'Kol'
      Origin = 'Rashod.Kol'
      DisplayFormat = '0.###'
    end
    object quRashodPriceOut: TFloatField
      FieldName = 'PriceOut'
      Origin = 'Rashod.PriceOut'
      DisplayFormat = '0.00##'
    end
  end
  object dsNaklR: TDataSource
    DataSet = quNaklR
    Left = 88
    Top = 96
  end
  object dsRashod: TDataSource
    DataSet = quRashod
    Left = 168
    Top = 96
  end
end
