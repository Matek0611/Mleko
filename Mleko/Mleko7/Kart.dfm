inherited fmKart: TfmKart
  Left = 64
  Top = 18
  Width = 558
  Height = 434
  ActiveControl = RxDBGrid1
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1090#1086#1074#1072#1088#1072
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox [0]
    Left = 8
    Top = 0
    Width = 529
    Height = 137
    Caption = #1055#1088#1080#1093#1086#1076#1099
    TabOrder = 3
  end
  object GroupBox1: TGroupBox [1]
    Left = 8
    Top = 144
    Width = 529
    Height = 225
    Caption = #1056#1072#1089#1093#1086#1076#1099
    TabOrder = 2
  end
  object RxDBGrid1: TRxDBGrid [2]
    Left = 16
    Top = 16
    Width = 513
    Height = 113
    DataSource = dsPrihod
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DateNakl'
        Title.Caption = #1044#1072#1090#1072
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BuhName'
        Title.Caption = #1058#1080#1087
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
        Width = 159
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nom'
        Title.Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Caption = #1062#1077#1085#1072
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid [3]
    Left = 16
    Top = 160
    Width = 513
    Height = 201
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
        FieldName = 'DateNakl'
        Title.Caption = #1044#1072#1090#1072
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BuhName'
        Title.Caption = #1058#1080#1087
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nom'
        Title.Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceOut'
        Title.Caption = #1062#1077#1085#1072
        Visible = True
      end>
  end
  object bbClose: TBitBtn [4]
    Left = 440
    Top = 376
    Width = 81
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    ModalResult = 2
    TabOrder = 4
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object bbPrint: TBitBtn [5]
    Left = 224
    Top = 376
    Width = 75
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100
    TabOrder = 5
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
  object quPrihod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Prihod.Kol,Prihod.Price,DateNakl,NaklP.Nom,Post.Name,'
      '       TipNakl.TipName BuhName'
      'from Prihod,NaklP,Post,TipNakl'
      'where (NaklP.NaklNo=Prihod.NaklNo) and'
      '      (Prihod.TovarNo=:TovarNo)    and'
      '      (NaklP.PostNo=Post.PostNo)   and'
      '      (NaklP.Buh=TipNakl.TipNo)'
      'order by NaklP.DateNakl'
      '')
    Left = 192
    Top = 96
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'TovarNo'
        Value = 3
      end>
    object quPrihodKol: TFloatField
      FieldName = 'Kol'
      Origin = 'Prihod.Kol'
    end
    object quPrihodPrice: TFloatField
      FieldName = 'Price'
      Origin = 'Prihod.Price'
      DisplayFormat = '0.00##'
    end
    object quPrihodDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklP.DateNakl'
    end
    object quPrihodNom: TIntegerField
      FieldName = 'Nom'
      Origin = 'NaklP.Nom'
    end
    object quPrihodName: TStringField
      FieldName = 'Name'
      Origin = 'Post.Name'
      Size = 30
    end
    object quPrihodBuhName: TStringField
      FieldName = 'BuhName'
      Origin = 'TipNakl.TipName'
      Size = 10
    end
  end
  object dsPrihod: TDataSource
    DataSet = quPrihod
    Left = 240
    Top = 96
  end
  object dsRashod: TDataSource
    DataSet = quRashod
    Left = 248
    Top = 208
  end
  object quRashod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select Rashod.Kol,Rashod.PriceOut,NaklR.DateNaklFirst DateNakl,N' +
        'aklR.Nom,'
      '       TipNakl.TipName BuhName,Post.Name'
      'from Rashod,NaklR,Post,TipNakl'
      'where (NaklR.NaklNo=Rashod.NaklNo) and'
      '      (Rashod.TovarNo=:TovarNo)    and'
      '      (NaklR.PostNoFirst=Post.PostNo)   and'
      '      (NaklR.Buh=TipNakl.TipNo)'
      'order by NaklR.DateNakl')
    Left = 192
    Top = 208
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'TovarNo'
        Value = 3
      end>
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
    object quRashodDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklR.DateNakl'
    end
    object quRashodNom: TIntegerField
      FieldName = 'Nom'
      Origin = 'NaklR.Nom'
    end
    object quRashodBuhName: TStringField
      FieldName = 'BuhName'
      Origin = 'TipNakl.TipName'
      Size = 10
    end
    object quRashodName: TStringField
      FieldName = 'Name'
      Origin = 'Post.Name'
      Size = 30
    end
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Left = 112
    Top = 224
  end
end
