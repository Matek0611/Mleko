inherited fmZakupka: TfmZakupka
  Left = 123
  Top = 70
  Width = 563
  Height = 374
  Caption = #1047#1072#1103#1074#1082#1072
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid [0]
    Left = 0
    Top = 0
    Width = 555
    Height = 306
    Align = alClient
    DataSource = dsOstatok
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = RxDBGrid1KeyDown
    OnKeyPress = RxDBGrid1KeyPress
    OnGetCellParams = RxDBGrid1GetCellParams
    Columns = <
      item
        Expanded = False
        FieldName = 'NameCompany'
        Title.Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameTovar'
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 189
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        ReadOnly = True
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KolRas'
        ReadOnly = True
        Title.Caption = #1055#1088#1086#1076#1072#1085#1086
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KolZak'
        Title.Caption = #1050' '#1079#1072#1082#1091#1087#1082#1077
        Visible = True
      end>
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 306
    Width = 555
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 384
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 1
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
    object bbPrint: TBitBtn
      Left = 288
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 1
      OnClick = bbPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object quOstatok: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Ostatok.TovarNo,Sum(Ostatok.Kol) Kol,Tovar.NameTovar,'
      '       cast(0 as Decimal(18,3)) KolZak,Company.NameCompany'
      
        'from Ostatok,Tovar left outer join Company on (Company.CompanyNo' +
        '=Tovar.CompanyNo)'
      'where (Ostatok.TovarNo=Tovar.TovarNo)'
      'group by Ostatok.TovarNo,Tovar.NameTovar,Company.NameCompany'
      'order by &_order'
      '')
    CachedUpdates = True
    UpdateObject = UpdateSQL1
    BeforeDelete = quOstatokBeforeDelete
    Left = 80
    Top = 48
    MacroData = <
      item
        Name = '_order'
        Value = 'NameCompany,NameTovar'
      end>
    object quOstatokTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quOstatokNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 30
    end
    object quOstatokKol: TFloatField
      FieldName = 'Kol'
    end
    object quOstatokNameCompany: TStringField
      FieldName = 'NameCompany'
      Size = 30
    end
    object quOstatokKolZak: TFloatField
      FieldName = 'KolZak'
    end
    object quOstatokKolRas: TFloatField
      FieldKind = fkLookup
      FieldName = 'KolRas'
      LookupDataSet = quRashod
      LookupKeyFields = 'TovarNo'
      LookupResultField = 'Kol'
      KeyFields = 'TovarNo'
      Lookup = True
    end
  end
  object quRashod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select TovarNo,Sum(Kol) Kol'
      'from Rashod,NaklR'
      'where (NaklR.DateNaklFirst>=:DateBegin) and'
      '      (NaklR.DateNaklfirst<=:DateEnd)   and'
      '      (NaklR.NaklNo=Rashod.NaklNo)'
      'group by TovarNo'
      '')
    Left = 184
    Top = 8
    ParamData = <
      item
        DataType = ftDate
        Name = 'DateBegin'
      end
      item
        DataType = ftDate
        Name = 'DateEnd'
      end>
    object quRashodTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quRashodKol: TFloatField
      FieldName = 'Kol'
      Origin = 'Rashod.Kol'
    end
  end
  object dsOstatok: TDataSource
    DataSet = quOstatok
    Left = 88
    Top = 104
  end
  object UpdateSQL1: TMSUpdateSQL
    Left = 88
    Top = 160
  end
  object quWork: TMSQuery
    Left = 184
    Top = 176
  end
end
