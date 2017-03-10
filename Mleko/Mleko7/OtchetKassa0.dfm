inherited fmOtchetKassa: TfmOtchetKassa
  Left = 867
  Top = 278
  Width = 435
  Height = 197
  Caption = 'fmOtchetKassa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 88
    Top = 112
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = dsPlatP
    Left = 16
    Top = 72
  end
  object dsPlatP: TDataSource
    DataSet = quPlatP
    Left = 16
    Top = 40
  end
  object quPlatR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select PlatR.Summa,Post.Name,PlatR.Spravka,PlatR.DatePlat,PlatR.' +
        'Nom, PlatR.CurrencyHead'
      
        'from PlatR join Post on (Post.PostNo=PlatR.PostNo and PlatR.is_e' +
        'conom=0)'
      'where (PlatR.DatePlat>=:DateBegin) '
      '  and (PlatR.DatePlat<=:DateEnd)   '
      '  and (PlatR.Buh=:Buh)'
      '  and PlatR.OurFirmNo= :OurFirmNo'
      '  and isnull(PlatR.TipPlat,0)<>6'
      '  and PlatR.CurrencyHead = '#39'UAH'#39
      'order by PlatR.Summa,DatePlat,Nom')
    BeforeOpen = quPlatRBeforeOpen
    Left = 56
    Top = 8
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBegin'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
      end>
    object BCDField1: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '0.00'
    end
    object StringField1: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'Spravka'
      Size = 55
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DatePlat'
    end
    object IntegerField1: TIntegerField
      FieldName = 'Nom'
    end
  end
  object frDBDataSet2: TfrDBDataSet
    DataSource = dsPlatR
    Left = 56
    Top = 72
  end
  object dsPlatR: TDataSource
    DataSet = quPlatR
    Left = 56
    Top = 40
  end
  object quSaleCash: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Sum(Kol*Price) Summa'
      'from SaleCash'
      'where (DateTimeSale>=:DateBegin) and'
      '      (DateTimeSale<:DateEnd)')
    Left = 96
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
    object quSaleCashSumma: TFloatField
      FieldName = 'Summa'
    end
  end
  object quPlatPSumm: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select SUM(PlatP.Summa) AS Summ'
      'from PlatP'
      'where (PlatP.DatePlat>=:DateBegin) '
      '  and (PlatP.DatePlat<=:DateEnd)   '
      '  and (PlatP.Buh=:Buh) '
      '  and PlatP.OurFirmNo= :OurFirmNo'
      '  and isnull(PlatP.TipPlat,0) <> 6'
      '  and PlatP.CurrencyHead = '#39'UAH'#39)
    BeforeOpen = quPlatPSummBeforeOpen
    Left = 96
    Top = 40
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBegin'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
      end>
    object quPlatPSummSumm: TFloatField
      FieldName = 'Summ'
      Origin = 'BASE.PlatP.Summa'
    end
  end
  object quPlatRSumm: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select SUM(PlatR.Summa) AS Summ'
      'from PlatR'
      'where (PlatR.DatePlat >= :DateBegin) '
      '  and (PlatR.DatePlat <= :DateEnd)   '
      '  and (PlatR.Buh = :Buh) '
      '  and PlatR.is_econom = 0'
      '  and PlatR.OurFirmNo= :OurFirmNo'
      '  and isnull(PlatR.TipPlat,0)<>6'
      '  and PlatR.CurrencyHead = '#39'UAH'#39)
    BeforeOpen = quPlatRSummBeforeOpen
    Left = 96
    Top = 72
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBegin'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
      end>
    object quPlatRSummSumm: TFloatField
      FieldName = 'Summ'
      Origin = 'BASE.PlatR.Summa'
    end
  end
  object quPlatPUSD: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select PlatP.Summa,Post.Name,PlatP.Spravka,PlatP.DatePlat,PlatP.' +
        'Nom,TipNakl.TipName NameBuh, PlatP.CurrencyHead'
      'from PlatP join '
      '     Post on (Post.PostNo=PlatP.PostNo) join '
      '     TipNakl on (TipNakl.TipNo=PlatP.Buh)'
      'where (PlatP.DatePlat>=:DateBegin) '
      '  and (PlatP.DatePlat<=:DateEnd)   '
      '  and (PlatP.Buh=:Buh)'
      '  and isnull(PlatP.TipPlat,0) <> 6'
      '  and PlatP.OurFirmNo= :OurFirmNo'
      '  and PlatP.CurrencyHead = '#39'USD'#39
      'order by PlatP.Summa,DatePlat,Nom')
    BeforeOpen = quPlatPUSDBeforeOpen
    Left = 176
    Top = 8
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBegin'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
      end>
    object FloatField1: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '0.00'
    end
    object StringField3: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object StringField4: TStringField
      FieldName = 'Spravka'
      Size = 55
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'DatePlat'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Nom'
    end
    object StringField5: TStringField
      FieldName = 'NameBuh'
      Size = 10
    end
  end
  object dsPlatPUSD: TDataSource
    DataSet = quPlatPUSD
    Left = 176
    Top = 40
  end
  object dsPlatRUSD: TDataSource
    DataSet = quPlatRUSD
    Left = 216
    Top = 40
  end
  object quPlatRUSD: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select PlatR.Summa,Post.Name,PlatR.Spravka,PlatR.DatePlat,PlatR.' +
        'Nom, PlatR.CurrencyHead'
      
        'from PlatR join Post on (Post.PostNo=PlatR.PostNo and PlatR.is_e' +
        'conom=0)'
      'where (PlatR.DatePlat>=:DateBegin) '
      '  and (PlatR.DatePlat<=:DateEnd)   '
      '  and (PlatR.Buh=:Buh)'
      '  and PlatR.OurFirmNo= :OurFirmNo'
      '  and isnull(PlatR.TipPlat,0)<>6'
      '  and PlatR.CurrencyHead = '#39'USD'#39
      'order by PlatR.Summa,DatePlat,Nom')
    BeforeOpen = quPlatRUSDBeforeOpen
    Left = 216
    Top = 8
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBegin'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
      end>
    object FloatField2: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '0.00'
    end
    object StringField6: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object StringField7: TStringField
      FieldName = 'Spravka'
      Size = 55
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'DatePlat'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Nom'
    end
  end
  object frDBDataSet3: TfrDBDataSet
    DataSource = dsPlatPUSD
    Left = 176
    Top = 72
  end
  object frDBDataSet4: TfrDBDataSet
    DataSource = dsPlatRUSD
    Left = 216
    Top = 72
  end
  object quPlatPSummUSD: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select SUM(PlatP.Summa) AS Summ'
      'from PlatP'
      'where (PlatP.DatePlat>=:DateBegin) '
      '  and (PlatP.DatePlat<=:DateEnd)   '
      '  and (PlatP.Buh=:Buh) '
      '  and PlatP.OurFirmNo= :OurFirmNo'
      '  and isnull(PlatP.TipPlat,0) <> 6'
      '  and PlatP.CurrencyHead = '#39'USD'#39)
    BeforeOpen = quPlatPSummUSDBeforeOpen
    Left = 256
    Top = 40
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBegin'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
      end>
    object FloatField3: TFloatField
      FieldName = 'Summ'
      Origin = 'BASE.PlatP.Summa'
    end
  end
  object quPlatRSummUSD: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select SUM(PlatR.Summa) AS Summ'
      'from PlatR'
      'where (PlatR.DatePlat >= :DateBegin) '
      '  and (PlatR.DatePlat <= :DateEnd)   '
      '  and (PlatR.Buh = :Buh) '
      '  and PlatR.is_econom = 0'
      '  and PlatR.OurFirmNo= :OurFirmNo'
      '  and isnull(PlatR.TipPlat,0)<>6'
      '  and PlatR.CurrencyHead = '#39'USD'#39)
    BeforeOpen = quPlatRSummUSDBeforeOpen
    Left = 256
    Top = 72
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBegin'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
      end>
    object FloatField4: TFloatField
      FieldName = 'Summ'
      Origin = 'BASE.PlatR.Summa'
    end
  end
  object quPlatP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select PlatP.Summa,Post.Name,PlatP.Spravka,PlatP.DatePlat,PlatP.' +
        'Nom,TipNakl.TipName NameBuh, PlatP.CurrencyHead'
      'from PlatP join '
      '     Post on (Post.PostNo=PlatP.PostNo) join '
      '     TipNakl on (TipNakl.TipNo=PlatP.Buh)'
      'where (PlatP.DatePlat>=:DateBegin) '
      '  and (PlatP.DatePlat<=:DateEnd)   '
      '  and (PlatP.Buh=:Buh)'
      '  and isnull(PlatP.TipPlat,0) <> 6'
      '  and PlatP.OurFirmNo= :OurFirmNo'
      '  and PlatP.CurrencyHead = '#39'UAH'#39
      'order by PlatP.Summa,DatePlat,Nom')
    BeforeOpen = quPlatPBeforeOpen
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBegin'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'OurFirmNo'
      end>
    object FloatField5: TFloatField
      FieldName = 'Summa'
      DisplayFormat = '0.00'
    end
    object StringField8: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object StringField9: TStringField
      FieldName = 'Spravka'
      Size = 55
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'DatePlat'
    end
    object IntegerField4: TIntegerField
      FieldName = 'Nom'
    end
    object StringField10: TStringField
      FieldName = 'NameBuh'
      Size = 10
    end
  end
end
