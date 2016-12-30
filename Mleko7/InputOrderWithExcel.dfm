inherited InputOrderWithExcelForm: TInputOrderWithExcelForm
  Left = 1156
  Top = 613
  Width = 405
  Height = 304
  Caption = #1042#1090#1103#1078#1082#1072' '#1079#1072#1082#1072#1079#1086#1074' '#1080#1079' Excel'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 227
    Width = 389
    Height = 38
    Align = alBottom
    TabOrder = 0
    object bLoadAndCreateOrders: TButton
      Left = 8
      Top = 8
      Width = 161
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080' '#1089#1086#1079#1076#1072#1090#1100' '#1079#1072#1082#1072#1079#1099
      TabOrder = 0
      OnClick = bLoadAndCreateOrdersClick
    end
    object bTemplate: TButton
      Left = 208
      Top = 8
      Width = 121
      Height = 25
      Caption = #1064#1072#1073#1083#1086#1085' '#1092#1072#1081#1083#1072
      TabOrder = 1
      OnClick = bTemplateClick
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 389
    Height = 227
    Align = alClient
    TabOrder = 1
    object lDescriptionForm: TLabel
      Left = 8
      Top = 0
      Width = 375
      Height = 52
      Caption = 
        #1044#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1074#1099#1073#1080#1088#1080#1090#1077' '#1087#1086#1083#1077' '#1080' '#1076#1074#1072' '#1088#1072#1079#1072' '#1082#1083#1080#1082#1085#1080#1090#1077' '#1084#1099#1096#1082#1086#1081' '#13#10#1080#1083#1080' '#1085#1072 +
        #1078#1084#1080#1090#1077' Enter. '#1055#1086#1089#1083#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1074#1089#1077#1093' '#1087#1086#1083#1077#1081' '#1085#1072#1078#1084#1080#1090#1077#13#10#1082#1085#1086#1087#1082#1091' "'#1047#1072#1075#1088#1091#1079 +
        #1080#1090#1100' '#1080' '#1089#1086#1079#1076#1072#1090#1100' '#1079#1072#1082#1072#1079'". '#1055#1086#1089#1083#1077' '#1095#1077#1075#1086' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086#13#10#1074#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083' '#1080#1079' '#1082#1086#1090 +
        #1086#1088#1086#1075#1086' '#1073#1091#1076#1077#1090' '#1079#1072#1075#1088#1091#1078#1072#1090#1100#1089#1103' '#1079#1072#1082#1072#1079#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object leSelectFirm: TLabeledEdit
      Left = 8
      Top = 80
      Width = 305
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = #1060#1080#1088#1084#1072':'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 0
      OnChange = leSelectFirmChange
      OnDblClick = leSelectFirmDblClick
      OnEnter = leSelectFirmEnter
    end
    object leBuh: TLabeledEdit
      Left = 10
      Top = 120
      Width = 121
      Height = 21
      EditLabel.Width = 113
      EditLabel.Height = 13
      EditLabel.Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1080#1081' '#1090#1080#1087
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 1
      OnChange = leBuhChange
      OnDblClick = leBuhDblClick
      OnEnter = leBuhEnter
    end
    object leVidNakl: TLabeledEdit
      Left = 11
      Top = 156
      Width = 121
      Height = 21
      EditLabel.Width = 90
      EditLabel.Height = 13
      EditLabel.Caption = #1042#1080#1076' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 2
      OnChange = leVidNaklChange
      OnDblClick = leVidNaklDblClick
      OnEnter = leVidNaklEnter
    end
    object lTypeReturn: TLabeledEdit
      Left = 10
      Top = 193
      Width = 121
      Height = 21
      EditLabel.Width = 82
      EditLabel.Height = 13
      EditLabel.Caption = #1058#1080#1087' '#1074#1086#1079#1074#1088#1072#1090#1072
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      TabOrder = 3
      Visible = False
      OnChange = lTypeReturnChange
      OnDblClick = lTypeReturnDblClick
      OnEnter = lTypeReturnEnter
    end
    object cbIsVisebleStringOrder: TCheckBox
      Left = 144
      Top = 196
      Width = 233
      Height = 17
      Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1089#1086#1079#1076#1072#1085#1080#1080' '#1079#1072#1082#1072#1079#1072
      TabOrder = 4
    end
  end
  object od_InputOrderWithExcel: TOpenDialog
    Left = 56
  end
  object dsInsInOrdersFromExcel: TMSDataSource
    DataSet = quInsInOrdersFromExcel
    Left = 104
    Top = 8
  end
  object quInsInOrdersFromExcel: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'insert into OrdersFromExcel(TovarNoPost,TovarNamePost,OrderDate,' +
        'KolTov,AddressPost,TovarNoPostText)'
      
        ' values (/*:TovarNoPost*/1,:TovarNamePost,:OrderDate,:KolTov,:Ad' +
        'dressPost,:TovarNoPostText)')
    Left = 144
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TovarNamePost'
      end
      item
        DataType = ftUnknown
        Name = 'OrderDate'
      end
      item
        DataType = ftUnknown
        Name = 'KolTov'
      end
      item
        DataType = ftUnknown
        Name = 'AddressPost'
      end
      item
        DataType = ftUnknown
        Name = 'TovarNoPostText'
      end>
  end
  object quOrdersCNT: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct rtrim(ltrim(ofe.AddressPost)) as AddressPost'
      '               ,ofe.OrderDate'
      #9'       ,ac.AddressNo'
      ' from OrdersFromExcel ofe left join'
      
        '      AddressCorrespondence ac on rtrim(ltrim(ac.AddressPost)) =' +
        ' rtrim(ltrim(ofe.AddressPost))')
    Left = 360
    Top = 80
    object quOrdersCNTAddressPost: TStringField
      FieldName = 'AddressPost'
      ReadOnly = True
      Size = 1024
    end
    object quOrdersCNTOrderDate: TDateTimeField
      FieldName = 'OrderDate'
    end
    object quOrdersCNTAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
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
      
        #9'     TovarPost tp on (convert(varchar(20),tp.TovarNoPost) = con' +
        'vert(varchar(20),ofe.TovarNoPostText)'
      
        #9#9#9'                  or convert(varchar(20),tp.TovarNoPostText) ' +
        '= convert(varchar(20),ofe.TovarNoPostText)'
      
        #9#9#9#9#9#9#9'  or convert(varchar(20),tp.TovarNoPostSecondText) = conv' +
        'ert(varchar(20),ofe.TovarNoPostText)'
      
        #9#9#9#9#9#9#9'  or convert(varchar(20),tp.TovarNoPostSecond) = convert(' +
        'varchar(20),ofe.TovarNoPostText)) and tp.PostNo = ac.PostNo) ofe' +
        '1 on ofe1.TovarNo = lag.ARTICLE_ID'
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
    Left = 360
    Top = 112
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
  object quColnPriceForOrder: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  distinct /*lag.ARTICLE_GROUP_ID'
      '               ,dag.NAME'
      '               ,lag.ARTICLE_ID'
      
        '               ,lsag.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP_I' +
        'D'
      '               ,dsag.NAME'
      '               ,lpsagd.POSTNO'
      
        '               ,lpsagd.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP' +
        '_ID_delay'
      '               ,lpsagd.DAY_DELAY'
      '               ,lpsagd.DAY_DELAY_EXT'
      '               ,lpsagp.POSTNO'
      
        '               , */ lpsagp.SET_ARTICLE_GROUP_ID as SET_ARTICLE_G' +
        'ROUP_ID_price'
      '               ,isnull(lpsagp.COLNPRICE,0) as COLNPRICE'
      ' from L_ARTICLE_GROUP lag left join'
      
        '      D_ARTICLE_GROUP dag on dag.ID = lag.ARTICLE_GROUP_ID left ' +
        'join '
      
        '      L_SET_ARTICLE_GROUP lsag on lag.ARTICLE_GROUP_ID = lsag.AR' +
        'TICLE_GROUP_ID left join'
      
        '      D_SET_ARTICLE_GROUP dsag on dsag.ID = lsag.SET_ARTICLE_GRO' +
        'UP_ID left join'
      
        '      L_POST_SET_ARTGROUP_DELAY lpsagd on lsag.SET_ARTICLE_GROUP' +
        '_ID = lpsagd.SET_ARTICLE_GROUP_ID and lpsagd.POSTNO = :PostNo an' +
        'd lpsagd.BUH = :Buh left join '
      
        '      L_POST_SET_ARTGROUP_PRICE lpsagp on lsag.SET_ARTICLE_GROUP' +
        '_ID = lpsagp.SET_ARTICLE_GROUP_ID and lpsagp.POSTNO = :PostNom l' +
        'eft join'
      
        '      (select tp.TovarNo, tp.TovarNoPost, ofe.OrderDate, tp.Post' +
        'No, AddressNo'
      '        from OrdersFromExcel ofe left join'
      
        '             AddressCorrespondence ac on rtrim(ltrim(ac.AddressP' +
        'ost)) = rtrim(ltrim(ofe.AddressPost)) left join'
      
        #9'         TovarPost tp on (convert(varchar(20),tp.TovarNoPost) =' +
        ' convert(varchar(20),ofe.TovarNoPostText) '
      
        #9#9#9'                         or convert(varchar(20),tp.TovarNoPos' +
        'tText) = convert(varchar(20),ofe.TovarNoPostText) '
      
        '                 '#9#9#9#9#9'   or convert(varchar(20),tp.TovarNoPostSe' +
        'condText) = convert(varchar(20),ofe.TovarNoPostText) '
      
        #9#9#9#9#9#9#9'                 or convert(varchar(20),tp.TovarNoPostSec' +
        'ond) = convert(varchar(20),ofe.TovarNoPostText)) and tp.PostNo =' +
        ' ac.PostNo) ofe1 on ofe1.TovarNo = lag.ARTICLE_ID '
      
        '  where ((ofe1.OrderDate = :OrderDate) and (ofe1.AddressNo = :Ad' +
        'dressNo))'
      '    and lsag.SET_ARTICLE_GROUP_ID is not null'
      '    and convert(smallint,ofe1.TovarNo) not in (select TovarNo '
      '                                               from e_blanks '
      
        '                                                where Document_i' +
        'd in (select idBlank '
      
        '                                                                ' +
        '        from l_BlankForExcel '
      
        '                                                                ' +
        '         where ((OrderDate = :OrderDate1)and(AddressNo = :Addres' +
        'sNo1)and(PostNo = :PostNo1))))'
      
        '    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varcha' +
        'r(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50' +
        '))) > 2'
      
        '    and lag.ARTICLE_GROUP_ID = ISNULL(:ARTICLE_GROUP_ID,lag.ARTI' +
        'CLE_GROUP_ID)'
      
        '--    and lpsagd.SET_ARTICLE_GROUP_ID = isnull(:SET_ARTICLE_GROU' +
        'P_ID_DELAY,lpsagd.SET_ARTICLE_GROUP_ID)'
      'order by lpsagp.COLNPRICE')
    Left = 360
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end
      item
        DataType = ftUnknown
        Name = 'Buh'
      end
      item
        DataType = ftUnknown
        Name = 'PostNom'
      end
      item
        DataType = ftUnknown
        Name = 'OrderDate'
      end
      item
        DataType = ftUnknown
        Name = 'AddressNo'
      end
      item
        DataType = ftUnknown
        Name = 'OrderDate1'
      end
      item
        DataType = ftUnknown
        Name = 'AddressNo1'
      end
      item
        DataType = ftUnknown
        Name = 'PostNo1'
      end
      item
        DataType = ftUnknown
        Name = 'ARTICLE_GROUP_ID'
      end>
    object quColnPriceForOrderSET_ARTICLE_GROUP_ID_price: TLargeintField
      FieldName = 'SET_ARTICLE_GROUP_ID_price'
    end
    object quColnPriceForOrderCOLNPRICE: TSmallintField
      FieldName = 'COLNPRICE'
      ReadOnly = True
    end
  end
  object quSpecBlank: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select tp.TovarNo, tp.TovarNoPost, OrderDate, tp.PostNo, Address' +
        'No, sum(KolTov) as KolTov'
      ' from OrdersFromExcel ofe left join'
      
        '      AddressCorrespondence ac on rtrim(ltrim(ac.AddressPost)) =' +
        ' rtrim(ltrim(ofe.AddressPost)) left join'
      
        '       TovarPost tp on (convert(varchar(20),tp.TovarNoPost) = co' +
        'nvert(varchar(20),ofe.TovarNoPostText) '
      
        #9#9#9'                         or convert(varchar(20),tp.TovarNoPos' +
        'tText) = convert(varchar(20),ofe.TovarNoPostText) '
      
        '                 '#9#9#9#9#9'   or convert(varchar(20),tp.TovarNoPostSe' +
        'condText) = convert(varchar(20),ofe.TovarNoPostText) '
      
        #9#9#9#9#9#9#9'                 or convert(varchar(20),tp.TovarNoPostSec' +
        'ond) = convert(varchar(20),ofe.TovarNoPostText)) and tp.PostNo =' +
        ' ac.PostNo'
      '  where tp.PostNo = :PostNo'
      '    and AddressNo = :AddressNo'
      '    and OrderDate = :OrderDate'
      'group by  tp.TovarNo'
      '        , tp.TovarNoPost'
      '        , OrderDate'
      '        , tp.PostNo'
      '        , AddressNo')
    Left = 360
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftInteger
        Name = 'AddressNo'
      end
      item
        DataType = ftDateTime
        Name = 'OrderDate'
      end>
    object quSpecBlankTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quSpecBlankTovarNoPost: TIntegerField
      FieldName = 'TovarNoPost'
    end
    object quSpecBlankOrderDate: TDateTimeField
      FieldName = 'OrderDate'
    end
    object quSpecBlankPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quSpecBlankAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object quSpecBlankKolTov: TIntegerField
      FieldName = 'KolTov'
    end
  end
  object spEditBlankPosition: TMSStoredProc
    StoredProcName = 'sp_EditBlankPosition;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditBlankPosition;1(:document_id, :tova' +
        'rNo, :UserNo, :KolBeg, :KolOrd, :Boss_Price, :Residue, :Need, :C' +
        'urrency, :Rate, :CrossPrice, :PaymentPrice, :BossPriceFirst, :id' +
        ', :summa)}')
    Left = 357
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'document_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'tovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftSmallint
        Name = 'UserNo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'KolBeg'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'KolOrd'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Boss_Price'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Residue'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Need'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Currency'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftFloat
        Name = 'Rate'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'CrossPrice'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PaymentPrice'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'BossPriceFirst'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInputOutput
      end
      item
        DataType = ftFloat
        Name = 'summa'
        ParamType = ptInputOutput
      end>
  end
  object SpCheckBlank: TMSStoredProc
    StoredProcName = 'pr_Check_Blank;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL pr_Check_Blank;1(:p_Postno, :p_Reason_id, ' +
        ':DateNakl, :OtdelNo, :SET_ARTICLE_GROUP_ID, :err_level, :err_mes' +
        'sage)}')
    Left = 357
    Top = 31
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftLargeint
        Name = 'p_Postno'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'p_Reason_id'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DateNakl'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'OtdelNo'
        ParamType = ptInput
      end
      item
        DataType = ftLargeint
        Name = 'SET_ARTICLE_GROUP_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'err_level'
        ParamType = ptInputOutput
      end
      item
        DataType = ftString
        Name = 'err_message'
        ParamType = ptInputOutput
        Size = 1024
      end>
  end
  object quInsInAddressCorrespondence: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '    @cnt int'
      '   ,@PostNo int'
      '   ,@AddressNo int'
      '   ,@AddressPost varchar(1024)'
      ''
      'set @PostNo = :PostNo'
      'set @AddressNo = :AddressNo'
      'set @AddressPost = :AddressPost'
      ''
      'select @cnt = count(*) '
      ' from AddressCorrespondence'
      '  where PostNo = @PostNo'
      '    and AddressNo = @AddressNo'
      ''
      'if @cnt = 0'
      
        ' insert into AddressCorrespondence (PostNo, AddressNo, AddressPo' +
        'st)'
      '  values (@PostNo, @AddressNo, @AddressPost)'
      ''
      'if @cnt > 0'
      ' update AddressCorrespondence'
      '  set AddressPost = @AddressPost'
      ' where PostNo = @PostNo'
      '    and AddressNo = @AddressNo')
    Left = 360
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftInteger
        Name = 'AddressNo'
      end
      item
        DataType = ftString
        Name = 'AddressPost'
      end>
  end
end
