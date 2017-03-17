inherited CreateBlankWithExelForm: TCreateBlankWithExelForm
  Left = 986
  Top = 249
  Width = 414
  Height = 306
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1079#1072#1082#1072#1079#1072' '#1080#1079' Exel '#1092#1072#1081#1083#1072' '#1085#1086#1074#1086#1077
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 398
    Height = 226
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 97
      Width = 137
      Height = 13
      Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1082#1072#1079#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object leSelectFirm: TLabeledEdit
      Left = 8
      Top = 32
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
      Tag = 1
      Left = 10
      Top = 72
      Width = 143
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
      Tag = 3
      Left = 11
      Top = 158
      Width = 142
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
      TabOrder = 3
      OnChange = leVidNaklChange
      OnDblClick = leVidNaklDblClick
      OnEnter = leVidNaklEnter
    end
    object lTypeReturn: TLabeledEdit
      Tag = 4
      Left = 10
      Top = 195
      Width = 143
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
      TabOrder = 4
      Visible = False
      OnChange = lTypeReturnChange
      OnDblClick = lTypeReturnDblClick
      OnEnter = lTypeReturnEnter
    end
    object cbIsVisebleStringOrder: TCheckBox
      Tag = 5
      Left = 168
      Top = 197
      Width = 225
      Height = 17
      Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1086' '#1089#1086#1079#1076#1072#1085#1080#1080' '#1079#1072#1082#1072#1079#1072
      TabOrder = 5
    end
    object dtDocDate: TDateTimePicker
      Tag = 2
      Left = 10
      Top = 115
      Width = 143
      Height = 21
      Date = 2.000000000000000000
      Time = 2.000000000000000000
      DragMode = dmAutomatic
      TabOrder = 2
      OnEnter = dtDocDateEnter
      OnExit = dtDocDateExit
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 226
    Width = 398
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bLoadAndCreateOrders: TButton
      Left = 136
      Top = 8
      Width = 161
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080' '#1089#1086#1079#1076#1072#1090#1100' '#1079#1072#1082#1072#1079
      TabOrder = 0
      OnClick = bLoadAndCreateOrdersClick
    end
  end
  object od_InputOrderWithExcel: TOpenDialog
    Left = 56
  end
  object quInsInOrdersFromExcel: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'insert into OrdersFromExcel(TovarNoPost,TovarNamePost,OrderDate,' +
        'KolTov,AddressPost,TovarNoPostText,TovarDateOfManufacture)'
      
        ' values (/*:TovarNoPost*/1,:TovarNamePost,:OrderDate,:KolTov,:Ad' +
        'dressPost,:TovarNoPostText,:TovarDateOfManufacture)')
    Left = 96
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
      end
      item
        DataType = ftUnknown
        Name = 'TovarDateOfManufacture'
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
        ' rtrim(ltrim(ofe.AddressPost))'
      '  where PostNo = :PostNo')
    Left = 368
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
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
    Left = 368
    Top = 40
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
    Left = 368
    Top = 72
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
      
        '  where ((ofe1.OrderDate = convert(smalldatetime,:OrderDate)) an' +
        'd (ofe1.AddressNo = :AddressNo))'
      '    and lsag.SET_ARTICLE_GROUP_ID is not null'
      '    and convert(smallint,ofe1.TovarNo) not in (select TovarNo '
      '                                               from e_blanks '
      
        '                                                where Document_i' +
        'd in (select idBlank '
      
        '                                                                ' +
        '        from l_BlankForExcel '
      
        '                                                                ' +
        '         where ((OrderDate = convert(smalldatetime,:OrderDate1))' +
        'and(AddressNo = :AddressNo1)and(PostNo = :PostNo1))))'
      
        '    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varcha' +
        'r(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50' +
        '))) > 2'
      
        '    and lag.ARTICLE_GROUP_ID = ISNULL(:ARTICLE_GROUP_ID,lag.ARTI' +
        'CLE_GROUP_ID)'
      
        '--    and lpsagd.SET_ARTICLE_GROUP_ID = isnull(:SET_ARTICLE_GROU' +
        'P_ID_DELAY,lpsagd.SET_ARTICLE_GROUP_ID)'
      'order by lpsagp.COLNPRICE')
    Left = 368
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'PostNom'
      end
      item
        DataType = ftDateTime
        Name = 'OrderDate'
      end
      item
        DataType = ftInteger
        Name = 'AddressNo'
      end
      item
        DataType = ftDateTime
        Name = 'OrderDate1'
      end
      item
        DataType = ftInteger
        Name = 'AddressNo1'
      end
      item
        DataType = ftInteger
        Name = 'PostNo1'
      end
      item
        DataType = ftLargeint
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
    Left = 368
    Top = 136
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
    object quSpecBlankTovarNo: TIntegerField
      FieldName = 'TovarNo'
    end
    object quSpecBlankTovarNoPost: TLargeintField
      FieldName = 'TovarNoPost'
    end
  end
  object SpCheckBlank: TMSStoredProc
    StoredProcName = 'pr_Check_Blank;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL pr_Check_Blank;1(:p_Postno, :p_Reason_id, ' +
        ':DateNakl, :OtdelNo, :SET_ARTICLE_GROUP_ID, :err_level, :err_mes' +
        'sage)}')
    Left = 133
    Top = 65535
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
  object spEditBlankPosition: TMSStoredProc
    StoredProcName = 'sp_EditBlankPosition;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditBlankPosition;1(:document_id, :tova' +
        'rNo, :UserNo, :KolBeg, :KolOrd, :Boss_Price, :Residue, :Need, :C' +
        'urrency, :Rate, :CrossPrice, :PaymentPrice, :BossPriceFirst, :id' +
        ', :summa)}')
    Left = 173
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
end
