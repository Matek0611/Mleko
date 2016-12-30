inherited fmDolgNash: TfmDolgNash
  Left = 669
  Top = 260
  BorderStyle = bsDialog
  Caption = #1044#1086#1083#1075#1080
  ClientHeight = 408
  ClientWidth = 627
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox4: TGroupBox [0]
    Left = 6
    Top = 0
    Width = 291
    Height = 353
    Caption = #1044#1086#1083#1075
    TabOrder = 7
  end
  object GroupBox3: TGroupBox [1]
    Left = 312
    Top = 168
    Width = 305
    Height = 185
    Caption = #1058#1086#1074#1072#1088
    TabOrder = 6
  end
  object GroupBox2: TGroupBox [2]
    Left = 312
    Top = 0
    Width = 305
    Height = 161
    Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077
    TabOrder = 5
  end
  object grDolg: TRxDBGrid [3]
    Left = 14
    Top = 17
    Width = 275
    Height = 328
    DataSource = dsDolg
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = grDolgKeyDown
    OnKeyPress = grDolgKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Width = 177
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Dolg'
        Title.Caption = #1044#1086#1083#1075
        Visible = True
      end>
  end
  object grNaklR: TRxDBGrid [4]
    Left = 320
    Top = 16
    Width = 289
    Height = 137
    DataSource = dsNaklP
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nom'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DateNakl'
        Title.Caption = #1044#1072#1090#1072
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SummaDolg'
        Title.Caption = #1044#1086#1083#1075
        Width = 65
        Visible = True
      end>
  end
  object grPlat: TRxDBGrid [5]
    Left = 320
    Top = 184
    Width = 289
    Height = 161
    DataSource = dsPrihod
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PrihNo'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameTovar'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Caption = #1062#1077#1085#1072
        Width = 31
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox [6]
    Left = 8
    Top = 360
    Width = 609
    Height = 7
    TabOrder = 3
  end
  object BitBtn1: TBitBtn [7]
    Left = 520
    Top = 376
    Width = 81
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Kind = bkOK
  end
  object bbPrint: TBitBtn [8]
    Left = 424
    Top = 376
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
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
  object dsDolg: TDataSource
    DataSet = quDolg
    Left = 32
    Top = 184
  end
  object quDolg: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select SUM(SummaDolg) Dolg,Post.Name,NaklP.PostNo'
      'from NaklP ,Post'
      'where (SummaDolg<>0) and'
      '      (Post.PostNo=NaklP.PostNo)'
      '      and NaklP.OurFirmNo = :OurFirmNo'
      'group by Post.Name,NaklP.PostNo'
      'order by Post.Name')
    BeforeOpen = quDolgBeforeOpen
    Left = 32
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OurFirmNo'
      end>
    object quDolgDolg: TFloatField
      FieldName = 'Dolg'
      Origin = 'NaklP.SummaDolg'
      DisplayFormat = '0.00'
    end
    object quDolgName: TStringField
      FieldName = 'Name'
      Origin = 'Post.Name'
      Size = 30
    end
    object quDolgPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'NaklP.PostNo'
    end
  end
  object dsNaklP: TDataSource
    DataSet = quNaklP
    Left = 80
    Top = 184
  end
  object quNaklP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select NaklNo,Nom ,SummaDolg,DateNakl,Summa'
      'from NaklP'
      'where (SummaDolg<>0) and'
      '      (PostNo=:PostNo)'
      '      and NaklP.OurFirmNo = :OurFirmNo'
      '')
    MasterSource = dsDolg
    BeforeOpen = quNaklPBeforeOpen
    Left = 80
    Top = 216
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end
      item
        DataType = ftUnknown
        Name = 'OurFirmNo'
      end>
    object quNaklPNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quNaklPNom: TIntegerField
      FieldName = 'Nom'
    end
    object quNaklPSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      Origin = 'NaklP.SummaDolg'
    end
    object quNaklPDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklP.DateNakl'
    end
    object quNaklPSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'NaklP.Summa'
    end
  end
  object dsPrihod: TDataSource
    DataSet = quPrihod
    Left = 128
    Top = 184
  end
  object quPrihod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Prihod.PrihNo,Prihod.Kol,Prihod.Price,Tovar.NameTovar'
      'from Prihod,Tovar'
      'where (Prihod.NaklNo=:NaklNo) and'
      '      (Prihod.TovarNo=Tovar.TovarNo)'
      'order by PrihNo')
    MasterSource = dsNaklP
    Left = 128
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
      end>
    object quPrihodPrihNo: TSmallintField
      FieldName = 'PrihNo'
    end
    object quPrihodKol: TFloatField
      FieldName = 'Kol'
      Origin = 'Prihod.Kol'
    end
    object quPrihodPrice: TFloatField
      FieldName = 'Price'
      Origin = 'Prihod.Price'
      DisplayFormat = '0.00##'
    end
    object quPrihodNameTovar: TStringField
      FieldName = 'NameTovar'
      Origin = 'Tovar.NameTovar'
      Size = 30
    end
  end
end
