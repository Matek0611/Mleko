inherited fmKart2: TfmKart2
  Left = 299
  Top = 407
  Width = 562
  Height = 411
  ActiveControl = RxDBGrid1
  Caption = 'fmKart2'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 343
    Width = 554
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 96
      Top = 13
      Width = 48
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbClose: TBitBtn
      Left = 424
      Top = 8
      Width = 83
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
  object RxDBGrid1: TRxDBGrid [1]
    Left = 0
    Top = 0
    Width = 554
    Height = 343
    Align = alClient
    DataSource = dsKartTovar
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
        FieldName = 'DateKart'
        Title.Caption = #1044#1072#1090#1072
        Width = 63
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nom'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082'/'#1087#1086#1082#1091#1087#1072#1090#1077#1083#1100
        Width = 149
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KolPrih'
        Title.Caption = #1055#1088#1080#1093#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KolRas'
        Title.Caption = #1056#1072#1089#1093#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Caption = #1062#1077#1085#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Ostatok'
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082
        Width = 49
        Visible = True
      end>
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Left = 88
    Top = 96
  end
  object spKartTovar: TMSStoredProc
    StoredProcName = 'dbo.KartTovar'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL dbo.KartTovar (:TovarNo)}')
    Left = 288
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftSmallint
        Name = 'TovarNo'
        ParamType = ptInput
        Value = 3
      end>
    object spKartTovarDateKart: TDateTimeField
      FieldName = 'DateKart'
    end
    object spKartTovarKolPrih: TFloatField
      FieldName = 'KolPrih'
    end
    object spKartTovarKolRas: TFloatField
      FieldName = 'KolRas'
    end
    object spKartTovarTip: TSmallintField
      FieldName = 'Tip'
    end
    object spKartTovarNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object spKartTovarNom: TIntegerField
      FieldName = 'Nom'
    end
    object spKartTovarPrice: TFloatField
      FieldName = 'Price'
    end
    object spKartTovarOstatok: TFloatField
      FieldName = 'Ostatok'
    end
    object spKartTovarName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spKartTovarNameBuh: TStringField
      FieldName = 'NameBuh'
      Size = 10
    end
  end
  object dsKartTovar: TDataSource
    DataSet = spKartTovar
    Left = 288
    Top = 192
  end
end
