object CreateDbfForMail0: TCreateDbfForMail0
  Left = 848
  Top = 197
  Width = 612
  Height = 199
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1081' '#1085#1072#1082#1083#1072#1076#1085#1086#1081' '#1076#1083#1103' '#1074#1099#1075#1088#1091#1079#1082#1080' '#1085#1072' '#1101#1083'. '#1087#1086#1095#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DB: TMSConnection
    Database = 'work'
    Username = 'sa'
    Password = '3#_KVAZAR@'
    Server = 'SIRIUS\KVAZAR'
    Connected = True
    Left = 8
    Top = 8
  end
  object quNaklRPostExport: TMSQuery
    Connection = DB
    SQL.Strings = (
      'Select TovarNoP'
      '      ,BarCode'
      '      ,NameTov'
      '      ,EdIzm'
      '      ,PrNoNDS'
      '      ,Price'
      '      ,StavNDS'
      '      ,QTY'
      '      ,SumNoNDS'
      '      ,Summa'
      '      ,NomNaklR'
      '      ,cast(Date as datetime) Date'
      '      ,SumNaklR'
      '      ,SNRNoNDS'
      '      ,OurFirm'
      '      ,OurOKPO'
      '      ,Firm'
      '      ,AdrPost'
      '      ,PostNo'
      '      ,AddressNo'
      '      ,VidName'
      '      ,NameTovar'
      '      ,AddresId'
      ' from v_NaklRPost_Export v'
      '  where v.PostNo = Isnull( :PostNo ,v.PostNo)'
      
        '    and Isnull (:date1,cast(v.date as date)) <= cast(v.date as d' +
        'ate)'
      
        '    and Isnull (:date2,cast(v.date as date)) >= cast(v.date as d' +
        'ate)'
      '    and v.AddressNo = Isnull(:AddressNo, v.AddressNo)'
      '    and v.NomNaklR = Isnull(:NomNaklR, v.NomNaklR)'
      'order by VidName, NameTovar')
    Left = 38
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftDateTime
        Name = 'date1'
      end
      item
        DataType = ftDateTime
        Name = 'date2'
      end
      item
        DataType = ftInteger
        Name = 'AddressNo'
      end
      item
        DataType = ftInteger
        Name = 'NomNaklR'
      end>
    object quNaklRPostExportTovarNoP: TIntegerField
      FieldName = 'TovarNoP'
      ReadOnly = True
    end
    object quNaklRPostExportBarCode: TLargeintField
      FieldName = 'BarCode'
      ReadOnly = True
    end
    object quNaklRPostExportNameTov: TStringField
      FieldName = 'NameTov'
      ReadOnly = True
      Size = 128
    end
    object quNaklRPostExportEdIzm: TStringField
      FieldName = 'EdIzm'
      Size = 5
    end
    object quNaklRPostExportPrNoNDS: TFloatField
      FieldName = 'PrNoNDS'
      ReadOnly = True
    end
    object quNaklRPostExportPrice: TFloatField
      FieldName = 'Price'
      ReadOnly = True
    end
    object quNaklRPostExportStavNDS: TStringField
      FieldName = 'StavNDS'
      ReadOnly = True
      Size = 2
    end
    object quNaklRPostExportQTY: TFloatField
      FieldName = 'QTY'
    end
    object quNaklRPostExportSumNoNDS: TFloatField
      FieldName = 'SumNoNDS'
      ReadOnly = True
    end
    object quNaklRPostExportSumma: TFloatField
      FieldName = 'Summa'
      ReadOnly = True
    end
    object quNaklRPostExportNomNaklR: TIntegerField
      FieldName = 'NomNaklR'
    end
    object quNaklRPostExportDate: TDateTimeField
      FieldName = 'Date'
      ReadOnly = True
    end
    object quNaklRPostExportSumNaklR: TFloatField
      FieldName = 'SumNaklR'
    end
    object quNaklRPostExportSNRNoNDS: TFloatField
      FieldName = 'SNRNoNDS'
      ReadOnly = True
    end
    object quNaklRPostExportOurFirm: TStringField
      FieldName = 'OurFirm'
      ReadOnly = True
      Size = 80
    end
    object quNaklRPostExportOurOKPO: TStringField
      FieldName = 'OurOKPO'
      ReadOnly = True
      Size = 10
    end
    object quNaklRPostExportFirm: TStringField
      FieldName = 'Firm'
      ReadOnly = True
      Size = 80
    end
    object quNaklRPostExportAdrPost: TStringField
      FieldName = 'AdrPost'
      ReadOnly = True
      Size = 256
    end
    object quNaklRPostExportPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quNaklRPostExportAddresId: TIntegerField
      FieldName = 'AddresId'
      ReadOnly = True
    end
  end
  object dsNaklRPostExport: TDataSource
    DataSet = quNaklRPostExport
    Left = 6
    Top = 48
  end
  object TableDbf: TTable
    StoreDefs = True
    TableType = ttFoxPro
    Left = 8
    Top = 88
  end
end
