inherited fmOtchets: TfmOtchets
  Left = 616
  Top = 128
  Width = 796
  Height = 478
  Caption = 'fmOtchets'
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 362
    Top = 278
    Width = 32
    Height = 13
    Caption = 'Label1'
    Color = clWhite
    ParentColor = False
  end
  object ProgressBar1: TProgressBar [1]
    Left = 8
    Top = 8
    Width = 361
    Height = 16
    TabOrder = 0
  end
  object quNaklR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from NaklR,Post'
      'where NaklR.NaklNo=:NaklNo and'
      '      NaklR.PostNo=Post.PostNo        ')
    Left = 6
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
      end>
    object quNaklRDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklR.DateNakl'
    end
    object quNaklRSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'NaklR.Summa'
    end
    object quNaklRNom: TIntegerField
      FieldName = 'Nom'
      Origin = 'NaklR.Nom'
    end
    object quNaklRNameLong: TStringField
      FieldName = 'NameLong'
      Origin = 'Post.NameLong'
      Size = 80
    end
    object quNaklRDogovorNo: TStringField
      FieldName = 'DogovorNo'
      Origin = 'Post.DogovorNo'
      Size = 10
    end
    object quNaklRDateDogovor: TDateTimeField
      FieldName = 'DateDogovor'
      Origin = 'Post.DateDogovor'
    end
    object quNaklRNaklNo: TIntegerField
      FieldName = 'NaklNo'
      Origin = 'BASE.NaklR.NaklNo'
    end
    object quNaklRNomFirst: TStringField
      FieldName = 'NomFirst'
      Origin = 'BASE.NaklR.NomFirst'
      FixedChar = True
      Size = 10
    end
    object quNaklRPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'BASE.NaklR.PostNo'
    end
    object quNaklRDateNaklFirst: TDateTimeField
      FieldName = 'DateNaklFirst'
      Origin = 'BASE.NaklR.DateNaklFirst'
    end
    object quNaklRSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      Origin = 'BASE.NaklR.SummaDolg'
    end
    object quNaklRBuh: TSmallintField
      FieldName = 'Buh'
      Origin = 'BASE.NaklR.Buh'
    end
    object quNaklRVidNaklNo: TSmallintField
      FieldName = 'VidNaklNo'
      Origin = 'BASE.NaklR.VidNaklNo'
    end
    object quNaklRName: TStringField
      FieldName = 'Name'
      Origin = 'BASE.NaklR.ID1C'
      FixedChar = True
      Size = 30
    end
    object quNaklRNoSvidNDS: TStringField
      FieldName = 'NoSvidNDS'
      Origin = 'BASE.NaklR.ID1C'
      FixedChar = True
      Size = 8
    end
    object quNaklRCodeNDS: TStringField
      FieldName = 'CodeNDS'
      Origin = 'BASE.NaklR.ID1C'
      FixedChar = True
      Size = 12
    end
    object quNaklRAddress: TStringField
      FieldName = 'Address'
      Origin = 'BASE.NaklR.ID1C'
      FixedChar = True
      Size = 60
    end
    object quNaklRPhone: TStringField
      FieldName = 'Phone'
      Origin = 'BASE.NaklR.ID1C'
      FixedChar = True
      Size = 15
    end
    object quNaklRRS: TStringField
      FieldName = 'RS'
      Origin = 'BASE.NaklR.ID1C'
      FixedChar = True
      Size = 14
    end
    object quNaklRMFO: TStringField
      FieldName = 'MFO'
      Origin = 'BASE.NaklR.ID1C'
      FixedChar = True
      Size = 10
    end
    object quNaklRNameBank: TStringField
      FieldName = 'NameBank'
      Origin = 'BASE.NaklR.ID1C'
      FixedChar = True
      Size = 40
    end
    object quNaklRAddressBank: TStringField
      FieldName = 'AddressBank'
      Origin = 'BASE.NaklR.ID1C'
      FixedChar = True
      Size = 30
    end
    object quNaklROKPO: TStringField
      FieldName = 'OKPO'
      Origin = 'BASE.NaklR.ID1C'
      FixedChar = True
      Size = 10
    end
    object quNaklRNotPlatNDS: TBooleanField
      FieldName = 'NotPlatNDS'
      Origin = 'BASE.NaklR.ID1C'
    end
    object quNaklRContact: TStringField
      FieldName = 'Contact'
      Origin = 'BASE.NaklR.ID1C'
      FixedChar = True
      Size = 50
    end
  end
  object quRashod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      
        'from Rashod,Tovar left outer join VidTov on (VidTov.VidNo=Tovar.' +
        'VidNo)'
      'where (Rashod.NaklNo=:NaklNo) and'
      '      (Rashod.TovarNo=Tovar.TovarNo)'
      'order by VidTov.VidName,Tovar.NameTovar')
    Left = 46
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
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
    object quRashodNameTovar: TStringField
      FieldName = 'NameTovar'
      Origin = 'Tovar.NameTovar'
      Size = 30
    end
    object quRashodVidName: TStringField
      FieldName = 'VidName'
      Origin = 'VidTov.VidName'
      Size = 30
    end
    object quRashodEdIzm: TStringField
      FieldName = 'EdIzm'
      Origin = 'Tovar.EdIzm'
      Size = 5
    end
    object quRashodRasNo: TSmallintField
      FieldName = 'RasNo'
      Origin = 'BASE.Tovar.NameTovar'
    end
  end
  object dsRashod: TDataSource
    DataSet = quRashod
    Left = 48
    Top = 56
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = dsRashod
    Left = 48
    Top = 88
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 48
    Top = 120
    ReportForm = {19000000}
  end
  object quPrintPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Post.Name, Post.NameLong, Post.Phone, Post.Contact, S' +
        'otrud.SotrudName, Post.AddressFact, Post.CategorName, Regions.Re' +
        'gionName, '
      
        '                      Post.MarschrutNo, Regions.RegionNo, Addres' +
        'sPost.Address'
      'FROM         Post INNER JOIN'
      
        '                      AddressPost ON Post.PostNo = AddressPost.P' +
        'ostNo LEFT OUTER JOIN'
      
        '                      Sotrud ON AddressPost.SotrudNo = Sotrud.So' +
        'trudNo LEFT OUTER JOIN'
      
        '                      Regions ON AddressPost.RegionNo = Regions.' +
        'RegionNo'
      'WHERE     (Post.PrintPost = 1)'
      'ORDER BY Sotrud.SotrudName, Post.Name')
    Left = 96
    Top = 24
    object quPrintPostName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object quPrintPostNameLong: TStringField
      FieldName = 'NameLong'
      Size = 80
    end
    object quPrintPostPhone: TStringField
      FieldName = 'Phone'
      Size = 15
    end
    object quPrintPostContact: TStringField
      FieldName = 'Contact'
      Size = 50
    end
    object quPrintPostSotrudName: TStringField
      FieldName = 'SotrudName'
      Size = 30
    end
    object quPrintPostAddressFact: TStringField
      FieldName = 'AddressFact'
      Size = 50
    end
    object quPrintPostCategorName: TStringField
      FieldName = 'CategorName'
    end
    object quPrintPostRegionName: TStringField
      FieldName = 'RegionName'
      Size = 50
    end
    object quPrintPostMarschrutNo: TSmallintField
      FieldName = 'MarschrutNo'
    end
    object quPrintPostRegionNo: TSmallintField
      FieldName = 'RegionNo'
    end
    object quPrintPostAddress: TStringField
      FieldName = 'Address'
      FixedChar = True
      Size = 50
    end
  end
  object dsPrintPost: TDataSource
    DataSet = quPrintPost
    Left = 96
    Top = 56
  end
  object frDBDataSet2: TfrDBDataSet
    DataSource = dsPrintPost
    Left = 96
    Top = 88
  end
  object frReport2: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 96
    Top = 120
    ReportForm = {19000000}
  end
  object quNotCompletOrder: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select '
      'PostName'
      ',NameTovar'
      ',DateNakl'
      ',VidName'
      ',Address'
      ',KolZak'
      ',KolNakl'
      ',KolRez'
      ',KolStratil'
      ',PriceOut'
      'from v_repNedogruz'
      'where dateNakl>=:DateBegin'
      'and dateNakl<=:DateEnd'
      'Order by PostName,VidName,NameTovar')
    Left = 144
    Top = 24
    ParamData = <
      item
        DataType = ftDate
        Name = 'DateBegin'
      end
      item
        DataType = ftDate
        Name = 'DateEnd'
      end>
    object quNotCompletOrderTovarNo: TSmallintField
      FieldName = 'TovarNo'
      Origin = 'NotCompletOrder.TovarNo'
    end
    object quNotCompletOrderKolC: TFloatField
      FieldName = 'KolC'
      Origin = 'NotCompletOrder.KolC'
    end
    object quNotCompletOrderKolZ: TFloatField
      FieldName = 'KolZ'
      Origin = 'NotCompletOrder.KolZ'
    end
    object quNotCompletOrderNameTovar: TStringField
      FieldName = 'NameTovar'
      Origin = 'Tovar.NameTovar'
      Size = 30
    end
    object quNotCompletOrderVidName: TStringField
      FieldName = 'VidName'
      Origin = 'VidTov.VidName'
      Size = 30
    end
    object quNotCompletOrderPriceIn: TFloatField
      FieldName = 'PriceIn'
      Origin = 'NotCompletOrder.TovarNo'
    end
  end
  object dsNotCompletOrder: TDataSource
    DataSet = quNotCompletOrder
    Left = 144
    Top = 56
  end
  object frDBDataSet3: TfrDBDataSet
    DataSource = dsNotCompletOrder
    Left = 144
    Top = 88
  end
  object frReport3: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport3GetValue
    Left = 144
    Top = 120
    ReportForm = {19000000}
  end
  object spSaleCompanyPeriods: TMSStoredProc
    StoredProcName = 'dbo.SaleCompanyPeriods'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL dbo.SaleCompanyPeriods (:DateBegin, :DateE' +
        'nd, :KolDay)}')
    Left = 184
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
        Value = 37622d
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
        Value = 37652d
      end
      item
        DataType = ftSmallint
        Name = 'KolDay'
        ParamType = ptInput
        Value = 10
      end>
  end
  object dsSaleCompanyPeriods: TDataSource
    DataSet = spSaleCompanyPeriods
    Left = 184
    Top = 56
  end
  object frDBDataSet4: TfrDBDataSet
    DataSource = dsSaleCompanyPeriods
    Left = 184
    Top = 88
  end
  object frReport4: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginDoc = frReport4BeginDoc
    OnGetValue = frReport4GetValue
    Left = 184
    Top = 120
    ReportForm = {19000000}
  end
  object frUserDataset1: TfrUserDataset
    OnCheckEOF = frUserDataset1CheckEOF
    OnFirst = frUserDataset1First
    OnNext = frUserDataset1Next
    Left = 184
    Top = 152
  end
  object spSaleCustomersPeriods: TMSStoredProc
    StoredProcName = 'dbo.SaleCustomersPeriodsMy'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL dbo.SaleCustomersPeriodsMy (:DateBegin, :D' +
        'ateEnd, :KolDay)}')
    Left = 224
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'KolDay'
        ParamType = ptInput
      end>
  end
  object dsSaleCustomersPeriods: TDataSource
    DataSet = spSaleCustomersPeriods
    Left = 224
    Top = 56
  end
  object frDBDataSet5: TfrDBDataSet
    DataSource = dsSaleCustomersPeriods
    Left = 224
    Top = 88
  end
  object frReport5: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginDoc = frReport5BeginDoc
    OnGetValue = frReport5GetValue
    Left = 224
    Top = 120
    ReportForm = {19000000}
  end
  object frUserDataset2: TfrUserDataset
    OnCheckEOF = frUserDataset2CheckEOF
    OnFirst = frUserDataset2First
    OnNext = frUserDataset2Next
    Left = 224
    Top = 152
  end
  object spCrossPostCompany: TMSStoredProc
    StoredProcName = 'dbo.CrossPostCompanyMy'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL dbo.CrossPostCompanyMy (:DateBegin, :DateE' +
        'nd, :Returne)}')
    Left = 256
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'Returne'
        ParamType = ptInput
      end>
  end
  object dsCrossPostCompany: TDataSource
    DataSet = spCrossPostCompany
    Left = 264
    Top = 56
  end
  object frDBDataSet6: TfrDBDataSet
    DataSource = dsCrossPostCompany
    Left = 264
    Top = 88
  end
  object frReport6: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginDoc = frReport6BeginDoc
    OnGetValue = frReport6GetValue
    Left = 264
    Top = 120
    ReportForm = {19000000}
  end
  object frUserDataset3: TfrUserDataset
    OnCheckEOF = frUserDataset3CheckEOF
    OnFirst = frUserDataset3First
    OnNext = frUserDataset3Next
    Left = 264
    Top = 152
  end
  object quCompany: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select CompanyNo,NameCompany'
      'from Company'
      'where CompanyNo=:CompanyNo')
    Left = 264
    Top = 184
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'CompanyNo'
      end>
    object quCompanyNameCompany: TStringField
      FieldName = 'NameCompany'
      Origin = 'Company.NameCompany'
      Size = 30
    end
    object quCompanyCompanyNo: TSmallintField
      FieldName = 'CompanyNo'
      Origin = 'Company.CompanyNo'
    end
  end
  object quRashod2: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Sum(Kol) Kol,Tovar.NameTovar,Company.NameCompany,'
      '       Tovar.EdIzm,VidTov.VidName,Rashod.AvgPriceIn'
      'from Rashod,Tovar join VidTov on (VidTov.VidNo=Tovar.VidNo)'
      
        '                  left outer join Company on (Company.CompanyNo=' +
        'Tovar.CompanyNo)'
      'where (Tovar.TovarNo=Rashod.TovarNo) and'
      '      (NaklNo In &Nakl)'
      'group by VidName,NameCompany,NameTovar,EdIzm,Rashod.AvgPriceIn'
      'order by VidName,NameCompany,NameTovar')
    Left = 312
    Top = 24
    MacroData = <
      item
        Name = 'Nakl'
        Value = '(1,2)'
      end>
    object quRashod2Kol: TFloatField
      FieldName = 'Kol'
    end
    object quRashod2NameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 30
    end
    object quRashod2NameCompany: TStringField
      FieldName = 'NameCompany'
      Size = 30
    end
    object quRashod2VidName: TStringField
      FieldName = 'VidName'
      Size = 30
    end
    object quRashod2AvgPriceIn: TFloatField
      FieldName = 'AvgPriceIn'
    end
    object quRashod2EdIzm: TStringField
      FieldName = 'EdIzm'
      Size = 5
    end
  end
  object quNaklR2: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Top 1 Nom,DateNakl'
      'from NaklR'
      'where NaklNo in &Nakl')
    Left = 352
    Top = 24
    MacroData = <
      item
        Name = 'Nakl'
        Value = '(1,2)'
      end>
    object IntegerField1: TIntegerField
      FieldName = 'Nom'
    end
    object quNaklR2DateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
  end
  object dsNaklR2: TDataSource
    DataSet = quNaklR2
    Left = 352
    Top = 56
  end
  object dsRashod2: TDataSource
    DataSet = quRashod2
    Left = 312
    Top = 56
  end
  object frDBDataSet7: TfrDBDataSet
    DataSource = dsRashod2
    Left = 312
    Top = 88
  end
  object frReport7: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport7GetValue
    Left = 352
    Top = 88
    ReportForm = {19000000}
  end
  object quSaleSotrudTipTovar: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     TipTovara.TipName, Sotrud.SotrudName, SUM(Rashod.Kol ' +
        '* Rashod.PriceOut) AS Summ'
      'FROM         Rashod INNER JOIN'
      
        '                      Tovar ON Rashod.TovarNo = Tovar.TovarNo IN' +
        'NER JOIN'
      
        '                      NaklR ON Rashod.NaklNo = NaklR.NaklNo INNE' +
        'R JOIN'
      
        '                      Sotrud ON NaklR.SotrudNo = Sotrud.SotrudNo' +
        ' LEFT OUTER JOIN'
      '                      TipTovara ON Tovar.TipNo = TipTovara.TipNo'
      'WHERE     (NaklR.DateNaklFirst >= :DatePostB) AND '
      #9'  (NaklR.DateNaklFirst <= :DatePostE)'
      'GROUP BY TipTovara.TipName, Sotrud.SotrudName'
      'ORDER BY TipTovara.TipName, Sotrud.SotrudName')
    Left = 392
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DatePostB'
      end
      item
        DataType = ftUnknown
        Name = 'DatePostE'
      end>
    object quSaleSotrudTipTovarTipName: TStringField
      FieldName = 'TipName'
      FixedChar = True
      Size = 30
    end
    object quSaleSotrudTipTovarSotrudName: TStringField
      FieldName = 'SotrudName'
      FixedChar = True
      Size = 30
    end
    object quSaleSotrudTipTovarSumm: TFloatField
      FieldName = 'Summ'
    end
  end
  object quSaleSotrudSumm: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Sotrud.SotrudName, SUM(NaklR.Summa) AS Summa, SUM(Nak' +
        'lR.SummaDolg) AS SummaDolg, SUM(NaklR.SummaDolg) / (SUM(NaklR.Su' +
        'mma) / 100) '
      '                      AS SummaPercent'
      'FROM         NaklR INNER JOIN'
      '                      Sotrud ON NaklR.SotrudNo = Sotrud.SotrudNo'
      
        'WHERE     (NaklR.DateNaklFirst >= :DatePostB) AND (NaklR.DateNak' +
        'lFirst <= :DatePostE) '
      'GROUP BY Sotrud.SotrudName, Sotrud.SotrudName'
      'ORDER BY Sotrud.SotrudName')
    Left = 432
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DatePostB'
      end
      item
        DataType = ftUnknown
        Name = 'DatePostE'
      end>
    object quSaleSotrudSummSotrudName: TStringField
      FieldName = 'SotrudName'
      FixedChar = True
      Size = 30
    end
    object quSaleSotrudSummSumma: TFloatField
      FieldName = 'Summa'
    end
    object quSaleSotrudSummSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
    object quSaleSotrudSummSummaPercent: TFloatField
      FieldName = 'SummaPercent'
    end
  end
  object frDBDataSet8: TfrDBDataSet
    DataSource = dsSaleSotrudTipTovar
    Left = 392
    Top = 120
  end
  object frReport8: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport8GetValue
    Left = 392
    Top = 173
    ReportForm = {19000000}
  end
  object dsSaleSotrudTipTovar: TDataSource
    DataSet = mdSaleSotrudTipTovar
    Left = 392
    Top = 88
  end
  object DataSource2: TDataSource
    Left = 432
    Top = 56
  end
  object mdSaleSotrudTipTovar: TRxMemoryData
    FieldDefs = <>
    Left = 392
    Top = 56
  end
  object frUserDataset4: TfrUserDataset
    OnCheckEOF = frUserDataset4CheckEOF
    OnFirst = frUserDataset4First
    OnNext = frUserDataset4Next
    Left = 432
    Top = 120
  end
  object DBSumList1: TDBSumList
    DataSet = quSaleSotrudSumm
    ExternalRecalc = False
    SumCollection = <
      item
        FieldName = 'Summa'
        GroupOperation = goSum
      end
      item
        FieldName = 'SummaDolg'
        GroupOperation = goSum
      end>
    VirtualRecords = False
    Left = 432
    Top = 88
  end
  object quExcelDanon: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Tovar.CodReport, Tovar.TovarNo, Tovar.NameTovar, Nakl' +
        'R.DateNakl, Post.NameLong, Rashod.Kol, Rashod.Kol * Tovar.Weight' +
        ' AS WeightTovar, Regions.RegionName'
      'FROM         Rashod INNER JOIN'
      
        '                      Tovar ON Rashod.TovarNo = Tovar.TovarNo IN' +
        'NER JOIN'
      
        '                      VidTov ON Tovar.VidNo = VidTov.VidNo INNER' +
        ' JOIN'
      
        '                      NaklR ON Rashod.NaklNo = NaklR.NaklNo INNE' +
        'R JOIN'
      
        '                      Post ON NaklR.PostNo = Post.PostNo INNER J' +
        'OIN'
      
        '                      Regions ON Post.RegionNo = Regions.RegionN' +
        'o'
      
        'WHERE     (VidTov.VidNo = 20) AND (Rashod.Kol > 0) AND (Post.Pri' +
        'ntPost = 1)'
      '                   AND (Tovar.CodReport<>'#39#39') '
      '                   AND ((NaklR.DateNakl >= :DateB)'
      '                   AND (NaklR.DateNakl <= :DateE))'
      'ORDER BY NaklR.DateNakl, Tovar.TovarNo, Post.NameLong')
    Left = 472
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateB'
      end
      item
        DataType = ftUnknown
        Name = 'DateE'
      end>
    object quExcelDanonTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quExcelDanonDateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object quExcelDanonNameLong: TStringField
      FieldName = 'NameLong'
      FixedChar = True
      Size = 80
    end
    object quExcelDanonKol: TFloatField
      FieldName = 'Kol'
    end
    object quExcelDanonWeightTovar: TFloatField
      FieldName = 'WeightTovar'
    end
    object quExcelDanonRegionName: TStringField
      FieldName = 'RegionName'
      FixedChar = True
      Size = 50
    end
    object quExcelDanonNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object quExcelDanonCodReport: TStringField
      FieldName = 'CodReport'
      FixedChar = True
      Size = 10
    end
  end
  object quSotrudDolg: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Sotrud.SotrudName, NaklR.PostNoFirst, Post.Name, Nakl' +
        'R.AddressNoFirst, AddressPost.Address, SUM(NaklR.Summa) AS Summa' +
        ', SUM(NaklR.SummaDolg) '
      '                      AS SummaDolg'
      'FROM         NaklR INNER JOIN'
      
        '                      AddressPost ON NaklR.PostNoFirst = Address' +
        'Post.PostNo AND NaklR.AddressNoFirst = AddressPost.AddressNo INN' +
        'ER JOIN'
      
        '                      Post ON NaklR.PostNoFirst = Post.PostNo LE' +
        'FT OUTER JOIN'
      '                      Sotrud ON NaklR.SotrudNo = Sotrud.SotrudNo'
      
        'WHERE     (NaklR.DateNakl >= :DateBegin) AND (NaklR.DateNakl <= ' +
        ':DateEnd)'
      
        'GROUP BY Post.Name, AddressPost.Address, Sotrud.SotrudName, Nakl' +
        'R.AddressNoFirst, NaklR.PostNoFirst'
      'ORDER BY Sotrud.SotrudName, Post.Name')
    Left = 536
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateBegin'
      end
      item
        DataType = ftUnknown
        Name = 'DateEnd'
      end>
    object quSotrudDolgSotrudName: TStringField
      FieldName = 'SotrudName'
      FixedChar = True
      Size = 30
    end
    object quSotrudDolgPostNoFirst: TSmallintField
      FieldName = 'PostNoFirst'
    end
    object quSotrudDolgName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object quSotrudDolgAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object quSotrudDolgAddress: TStringField
      FieldName = 'Address'
      FixedChar = True
      Size = 50
    end
    object quSotrudDolgSumma: TFloatField
      FieldName = 'Summa'
    end
    object quSotrudDolgSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
  end
  object quSotrudDolgNoClose: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Sotrud.SotrudName, NaklR.PostNoFirst, Post.Name, Nakl' +
        'R.AddressNoFirst, AddressPost.Address, SUM(NaklR.Summa) AS Summa' +
        ', SUM(NaklR.SummaDolg) '
      '                      AS SummaDolg'
      'FROM         NaklR INNER JOIN'
      
        '                      AddressPost ON NaklR.PostNoFirst = Address' +
        'Post.PostNo AND NaklR.AddressNoFirst = AddressPost.AddressNo INN' +
        'ER JOIN'
      
        '                      Post ON NaklR.PostNoFirst = Post.PostNo LE' +
        'FT OUTER JOIN'
      '                      Sotrud ON NaklR.SotrudNo = Sotrud.SotrudNo'
      
        'WHERE     (NaklR.DateNakl >= :DateBegin) AND (NaklR.DateNakl <= ' +
        ':DateEnd)'
      
        '                   AND (NaklR.DateOpl < :DateNow) AND (NaklR.Sum' +
        'maDolg>0)'
      
        'GROUP BY Post.Name, AddressPost.Address, Sotrud.SotrudName, Nakl' +
        'R.AddressNoFirst, NaklR.PostNoFirst'
      'ORDER BY Sotrud.SotrudName, Post.Name')
    Left = 536
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DateEnd'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'DateNow'
        ParamType = ptInput
      end>
    object quSotrudDolgNoCloseSotrudName: TStringField
      FieldName = 'SotrudName'
      FixedChar = True
      Size = 30
    end
    object quSotrudDolgNoClosePostNoFirst: TSmallintField
      FieldName = 'PostNoFirst'
    end
    object quSotrudDolgNoCloseName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object quSotrudDolgNoCloseAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object quSotrudDolgNoCloseAddress: TStringField
      FieldName = 'Address'
      FixedChar = True
      Size = 50
    end
    object quSotrudDolgNoCloseSumma: TFloatField
      FieldName = 'Summa'
    end
    object quSotrudDolgNoCloseSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
  end
  object mdSotrudDolg: TRxMemoryData
    FieldDefs = <>
    Left = 536
    Top = 88
    object mdSotrudDolgSotrudName: TStringField
      FieldName = 'SotrudName'
    end
    object mdSotrudDolgSummaAll: TFloatField
      FieldName = 'SummaAll'
    end
    object mdSotrudDolgSummaDolgAll: TFloatField
      FieldName = 'SummaDolgAll'
    end
    object mdSotrudDolgSumma: TFloatField
      FieldName = 'Summa'
    end
    object mdSotrudDolgSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
    object mdSotrudDolgPostNo: TIntegerField
      FieldName = 'PostNo'
    end
    object mdSotrudDolgPostName: TStringField
      FieldName = 'PostName'
      Size = 100
    end
    object mdSotrudDolgAddressNo: TIntegerField
      FieldName = 'AddressNo'
    end
    object mdSotrudDolgAddressName: TStringField
      FieldName = 'AddressName'
      Size = 100
    end
  end
  object frReport9: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport9GetValue
    Left = 536
    Top = 184
    ReportForm = {19000000}
  end
  object frDBDataSet9: TfrDBDataSet
    DataSource = dsSotrudDolg
    Left = 536
    Top = 152
  end
  object dsSotrudDolg: TDataSource
    DataSet = mdSotrudDolg
    Left = 536
    Top = 120
  end
  object quPresidentOtchet: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Tovar.CodReport, Tovar.TovarNo, Tovar.NameTovar, Nakl' +
        'R.DateNakl, Post.NameLong, Rashod.Kol, Rashod.Kol * Tovar.Weight' +
        ' AS WeightTovar, Regions.RegionName'
      'FROM         Rashod INNER JOIN'
      
        '                      Tovar ON Rashod.TovarNo = Tovar.TovarNo IN' +
        'NER JOIN'
      
        '                      VidTov ON Tovar.VidNo = VidTov.VidNo INNER' +
        ' JOIN'
      
        '                      NaklR ON Rashod.NaklNo = NaklR.NaklNo INNE' +
        'R JOIN'
      
        '                      Post ON NaklR.PostNo = Post.PostNo INNER J' +
        'OIN'
      
        '                      Regions ON Post.RegionNo = Regions.RegionN' +
        'o'
      
        'WHERE     (VidTov.VidNo = 21) AND (Rashod.Kol > 0) AND (Post.Pri' +
        'ntPost = 1)'
      '                   AND (Tovar.CodReport<>'#39#39') '
      '                   AND ((NaklR.DateNakl >= :DateB)'
      '                   AND (NaklR.DateNakl <= :DateE))'
      'ORDER BY NaklR.DateNakl, Tovar.TovarNo, Post.NameLong')
    Left = 504
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateB'
      end
      item
        DataType = ftUnknown
        Name = 'DateE'
      end>
    object quPresidentOtchetCodReport: TStringField
      FieldName = 'CodReport'
      FixedChar = True
    end
    object quPresidentOtchetTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quPresidentOtchetNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object quPresidentOtchetDateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object quPresidentOtchetNameLong: TStringField
      FieldName = 'NameLong'
      FixedChar = True
      Size = 80
    end
    object quPresidentOtchetKol: TFloatField
      FieldName = 'Kol'
    end
    object quPresidentOtchetWeightTovar: TFloatField
      FieldName = 'WeightTovar'
    end
    object quPresidentOtchetRegionName: TStringField
      FieldName = 'RegionName'
      FixedChar = True
      Size = 50
    end
  end
  object quExcelTara: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     NaklR.DateNaklFirst AS DateNakl, Rashod.Kol AS Kol, N' +
        'aklR.NaklNo AS NaklNo, Rashod.PriceOut AS Price, NaklR.Buh AS Bu' +
        'h, VidTov.VidNo, Post.Name, Tovar.NameTovar, 1 AS Rashod '
      'FROM         Rashod INNER JOIN'
      
        '                      NaklR ON Rashod.NaklNo = NaklR.NaklNo INNE' +
        'R JOIN'
      
        '                      Tovar ON Rashod.TovarNo = Tovar.TovarNo IN' +
        'NER JOIN'
      
        '                      VidTov ON Tovar.VidNo = VidTov.VidNo INNER' +
        ' JOIN'
      '                      Post ON NaklR.PostNoFirst = Post.PostNo'
      'WHERE     (VidTov.VidNo = 10)'
      '                   AND ((NaklR.DateNaklFirst >= :DateB)'
      '                   AND (NaklR.DateNaklFirst <= :DateE))'
      'UNION'
      
        'SELECT     NaklP.DateNakl AS DateNakl, Prihod.Kol AS Kol, NaklP.' +
        'NaklNo AS NaklNo, Prihod.Price AS Price, NaklP.Buh AS Buh, VidTo' +
        'v.VidNo, Post.Name, Tovar.NameTovar, 0 AS Rashod'
      'FROM         Prihod INNER JOIN'
      
        '                      NaklP ON Prihod.NaklNo = NaklP.NaklNo INNE' +
        'R JOIN'
      
        '                      Tovar ON Prihod.TovarNo = Tovar.TovarNo IN' +
        'NER JOIN'
      
        '                      VidTov ON Tovar.VidNo = VidTov.VidNo INNER' +
        ' JOIN'
      '                      Post ON NaklP.PostNo = Post.PostNo'
      'WHERE     (VidTov.VidNo = 10)'
      '                   AND ((NaklP.DateNakl >= :DateB)'
      '                   AND (NaklP.DateNakl <= :DateE))'
      'ORDER BY DateNakl, Post.Name, Tovar.NameTovar')
    Left = 568
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateB'
      end
      item
        DataType = ftUnknown
        Name = 'DateE'
      end
      item
        DataType = ftUnknown
        Name = 'DateB'
      end
      item
        DataType = ftUnknown
        Name = 'DateE'
      end>
    object quExcelTaraDateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object quExcelTaraKol: TFloatField
      FieldName = 'Kol'
    end
    object quExcelTaraNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quExcelTaraPrice: TFloatField
      FieldName = 'Price'
    end
    object quExcelTaraBuh: TSmallintField
      FieldName = 'Buh'
    end
    object quExcelTaraVidNo: TSmallintField
      FieldName = 'VidNo'
    end
    object quExcelTaraName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object quExcelTaraNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object quExcelTaraRashod: TIntegerField
      FieldName = 'Rashod'
    end
  end
  object spSalarySotrudPlat: TMSStoredProc
    StoredProcName = 'dbo.SalarySotrudPlat'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL dbo.SalarySotrudPlat (:DateBegin, :DateEnd' +
        ', :SotrudNo)}')
    Left = 600
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftSmallint
        Name = 'SotrudNo'
        ParamType = ptInput
      end>
    object spSalarySotrudPlatDatePlat: TDateTimeField
      FieldName = 'DatePlat'
    end
    object spSalarySotrudPlatSummaPlat: TFloatField
      FieldName = 'SummaPlat'
      DisplayFormat = '#,##0.00'
    end
    object spSalarySotrudPlatName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object spSalarySotrudPlatNom: TIntegerField
      FieldName = 'Nom'
    end
    object spSalarySotrudPlatSummaToNakl: TFloatField
      FieldName = 'SummaToNakl'
      DisplayFormat = '#,##0.00'
    end
    object spSalarySotrudPlatGroupBy: TIntegerField
      FieldName = 'GroupBy'
    end
    object spSalarySotrudPlatNamePercent: TStringField
      FieldKind = fkLookup
      FieldName = 'NamePercent'
      LookupDataSet = quPercentsSalary
      LookupKeyFields = 'PercentNo'
      LookupResultField = 'NamePercent'
      KeyFields = 'GroupBy'
      Lookup = True
    end
    object spSalarySotrudPlatNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object spSalarySotrudPlatValuePercent2: TFloatField
      FieldKind = fkLookup
      FieldName = 'ValuePercent2'
      LookupDataSet = quPercentsSalary
      LookupKeyFields = 'PercentNo'
      LookupResultField = 'ValuePercent2'
      KeyFields = 'GroupBy'
      Lookup = True
    end
    object spSalarySotrudPlatDateNaklFirst: TDateTimeField
      FieldName = 'DateNaklFirst'
    end
    object spSalarySotrudPlatKolDay: TFloatField
      FieldName = 'KolDay'
    end
    object spSalarySotrudPlatColnPrice: TSmallintField
      FieldName = 'ColnPrice'
    end
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Left = 600
    Top = 88
  end
  object spCountPercentSalaryForNakl: TMSStoredProc
    StoredProcName = 'dbo.CountPercentSalaryForNakl'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL dbo.CountPercentSalaryForNakl (:NaklNo)}')
    Left = 601
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'NaklNo'
        ParamType = ptInput
      end>
    object spCountPercentSalaryForNaklPercentSalary: TFloatField
      FieldName = 'PercentSalary'
    end
  end
  object quPercentsSalary: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select PercentNo,NamePercent,ValuePercent2'
      'from PercentsSalary'
      ' '
      ' '
      ' ')
    Left = 600
    Top = 120
    object quPercentsSalaryPercentNo: TSmallintField
      FieldName = 'PercentNo'
      Origin = 'BASE.PercentsSalary.PercentNo'
    end
    object quPercentsSalaryNamePercent: TStringField
      FieldName = 'NamePercent'
      Origin = 'BASE.PercentsSalary.NamePercent'
    end
    object quPercentsSalaryValuePercent2: TFloatField
      FieldName = 'ValuePercent2'
      Origin = 'BASE.PercentsSalary.ValuePercent2'
    end
  end
  object dsSalarySotrudPlat: TDataSource
    DataSet = spSalarySotrudPlat
    Left = 600
    Top = 152
  end
  object frDBDataSet10: TfrDBDataSet
    DataSource = dsSalarySotrudPlat
    Left = 600
    Top = 184
  end
  object frReport10: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 600
    Top = 216
    ReportForm = {19000000}
  end
  object quPresidentTovar: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Tovar.CodReport, Tovar.TovarNo, Tovar.NameTovar, Nakl' +
        'R.DateNakl, Post.NameLong, Rashod.Kol, Rashod.Kol * Tovar.Weight' +
        ' AS WeightTovar, Regions.RegionName'
      'FROM         Rashod INNER JOIN'
      
        '                      Tovar ON Rashod.TovarNo = Tovar.TovarNo IN' +
        'NER JOIN'
      
        '                      VidTov ON Tovar.VidNo = VidTov.VidNo INNER' +
        ' JOIN'
      
        '                      NaklR ON Rashod.NaklNo = NaklR.NaklNo INNE' +
        'R JOIN'
      
        '                      Post ON NaklR.PostNo = Post.PostNo INNER J' +
        'OIN'
      
        '                      Regions ON Post.RegionNo = Regions.RegionN' +
        'o'
      
        'WHERE     (VidTov.VidNo = 21) AND (Rashod.Kol > 0) AND (Post.Pri' +
        'ntPost = 1)'
      '                   AND (Tovar.CodReport<>'#39#39') '
      '                   AND ((NaklR.DateNakl >= :DateB)'
      '                   AND (NaklR.DateNakl <= :DateE))'
      'ORDER BY NaklR.DateNakl, Tovar.TovarNo, Post.NameLong')
    Left = 504
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateB'
      end
      item
        DataType = ftUnknown
        Name = 'DateE'
      end>
    object StringField1: TStringField
      FieldName = 'CodReport'
      FixedChar = True
    end
    object SmallintField1: TSmallintField
      FieldName = 'TovarNo'
    end
    object StringField2: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DateNakl'
    end
    object StringField3: TStringField
      FieldName = 'NameLong'
      FixedChar = True
      Size = 80
    end
    object BCDField1: TFloatField
      FieldName = 'Kol'
    end
    object BCDField2: TFloatField
      FieldName = 'WeightTovar'
    end
    object StringField4: TStringField
      FieldName = 'RegionName'
      FixedChar = True
      Size = 50
    end
  end
  object quSotrudDolgPodotchet: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     NaklR.DateNakl, Sotrud.SotrudName, PodotchetR.Podotch' +
        'etNom, PodotchetR.DatePodotche, NaklR.Nom, Post.Name, PodotchetR' +
        '.Summa, '
      '                      PodotchetR.SummaPlat'
      'FROM         NaklR INNER JOIN'
      
        '                      PodotchetR ON NaklR.NaklNo = PodotchetR.Na' +
        'klNo INNER JOIN'
      
        '                      Sotrud ON PodotchetR.SotrudNo = Sotrud.Sot' +
        'rudNo INNER JOIN'
      '                      Post ON NaklR.PostNoFirst = Post.PostNo'
      'WHERE     (PodotchetR.Summa <> PodotchetR.SummaPlat)  &_Sotrud'
      
        'ORDER BY Sotrud.SotrudName, Post.Name, PodotchetR.DatePodotche, ' +
        'NaklR.DateNakl')
    Top = 136
    MacroData = <
      item
        Name = '_Sotrud'
        Value = ' '
      end>
    object quSotrudDolgPodotchetDateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object quSotrudDolgPodotchetSotrudName: TStringField
      FieldName = 'SotrudName'
      FixedChar = True
      Size = 30
    end
    object quSotrudDolgPodotchetPodotchetNom: TStringField
      FieldName = 'PodotchetNom'
      FixedChar = True
      Size = 10
    end
    object quSotrudDolgPodotchetDatePodotche: TDateTimeField
      FieldName = 'DatePodotche'
    end
    object quSotrudDolgPodotchetNom: TIntegerField
      FieldName = 'Nom'
    end
    object quSotrudDolgPodotchetName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object quSotrudDolgPodotchetSumma: TFloatField
      FieldName = 'Summa'
    end
    object quSotrudDolgPodotchetSummaPlat: TFloatField
      FieldName = 'SummaPlat'
    end
  end
  object dsSotrudDolgPodotchet: TDataSource
    DataSet = quSotrudDolgPodotchet
    Top = 168
  end
  object frReport11: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Top = 232
    ReportForm = {19000000}
  end
  object frDBDataSet11: TfrDBDataSet
    DataSource = dsSotrudDolgPodotchet
    Top = 200
  end
  object quBuh_1: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Post.PostNo, Post.Name, Post.NameLong, NaklR.NaklNo, ' +
        'NaklR.Nom, NaklR.DateNaklFirst, NaklR.DateOpl, NaklR.SummaDolg, ' +
        'NaklR.Buh'
      'FROM         NaklR INNER JOIN'
      '                      Post ON NaklR.PostNo = Post.PostNo'
      
        'WHERE     ((NaklR.DateNakl >= :DateBegin) AND (NaklR.DateNakl <=' +
        ' :DateEnd)) AND (NaklR.SummaDolg > 0) AND (NaklR.Buh = 2)'
      'ORDER BY NaklR.DateOpl, Post.Name, NaklR.DateNakl')
    Left = 64
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateBegin'
      end
      item
        DataType = ftUnknown
        Name = 'DateEnd'
      end>
  end
  object quLoadCarPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     NaklR.PostNo, NaklR.AddressNo, AddressPost.Address, P' +
        'ost.Name'
      'FROM         NaklR INNER JOIN'
      
        '                      AddressPost ON NaklR.PostNo = AddressPost.' +
        'PostNo AND NaklR.AddressNo = AddressPost.AddressNo INNER JOIN'
      '                      Post ON AddressPost.PostNo = Post.PostNo'
      'WHERE     (NaklR.NaklNo IN &Nakl)'
      
        'GROUP BY NaklR.PostNo, NaklR.AddressNo, AddressPost.Address, Pos' +
        't.Name')
    Left = 636
    Top = 24
    MacroData = <
      item
        Name = 'Nakl'
        Value = '0=0'
      end>
    object quLoadCarPostPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quLoadCarPostAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object quLoadCarPostAddress: TStringField
      FieldName = 'Address'
      FixedChar = True
      Size = 50
    end
    object quLoadCarPostName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
  end
  object quLoadCarTovar: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Rashod.TovarNo, Tovar.NameTovar, SUM(Rashod.Kol) AS K' +
        'olvo, Tovar.KolPerPak, VidTov.VidName, SUM(Rashod.Kol * Rashod.P' +
        'riceOut) AS Summ, '
      
        '                      SUM(Rashod.Kol * Tovar.Weight) AS Weight, ' +
        'cast(Tovar.BarCode as varchar(30)) as BarCode'
      'FROM         NaklR INNER JOIN'
      
        '                      AddressPost ON NaklR.PostNo = AddressPost.' +
        'PostNo AND NaklR.AddressNo = AddressPost.AddressNo INNER JOIN'
      
        '                      Post ON AddressPost.PostNo = Post.PostNo I' +
        'NNER JOIN'
      
        '                      Rashod ON NaklR.NaklNo = Rashod.NaklNo INN' +
        'ER JOIN'
      
        '                      Tovar ON Rashod.TovarNo = Tovar.TovarNo IN' +
        'NER JOIN'
      '                      VidTov ON Tovar.VidNo = VidTov.VidNo'
      'WHERE     (NaklR.PostNo = :PostNo) AND (NaklR.NaklNo IN &Nakl)'
      
        'GROUP BY NaklR.AddressNo, Rashod.TovarNo, Tovar.NameTovar, Tovar' +
        '.KolPerPak, Tovar.Weight, VidTov.VidName, Tovar.BarCode'
      'HAVING      (NaklR.AddressNo = :AddressNo)'
      'ORDER BY VidTov.VidName DESC, Tovar.NameTovar DESC')
    Left = 636
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end
      item
        DataType = ftUnknown
        Name = 'AddressNo'
      end>
    MacroData = <
      item
        Name = 'Nakl'
        Value = '0=0'
      end>
    object quLoadCarTovarTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quLoadCarTovarNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object quLoadCarTovarKolvo: TFloatField
      FieldName = 'Kolvo'
    end
    object quLoadCarTovarKolPerPak: TSmallintField
      FieldName = 'KolPerPak'
    end
    object quLoadCarTovarVidName: TStringField
      FieldName = 'VidName'
      FixedChar = True
      Size = 30
    end
    object quLoadCarTovarSumm: TFloatField
      FieldName = 'Summ'
    end
    object quLoadCarTovarWeight: TFloatField
      FieldName = 'Weight'
    end
    object quLoadCarTovarBarCode: TStringField
      FieldName = 'BarCode'
      ReadOnly = True
      Size = 30
    end
  end
  object mdLoadCar: TRxMemoryData
    Active = True
    FieldDefs = <>
    Left = 650
    Top = 152
  end
  object dsLoadCar: TDataSource
    DataSet = mdLoadCar
    Left = 636
    Top = 184
  end
  object frReport12: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport12GetValue
    Left = 636
    Top = 282
    ReportForm = {19000000}
  end
  object frDBdsLoadCar: TfrDBDataSet
    DataSource = dsLoadCar
    Left = 636
    Top = 216
  end
  object frUDLoadCar: TfrUserDataset
    OnCheckEOF = frUDLoadCarCheckEOF
    OnFirst = frUDLoadCarFirst
    OnNext = frUDLoadCarNext
    Left = 636
    Top = 248
  end
  object quLoadNakl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Nom'
      'from NaklR'
      'where NaklNo in &Nakl')
    Left = 636
    Top = 88
    MacroData = <
      item
        Name = 'Nakl'
        Value = '0=0'
      end>
    object IntegerField2: TIntegerField
      FieldName = 'Nom'
    end
  end
  object quTovarVidName: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     Tovar.NameTovar, Tovar.TovarNo, VidTov.VidName'
      'FROM         NaklR INNER JOIN'
      
        '                      Rashod ON NaklR.NaklNo = Rashod.NaklNo INN' +
        'ER JOIN'
      
        '                      Tovar ON Rashod.TovarNo = Tovar.TovarNo IN' +
        'NER JOIN'
      '                      VidTov ON Tovar.VidNo = VidTov.VidNo'
      'WHERE     (NaklR.NaklNo IN &Nakl)'
      'GROUP BY Tovar.NameTovar, Tovar.TovarNo, VidTov.VidName'
      'ORDER BY VidTov.VidName DESC, Tovar.NameTovar DESC')
    Left = 636
    Top = 120
    MacroData = <
      item
        Name = 'Nakl'
        Value = '0=0'
      end>
    object quTovarVidNameNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object quTovarVidNameTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarVidNameVidName: TStringField
      FieldName = 'VidName'
      FixedChar = True
      Size = 30
    end
  end
  object quNaklRPrint: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     NaklR.DateNakl,'
      '           NaklR.PostNo,'
      
        '           case when NaklR.Contract_id is not null then (select ' +
        'num from d_firm_contract where id = NaklR.Contract_id)'
      
        '                when NaklR.Contract_id = -1 then (select num fro' +
        'm d_firm_contract where id = (select max(id) from d_firm_contrac' +
        't where PostNo = NaklR.PostNo and Print_on_naklR=1))'
      
        '                when NaklR.Contract_id is null then (select num ' +
        'from d_firm_contract where id = (select max(id) from d_firm_cont' +
        'ract where PostNo = NaklR.PostNo and Print_on_naklR=1))'
      
        '                when NaklR.Contract_id is null then (select Dogo' +
        'vorNo from Post where PostNo=NaklR.PostNo)'
      '           end as Contract_Nom,'
      
        '           case when NaklR.Contract_id is not null then (select ' +
        'name from d_contract_type where id=(select TYPE_ID from d_firm_c' +
        'ontract where id = NaklR.Contract_id))'
      
        '                when NaklR.Contract_id = -1 then (select name fr' +
        'om d_contract_type where id = (select TYPE_ID from d_firm_contra' +
        'ct where id = (select max(id) from d_firm_contract where PostNo ' +
        '= NaklR.PostNo and Print_on_naklR=1)))'
      '                when NaklR.Contract_id is null then '#39#1044#1086#1075#1086#1074#1086#1088' '#39
      '           end as Contract_type,'
      
        '           case when NaklR.Contract_id is not null then (select ' +
        'CONVERT (Varchar , Create_date , 104) from d_firm_contract where' +
        ' id = NaklR.Contract_id)'
      
        '                when NaklR.Contract_id = -1 then (select CONVERT' +
        ' (Varchar , Create_date , 104) from d_firm_contract where id = (' +
        'select max(id) from d_firm_contract where PostNo = NaklR.PostNo ' +
        'and Print_on_naklR=1))'
      
        '                when NaklR.Contract_id is null then (select CONV' +
        'ERT (Varchar , Create_date , 104) from d_firm_contract where id ' +
        '= (select max(id) from d_firm_contract where PostNo = NaklR.Post' +
        'No and Print_on_naklR=1))'
      
        '                when NaklR.Contract_id is null then (select CONV' +
        'ERT (Varchar , DateDogovor , 104) from Post where PostNo=NaklR.P' +
        'ostNo)'
      '           end as Contract_date,'
      '            '
      '           dbo.Get_doc_sum(NaklR.NaklNo,'#39'NAKLR'#39') as Summa,'
      
        '           case when (select NotPlatNDS from Post where PostNo =' +
        ' (select PostNo from d_our_firm)) = 1 then null'
      
        #9#9'                                                              ' +
        '                                else dbo.fu_GetNDS (NaklR.NaklNo' +
        ') '
      '           end as NDS, '
      ''
      
        #9#9'   case when (select NotPlatNDS from Post where PostNo = (sele' +
        'ct PostNo from d_our_firm)) = 1 then dbo.Get_doc_sum(NaklR.NaklN' +
        'o,'#39'NAKLR'#39')'
      
        '                                                                ' +
        '                                      else dbo.fu_GetNoNDS (Nakl' +
        'R.NaklNo) '
      '           end as NoNDS,'
      ''
      
        '           case when (select NotPlatNDS from Post where PostNo =' +
        ' (select PostNo from d_our_firm)) = 1 then 0'
      
        #9#9'                                                              ' +
        '                                else dbo.fu_CheckTovNoNDS(NaklR.' +
        'NaklNo) '
      '           end as isTovNoNDS,'
      ''
      '           NaklR.NaklNo,'
      '           NaklR.Nom, '
      '           Post.NameLong, '
      '           Post.DogovorNo, '
      '           Post.DateDogovor, '
      '           Post.Address as PhisicalAddress,'
      '           AddressPost.Address, '
      '           NaklR.Weight, '
      '           NaklR.KolPerPak, '
      '           Post.OKPO, '
      '           Cars.CarsName, '
      '           Cars.CarsDriver, '
      '           Cars.CarsType, '
      '           Cars.CarsNomer, '
      '           Cars.CarsOKPO, '
      '           Cars.CarsFirma,'
      '           (select NameLong '
      '              from post '
      '               where PostNo= NaklR.OurFirmNo) as "OurFirmName",'
      '           (select OKPO  '
      '              from post '
      '               where PostNo= NaklR.OurFirmNo) as "OurOKPO",'
      '           (select Address   '
      '              from post '
      
        '               where PostNo= NaklR.OurFirmNo) as "OurAdres",    ' +
        ' '
      '           NaklR.Contract_id,'
      
        '           dbo.Get_Contract_Base (NaklR.NaklNo,'#39'NAKLR'#39') as Contr' +
        'act_Name, '
      '           NaklR.ExpeditionNo,'
      
        '           isnull (cfa.Car, Cars.CarsName + '#39' '#39' + Cars.CarsNomer' +
        ') as Car,'
      '           isnull (cfa.Driver, Cars.CarsDriver) as Driver,'
      
        '           (select TypeReturnName from d_TypeReturn where TypeRe' +
        'turnNo = L.TypeReturnNo) as TypeReturn,'
      '           ncofs.Description'
      'FROM AddressPost RIGHT OUTER JOIN'
      '     NaklR INNER JOIN'
      
        '     Post ON NaklR.PostNo = Post.PostNo ON AddressPost.PostNo = ' +
        'NaklR.PostNo AND AddressPost.AddressNo = NaklR.AddressNo LEFT OU' +
        'TER JOIN'
      
        '     Expedition INNER JOIN Cars ON Expedition.ExpeditionCarsNo =' +
        ' Cars.CarsNo ON NaklR.ExpeditionNo = Expedition.ExpeditionNo lef' +
        't join'
      
        '     CarForAdressPost cfa on cfa.PostNo = NaklR.PostNo and cfa.A' +
        'ddressNo = NaklR.AddressNo and cfa.DateDeparture = NaklR.DateNak' +
        'l left join'
      '     L_NaklRReturn L on L.NaklNo = NaklR.NaklNo left join'
      
        '     NaklRCommentOrderFromSite ncofs on ncofs.NaklRPkey = NaklR.' +
        'pkey'
      ' where NaklR.NaklNo = :NaklNo'
      '/*'
      
        'SELECT     NaklR.DateNakl, dbo.Get_doc_sum(NaklR.NaklNo,'#39'NAKLR'#39')' +
        ' as Summa, NaklR.Nom, Post.NameLong, Post.DogovorNo, Post.DateDo' +
        'govor, AddressPost.Address, NaklR.Weight, '
      
        '                      NaklR.KolPerPak, Post.OKPO, Cars.CarsName,' +
        ' Cars.CarsDriver, Cars.CarsType, Cars.CarsNomer, Cars.CarsOKPO, ' +
        'Cars.CarsFirma'
      
        ',(select NameLong from post where PostNo= NaklR.OurFirmNo) as Ou' +
        'rFirmName, NaklR.Contract_id'
      
        '           ,dbo.Get_Contract_Base (NaklR.NaklNo,'#39'NAKLR'#39') as Cont' +
        'ract_Name, NaklR.ExpeditionNo'
      'FROM         AddressPost RIGHT OUTER JOIN'
      '                      NaklR INNER JOIN'
      
        '                      Post ON NaklR.PostNo = Post.PostNo ON Addr' +
        'essPost.PostNo = NaklR.PostNo AND AddressPost.AddressNo = NaklR.' +
        'AddressNo LEFT OUTER JOIN'
      '                      Expedition INNER JOIN'
      
        '                      Cars ON Expedition.ExpeditionCarsNo = Cars' +
        '.CarsNo ON NaklR.ExpeditionNo = Expedition.ExpeditionNo'
      'where NaklR.NaklNo=:NaklNo'
      '*/')
    Left = 716
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
        Value = 1
      end>
    object quNaklRPrintDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklR.DateNakl'
    end
    object quNaklRPrintSumma: TFloatField
      FieldName = 'Summa'
      Origin = '.'
    end
    object quNaklRPrintNom: TIntegerField
      FieldName = 'Nom'
      Origin = 'NaklR.Nom'
    end
    object quNaklRPrintNameLong: TStringField
      FieldName = 'NameLong'
      Origin = 'Post.NameLong'
      FixedChar = True
      Size = 80
    end
    object quNaklRPrintDogovorNo: TStringField
      FieldName = 'DogovorNo'
      Origin = 'Post.DogovorNo'
      FixedChar = True
    end
    object quNaklRPrintDateDogovor: TDateTimeField
      FieldName = 'DateDogovor'
      Origin = 'Post.DateDogovor'
    end
    object quNaklRPrintAddress: TStringField
      FieldName = 'Address'
      Origin = 'AddressPost.Address'
      FixedChar = True
      Size = 256
    end
    object quNaklRPrintWeight: TFloatField
      FieldName = 'Weight'
      Origin = 'NaklR.Weight'
      Precision = 10
    end
    object quNaklRPrintKolPerPak: TFloatField
      FieldName = 'KolPerPak'
      Origin = 'NaklR.KolPerPak'
      Precision = 10
    end
    object quNaklRPrintOKPO: TStringField
      FieldName = 'OKPO'
      Origin = 'Post.OKPO'
      FixedChar = True
      Size = 10
    end
    object quNaklRPrintCarsName: TStringField
      FieldName = 'CarsName'
      Origin = 'Cars.CarsName'
      FixedChar = True
      Size = 64
    end
    object quNaklRPrintCarsDriver: TStringField
      FieldName = 'CarsDriver'
      Origin = 'Cars.CarsDriver'
      FixedChar = True
      Size = 64
    end
    object quNaklRPrintCarsType: TStringField
      FieldName = 'CarsType'
      Origin = 'Cars.CarsType'
      FixedChar = True
    end
    object quNaklRPrintCarsNomer: TStringField
      FieldName = 'CarsNomer'
      Origin = 'Cars.CarsNomer'
      FixedChar = True
      Size = 10
    end
    object quNaklRPrintCarsOKPO: TStringField
      FieldName = 'CarsOKPO'
      Origin = 'Cars.CarsOKPO'
      FixedChar = True
      Size = 10
    end
    object quNaklRPrintCarsFirma: TStringField
      FieldName = 'CarsFirma'
      Origin = 'Cars.CarsFirma'
      FixedChar = True
      Size = 30
    end
    object quNaklRPrintOurFirmName: TStringField
      FieldName = 'OurFirmName'
      Origin = '.'
      FixedChar = True
      Size = 80
    end
    object quNaklRPrintOurOKPO: TStringField
      FieldName = 'OurOKPO'
      Origin = '.'
      ReadOnly = True
      Size = 10
    end
    object quNaklRPrintOurAdres: TStringField
      FieldName = 'OurAdres'
      ReadOnly = True
      Size = 60
    end
    object quNaklRPrintContract_Name: TStringField
      FieldName = 'Contract_Name'
      Origin = '.'
      FixedChar = True
      Size = 1024
    end
    object quNaklRPrintExpeditionNo: TIntegerField
      FieldName = 'ExpeditionNo'
      Origin = 'NaklR.ExpeditionNo'
    end
    object quNaklRPrintPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quNaklRPrintNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quNaklRPrintContract_id: TIntegerField
      FieldName = 'Contract_id'
    end
    object quNaklRPrintCar: TStringField
      FieldName = 'Car'
      FixedChar = True
      Size = 50
    end
    object quNaklRPrintDriver: TStringField
      FieldName = 'Driver'
      FixedChar = True
      Size = 50
    end
    object quNaklRPrintContract_Nom: TStringField
      FieldName = 'Contract_Nom'
      ReadOnly = True
      Size = 24
    end
    object quNaklRPrintContract_date: TStringField
      FieldName = 'Contract_date'
      ReadOnly = True
      Size = 30
    end
    object quNaklRPrintContract_type: TStringField
      FieldName = 'Contract_type'
      ReadOnly = True
      Size = 1024
    end
    object quNaklRPrintNDS: TFloatField
      FieldName = 'NDS'
      ReadOnly = True
    end
    object quNaklRPrintNoNDS: TFloatField
      FieldName = 'NoNDS'
      ReadOnly = True
    end
    object quNaklRPrintisTovNoNDS: TIntegerField
      FieldName = 'isTovNoNDS'
      ReadOnly = True
    end
    object quNaklRPrintPhisicalAddress: TStringField
      FieldName = 'PhisicalAddress'
      Size = 60
    end
    object quNaklRPrintTypeReturn: TStringField
      FieldName = 'TypeReturn'
      ReadOnly = True
      Size = 50
    end
    object quNaklRPrintDescription: TStringField
      FieldName = 'Description'
      Size = 1024
    end
  end
  object quRashodPrint: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT Rashod.Kol, '
      '       Rashod.PriceOut, '
      '       Tovar.NameTovar, '
      '       VidTov.VidName, '
      '       VidTov.PriceWithNDS, '
      '       Tovar.EdIzm, '
      '       Tovar.Weight * Rashod.Kol / 1000 AS Weight, '
      '       Tovar.KolPerPak,'
      '       Tovar.BarCode, '
      '       isnull((select Social '
      '                from Social_Tovar st'
      '                 where st.TovarNo = Tovar.TovarNo),0) as Social,'
      '       isnull((select WithNoNDS '
      '                from TovarWithNoNDS st'
      
        '                 where st.TovarNo = Tovar.TovarNo),0) as WithNoN' +
        'DS,'
      '       isnull(Rashod.AVgPriceIn,'
      '              (select o.AvgPriceIn '
      '               from ostatok o'
      '                where o.TovarNo = Tovar.TovarNo)) as AvgPriceIn,'
      '       RASHOD.PriceInInst, '
      '       isnull(TovarPost.TovarNoPost, Tovar.TovarNo) as Article,'
      '       '
      
        #9'   case when (select NotPlatNDS from Post where PostNo = (selec' +
        't PostNo from d_our_firm)) = 1 then 0 '
      
        '                                                                ' +
        '                                  else isnull((select IsStavNDS '
      
        '                                                                ' +
        '                                                from TovarNDS st'
      
        '                                                                ' +
        '                                                 where st.TovarN' +
        'o = Tovar.TovarNo),0) '
      #9'   end as IsStavNDS,'
      ''
      
        '       case when (select NotPlatNDS from Post where PostNo = (se' +
        'lect PostNo from d_our_firm)) = 1 then Null'
      
        #9'                                                               ' +
        '                               else isnull((select StavNDS '
      
        '                                                                ' +
        '                                                from TovarNDS st'
      
        '                                                                ' +
        '                                                 where st.TovarN' +
        'o = Tovar.TovarNo),0) '
      #9'   end as StavNDS,'
      ''
      
        '       case  when (select NotPlatNDS from Post where PostNo = (s' +
        'elect PostNo from d_our_firm)) = 1 then Rashod.PriceOut'
      #9'         when ((isnull((select IsStavNDS '
      '                          from TovarNDS st'
      
        '                           where st.TovarNo = Tovar.TovarNo),0) ' +
        '= 0) and isnull((select WithNoNDS '
      
        '                                                                ' +
        '                  from TovarWithNoNDS st'
      
        '                                                                ' +
        '                   where st.TovarNo = Tovar.TovarNo),0) = 1) the' +
        'n Rashod.PriceOut'
      #9'         when isnull((select IsStavNDS '
      '                           from TovarNDS st'
      
        '                            where st.TovarNo = Tovar.TovarNo),0)' +
        ' = 1 then Rashod.PriceOut - (Rashod.PriceOut/(100+isnull((select' +
        ' StavNDS '
      
        '                                                                ' +
        '                                                           from ' +
        'TovarNDS st'
      
        '                                                                ' +
        '                                                            wher' +
        'e st.TovarNo = Tovar.TovarNo),0))*isnull((select StavNDS '
      
        '                                                                ' +
        '                                                                ' +
        '                                           from TovarNDS st'
      
        '                                                                ' +
        '                                                                ' +
        '                                            where st.TovarNo = T' +
        'ovar.TovarNo),0))'
      '             when isnull((select IsStavNDS '
      '                          from TovarNDS st'
      
        '                           where st.TovarNo = Tovar.TovarNo),0) ' +
        '= 0 then Rashod.PriceOut/1.2'
      '             when isnull((select WithNoNDS '
      '                           from TovarWithNoNDS st'
      
        '                            where st.TovarNo = Tovar.TovarNo),0)' +
        ' =1 then Rashod.PriceOut'
      #9'end as PriceNoNds,'
      ''
      
        '        case when (select NotPlatNDS from Post where PostNo = (s' +
        'elect PostNo from d_our_firm)) = 1 then abs(Rashod.Kol)*Rashod.P' +
        'riceOut'
      #9#9'     when ((isnull((select IsStavNDS '
      '                          from TovarNDS st'
      
        '                           where st.TovarNo = Tovar.TovarNo),0) ' +
        '= 0)and(isnull((select WithNoNDS '
      
        '                                                                ' +
        '                 from TovarWithNoNDS st'
      
        '                                                                ' +
        '                  where st.TovarNo = Tovar.TovarNo),0) = 1)) the' +
        'n abs(Rashod.Kol)*Rashod.PriceOut'
      #9#9#9' when isnull((select IsStavNDS '
      '                          from TovarNDS st'
      
        '                           where st.TovarNo = Tovar.TovarNo),0) ' +
        '= 1 then Rashod.Kol*Rashod.PriceOut - (abs(Rashod.Kol)*Rashod.Pr' +
        'iceOut/(100+isnull((select StavNDS '
      
        '                                                                ' +
        '                                                                ' +
        '                    from TovarNDS st'
      
        '                                                                ' +
        '                                                                ' +
        '                     where st.TovarNo = Tovar.TovarNo),0))*isnul' +
        'l((select StavNDS '
      
        '                                                                ' +
        '                                                                ' +
        '                    from TovarNDS st'
      
        '                                                                ' +
        '                                                                ' +
        '                     where st.TovarNo = Tovar.TovarNo),0))'
      '             when isnull((select IsStavNDS '
      '                          from TovarNDS st'
      
        '                           where st.TovarNo = Tovar.TovarNo),0) ' +
        '= 0 then abs(Rashod.Kol)*Rashod.PriceOut/1.2'
      '             '
      '        end as SummaWIthNoNds'
      '        '
      ' FROM VidTov RIGHT OUTER JOIN'
      '      Tovar INNER JOIN'
      
        '     Rashod ON Tovar.TovarNo = Rashod.TovarNo ON VidTov.VidNo = ' +
        'Tovar.VidNo left join'
      '     NaklR on RASHOD.NaklNo = NaklR.NaklNo left join'
      
        '     TovarPost on TovarPost.TovarNo = Tovar.TovarNo and TovarPos' +
        't.PostNo = NaklR.PostNo'
      '  WHERE (Rashod.NaklNo = :NaklNo)'
      'ORDER BY VidTov.VidName, Tovar.NameTovar'
      ''
      ''
      '/*'
      
        'SELECT     Rashod.Kol, Rashod.PriceOut, Tovar.NameTovar, VidTov.' +
        'VidName, VidTov.PriceWithNDS, Tovar.EdIzm, Tovar.Weight * Rashod' +
        '.Kol / 1000 AS Weight, '
      '                      Tovar.KolPerPak'
      'FROM         VidTov RIGHT OUTER JOIN'
      '                      Tovar INNER JOIN'
      
        '                      Rashod ON Tovar.TovarNo = Rashod.TovarNo O' +
        'N VidTov.VidNo = Tovar.VidNo'
      'WHERE     (Rashod.NaklNo = :NaklNo)'
      'ORDER BY VidTov.VidName, Tovar.NameTovar'
      '*/')
    Left = 716
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
      end>
    object quRashodPrintKol: TFloatField
      FieldName = 'Kol'
      Origin = 'BASE.Rashod.Kol'
    end
    object quRashodPrintPriceOut: TFloatField
      FieldName = 'PriceOut'
      Origin = 'BASE.Rashod.PriceOut'
    end
    object quRashodPrintNameTovar: TStringField
      FieldName = 'NameTovar'
      Origin = 'BASE.Tovar.NameTovar'
      FixedChar = True
      Size = 30
    end
    object quRashodPrintVidName: TStringField
      FieldName = 'VidName'
      Origin = 'BASE.VidTov.VidName'
      FixedChar = True
      Size = 30
    end
    object quRashodPrintPriceWithNDS: TBooleanField
      FieldName = 'PriceWithNDS'
      Origin = 'BASE.VidTov.PriceWithNDS'
    end
    object quRashodPrintEdIzm: TStringField
      FieldName = 'EdIzm'
      Origin = 'BASE.Tovar.EdIzm'
      FixedChar = True
      Size = 5
    end
    object quRashodPrintWeight: TFloatField
      FieldName = 'Weight'
      Origin = 'BASE.Tovar.Weight'
    end
    object quRashodPrintKolPerPak: TSmallintField
      FieldName = 'KolPerPak'
      Origin = 'BASE.Tovar.KolPerPak'
    end
    object quRashodPrintSocial: TBooleanField
      FieldName = 'Social'
      ReadOnly = True
    end
    object quRashodPrintAvgPriceIn: TFloatField
      FieldName = 'AvgPriceIn'
      ReadOnly = True
    end
    object quRashodPrintArticle: TIntegerField
      FieldName = 'Article'
      ReadOnly = True
    end
    object quRashodPrintWithNoNDS: TBooleanField
      FieldName = 'WithNoNDS'
      ReadOnly = True
    end
    object quRashodPrintStavNDS: TIntegerField
      FieldName = 'StavNDS'
      ReadOnly = True
    end
    object quRashodPrintPriceNoNds: TFloatField
      FieldName = 'PriceNoNds'
      ReadOnly = True
    end
    object quRashodPrintSummaWIthNoNds: TFloatField
      FieldName = 'SummaWIthNoNds'
      ReadOnly = True
    end
    object quRashodPrintPriceInInst: TFloatField
      FieldName = 'PriceInInst'
      ReadOnly = True
    end
    object quRashodPrintBarCode: TLargeintField
      FieldName = 'BarCode'
    end
    object quRashodPrintIsStavNDS: TIntegerField
      FieldName = 'IsStavNDS'
      ReadOnly = True
    end
  end
  object frReportPrintNakl: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit, pbPageSetup]
    RebuildPrinter = False
    OnGetValue = frReportPrintNaklGetValue
    Left = 706
    Top = 180
    ReportForm = {19000000}
  end
  object frDBdsPrintNakl: TfrDBDataSet
    DataSource = dsPrintNakl
    Left = 706
    Top = 150
  end
  object dsPrintNakl: TDataSource
    DataSet = quRashodPrint
    Left = 706
    Top = 118
  end
  object quRashodPrintKolvo: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select SUM(Rashod.Kol) AS Kolvo'
      'from Rashod'
      'where (Rashod.NaklNo=:NaklNo)')
    Left = 704
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
        Value = '1'
      end>
    object quRashodPrintKolvoKolvo: TFloatField
      FieldName = 'Kolvo'
      Origin = 'BASE.Rashod.Kol'
    end
  end
  object quMaster: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     NaklR.Nom'
      '         , NaklR.SummaDolg'
      #9#9' , NaklR.Summa'
      #9#9' , NaklR.Summa - NaklR.SummaDolg AS SummaPlat'
      #9#9' , NaklR.DateNakl'
      #9#9' , NaklR.DateOpl'
      #9#9' , Sotrud.SotrudName'
      #9#9' , Post.Name'
      #9#9' , Post.Contact AS ContactFace'
      #9#9' , Post.Phone'
      #9#9' , TipNakl.TipName AS BuhName'
      '         , (select Address '
      #9#9'     from addressPost '
      #9#9#9'  where PostNo=NaklR.PostNo '
      #9#9#9'    and AddressNo=NaklR.AddressNo) as Address'
      'from NaklR,Sotrud,Post,TipNakl'
      'where (SummaDolg>0) and'
      '      (Post.PostNo=NaklR.PostNo) and'
      '      (NaklR.Buh=TipNakl.TipNo)  and'
      '      (Sotrud.SotrudNo=NaklR.SotrudNo) &_Sotrud'
      'order by SotrudName,Name,NaklR.DateNakl')
    OnCalcFields = quMasterCalcFields
    Left = 2
    Top = 292
    MacroData = <
      item
        Name = '_Sotrud'
        Value = ' '
      end>
    object quMasterSotrudName: TStringField
      FieldName = 'SotrudName'
      Size = 30
    end
    object quMasterNom: TIntegerField
      FieldName = 'Nom'
    end
    object quMasterName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object quMasterPhone: TStringField
      FieldName = 'Phone'
      Size = 15
    end
    object quMasterPSrok: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'PSrok'
      Calculated = True
    end
    object quMasterDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklR.DateNakl'
    end
    object quMasterSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      Origin = 'NaklR.SummaDolg'
      DisplayFormat = '0.00'
    end
    object quMasterDateOpl: TDateTimeField
      FieldName = 'DateOpl'
      Origin = 'NaklR.DateOpl'
    end
    object quMasterContactFace: TStringField
      FieldName = 'ContactFace'
      Origin = 'Post.Contact'
      Size = 50
    end
    object quMasterBuhName: TStringField
      FieldName = 'BuhName'
      Origin = 'TipNakl.TipName'
      Size = 10
    end
    object quMasterSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'BASE.NaklR.Summa'
    end
    object quMasterSummaPlat: TFloatField
      FieldName = 'SummaPlat'
      Origin = 'BASE.NaklR.Summa'
    end
    object quMasterAddress: TStringField
      FieldName = 'Address'
      FixedChar = True
      Size = 50
    end
  end
  object quLoadCarPostP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     NaklP.PostNo, Post.Name'
      'FROM         AddressPost INNER JOIN'
      
        '                      Post ON AddressPost.PostNo = Post.PostNo I' +
        'NNER JOIN'
      '                      NaklP ON AddressPost.PostNo = NaklP.PostNo'
      'WHERE     (NaklP.NaklNo IN &Nakl)'
      'GROUP BY NaklP.PostNo, Post.Name')
    Left = 668
    Top = 24
    MacroData = <
      item
        Name = 'Nakl'
        Value = '0=0'
      end>
    object quLoadCarPostPPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quLoadCarPostPName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
  end
  object quTovarVidNameP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT     Tovar.NameTovar, Tovar.TovarNo, VidTov.VidName'
      'FROM         Tovar INNER JOIN'
      
        '                      VidTov ON Tovar.VidNo = VidTov.VidNo INNER' +
        ' JOIN'
      
        '                      Prihod ON Tovar.TovarNo = Prihod.TovarNo I' +
        'NNER JOIN'
      '                      NaklP ON Prihod.NaklNo = NaklP.NaklNo'
      'WHERE     (NaklP.NaklNo IN &Nakl)'
      'GROUP BY Tovar.NameTovar, Tovar.TovarNo, VidTov.VidName'
      'ORDER BY VidTov.VidName DESC, Tovar.NameTovar DESC')
    Left = 668
    Top = 120
    MacroData = <
      item
        Name = 'Nakl'
        Value = '0=0'
      end>
    object quTovarVidNamePNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object quTovarVidNamePTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarVidNamePVidName: TStringField
      FieldName = 'VidName'
      FixedChar = True
      Size = 30
    end
  end
  object quLoadCarTovarP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Prihod.TovarNo, Tovar.NameTovar, SUM(Prihod.Kol) AS K' +
        'olvo, Tovar.KolPerPak, VidTov.VidName, SUM(Prihod.Kol * Prihod.P' +
        'rice) AS Summ'
      'FROM         Prihod INNER JOIN'
      '                      VidTov INNER JOIN'
      
        '                      Tovar ON VidTov.VidNo = Tovar.VidNo ON Pri' +
        'hod.TovarNo = Tovar.TovarNo INNER JOIN'
      '                      NaklP INNER JOIN'
      '                      AddressPost INNER JOIN'
      
        '                      Post ON AddressPost.PostNo = Post.PostNo O' +
        'N NaklP.PostNo = AddressPost.PostNo ON Prihod.NaklNo = NaklP.Nak' +
        'lNo'
      'WHERE     (NaklP.PostNo = :PostNo) AND (NaklP.NaklNo IN &Nakl)'
      
        'GROUP BY NaklP.PostNo, Prihod.TovarNo, Tovar.NameTovar, Tovar.Ko' +
        'lPerPak, Tovar.Weight, VidTov.VidName'
      'ORDER BY VidTov.VidName DESC, Tovar.NameTovar DESC')
    Left = 668
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end>
    MacroData = <
      item
        Name = 'Nakl'
        Value = '0=0'
      end>
    object quLoadCarTovarPTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quLoadCarTovarPNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object quLoadCarTovarPKolvo: TFloatField
      FieldName = 'Kolvo'
    end
    object quLoadCarTovarPKolPerPak: TSmallintField
      FieldName = 'KolPerPak'
    end
    object quLoadCarTovarPVidName: TStringField
      FieldName = 'VidName'
      FixedChar = True
      Size = 30
    end
    object quLoadCarTovarPSumm: TFloatField
      FieldName = 'Summ'
    end
  end
  object dsLoadCarP: TDataSource
    DataSet = mdLoadCar
    Left = 668
    Top = 184
  end
  object frReport13: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport13GetValue
    Left = 668
    Top = 282
    ReportForm = {19000000}
  end
  object frDBdsLoadCarP: TfrDBDataSet
    DataSource = dsLoadCarP
    Left = 668
    Top = 216
  end
  object frUDLoadCarP: TfrUserDataset
    OnCheckEOF = frUDLoadCarPCheckEOF
    OnFirst = frUDLoadCarPFirst
    OnNext = frUDLoadCarPNext
    Left = 668
    Top = 248
  end
  object quLoadNaklP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Nom'
      'from NaklP'
      'where NaklNo in &Nakl')
    Left = 668
    Top = 88
    MacroData = <
      item
        Name = 'Nakl'
        Value = '0=0'
      end>
    object IntegerField3: TIntegerField
      FieldName = 'Nom'
    end
  end
  object dsPrintNaklTransport: TDataSource
    DataSet = quRashodPrint
    Left = 736
    Top = 118
  end
  object frDBDSPrintNaklTransport: TfrDBDataSet
    DataSource = dsPrintNaklTransport
    Left = 736
    Top = 150
  end
  object frReportPrintNaklTransport: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReportPrintNaklTransportGetValue
    Left = 738
    Top = 182
    ReportForm = {19000000}
  end
  object quSotrudDolgNew: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     NaklR.Nom, NaklR.SummaDolg, NaklR.Summa, NaklR.Summa ' +
        '- NaklR.SummaDolg AS SummaPlat, NaklR.DateNakl, NaklR.DateOpl, '
      
        '                      Sotrud.SotrudName, Post.Name+'#39'/'#39'+Post.Phon' +
        'e as Name, Post.Contact AS ContactFace, Post.Phone, TipNakl.TipN' +
        'ame AS BuhName, Post.VIP,'
      
        '                   (select address from AddressPost where PostNo' +
        '=Naklr.PostNo and AddressNo=NaklR.AddressNo) as Address'
      'from NaklR,Sotrud,Post,TipNakl'
      'where (SummaDolg>0) and'
      '      (Post.PostNo=NaklR.PostNo) and'
      '      (NaklR.Buh=TipNakl.TipNo)  and'
      '      (Sotrud.SotrudNo=NaklR.SotrudNo) &_Sotrud'
      'order by SotrudName, Post.VIP,Name,NaklR.DateNakl')
    OnCalcFields = quSotrudDolgNewCalcFields
    Left = 460
    Top = 234
    MacroData = <
      item
        Name = '_Sotrud'
        Value = ' '
      end>
    object quSotrudDolgNewNom: TIntegerField
      FieldName = 'Nom'
      Origin = 'BASE.NaklR.Nom'
    end
    object quSotrudDolgNewSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      Origin = 'BASE.NaklR.SummaDolg'
    end
    object quSotrudDolgNewSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'BASE.NaklR.Summa'
    end
    object quSotrudDolgNewSummaPlat: TFloatField
      FieldName = 'SummaPlat'
      Origin = 'BASE.NaklR.Summa'
    end
    object quSotrudDolgNewDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'BASE.NaklR.DateNakl'
    end
    object quSotrudDolgNewDateOpl: TDateTimeField
      FieldName = 'DateOpl'
      Origin = 'BASE.NaklR.DateOpl'
    end
    object quSotrudDolgNewSotrudName: TStringField
      FieldName = 'SotrudName'
      Origin = 'BASE.Sotrud.SotrudName'
      FixedChar = True
      Size = 30
    end
    object quSotrudDolgNewName: TStringField
      FieldName = 'Name'
      Origin = 'BASE.Post.Name'
      FixedChar = True
      Size = 30
    end
    object quSotrudDolgNewContactFace: TStringField
      FieldName = 'ContactFace'
      Origin = 'BASE.Post.Contact'
      FixedChar = True
      Size = 50
    end
    object quSotrudDolgNewPhone: TStringField
      FieldName = 'Phone'
      Origin = 'BASE.Post.Phone'
      FixedChar = True
      Size = 15
    end
    object quSotrudDolgNewBuhName: TStringField
      FieldName = 'BuhName'
      Origin = 'BASE.TipNakl.TipName'
      FixedChar = True
      Size = 10
    end
    object quSotrudDolgNewVIP: TBooleanField
      FieldName = 'VIP'
      Origin = 'BASE.Post.VIP'
    end
    object quSotrudDolgNewPSrok: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'PSrok'
      Calculated = True
    end
    object quSotrudDolgNewAddress: TStringField
      FieldName = 'Address'
      FixedChar = True
      Size = 50
    end
  end
  object dsSotrudDolgNew: TDataSource
    DataSet = quSotrudDolgNew
    Left = 460
    Top = 266
  end
  object frDBdsSotrudDolgNew: TfrDBDataSet
    DataSource = dsSotrudDolgNew
    Left = 460
    Top = 298
  end
  object frReportSotrudDolgNew: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReportSotrudDolgNewGetValue
    Left = 460
    Top = 330
    ReportForm = {19000000}
  end
  object spZPSotrudPlat: TMSStoredProc
    StoredProcName = 'dbo.SalarySotrudPlat'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL dbo.SalarySotrudPlat (:DateBegin, :DateEnd' +
        ', :SotrudNo)}')
    Left = 264
    Top = 246
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
        Value = 36892d
      end
      item
        DataType = ftSmallint
        Name = 'SotrudNo'
        ParamType = ptInput
      end>
    object spZPSotrudPlatDatePlat: TDateTimeField
      FieldName = 'DatePlat'
    end
    object spZPSotrudPlatSummaPlat: TFloatField
      FieldName = 'SummaPlat'
      DisplayFormat = '#,##0.00'
    end
    object spZPSotrudPlatName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object spZPSotrudPlatNom: TIntegerField
      FieldName = 'Nom'
    end
    object spZPSotrudPlatSummaToNakl: TFloatField
      FieldName = 'SummaToNakl'
      DisplayFormat = '#,##0.00'
    end
    object spZPSotrudPlatGroupBy: TIntegerField
      FieldName = 'GroupBy'
    end
    object spZPSotrudPlatNamePercent: TStringField
      FieldKind = fkLookup
      FieldName = 'NamePercent'
      LookupDataSet = quPercentsZP
      LookupKeyFields = 'PercentNo'
      LookupResultField = 'NamePercent'
      KeyFields = 'GroupBy'
      Size = 50
      Lookup = True
    end
    object spZPSotrudPlatNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object spZPSotrudPlatValuePercent2: TCurrencyField
      FieldKind = fkLookup
      FieldName = 'ValuePercent2'
      LookupDataSet = quPercentsZP
      LookupKeyFields = 'PercentNo'
      LookupResultField = 'ValuePercent2'
      KeyFields = 'GroupBy'
      Lookup = True
    end
    object spZPSotrudPlatDateNaklFirst: TDateTimeField
      FieldName = 'DateNaklFirst'
    end
    object spZPSotrudPlatKolDay: TFloatField
      FieldName = 'KolDay'
    end
    object spZPSotrudPlatColnPrice: TSmallintField
      FieldName = 'ColnPrice'
    end
    object spZPSotrudPlatVip: TBooleanField
      FieldName = 'Vip'
    end
  end
  object dsZPSotrudPlat: TDataSource
    DataSet = spZPSotrudPlat
    Left = 264
    Top = 276
  end
  object frDBdsZPSotrudPlat: TfrDBDataSet
    DataSource = dsZPSotrudPlat
    Left = 264
    Top = 306
  end
  object frReportZPSotrudPlat: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReportZPSotrudPlatGetValue
    Left = 266
    Top = 336
    ReportForm = {19000000}
  end
  object quPercentsZP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select PercentNo,NamePercent,ValuePercent2'
      'from PercentsSalary'
      ' '
      ' '
      ' ')
    Left = 232
    Top = 246
    object quPercentsZPPercentNo: TSmallintField
      FieldName = 'PercentNo'
      Origin = 'BASE.PercentsSalary.PercentNo'
    end
    object quPercentsZPNamePercent: TStringField
      FieldName = 'NamePercent'
      Origin = 'BASE.PercentsSalary.NamePercent'
      FixedChar = True
    end
    object quPercentsZPValuePercent2: TFloatField
      FieldName = 'ValuePercent2'
      Origin = 'BASE.PercentsSalary.ValuePercent2'
      Precision = 5
    end
  end
  object spCountPercentZPForNakl: TMSStoredProc
    StoredProcName = 'dbo.CountPercentSalaryForNakl'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL dbo.CountPercentSalaryForNakl (:NaklNo)}')
    Left = 303
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'NaklNo'
        ParamType = ptInput
      end>
    object spCountPercentZPForNaklPercentSalary: TFloatField
      FieldName = 'PercentSalary'
    end
  end
  object spCrossPostCompanyOld: TMSStoredProc
    StoredProcName = 'dbo.CrossPostCompany'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL dbo.CrossPostCompany (:DateBegin, :DateEnd' +
        ', :Returne)}')
    Left = 284
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'Returne'
        ParamType = ptInput
      end>
  end
  object quRashod3: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select Sum(Kol) Kol,Tovar.NameTovar,Company.NameCompany,Tovar.Ed' +
        'Izm,VidTov.VidName'
      ',round(sum(weight/1000),2) as weight'
      ',round(sum(kol/kolperpak),0,1) as KolPak'
      ',sum(kol)-round(sum(kol/kolperpak),0,1)*KolperPak as KolOstPak'
      
        'from Rashod,Tovar join VidTov on (VidTov.VidNo=Tovar.VidNo) left' +
        ' outer join Company on (Company.CompanyNo=Tovar.CompanyNo)'
      'where Tovar.TovarNo=Rashod.TovarNo'
      'and   NaklNo In (8618,8637)'
      'group by VidName,NameCompany,NameTovar,EdIzm,kolperpak'
      'order by VidName,NameCompany,NameTovar')
    Left = 358
    Top = 173
  end
  object frDBRashod3: TfrDBDataSet
    DataSource = DSRashod3
    Left = 358
    Top = 207
  end
  object DSRashod3: TDataSource
    DataSet = quRashod3
    Left = 392
    Top = 208
  end
  object frxTXTExport1: TfrxTXTExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ScaleWidth = 1.000000000000000000
    ScaleHeight = 1.000000000000000000
    Borders = False
    Pseudogrpahic = False
    PageBreaks = True
    OEMCodepage = False
    EmptyLines = False
    LeadSpaces = False
    PrintAfter = False
    PrinterDialog = True
    UseSavedProps = True
    Left = 16
    Top = 392
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    FixedWidth = True
    Background = True
    Centered = False
    EmptyLines = True
    Left = 48
    Top = 392
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 80
    Top = 392
  end
  object frxXMLExport1: TfrxXMLExport
    FileName = 'C:\DELPHI\MLEKO\1.xls'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    OpenExcelAfterExport = True
    Background = True
    Creator = 'FastReport'
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 112
    Top = 392
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 144
    Top = 392
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 176
    Top = 392
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 208
    Top = 392
  end
  object frxTIFFExport1: TfrxTIFFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 240
    Top = 392
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport (http://www.fast-report.com)'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 272
    Top = 392
  end
  object frxReport: TfrxReport
    Version = '4.7.91'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38636.546694745400000000
    ReportOptions.LastChange = 38636.668807280100000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      'end.')
    Left = 368
    Top = 392
    Datasets = <
      item
        DataSet = RepDataSet
        DataSetName = 'RepDataSet'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = 15790320
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.001250000000000000
      RightMargin = 10.001250000000000000
      TopMargin = 10.001250000000000000
      BottomMargin = 10.001250000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 19.456710000000000000
        Top = 16.000000000000000000
        Width = 718.101251175000100000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.101251175000100000
          Height = 16.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#181#1056#1030#1057#8249#1056#1111#1056#1109#1056#187#1056#1029#1056#181#1056#1029#1056#1029#1057#8249#1056#181' '#1056#183#1056#176#1056#1108#1056#176#1056#183#1057#8249)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 33.677180000000000000
        Top = 56.000000000000000000
        Width = 718.101251175000100000
        object Memo3: TfrxMemoView
          Width = 91.700283840000000000
          Height = 32.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1119#1056#176#1057#1026#1057#8218#1056#1029#1056#181#1057#1026)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 224.427067440000000000
          Width = 210.837111600000000000
          Height = 32.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#1105#1056#1112#1056#181#1056#1029#1056#1109#1056#1030#1056#176#1056#1029#1056#1105#1056#181)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 91.700283840000000000
          Width = 132.536166720000000000
          Height = 32.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1106#1056#1169#1057#1026#1056#181#1057#1027#1057#1027)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 661.070648780000000000
          Top = 0.244094000000000000
          Width = 56.692913390000000000
          Height = 32.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#8221#1056#1109#1056#177#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1109)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 434.622112780000000000
          Top = 0.244093999999997000
          Width = 56.692913390000000000
          Height = 32.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#8212#1056#176#1056#1108#1056#176#1056#183)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 490.827693690000000000
          Top = 0.244094000000000000
          Width = 56.692913390000000000
          Height = 32.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1032#1057#8364#1056#187#1056#1109' '#1056#1030
            #1056#1029#1056#176#1056#1108#1056#187#1056#176#1056#1169#1056#1029)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 548.460178010000000000
          Top = 0.244093999999997000
          Width = 56.692913390000000000
          Height = 32.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1032#1056#181#1057#8230#1056#176#1056#187#1056#1109)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 604.674720900000000000
          Top = 0.244093999999997000
          Width = 56.692913390000000000
          Height = 32.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          Memo.UTF8 = (
            #1056#1116#1056#181' '#1056#1030#1057#8249#1056#1111#1056#1109#1056#187'.')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Height = 26.456710000000000000
        Top = 148.000000000000000000
        Width = 718.101251175000100000
        Condition = 'RepDataSet."VidName"'
        object Memo11: TfrxMemoView
          Align = baWidth
          Width = 718.101251175000100000
          Height = 22.677180000000000000
          ShowHint = False
          Color = 15790320
          DataField = 'VidName'
          DataSet = RepDataSet
          DataSetName = 'RepDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[RepDataSet."VidName"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Height = 16.897650000000000000
        Top = 196.000000000000000000
        Width = 718.101251175000100000
        DataSet = RepDataSet
        DataSetName = 'RepDataSet'
        RowCount = 0
        object Memo12: TfrxMemoView
          Width = 91.700283840000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataField = 'PostName'
          DataSet = RepDataSet
          DataSetName = 'RepDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[RepDataSet."PostName"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo13: TfrxMemoView
          Left = 91.700283840000000000
          Width = 132.536166720000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[RepDataSet."Address"]')
          ParentFont = False
          SuppressRepeated = True
        end
        object Memo14: TfrxMemoView
          Left = 224.427067440000000000
          Width = 210.837111600000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[RepDataSet."NameTovar"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 661.073562170000000000
          Width = 56.690000000000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataSet = RepDataSet
          DataSetName = 'RepDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[RepDataSet."KolDobavil"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 434.625026170000000000
          Width = 56.690000000000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataField = 'KolZak'
          DataSet = RepDataSet
          DataSetName = 'RepDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[RepDataSet."KolZak"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 491.830607080000000000
          Width = 56.690000000000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataField = 'KolNakl'
          DataSet = RepDataSet
          DataSetName = 'RepDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[RepDataSet."KolNakl"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 548.463091400000000000
          Width = 56.690000000000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataField = 'KolRez'
          DataSet = RepDataSet
          DataSetName = 'RepDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[RepDataSet."KolRez"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 604.677634290000000000
          Width = 56.690000000000000000
          Height = 16.897650000000000000
          ShowHint = False
          DataField = 'KolStratil'
          DataSet = RepDataSet
          DataSetName = 'RepDataSet'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8 = (
            '[RepDataSet."KolStratil"]')
          ParentFont = False
        end
      end
    end
  end
  object RepDataSet: TfrxDBDataset
    UserName = 'RepDataSet'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PostName=PostName'
      'NameTovar=NameTovar'
      'VidName=VidName'
      'Address=Address'
      'PriceOut=PriceOut'
      'KolZak=KolZak'
      'KolNakl=KolNakl'
      'KolRez=KolRez'
      'KolStratil=KolStratil'
      'KolDobavil=KolDobavil')
    DataSet = QuRepQuery
    BCDToCurrency = False
    Left = 336
    Top = 392
  end
  object QuRepQuery: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select '
      'PostName'
      ',NameTovar'
      ',VidName'
      ',Address'
      ',PriceOut'
      ',sum(KolZak) as KolZak'
      ',sum(KolNakl) as KolNakl'
      ',sum(KolRez) as KolRez'
      ',sum(KolStratil) as KolStratil'
      ',sum(KolDobavil) as KolDobavil'
      'from v_repNedogruz'
      'where dateNakl>= :DateBegin and dateNakl<= :DateEnd'
      'group by PostName,NameTovar,VidName,Address,PriceOut'
      'Order by VidName,PostName,Address,NameTovar')
    Left = 304
    Top = 392
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateBegin'
        Value = 38635d
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
        Value = 38635d
      end>
  end
  object frRTFExport1: TfrRTFExport
    ScaleX = 1.300000000000000000
    ScaleY = 1.000000000000000000
    Left = 80
    Top = 328
  end
  object frOLEExcelExport1: TfrOLEExcelExport
    HighQuality = False
    CellsAlign = False
    CellsBorders = False
    CellsFillColor = False
    CellsFontColor = False
    CellsFontName = False
    CellsFontSize = False
    CellsFontStyle = False
    CellsMerged = False
    CellsWrapWords = False
    ExportPictures = False
    OpenExcelAfterExport = True
    PageBreaks = False
    AsText = False
    Left = 8
    Top = 328
  end
  object frXMLExcelExport1: TfrXMLExcelExport
    OpenExcelAfterExport = True
    Left = 48
    Top = 328
  end
  object frDesigner1: TfrDesigner
    Left = 336
    Top = 136
  end
  object frCSVExport1: TfrCSVExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Delimiter = ';'
    Left = 112
    Top = 328
  end
  object frTextExport1: TfrTextExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 152
    Top = 328
  end
  object frRtfAdvExport1: TfrRtfAdvExport
    OpenAfterExport = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 192
    Top = 328
  end
  object frDialogControls1: TfrDialogControls
    Left = 448
    Top = 160
  end
  object Otchet_TTN: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from Post'
      'where NameLong = :bb')
    Left = 669
    Top = 333
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'bb'
      end>
  end
  object dsRashodPrintNew: TDataSource
    DataSet = quRashodPrint
    Left = 746
    Top = 407
  end
  object quRashodPrintNew: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT Rashod.Kol, '
      '       Rashod.PriceOut, '
      '       Tovar.NameTovar, '
      '       VidTov.VidName, '
      '       VidTov.PriceWithNDS, '
      '       Tovar.EdIzm, '
      '       Tovar.Weight * Rashod.Kol / 1000 AS Weight, '
      '       Tovar.KolPerPak, '
      '       isnull((select Social '
      '                from Social_Tovar st'
      '                 where st.TovarNo = Tovar.TovarNo),0) as Social'
      ' FROM VidTov RIGHT OUTER JOIN'
      '      Tovar INNER JOIN'
      
        '     Rashod ON Tovar.TovarNo = Rashod.TovarNo ON VidTov.VidNo = ' +
        'Tovar.VidNo'
      '  WHERE (Rashod.NaklNo = :NaklNo)'
      'ORDER BY VidTov.VidName, Tovar.NameTovar'
      ''
      '/*'
      
        'SELECT     Rashod.Kol, Rashod.PriceOut, Tovar.NameTovar, VidTov.' +
        'VidName, VidTov.PriceWithNDS, Tovar.EdIzm, Tovar.Weight * Rashod' +
        '.Kol / 1000 AS Weight, '
      '                      Tovar.KolPerPak, st.Social'
      'FROM         VidTov RIGHT OUTER JOIN'
      '                      Tovar INNER JOIN'
      
        '                      Rashod ON Tovar.TovarNo = Rashod.TovarNo O' +
        'N VidTov.VidNo = Tovar.VidNo,'
      '             Social_tovar st'
      'WHERE (Rashod.NaklNo = :NaklNo)'
      '  and st.TovarNo = Tovar.TovarNo'
      'ORDER BY VidTov.VidName, Tovar.NameTovar'
      '*/')
    Left = 708
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NaklNo'
        Value = 1
      end>
    object quRashodPrintNewKol: TFloatField
      FieldName = 'Kol'
    end
    object quRashodPrintNewPriceOut: TFloatField
      FieldName = 'PriceOut'
    end
    object quRashodPrintNewNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 128
    end
    object quRashodPrintNewVidName: TStringField
      FieldName = 'VidName'
      Size = 30
    end
    object quRashodPrintNewPriceWithNDS: TBooleanField
      FieldName = 'PriceWithNDS'
    end
    object quRashodPrintNewEdIzm: TStringField
      FieldName = 'EdIzm'
      Size = 5
    end
    object quRashodPrintNewWeight: TFloatField
      FieldName = 'Weight'
      ReadOnly = True
    end
    object quRashodPrintNewKolPerPak: TSmallintField
      FieldName = 'KolPerPak'
    end
    object quRashodPrintNewSocial: TBooleanField
      FieldName = 'Social'
      ReadOnly = True
    end
  end
  object frBarCodeObject1: TfrBarCodeObject
    Left = 560
    Top = 400
  end
end
