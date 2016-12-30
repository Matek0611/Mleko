inherited RequestForSupplyGoodsSpecForm: TRequestForSupplyGoodsSpecForm
  Left = 557
  Top = 140
  Width = 768
  Height = 355
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 275
    Width = 752
    Height = 41
    Align = alBottom
    TabOrder = 0
    object IsOnlyChange: TCheckBox
      Left = 384
      Top = 16
      Width = 129
      Height = 17
      Caption = #1058#1086#1083#1100#1082#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      TabOrder = 0
      OnClick = IsOnlyChangeClick
    end
    object ExportInFile: TButton
      Left = 216
      Top = 9
      Width = 113
      Height = 25
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1092#1072#1081#1083
      TabOrder = 1
      OnClick = ExportInFileClick
    end
    object Button1: TButton
      Left = 520
      Top = 8
      Width = 105
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1082#1083#1072#1076#1091#1102
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 752
    Height = 275
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 750
      Height = 273
      Align = alClient
      DataSource = dsRequestForSupplyGoodsSpec
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridEh1DrawColumnCell
      Columns = <
        item
          EditButtons = <>
          FieldName = 'RequestForSupplyGoods_Id'
          Footers = <>
          Width = 86
        end
        item
          EditButtons = <>
          FieldName = 'DateRequest'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NaklNo'
          Footers = <>
          Width = 75
        end
        item
          EditButtons = <>
          FieldName = 'DateNakl'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DeliveryGoodsName'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NameTovar'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Qty'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'QtyFirst'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PostNo'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'PostName'
          Footers = <>
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 8
    Top = 40
  end
  object quRequestForSupplyGoodsSpec: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '  @isOnlyChange bit'
      ''
      'set @isOnlyChange = :isOnlyChange'
      ''
      'select *'
      ' from RequestForSupplyGoodsSpec s left join'
      
        '      RequestForSupplyGoodsHead h on h.id = s.RequestForSupplyGo' +
        'ods_Id'
      
        '  where RequestForSupplyGoods_Id = isnull(:RequestForSupplyGoods' +
        '_Id,RequestForSupplyGoods_Id)'
      
        '    and case when @isOnlyChange = 1 and (s.Qty<>s.QtyFirst) then' +
        ' 1'
      #9'     when @isOnlyChange = 0 then 1'
      '       '#9'     when @isOnlyChange is null then 1'
      #9'end = 1'
      '/*'
      'select *'
      ' from RequestForSupplyGoodsSpec s left join'
      
        '      RequestForSupplyGoodsHead h on h.id = s.RequestForSupplyGo' +
        'ods_Id'
      
        '  where RequestForSupplyGoods_Id = isnull(:RequestForSupplyGoods' +
        '_Id,RequestForSupplyGoods_Id)'
      '*/')
    Left = 464
    Top = 16
    ParamData = <
      item
        DataType = ftBoolean
        Name = 'isOnlyChange'
      end
      item
        DataType = ftInteger
        Name = 'RequestForSupplyGoods_Id'
      end>
    object quRequestForSupplyGoodsSpecId: TLargeintField
      FieldName = 'Id'
      ReadOnly = True
    end
    object quRequestForSupplyGoodsSpecRequestForSupplyGoods_Id: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1087#1088#1086#1089#1072
      FieldName = 'RequestForSupplyGoods_Id'
    end
    object quRequestForSupplyGoodsSpecDateNakl: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      DisplayWidth = 10
      FieldName = 'DateNakl'
    end
    object quRequestForSupplyGoodsSpecNaklNo: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NaklNo'
    end
    object quRequestForSupplyGoodsSpecTovarNo: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1086#1074#1072#1088#1072
      FieldName = 'TovarNo'
    end
    object quRequestForSupplyGoodsSpecNameTovar: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 50
      FieldName = 'NameTovar'
      Size = 128
    end
    object quRequestForSupplyGoodsSpecQty: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'Qty'
    end
    object quRequestForSupplyGoodsSpecQtyFirst: TFloatField
      DisplayLabel = #1053#1072#1095#1072#1083#1100#1085#1086#1077' '#1082#1086#1083'-'#1074#1086
      FieldName = 'QtyFirst'
    end
    object quRequestForSupplyGoodsSpecPostNo: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      FieldName = 'PostNo'
    end
    object quRequestForSupplyGoodsSpecPostName: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'PostName'
      Size = 30
    end
    object quRequestForSupplyGoodsSpecDateRequest: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1087#1088#1086#1089#1072
      DisplayWidth = 10
      FieldName = 'DateRequest'
    end
    object quRequestForSupplyGoodsSpecDeliveryGoodsName: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1082#1072' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 30
      FieldName = 'DeliveryGoodsName'
      Size = 50
    end
  end
  object dsRequestForSupplyGoodsSpec: TMSDataSource
    DataSet = quRequestForSupplyGoodsSpec
    Left = 496
    Top = 16
  end
  object sdRequestForSupply: TSaveDialog
    Left = 336
    Top = 24
  end
  object quPostArtGroup: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct lag.ARTICLE_GROUP_ID '
      '               ,dag.NAME '
      '               ,lag.ARTICLE_ID '
      
        '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_I' +
        'D '
      '               ,dsag.NAME '
      '               ,lpsagd.POSTNO '
      
        '               ,isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as SET_ART' +
        'ICLE_GROUP_ID_delay '
      '               ,isnull(lpsagd.DAY_DELAY,0) as DAY_DELAY '
      '               ,isnull(lpsagd.DAY_DELAY_EXT,0) as DAY_DELAY_EXT '
      '               ,isnull(lpsagp.POSTNO,0) as POSTNOP '
      
        '               ,isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as SET_ART' +
        'ICLE_GROUP_ID_price '
      '               ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE '
      ' from L_ARTICLE_GROUP lag left join '
      
        '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left ' +
        'join '
      
        '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.AR' +
        'TICLE_GROUP_ID left join '
      
        '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GRO' +
        'UP_ID left join '
      
        '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP' +
        '_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo an' +
        'd lpsagd.BUH = :Buh left join '
      
        '      L_POST_SET_ARTGROUP_PRICE lpsagp on lsag.SET_ARTICLE_GROUP' +
        '_ID = lpsagp.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = :PostNom l' +
        'eft join '
      
        '      (select tp.TovarNo, tp.TovarNoPost, ofe.OrderDate, tp.Post' +
        'No, AddressNo'
      '        from OrdersFromExcel ofe left join'
      
        '             AddressCorrespondence ac on rtrim(ltrim(ac.AddressP' +
        'ost)) = rtrim(ltrim(ofe.AddressPost)) left join'
      
        #9'         TovarPost tp on tp.TovarNoPost = ofe.TovarNoPost and t' +
        'p.PostNo = ac.PostNo) ofe1 on ofe1.TovarNo = lag.ARTICLE_ID'
      '      '
      
        '  where ((ofe1.OrderDate = :OrderDate) and (ofe1.AddressNo = :Ad' +
        'dressNo))'
      '    and lsag.SET_ARTICLE_GROUP_ID is not null '
      '    and convert(smallint,ofe1.TovarNo) not in (select TovarNo '
      '                                                from e_blanks '
      
        '                                                 where Document_' +
        'id in (select idBlank '
      
        '                                                                ' +
        '        from l_BlankForExcel '
      
        '                                                                ' +
        '         where ((OrderDate = :OrderDate1)and(AddressNo = :Addres' +
        'sNo1)and(PostNo = :PostNo1))))'
      ''
      
        '    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varcha' +
        'r(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50' +
        '))) > 2'
      '    and lpsagd.POSTNO is not null '
      ' order by lpsagd.SET_ARTICLE_GROUP_ID')
    Left = 720
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
        ParamType = ptInput
        Value = 2255
      end
      item
        DataType = ftInteger
        Name = 'Buh'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'PostNom'
        ParamType = ptInput
        Value = 2255
      end
      item
        DataType = ftDateTime
        Name = 'OrderDate'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AddressNo'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftDateTime
        Name = 'OrderDate1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AddressNo1'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftUnknown
        Name = 'PostNo1'
      end>
    object quPostArtGroupARTICLE_GROUP_ID: TLargeintField
      FieldName = 'ARTICLE_GROUP_ID'
    end
    object quPostArtGroupNAME: TStringField
      FieldName = 'NAME'
      Size = 512
    end
    object quPostArtGroupARTICLE_ID: TLargeintField
      FieldName = 'ARTICLE_ID'
    end
    object quPostArtGroupSET_ARTICLE_GROUP_ID: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID'
    end
    object quPostArtGroupNAME_1: TStringField
      FieldName = 'NAME_1'
      Size = 512
    end
    object quPostArtGroupPOSTNO: TLargeintField
      FieldName = 'POSTNO'
    end
    object quPostArtGroupSET_ARTICLE_GROUP_ID_delay: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID_delay'
      ReadOnly = True
    end
    object quPostArtGroupDAY_DELAY: TIntegerField
      FieldName = 'DAY_DELAY'
      ReadOnly = True
    end
    object quPostArtGroupDAY_DELAY_EXT: TIntegerField
      FieldName = 'DAY_DELAY_EXT'
      ReadOnly = True
    end
    object quPostArtGroupPOSTNOP: TLargeintField
      FieldName = 'POSTNOP'
      ReadOnly = True
    end
    object quPostArtGroupSET_ARTICLE_GROUP_ID_price: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID_price'
      ReadOnly = True
    end
    object quPostArtGroupCOLNPRICE: TSmallintField
      FieldName = 'COLNPRICE'
      ReadOnly = True
    end
  end
  object quNaklR: TMSQuery
    SQLInsert.Strings = (
      'declare '
      '   @cnt int'
      '  ,@cnt1 int'
      ''
      'select @cnt = count(*) from NaklR where NaklNo = :NaklNo'
      
        'select @cnt1 = count(*) from L_NaklRReturn where NaklNo = :NaklN' +
        'o'
      ''
      'if @cnt = 0'
      ' insert into(   NaklNo'
      '              , PostNo'
      '              , SotrudNo'
      '              , AddressNo'
      '              , OtdelNo'
      '              , VidNaklNo'
      '--              , TypeReturnNo'
      '              , Buh'
      '              , SET_ARTICLE_GROUP_ID'
      '              , ColnPrice'
      '              , CurrencyHead)'
      '    values (  :NaklNo'
      '            , :PostNo'
      '            , :SotrudNo'
      '            , :AddressNo'
      '            , :OtdelNo'
      '            , :VidNaklNo'
      '--            , :TypeReturnNo'
      '            , :Buh'
      '            , :SET_ARTICLE_GROUP_ID'
      '            , :ColnPrice'
      '            , :CurrencyHead)'
      'else'
      ' update NaklR'
      '   set PostNo = :PostNo'
      '     , SotrudNo = :SotrudNo '
      '     , AddressNo = :AddressNo'
      '     , OtdelNo = :OtdelNo'
      '     , VidNaklNo = :VidNaklNo'
      '--     , TypeReturnNo = '
      '     , Buh = :Buh'
      '     , SET_ARTICLE_GROUP_ID = :SET_ARTICLE_GROUP_ID'
      '     , ColnPrice = :ColnPrice'
      '     , CurrencyHead = :CurrencyHead'
      ' where NaklNo = :NaklNo'
      ''
      'if @cnt1 = 0'
      ' insert into L_NaklRReturn (NaklNo, TypeReturnNo)'
      '  values (:NaklNo, :TypeReturnNo)'
      'else'
      ' update L_NaklRReturn'
      '  set TypeReturnNo = :TypeReturnNo'
      ' where NaklNo = :NaklNo')
    SQLUpdate.Strings = (
      'declare '
      '   @cnt int'
      '  ,@cnt1 int'
      ''
      'select @cnt = count(*) from NaklR where NaklNo = :NaklNo'
      
        'select @cnt1 = count(*) from L_NaklRReturn where NaklNo = :NaklN' +
        'o'
      ''
      'if @cnt = 0'
      ' insert into NaklR( NaklNo'
      '                  , Nom'
      '                  , NomFirst'
      '                  , PostNo'
      '                  , PostNoFirst'
      '                  , DateNakl'
      '                  , DateNaklFirst'
      '                  , DateOpl'
      '                  , UserNo'
      '                  , SotrudNo'
      '                  , AddressNo'
      '                  , OtdelNo'
      '                  , VidNaklNo'
      '                  , Buh'
      '                  , SET_ARTICLE_GROUP_ID'
      '                  , ColnPrice'
      '                  , pkey'
      '                  , description'
      '                  , CurrencyHead)'
      '    values (  :NaklNo'
      '            , :Nom'
      '            , :NomFirst'
      '            , :PostNo'
      '            , :PostNoFirst'
      '            , :DateNakl'
      '            , :DateNaklFirst'
      '            , :DateOpl'
      '            , :UserNo'
      '            , :SotrudNo'
      '            , :AddressNo'
      '            , :OtdelNo'
      '            , :VidNaklNo'
      '            , :Buh'
      '            , :SET_ARTICLE_GROUP_ID'
      '            , :ColnPrice'
      '            , :pkey'
      '            , :description'
      '            , :CurrencyHead)'
      'else'
      ' update NaklR'
      '   set PostNo = :PostNo'
      '     , SotrudNo = :SotrudNo '
      '     , AddressNo = :AddressNo'
      '     , OtdelNo = :OtdelNo'
      '     , VidNaklNo = :VidNaklNo'
      '     , Buh = :Buh'
      '     , SET_ARTICLE_GROUP_ID = :SET_ARTICLE_GROUP_ID'
      '     , ColnPrice = :ColnPrice'
      '     , CurrencyHead = :CurrencyHead'
      ' where NaklNo = :NaklNo'
      ''
      'if @cnt1 = 0'
      ' insert into L_NaklRReturn (NaklNo, TypeReturnNo)'
      '  values (:NaklNo, :TypeReturnNo)'
      'else'
      ' update L_NaklRReturn'
      '  set TypeReturnNo = :TypeReturnNo'
      ' where NaklNo = :NaklNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from NaklR nr left join'
      '      L_NaklRReturn lnr on lnr.NaklNo = nr.NaklNo')
    Left = 720
    Top = 72
  end
  object quSpec: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select TovarNo, sum(Qty) as Qty, RequestForSupplyGoods_Id as id'
      ' from RequestForSupplyGoodsSpec'
      '  where qty > 0'
      '    and RequestForSupplyGoods_Id = :id'
      'group by TovarNo, RequestForSupplyGoods_Id')
    Left = 720
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
      end>
    object quSpecTovarNo: TIntegerField
      FieldName = 'TovarNo'
    end
    object quSpecQty: TFloatField
      FieldName = 'Qty'
      ReadOnly = True
    end
    object quSpecid: TIntegerField
      FieldName = 'id'
    end
  end
  object quPostBan: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'begin'
      'declare'
      '  @PostBan int'
      ' ,@Description varchar(85)'
      ' ,@PostNo int'
      ''
      'set @PostNo = :p_PostNo'
      ' '
      ' select @PostBan =  Check1'
      '  from Post_Ban_Return where PostNo = @PostNo'
      ''
      'select @Description = Description '
      ' from Post_Ban_Return where PostNo = @PostNo'
      ''
      
        ' select ISNULL(@PostBan,0) PostBan, ISNULL(@Description,0) Descr' +
        'iption'
      'end')
    Left = 720
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_PostNo'
      end>
    object quPostBanPostBan: TIntegerField
      FieldName = 'PostBan'
      ReadOnly = True
    end
    object quPostBanDescription: TStringField
      FieldName = 'Description'
      ReadOnly = True
      Size = 85
    end
  end
end
