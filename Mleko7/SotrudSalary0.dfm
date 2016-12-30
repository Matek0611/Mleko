inherited fmSotrudSalary: TfmSotrudSalary
  Left = 861
  Top = 206
  Width = 751
  Height = 305
  Caption = 'fmSotrudSalary'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar [0]
    Left = 8
    Top = 8
    Width = 361
    Height = 16
    TabOrder = 0
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Left = 128
    Top = 24
  end
  object dsSotrudSalary3: TDataSource
    DataSet = spSotrudSalary3
    Left = 432
    Top = 80
  end
  object frDBDataSet3: TfrDBDataSet
    DataSource = dsSotrudSalary3
    Left = 432
    Top = 136
  end
  object frReport3: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport3GetValue
    Left = 432
    Top = 184
    ReportForm = {19000000}
  end
  object quNaklR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select VidTov'
      '      .VidName'
      #9'  ,Tovar.NameTovar'
      #9'  ,Sum(Rashod.Kol) Kol'
      #9'  ,Sum(Rashod.Kol*Rashod.PriceOut) Summa'
      
        'from NaklR,Rashod,Tovar left outer join VidTov on VidTov.VidNo=T' +
        'ovar.VidNo'
      'where (NaklR.DateNakl>=:DateBegin) and'
      '      (NaklR.DateNakl<=:DateEnd)  and'
      '      (NaklR.SotrudNo=:SotrudNo)        and'
      '      (NaklR.NaklNo=Rashod.NaklNo)      and'
      '      (Rashod.TovarNo=Tovar.TovarNo)'
      'group by VidTov.VidName,Tovar.NameTovar'
      'order by VidTov.VidName,Tovar.NameTovar')
    Left = 536
    Top = 24
    ParamData = <
      item
        DataType = ftDate
        Name = 'DateBegin'
      end
      item
        DataType = ftDate
        Name = 'DateEnd'
      end
      item
        DataType = ftSmallint
        Name = 'SotrudNo'
      end>
    object quNaklRVidName: TStringField
      FieldName = 'VidName'
      Size = 30
    end
    object quNaklRNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 30
    end
    object quNaklRKol: TFloatField
      FieldName = 'Kol'
    end
    object quNaklRSumma: TFloatField
      FieldName = 'Summa'
    end
  end
  object dsNaklR: TDataSource
    DataSet = quNaklR
    Left = 544
    Top = 80
  end
  object frDBDataSet4: TfrDBDataSet
    DataSource = dsNaklR
    Left = 544
    Top = 144
  end
  object frReport4: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport3GetValue
    Left = 536
    Top = 208
    ReportForm = {19000000}
  end
  object spSotrudSalary3: TMSStoredProc
    StoredProcName = 'dbo.SotrudSalary3'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL dbo.SotrudSalary3 (:SotrudNo, :DateBegin, ' +
        ':DateEnd)}')
    Left = 432
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftSmallint
        Name = 'SotrudNo'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
        Value = 37257d
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
        Value = 37257d
      end>
    object spSotrudSalary3Summa1: TFloatField
      FieldName = 'Summa1'
    end
    object spSotrudSalary3Summa2: TFloatField
      FieldName = 'Summa2'
    end
    object spSotrudSalary3Summa3: TFloatField
      FieldName = 'Summa3'
    end
    object spSotrudSalary3Summa4: TFloatField
      FieldName = 'Summa4'
    end
    object spSotrudSalary3Summa5: TFloatField
      FieldName = 'Summa5'
    end
    object spSotrudSalary3Summa6: TFloatField
      FieldName = 'Summa6'
    end
    object spSotrudSalary3Summa7: TFloatField
      FieldName = 'Summa7'
    end
    object spSotrudSalary3Summa8: TFloatField
      FieldName = 'Summa8'
    end
    object spSotrudSalary3DatePlat: TDateTimeField
      FieldName = 'DatePlat'
    end
    object spSotrudSalary3DateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object spSotrudSalary3NomNakl: TIntegerField
      FieldName = 'NomNakl'
    end
    object spSotrudSalary3ColnPrice: TSmallintField
      FieldName = 'ColnPrice'
    end
    object spSotrudSalary3Name: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spSotrudSalary3TipName: TStringField
      FieldName = 'TipName'
      Size = 10
    end
  end
  object quNaklR2: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select VidTov.VidName,Tovar.NameTovar,'
      '       Sum(Rashod.Kol) Kol,Sum(Rashod.Kol*Rashod.PriceOut) Summa'
      
        'from NaklR,Rashod,Tovar left outer join VidTov on VidTov.VidNo=T' +
        'ovar.VidNo'
      'where (NaklR.DateNaklFirst>=:DateBegin) and'
      '      (NaklR.DateNaklFirst<=:DateEnd)  and'
      '      (NaklR.NaklNo=Rashod.NaklNo)      and'
      
        '      (Rashod.TovarNo=Tovar.TovarNo)  AND (NaklR.OtdelNo in :Otd' +
        'elNo)'
      'group by VidTov.VidName,Tovar.NameTovar'
      'order by VidTov.VidName,Tovar.NameTovar')
    Left = 624
    Top = 24
    ParamData = <
      item
        DataType = ftDate
        Name = 'DateBegin'
      end
      item
        DataType = ftDate
        Name = 'DateEnd'
      end
      item
        DataType = ftVariant
        Name = 'OtdelNo'
        Value = '(1)'
      end>
    object StringField1: TStringField
      FieldName = 'VidName'
      Size = 30
    end
    object StringField2: TStringField
      FieldName = 'NameTovar'
      Size = 30
    end
    object BCDField1: TFloatField
      FieldName = 'Kol'
    end
    object BCDField2: TFloatField
      FieldName = 'Summa'
    end
  end
  object dsNaklR2: TDataSource
    DataSet = quNaklR2
    Left = 632
    Top = 80
  end
  object frDBDataSet5: TfrDBDataSet
    DataSource = dsNaklR2
    Left = 632
    Top = 144
  end
  object frReport5: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport3GetValue
    Left = 632
    Top = 208
    ReportForm = {19000000}
  end
end
