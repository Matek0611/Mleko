inherited ChangePriceList: TChangePriceList
  Left = 830
  Top = 183
  Width = 452
  Height = 111
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072'/'#1042#1099#1075#1088#1091#1079#1082#1072' '#1087#1088#1072#1081#1089' '#1083#1080#1089#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 136
    Top = 8
    Width = 150
    Height = 13
    Caption = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072' '#1076#1083#1103' '#1074#1099#1075#1088#1091#1079#1082#1080' '#1094#1077#1085
  end
  object bb_ExportPriceList: TBitBtn [1]
    Left = 8
    Top = 24
    Width = 105
    Height = 25
    Hint = #1042#1099#1075#1088#1091#1079#1082#1072' '#1094#1077#1085
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1094#1077#1085#1099
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = bb_ExportPriceListClick
  end
  object cbDBLookupFilterPrice: TDBLookupComboboxEh [2]
    Left = 120
    Top = 28
    Width = 201
    Height = 21
    Hint = #1058#1080#1087' '#1090#1086#1074#1072#1088#1072' '#1076#1083#1103' '#1074#1099#1075#1088#1091#1079#1082#1080' '#1094#1077#1085
    EditButtons = <>
    KeyField = 'NameGroup'
    ListField = 'NameGroup'
    ListSource = dsFilterPrice
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object bb_ImportPriceList: TBitBtn [3]
    Left = 328
    Top = 24
    Width = 97
    Height = 25
    Hint = #1047#1072#1075#1088#1091#1079#1082#1072' '#1092#1072#1081#1083#1072' '#1089' '#1094#1077#1085#1072#1084#1080
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1094#1077#1085#1099
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = bb_ImportPriceListClick
  end
  object od_PriceList: TOpenDialog
    Left = 48
  end
  object quFilterPrice: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct NameGroup '
      ' from work.dbo.V_PriceForVeb'
      'order by NameGroup')
    Left = 120
  end
  object qu_ChangePriceList: TMSQuery
    SQLInsert.Strings = (
      'declare'
      ' @cnt int'
      ''
      'select @cnt = count(*) '
      ' from work.dbo.V_PriceForVeb'
      '  where TovarNo = convert(smallint,:TovarNo);'
      ''
      'if @cnt > 0'
      ''
      'begin'
      '  update Ostatok'
      '    set Price = convert(decimal(18,6),:Price)'
      '      , Price1 = convert(decimal(18,6),:Price1)'
      '      , Price2 = convert(decimal(18,6),:Price2)'
      '      , Price3 = convert(decimal(18,6),:Price3)'
      '      , Price4 = convert(decimal(18,3),:Price4)'
      '      , Price5 = convert(decimal(18,4),:Price5)'
      '      , Price6 = convert(decimal(18,4),:Price6)'
      '      , Price7 = convert(decimal(18,4),:Price7)'
      '      , Price8 = convert(decimal(18,4),:Price8)'
      '      , Price9 = convert(decimal(18,4),:Price9)'
      '      , Price10 = convert(decimal(18,4),:Price10)'
      '      , Price13 = convert(decimal(18,4),:Price13)'
      '      , Price14 = convert(decimal(18,4),:Price14)'
      '      , Price15 = convert(decimal(18,4),:Price15)'
      '  where TovarNo = convert(smallint,:TovarNo); '
      '  '
      '  update PriceForVeb'
      '    set PriceInInst = convert(decimal(18,2),:PriceInInst)'
      '      , PriceVeb = convert(decimal(18,2),:PriceVeb)'
      '      , PriceOld = convert(decimal(18,2),:PriceOld)'
      '  where TovarNo = convert(smallint,:TovarNo); '
      ''
      'end')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  '#39#1053#1086#1084#1077#1088' '#1090#1086#1074#1072#1088#1072#39' as TovarNo'
      '      , '#39#1062#1077#1085#1072' 1'#39' as Price'
      '      , '#39#1062#1077#1085#1072' 2'#39' as Price1'
      '      , '#39#1062#1077#1085#1072' 3'#39' as Price2'
      '      , '#39#1062#1077#1085#1072' 4'#39' as Price3'
      '      , '#39#1062#1077#1085#1072' 5'#39' as Price4'
      '      , '#39#1062#1077#1085#1072' '#1061#1072#1088#1090#1086#1088#1075#39' as Price5'
      '      , '#39#1062#1077#1085#1072' '#1056#1077#1075#1080#1086#1085'1'#39' as Price6'
      '      , '#39#1062#1077#1085#1072' '#1056#1077#1075#1080#1086#1085'2'#39' as Price7'
      '      , '#39#1062#1077#1085#1072' '#1060#1086#1079#1080#39' as Price8'
      '      , '#39#1062#1077#1085#1072' '#1040#1058#1041#39' as Price13'
      '      , '#39#1062#1077#1085#1072' '#1053#1086#1074#1072#1103'2'#39' as Price14'
      '      , '#39#1062#1077#1085#1072' '#1053#1086#1074#1072#1103'3'#39' as Price15'
      '      , '#39#1062#1077#1085#1072' '#1052#1086#1088#1086#1079#1086#1074#1099#39' as Price9'
      '      , '#39#1062#1077#1085#1072' '#1053#1086#1074#1072#1103'4'#39' as Price10'
      '      , '#39#1062#1077#1085#1072' '#1089#1072#1081#1090#1072#39' as PriceVeb'
      '      , '#39#1062#1077#1085#1072' '#1074#1093#1086#1076#1085#1072#1103' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1072#39' as PriceInInst'
      '      , '#39#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072#39' as NameTovar'
      '      , '#39#1058#1080#1087' '#1090#1086#1074#1072#1088#1072#39' as NameGroup'
      '      , '#39#1057#1090#1072#1088#1072#1103' '#1094#1077#1085#1072#39' as PriceOld'
      '      , '#39#1044#1072#1090#1072' '#1072#1082#1090#1091#1072#1083#1100#1085#1086#1089#1090#1080#39' as PriceValidDate'
      '      , '#39#1042#1072#1083#1102#1090#1072#39' as Currency'
      'union all      '
      'select  convert(varchar,TovarNo) as TovarNo'
      '      , Price'
      '      , Price1'
      '      , Price2'
      '      , Price3'
      '      , Price4'
      '      , Price5'
      '      , Price6'
      '      , Price7'
      '      , Price8'
      '      , Price13'
      '      , Price14'
      '      , Price15'
      '      , Price9'
      '      , Price10'
      '      , PriceVeb'
      '      , PriceInInst'
      '      , NameTovar'
      '      , NameGroup'
      '      , PriceOld'
      '      , PriceValidDate'
      '      , Currency'
      '  from  work.dbo.V_PriceForVeb'
      '   where NameGroup = isnull(rtrim(ltrim(:NameGroup)), NameGroup)')
    Left = 200
    ParamData = <
      item
        DataType = ftVariant
        Name = 'NameGroup'
        ParamType = ptInput
      end>
    object qu_ChangePriceListPrice: TStringField
      FieldName = 'Price'
      Size = 10
    end
    object qu_ChangePriceListPrice1: TStringField
      FieldName = 'Price1'
      Size = 10
    end
    object qu_ChangePriceListPrice2: TStringField
      FieldName = 'Price2'
      Size = 10
    end
    object qu_ChangePriceListPrice3: TStringField
      FieldName = 'Price3'
      Size = 10
    end
    object qu_ChangePriceListPrice4: TStringField
      FieldName = 'Price4'
      Size = 10
    end
    object qu_ChangePriceListPrice5: TStringField
      FieldName = 'Price5'
      Size = 10
    end
    object qu_ChangePriceListPrice6: TStringField
      FieldName = 'Price6'
      Size = 10
    end
    object qu_ChangePriceListPrice7: TStringField
      FieldName = 'Price7'
      Size = 10
    end
    object qu_ChangePriceListPrice8: TStringField
      FieldName = 'Price8'
      Size = 10
    end
    object qu_ChangePriceListPrice13: TStringField
      FieldName = 'Price13'
      Size = 10
    end
    object qu_ChangePriceListPrice14: TStringField
      FieldName = 'Price14'
      Size = 10
    end
    object qu_ChangePriceListPrice15: TStringField
      FieldName = 'Price15'
      Size = 10
    end
    object qu_ChangePriceListPrice9: TStringField
      FieldName = 'Price9'
      Size = 10
    end
    object qu_ChangePriceListPrice10: TStringField
      FieldName = 'Price10'
      Size = 10
    end
    object qu_ChangePriceListPriceVeb: TStringField
      FieldName = 'PriceVeb'
      Size = 10
    end
    object qu_ChangePriceListPriceInInst: TStringField
      FieldName = 'PriceInInst'
      Size = 10
    end
    object qu_ChangePriceListNameGroup: TStringField
      FieldName = 'NameGroup'
      Size = 30
    end
    object qu_ChangePriceListNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 128
    end
    object qu_ChangePriceListTovarNo: TStringField
      FieldName = 'TovarNo'
      Size = 30
    end
    object qu_ChangePriceListPriceOld: TStringField
      FieldName = 'PriceOld'
      ReadOnly = True
      Size = 11
    end
    object qu_ChangePriceListPriceValidDate: TStringField
      FieldName = 'PriceValidDate'
      ReadOnly = True
    end
    object qu_ChangePriceListCurrency: TStringField
      FieldName = 'Currency'
      ReadOnly = True
      Size = 6
    end
  end
  object dsFilterPrice: TMSDataSource
    DataSet = quFilterPrice
    Left = 96
  end
  object ds_ChangePriceList: TMSDataSource
    DataSet = qu_ChangePriceList
    Left = 176
  end
  object QuUpdatePrice: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '    @cnt int'
      '  , @TovarNo int'
      '  , @Edit_user  varchar(50)'
      '  , @Edit_host_name varchar(50)'
      ''
      '  , @Price decimal(18,3)'
      '  , @Price1 decimal(18,3)'
      '  , @Price2 decimal(18,3)'
      '  , @Price3 decimal(18,3)'
      '  , @Price4 decimal(18,3)'
      '  , @Price5 decimal(18,3)'
      '  , @Price6 decimal(18,3)'
      '  , @Price7 decimal(18,3)'
      '  , @Price8 decimal(18,3)'
      '  , @Price9 decimal(18,3)'
      '  , @Price10 decimal(18,3)'
      '  , @Price13 decimal(18,3)'
      '  , @Price14 decimal(18,3)'
      '  , @Price15 decimal(18,3)'
      '  , @PriceVeb decimal(18,2)'
      '  , @PriceInInst decimal(18,3)'
      '  , @AvgPriceIn decimal(18,3)'
      '  , @LastPriceIn decimal(18,3)'
      '  , @PriceOld decimal(18,2)'
      '  , @PriceValidDate smalldatetime'
      '  , @Currency varchar(5)'
      ''
      ''
      'set @TovarNo = :TovarNo'
      ''
      'select @cnt = count(*)'
      ' from work.dbo.V_PriceForVeb'
      '  where TovarNo = @TovarNo'
      ''
      'select @Edit_user = suser_sname(),'
      '       @Edit_host_name = HOST_NAME()'
      ''
      ''
      
        'set @Price = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price,'#39',' +
        #39','#39'.'#39'))))'
      
        'set @Price1 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price1,' +
        #39','#39','#39'.'#39'))))'
      
        'set @Price2 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price2,' +
        #39','#39','#39'.'#39'))))'
      
        'set @Price3 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price3,' +
        #39','#39','#39'.'#39'))))'
      
        'set @Price4 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price4,' +
        #39','#39','#39'.'#39'))))'
      
        'set @Price5 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price5,' +
        #39','#39','#39'.'#39'))))'
      
        'set @Price6 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price6,' +
        #39','#39','#39'.'#39'))))'
      
        'set @Price7 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price7,' +
        #39','#39','#39'.'#39'))))'
      
        'set @Price8 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price8,' +
        #39','#39','#39'.'#39'))))'
      
        'set @Price9 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price9,' +
        #39','#39','#39'.'#39'))))'
      
        'set @Price10 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price1' +
        '0,'#39','#39','#39'.'#39'))))'
      
        'set @Price13 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price1' +
        '3,'#39','#39','#39'.'#39'))))'
      
        'set @Price14 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price1' +
        '4,'#39','#39','#39'.'#39'))))'
      
        'set @Price15 = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Price1' +
        '5,'#39','#39','#39'.'#39'))))'
      
        'set @PriceVeb = convert(decimal(18,2),rtrim(ltrim(REPLACE(:Price' +
        'Veb,'#39','#39','#39'.'#39'))))'
      
        'set @PriceInInst = convert(decimal(18,3),rtrim(ltrim(REPLACE(:Pr' +
        'iceInInst,'#39','#39','#39'.'#39'))))'
      
        'set @PriceOld = isnull(convert(decimal(18,2),rtrim(ltrim(REPLACE' +
        '(:PriceOld,'#39','#39','#39'.'#39')))),0)'
      'set @PriceValidDate = convert(smalldatetime,:PriceValidDate)'
      'set @Currency = convert(varchar(5),:Currency)'
      ''
      
        'select @AvgPriceIn = AvgPriceIn, @LastPriceIn = LastPriceIn from' +
        ' Ostatok where TovarNo = @TovarNo'
      ''
      'if @cnt > 0'
      'begin'
      ''
      ''
      
        'if (@Price + @Price1 + @Price2 + @Price3 + @Price4 + @Price + @P' +
        'rice6 +'
      
        '    @Price + @Price8 + @Price9 + @Price10 + @Price13 + @Price14 ' +
        '+ '
      '    @Price15 + @PriceInInst + @PriceVeb) <>'
      
        '   (select isnull(o.Price,0) + isnull(o.Price1,0) + isnull(o.Pri' +
        'ce2,0) + isnull(o.Price3,0) + isnull(o.Price4,0) + isnull(o.Pric' +
        'e5,0) + isnull(o.Price6,0) + isnull(o.Price7,0) +'
      
        '           isnull(o.Price8,0) + isnull(o.Price9,0) + isnull(o.Pr' +
        'ice10,0) + isnull(o.Price13,0) + isnull(o.Price14,0) + isnull(o.' +
        'Price15,0) + isnull(pfv.PriceVeb,0) + isnull(pfv.PriceInInst,0) '
      
        '     from Ostatok o left join PriceForVeb pfv on pfv.TovarNo = o' +
        '.TovarNo'
      '      where o.TovarNo = @TovarNo) '
      ''
      
        ' insert into HistoriPrice (TovarNo, NameTovar, DateChangePrice, ' +
        'VidName, Price, Price1,'#9'Price2,'#9'Price3, Price4, Price5, Price6, ' +
        'Price7,'
      
        '                           Price8, Price9, Price10, Price13, Pri' +
        'ce14, Price15, PriceVeb, PriceInInst, Edit_user, Edit_host_name,' +
        ' AvgPriceIn, LastPriceIn, Currency)'
      '  values (  @TovarNo'
      
        '         , (select NameTovar from Tovar where TovarNo = @TovarNo' +
        ') '
      '         , getdate ()'
      
        '         , (select VidName from VidTov where VidNo = (select Vid' +
        'No from Tovar where TovarNo = @TovarNo))'
      '         , @Price'
      '         , @Price1'
      '         , @Price2'
      '         , @Price3'
      '         , @Price4'
      '         , @Price5'
      '         , @Price6'
      '         , @Price7'
      '         , @Price8'
      '         , @Price9'
      '         , @Price10'
      '         , @Price13'
      '         , @Price14'
      '         , @Price15'
      '         , @PriceVeb'
      '         , @PriceInInst'
      '         , @Edit_user'
      #9' , @Edit_host_name'
      '         , @AvgPriceIn'
      '         , @LastPriceIn'
      '         , @Currency)'
      ''
      '  update Ostatok'
      '    set Price = @Price'
      '      , Price1 = @Price1'
      '      , Price2 = @Price2'
      '      , Price3 = @Price3'
      '      , Price4 = @Price4'
      '      , Price5 = @Price5'
      '      , Price6 = @Price6'
      '      , Price7 = @Price7'
      '      , Price8 = @Price8'
      '      , Price9 = @Price9'
      '      , Price10 = @Price10'
      '      , Price13 = @Price13'
      '      , Price14 = @Price14'
      '      , Price15 = @Price15'
      '  where TovarNo = @TovarNo'
      ''
      '  update PriceForVeb'
      '    set PriceInInst = @PriceInInst'
      '      , PriceVeb = @PriceVeb'
      '      , PriceOld = @PriceOld'
      '      , PriceValidDate = @PriceValidDate'
      '      , Currency = @Currency'
      '  where TovarNo = @TovarNo'
      ''
      'end')
    Left = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TovarNo'
      end
      item
        DataType = ftString
        Name = 'Price'
      end
      item
        DataType = ftString
        Name = 'Price1'
      end
      item
        DataType = ftString
        Name = 'Price2'
      end
      item
        DataType = ftString
        Name = 'Price3'
      end
      item
        DataType = ftString
        Name = 'Price4'
      end
      item
        DataType = ftString
        Name = 'Price5'
      end
      item
        DataType = ftString
        Name = 'Price6'
      end
      item
        DataType = ftString
        Name = 'Price7'
      end
      item
        DataType = ftString
        Name = 'Price8'
      end
      item
        DataType = ftString
        Name = 'Price9'
      end
      item
        DataType = ftUnknown
        Name = 'Price10'
      end
      item
        DataType = ftUnknown
        Name = 'Price13'
      end
      item
        DataType = ftUnknown
        Name = 'Price14'
      end
      item
        DataType = ftUnknown
        Name = 'Price15'
      end
      item
        DataType = ftUnknown
        Name = 'PriceVeb'
      end
      item
        DataType = ftUnknown
        Name = 'PriceInInst'
      end
      item
        DataType = ftUnknown
        Name = 'PriceOld'
      end
      item
        DataType = ftUnknown
        Name = 'PriceValidDate'
      end
      item
        DataType = ftString
        Name = 'Currency'
      end>
  end
end
