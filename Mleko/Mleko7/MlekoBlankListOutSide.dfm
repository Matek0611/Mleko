inherited MlekoBlankListOutSideForm: TMlekoBlankListOutSideForm
  Left = 197
  Top = 212
  Width = 1426
  Height = 724
  Caption = #1042#1085#1077#1096#1085#1080#1077' '#1079#1072#1082#1072#1079#1099
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1410
    Height = 608
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object DBGridEhOrders: TDBGridEh
      Left = 1
      Top = 1
      Width = 1408
      Height = 606
      Align = alClient
      DataSource = dsOrders
      EditActions = [geaCopyEh]
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
      OnDblClick = DBGridEhOrdersDblClick
      OnDrawColumnCell = DBGridEhOrdersDrawColumnCell
      OnDrawDataCell = DBGridEhOrdersDrawDataCell
      OnKeyDown = DBGridEhOrdersKeyDown
      OnTitleBtnClick = DBGridEhOrdersTitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'OrderNo'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'OrderDate'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'OrderSumma'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'IdBlank'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'BlankSumma'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DescriptionFromOrders'
          Footers = <>
          Width = 123
        end
        item
          EditButtons = <>
          FieldName = 'Buh'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TypeNakl'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NameClient'
          Footers = <>
          Title.TitleButton = True
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'NoContractor'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'NameContractor'
          Footers = <>
          Title.TitleButton = True
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'Adress'
          Footers = <>
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'NoAdress'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DateDelivery'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Telephon'
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'Email'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'GroupClientName'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'RealOrderSumma'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Komplectacija'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'DescriptionFromManager'
          Footers = <>
          Width = 299
        end
        item
          EditButtons = <>
          FieldName = 'IsPay'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'State'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'NoClient'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'TimeCreate'
          Footers = <>
        end>
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 608
    Width = 1410
    Height = 77
    Align = alBottom
    TabOrder = 1
    object LbMessage: TLabel
      Left = 688
      Top = 16
      Width = 3
      Height = 13
    end
    object btExportPrice: TButton
      Left = 7
      Top = 8
      Width = 97
      Height = 25
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1094#1077#1085#1099
      TabOrder = 0
      OnClick = btExportPriceClick
    end
    object cbDBLookupFilterPrice: TDBLookupComboboxEh
      Left = 112
      Top = 12
      Width = 201
      Height = 21
      EditButtons = <>
      KeyField = 'NameGroup'
      ListField = 'NameGroup'
      ListSource = dsFilterPrice
      TabOrder = 1
      Visible = True
    end
    object BtImportOrders: TButton
      Left = 640
      Top = 8
      Width = 153
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1074#1085#1077#1096#1085#1080#1077' '#1079#1072#1082#1072#1079#1099
      TabOrder = 2
      OnClick = BtImportOrdersClick
    end
    object BtCreateOrder: TButton
      Left = 800
      Top = 8
      Width = 89
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1082#1072#1079
      TabOrder = 3
      OnClick = BtCreateOrderClick
    end
    object dtDateDelivery: TDateTimePicker
      Left = 904
      Top = 9
      Width = 97
      Height = 21
      Hint = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1076#1072#1090#1099' '#1076#1086#1089#1090#1072#1074#1082#1080
      Date = 41273.000011574070000000
      Time = 41273.000011574070000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
    object cb_SelecttedVid: TCheckBox
      Left = 320
      Top = 11
      Width = 161
      Height = 17
      Caption = #1042#1099#1075#1088#1091#1078#1072#1090#1100' '#1087#1086' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1084
      TabOrder = 5
    end
    object Button1: TButton
      Left = 488
      Top = 8
      Width = 145
      Height = 25
      Caption = #1047#1072#1076#1072#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1074#1080#1076#1086#1074
      TabOrder = 6
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 48
      Width = 297
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1074#1088#1077#1084#1077#1085#1085#1091#1102' '#1090#1072#1073#1083#1080#1094#1091'  '#1076#1083#1103' '#1085#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1079#1072#1082#1072#1079#1072
      TabOrder = 7
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 312
      Top = 48
      Width = 273
      Height = 25
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1074#1088#1077#1084#1077#1085#1085#1086#1081' '#1090#1072#1073#1083#1080#1094#1099' '#1085#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1079#1072#1082#1072#1079#1072
      TabOrder = 8
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 592
      Top = 48
      Width = 217
      Height = 25
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1080#1085#1092#1072#1088#1084#1072#1094#1080#1102' '#1087#1086' '#1079#1072#1082#1072#1079#1091
      TabOrder = 9
      OnClick = Button4Click
    end
  end
  object quFilterPrice: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct NameGroup '
      ' from work.dbo.V_PriceForVeb'
      'order by NameGroup')
    Left = 56
  end
  object dsFilterPrice: TDataSource
    DataSet = quFilterPrice
    Left = 152
  end
  object spExportPiceForVeb: TMSStoredProc
    StoredProcName = 'sp_PiceForVeb;1'
    Connection = dmDataModule.DB
    Left = 221
    Top = 40
  end
  object spImportOrderVebTmp: TMSStoredProc
    StoredProcName = 'sp_ImportOrdersVeb'
    Connection = dmDataModule.DB
    Left = 269
    Top = 40
  end
  object quOrders: TMSQuery
    SQLUpdate.Strings = (
      'update ImportOrderVebTmp ip'
      
        'set ip.DeliveryDate = convert(varchar(10),:DateDelivery) + :Time' +
        'Delivery'
      'where ip.OrderNo = :OrderNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct convert(int,ip.OrderNo) as OrderNo'
      
        '               ,case when ip.GroupClient = 5 then convert(dateti' +
        'me,(convert(datetime,ip.OrderDate)),104)'
      
        #9#9'                             else convert(datetime,ip.OrderDat' +
        'e)'
      #9'            end AS OrderDate'
      
        '               ,case when stat.Status is null then 0 -- '#1079#1072#1082#1072#1079' '#1085#1077 +
        ' '#1089#1086#1079#1076#1072#1074#1072#1083#1089#1103
      #9#9'             when stat.Status = 0 then 1 -- '#1079#1072#1082#1072#1079' '#1089#1086#1079#1076#1072#1085
      
        #9#9'             when stat.Status = -1 then 2 -- '#1079#1072#1082#1072#1079' '#1089#1086#1079#1076#1072#1085' '#1080' '#1087#1086 +
        #1084#1077#1095#1077#1085' '#1082#1072#1082' '#1091#1076#1072#1083#1077#1085#1085#1099#1081
      
        #9#9'             when stat.Status = 1 then 3 -- '#1079#1072#1082#1072#1079' '#1089#1086#1079#1076#1072#1085' '#1080' '#1076#1086#1073 +
        #1072#1074#1083#1077#1085' '#1074' '#1089#1077#1090#1082#1091
      #9#9'        end as StateBlank'
      '               ,isnull(stat.CntBlanks,0) as CntBlanks'
      #9'       ,isnull(stat.CntDelBlanks,1) as CntDelBlanks'
      '/*'
      
        '               ,case when (isnull(stat.CntDelBlanks,0) % isnull(' +
        'stat.CntBlanks,0)) = 0 then 1'
      
        #9#9#9'                                                             ' +
        '  else 0'
      #9#9'end as IsTrueRecover'
      '*/'
      '               ,isnull(stat.summa,0) as BlankSumma'
      #9#9#9'   ,isnull(stat.ID,0) as IdBlank'
      #9#9#9'   ,isnull(stat.is_del,0) as IsDelOrderBlank'
      
        '               ,convert(decimal(18,2),ip.OrderSumma) as OrderSum' +
        'ma'
      '               ,convert(varchar,ip.State) as State'
      
        '               ,case when convert(bit,ip.IsPay) = 0 then '#39#1053#1077' '#1086#1087#1083 +
        #1072#1095#1077#1085#39
      
        '                     when convert(bit,ip.IsPay) is null then '#39#1053#1077 +
        ' '#1086#1087#1083#1072#1095#1077#1085#39
      
        '                                                        else '#39#1054#1087 +
        #1083#1072#1095#1077#1085#39' '
      '                end as IsPay'
      '               ,case when convert(bit,ip.Buh) = 0 then '#39#1050#1072#1089#1089#1072#39
      '                                                  else '#39#1041#1072#1085#1082#39' '
      '                end as Buh'
      
        '               ,case when convert(bit,ip.TypeNakl) = 0 then '#39#1058#1086#1074 +
        #1072#1088#1085#1072#1103#39
      
        '                                                       else '#39#1042#1086#1079 +
        #1074#1088#1072#1090#1085#1072#1103#39
      '                end as TypeNakl '
      '               ,isnull(convert(int,ip.NoClient),0) as NoClient'
      '               ,case when ip.NameClient = '#39#39'    then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.NameClient is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      
        '                                                else ip.NameClie' +
        'nt'
      '                end as NameClient'
      
        '          ,isnull(convert(int,ip.NoContractor),0) as NoContracto' +
        'r'
      
        '               ,case when ((ip.NameContractor is null) and (ip.N' +
        'oContractor is not null) and (ip.NoContractor<>'#39#39'))'
      #9#9#9'                                        then (select name '
      #9#9#9#9#9#9#9#9#9'from Post '
      #9#9#9#9#9#9#9#9#9' where PostNo = ip.NoContractor)'
      #9#9'     when ip.NameContractor = '#39#39'    then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      
        '                     when ip.NameContractor is null then '#39#1053#1077' '#1091#1082#1072 +
        #1079#1072#1085#39
      
        '                                                    else ip.Name' +
        'Contractor'
      '                end as NameContractor'
      '               ,isnull(convert(int,ip.NoAdress),0) as NoAdress'
      
        '               ,case when ((ip.Adress is null) and (ip.NoAdress ' +
        'is not null)) '
      #9#9#9'                                then (select Address'
      #9#9#9#9#9'                               from AddressPost'
      #9#9#9#9#9#9#9#9#9#9#9'        where Id = convert(int,ip.NoAdress))'
      #9#9#9'         when ip.Adress = '#39#39'    then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.Adress is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      #9#9#9#9#9' '
      '                                            else ip.Adress'
      '                end as Adress'
      '              '
      
        '               ,case when ip.DeliveryDate is null             th' +
        'en '#39'01.01.1900 00:00:00'#39' '
      
        '                     when ip.DeliveryDate = '#39#39'                th' +
        'en '#39'01.01.1900 00:00:00'#39
      
        '                     when CHARINDEX ('#39','#39',ip.DeliveryDate) = 0 th' +
        'en case when ip.GroupClient = 5 then convert(smalldatetime,(conv' +
        'ert(varchar(10),ip.DeliveryDate,104)),104) '
      
        #9#9#9#9#9'                                                    else co' +
        'nvert(smalldatetime,SUBSTRING (ip.DeliveryDate,1,LEN (ip.Deliver' +
        'yDate)))'
      
        '                                                                ' +
        '   end'
      
        '                                                              el' +
        'se convert(smalldatetime,SUBSTRING (ip.DeliveryDate,1,(CHARINDEX' +
        ' ('#39','#39',ip.DeliveryDate)-1)))'
      '                end as DateDelivery'
      '  '
      
        '               ,case when ip.DeliveryDate is null             th' +
        'en '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#1086#39' '
      
        '                     when ip.DeliveryDate = '#39#39'                th' +
        'en '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#1086#39
      
        '                     when CHARINDEX ('#39','#39',ip.DeliveryDate) = 0 th' +
        'en '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#1086#39
      
        '                                                              el' +
        'se SUBSTRING (ip.DeliveryDate,CHARINDEX ('#39','#39',ip.DeliveryDate)+1,' +
        'LEN (ip.DeliveryDate)) '
      '                end as TimeDelivery'
      '  '
      '               ,case when ip.Telephon = '#39'""'#39'  then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.Telephon is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                                              else ip.Telephon'
      '                end as Telephon'
      '               ,case when ip.Email = '#39'""'#39'  then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.Email is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                                           else ip.Email'
      '                end as Email'
      '               ,ip.GroupClient'
      '               ,case when ip.GroupClient = 1 then '#39#1055#1086#1082#1091#1087#1072#1090#1077#1083#1100#39
      
        '                     when (ip.GroupClient = 2 or ip.GroupClient ' +
        '= 3) then '#39#1052#1077#1085#1077#1076#1078#1077#1088#39
      '                     when ip.GroupClient = 4 then '#39#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#39
      
        '                     when ip.GroupClient = 5 then '#39#1047#1072#1082#1072#1079' '#1089' Exite' +
        #39
      '                end as GroupClientName'
      
        '               ,convert(decimal(18,2),ip.RealOrderSumma) as Real' +
        'OrderSumma'
      
        '               ,convert(decimal(18,2),ip.Komplectacija) as Kompl' +
        'ectacija'
      '               ,ip.DescriptionFromOrders'
      '               ,ip.DescriptionFromManager'
      '               ,cbws.TimeCreate'
      '               ,ip.TypeReturn  '
      ' from ImportOrderVebTmp ip left join'
      
        '      CreateBlancWithSite cbws on cbws.OrderVeb = ip.OrderNo lef' +
        't join'
      '      (select distinct iov.OrderNo'
      '                      ,ebh.id'
      #9'                  ,ebh.Status '
      #9#9#9#9#9'  ,ebh.summa'
      #9#9#9#9#9'  ,case when c.IdVeb is null then 0'
      #9#9#9#9#9'        when c.IdVeb is not null then 1'
      '                       end as is_del'
      '                      ,c.CntDelBlanks'
      '                      ,c1.CntBlanks'
      '        from ImportOrderVebTmp iov left join'
      
        '             l_BlankForVeb lbfv on lbfv.IdVeb = iov.OrderNo left' +
        ' join'
      #9'         e_blank_head ebh on ebh.id = lbfv.idBlank left join'
      #9#9#9' (select IdVeb, count(idBlank) as CntDelBlanks'
      '               from l_BlankForVeb'
      '                where idBlank in (select id '
      '                                   from e_blank_head'
      '                                    where Status = -1)'
      #9#9#9'  group by IdVeb) c on c.IdVeb = lbfv.IdVeb left join'
      
        #9#9#9' (select IdVeb, count(idBlank) as CntBlanks from l_BlankForVe' +
        'b group by IdVeb) c1 on c1.IdVeb = lbfv.IdVeb ) stat on ip.Order' +
        'No = stat.OrderNo'
      
        '  where ip.OrderNo not in (select l.IdExite from l_BlankForExite' +
        ' l)'
      'order by &_OrderBy'
      ''
      ''
      ''
      ''
      ''
      '/*'
      'select distinct convert(int,ip.OrderNo) as OrderNo'
      
        '               ,case when ip.GroupClient = 5 then convert(dateti' +
        'me,(convert(datetime,ip.OrderDate)),104)'
      
        #9#9#9'                                 else convert(datetime,ip.Ord' +
        'erDate)'
      #9#9'end AS OrderDate'
      
        '               ,convert(decimal(18,2),ip.OrderSumma) as OrderSum' +
        'ma'
      '               ,convert(varchar,ip.State) as State'
      
        '               ,case when convert(bit,ip.IsPay) = 0 then '#39#1053#1077' '#1086#1087#1083 +
        #1072#1095#1077#1085#39
      
        '                     when convert(bit,ip.IsPay) is null then '#39#1053#1077 +
        ' '#1086#1087#1083#1072#1095#1077#1085#39
      
        '                                                        else '#39#1054#1087 +
        #1083#1072#1095#1077#1085#39' '
      '                end as IsPay'
      '               ,case when convert(bit,ip.Buh) = 0 then '#39#1050#1072#1089#1089#1072#39
      '                                                  else '#39#1041#1072#1085#1082#39' '
      '                end as Buh'
      
        '               ,case when convert(bit,ip.TypeNakl) = 0 then '#39#1058#1086#1074 +
        #1072#1088#1085#1072#1103#39
      
        '                                                       else '#39#1042#1086#1079 +
        #1074#1088#1072#1090#1085#1072#1103#39
      '                end as TypeNakl '
      '               ,isnull(convert(int,ip.NoClient),0) as NoClient'
      '               ,case when ip.NameClient = '#39#39'    then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.NameClient is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      
        '                                                else ip.NameClie' +
        'nt'
      '                end as NameClient'
      '     '
      ''
      ''
      ''
      
        '          ,isnull(convert(int,ip.NoContractor),0) as NoContracto' +
        'r'
      
        '               ,case when ((ip.NameContractor is null) and (ip.N' +
        'oContractor is not null) and (ip.NoContractor<>'#39#39'))'
      #9#9#9'                                        then (select name '
      #9#9#9#9#9#9#9#9#9'from Post '
      #9#9#9#9#9#9#9#9#9' where PostNo = ip.NoContractor)'
      #9#9'     when ip.NameContractor = '#39#39'    then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      
        '                     when ip.NameContractor is null then '#39#1053#1077' '#1091#1082#1072 +
        #1079#1072#1085#39
      
        '                                                    else ip.Name' +
        'Contractor'
      '                end as NameContractor'
      '               ,isnull(convert(int,ip.NoAdress),0) as NoAdress'
      
        '               ,case when ((ip.Adress is null) and (ip.NoAdress ' +
        'is not null)) '
      #9#9#9'                                then (select Address'
      #9#9#9#9#9'                               from AddressPost'
      #9#9#9#9#9#9#9#9#9#9#9'        where Id = convert(int,ip.NoAdress))'
      #9#9#9'         when ip.Adress = '#39#39'    then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.Adress is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      #9#9#9#9#9' '
      '                                            else ip.Adress'
      '                end as Adress'
      '              '
      
        '               ,case when ip.DeliveryDate is null             th' +
        'en '#39'01.01.1900 00:00:00'#39' '
      
        '                     when ip.DeliveryDate = '#39#39'                th' +
        'en '#39'01.01.1900 00:00:00'#39
      
        '                     when CHARINDEX ('#39','#39',ip.DeliveryDate) = 0 th' +
        'en case when ip.GroupClient = 5 then convert(smalldatetime,(conv' +
        'ert(varchar(10),ip.DeliveryDate,104)),104) '
      
        #9#9#9#9#9'                                                    else co' +
        'nvert(smalldatetime,SUBSTRING (ip.DeliveryDate,1,LEN (ip.Deliver' +
        'yDate)))'
      
        '                                                                ' +
        '   end'
      
        '                                                              el' +
        'se convert(smalldatetime,SUBSTRING (ip.DeliveryDate,1,(CHARINDEX' +
        ' ('#39','#39',ip.DeliveryDate)-1)))'
      '                end as DateDelivery'
      '  '
      
        '               ,case when ip.DeliveryDate is null             th' +
        'en '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#1086#39' '
      
        '                     when ip.DeliveryDate = '#39#39'                th' +
        'en '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#1086#39
      
        '                     when CHARINDEX ('#39','#39',ip.DeliveryDate) = 0 th' +
        'en '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#1086#39
      
        '                                                              el' +
        'se SUBSTRING (ip.DeliveryDate,CHARINDEX ('#39','#39',ip.DeliveryDate)+1,' +
        'LEN (ip.DeliveryDate)) '
      '                end as TimeDelivery'
      '  '
      '               ,case when ip.Telephon = '#39'""'#39'  then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.Telephon is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                                              else ip.Telephon'
      '                end as Telephon'
      '               ,case when ip.Email = '#39'""'#39'  then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.Email is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                                           else ip.Email'
      '                end as Email'
      '               ,ip.GroupClient'
      '               ,case when ip.GroupClient = 1 then '#39#1055#1086#1082#1091#1087#1072#1090#1077#1083#1100#39
      
        '                     when (ip.GroupClient = 2 or ip.GroupClient ' +
        '= 3) then '#39#1052#1077#1085#1077#1076#1078#1077#1088#39
      '                     when ip.GroupClient = 4 then '#39#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#39
      
        '                     when ip.GroupClient = 5 then '#39#1047#1072#1082#1072#1079' '#1089' Exite' +
        #39
      '                end as GroupClientName'
      
        '               ,convert(decimal(18,2),ip.RealOrderSumma) as Real' +
        'OrderSumma'
      
        '               ,convert(decimal(18,2),ip.Komplectacija) as Kompl' +
        'ectacija'
      '               ,ip.DescriptionFromOrders'
      '               ,ip.DescriptionFromManager'
      
        '--               ,convert(decimal(18,2),ip.KomplectacijaOne) as ' +
        'KomplectacijaOne'
      ' from ImportOrderVebTmp ip'
      '  where ip.OrderNo not in (select l.IdVeb from l_BlankForVeb l)'
      
        '    and ip.OrderNo not in (select l.IdExite from l_BlankForExite' +
        ' l)'
      '*/'
      ''
      '/*'
      'select distinct convert(int,ip.OrderNo) as OrderNo'
      '               ,convert(datetime,ip.OrderDate) as OrderDate'
      
        '               ,convert(decimal(18,2),ip.OrderSumma) as OrderSum' +
        'ma'
      '               ,convert(varchar,ip.State) as State'
      
        '               ,case when convert(bit,ip.IsPay) = 0 then '#39#1053#1077' '#1086#1087#1083 +
        #1072#1095#1077#1085#39
      
        '                                                    else '#39#1054#1087#1083#1072#1095#1077 +
        #1085#39' '
      '                end as IsPay'
      '               ,case when convert(bit,ip.Buh) = 0 then '#39#1050#1072#1089#1089#1072#39
      '                                                  else '#39#1041#1072#1085#1082#39' '
      '                end as Buh'
      
        '               ,case when convert(bit,ip.TypeNakl) = 0 then '#39#1058#1086#1074 +
        #1072#1088#1085#1072#1103#39
      
        '                                                       else '#39#1042#1086#1079 +
        #1074#1088#1072#1090#1085#1072#1103#39
      '                end as TypeNakl '
      '               ,isnull(convert(int,ip.NoClient),0) as NoClient'
      '               ,case when ip.NameClient = '#39#39'    then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.NameClient is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      
        '                                                else ip.NameClie' +
        'nt'
      '                end as NameClient'
      
        '               ,isnull(convert(int,ip.NoContractor),0) as NoCont' +
        'ractor'
      
        '               ,case when ip.NameContractor = '#39#39'    then '#39#1053#1077' '#1091#1082#1072 +
        #1079#1072#1085#39
      
        '                     when ip.NameContractor is null then '#39#1053#1077' '#1091#1082#1072 +
        #1079#1072#1085#39
      
        '                                                    else ip.Name' +
        'Contractor'
      '                end as NameContractor'
      '               ,isnull(convert(int,ip.NoAdress),0) as NoAdress'
      '               ,case when ip.Adress = '#39#39'    then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.Adress is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                                            else ip.Adress'
      '                end as Adress'
      '                '
      
        '               ,case when ip.DeliveryDate is null             th' +
        'en '#39'01.01.1900 00:00:00'#39' '
      
        '                     when ip.DeliveryDate = '#39#39'                th' +
        'en '#39'01.01.1900 00:00:00'#39
      
        '                     when CHARINDEX ('#39','#39',ip.DeliveryDate) = 0 th' +
        'en convert(smalldatetime,SUBSTRING (ip.DeliveryDate,1,LEN (ip.De' +
        'liveryDate)))'
      
        '                                                              el' +
        'se convert(smalldatetime,SUBSTRING (ip.DeliveryDate,1,(CHARINDEX' +
        ' ('#39','#39',ip.DeliveryDate)-1)))'
      '                end as DateDelivery'
      '                '
      
        '               ,case when ip.DeliveryDate is null             th' +
        'en '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#1086#39' '
      
        '                     when ip.DeliveryDate = '#39#39'                th' +
        'en '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#1086#39
      
        '                     when CHARINDEX ('#39','#39',ip.DeliveryDate) = 0 th' +
        'en '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#1086#39
      
        '                                                              el' +
        'se SUBSTRING (ip.DeliveryDate,CHARINDEX ('#39','#39',ip.DeliveryDate)+1,' +
        'LEN (ip.DeliveryDate)) '
      '                end as TimeDelivery'
      '                '
      '               ,case when ip.Telephon = '#39'""'#39'  then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.Telephon is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                                              else ip.Telephon'
      '                end as Telephon'
      '               ,case when ip.Email = '#39'""'#39'  then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                     when ip.Email is null then '#39#1053#1077' '#1091#1082#1072#1079#1072#1085#39
      '                                           else ip.Email'
      '                end as Email'
      '               ,case when ip.GroupClient = 1 then '#39#1055#1086#1082#1091#1087#1072#1090#1077#1083#1100#39
      
        '                     when (ip.GroupClient = 2 or ip.GroupClient ' +
        '= 3) then '#39#1052#1077#1085#1077#1076#1078#1077#1088#39
      '                     when ip.GroupClient = 4 then '#39#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#39
      
        '                     when ip.GroupClient = 5 then '#39#1047#1072#1082#1072#1079' '#1089' Exite' +
        #39
      '                end as GroupClient'
      ' from ImportOrderVebTmp ip'
      '  where ip.OrderNo not in (select l.IdVeb from l_BlankForVeb l)'
      '*/')
    Left = 88
    MacroData = <
      item
        Name = '_OrderBy'
        Value = 'OrderNo'
      end>
    object quOrdersOrderNo: TIntegerField
      FieldName = 'OrderNo'
      ReadOnly = True
    end
    object quOrdersOrderDate: TDateTimeField
      FieldName = 'OrderDate'
      ReadOnly = True
    end
    object quOrdersStateBlank: TIntegerField
      FieldName = 'StateBlank'
      ReadOnly = True
    end
    object quOrdersCntBlanks: TIntegerField
      FieldName = 'CntBlanks'
      ReadOnly = True
    end
    object quOrdersCntDelBlanks: TIntegerField
      FieldName = 'CntDelBlanks'
      ReadOnly = True
    end
    object quOrdersBlankSumma: TFloatField
      FieldName = 'BlankSumma'
      ReadOnly = True
    end
    object quOrdersIdBlank: TIntegerField
      FieldName = 'IdBlank'
      ReadOnly = True
    end
    object quOrdersIsDelOrderBlank: TIntegerField
      FieldName = 'IsDelOrderBlank'
      ReadOnly = True
    end
    object quOrdersOrderSumma: TFloatField
      FieldName = 'OrderSumma'
      ReadOnly = True
    end
    object quOrdersState: TStringField
      FieldName = 'State'
      ReadOnly = True
      Size = 30
    end
    object quOrdersIsPay: TStringField
      FieldName = 'IsPay'
      ReadOnly = True
      Size = 10
    end
    object quOrdersBuh: TStringField
      FieldName = 'Buh'
      ReadOnly = True
      Size = 5
    end
    object quOrdersTypeNakl: TStringField
      FieldName = 'TypeNakl'
      ReadOnly = True
      Size = 10
    end
    object quOrdersNoClient: TIntegerField
      FieldName = 'NoClient'
      ReadOnly = True
    end
    object quOrdersNameClient: TStringField
      FieldName = 'NameClient'
      ReadOnly = True
      Size = 256
    end
    object quOrdersNoContractor: TIntegerField
      FieldName = 'NoContractor'
      ReadOnly = True
    end
    object quOrdersNameContractor: TStringField
      FieldName = 'NameContractor'
      ReadOnly = True
      Size = 256
    end
    object quOrdersNoAdress: TIntegerField
      FieldName = 'NoAdress'
      ReadOnly = True
    end
    object quOrdersAdress: TStringField
      FieldName = 'Adress'
      ReadOnly = True
      Size = 256
    end
    object quOrdersDateDelivery: TDateTimeField
      FieldName = 'DateDelivery'
      ReadOnly = True
    end
    object quOrdersTimeDelivery: TStringField
      FieldName = 'TimeDelivery'
      ReadOnly = True
      Size = 100
    end
    object quOrdersTelephon: TStringField
      FieldName = 'Telephon'
      ReadOnly = True
      Size = 100
    end
    object quOrdersEmail: TStringField
      FieldName = 'Email'
      ReadOnly = True
      Size = 100
    end
    object quOrdersGroupClient: TStringField
      FieldName = 'GroupClient'
      Size = 1
    end
    object quOrdersGroupClientName: TStringField
      FieldName = 'GroupClientName'
      ReadOnly = True
      Size = 13
    end
    object quOrdersRealOrderSumma: TFloatField
      FieldName = 'RealOrderSumma'
      ReadOnly = True
    end
    object quOrdersKomplectacija: TFloatField
      FieldName = 'Komplectacija'
      ReadOnly = True
    end
    object quOrdersDescriptionFromOrders: TStringField
      FieldName = 'DescriptionFromOrders'
      Size = 512
    end
    object quOrdersDescriptionFromManager: TStringField
      FieldName = 'DescriptionFromManager'
      Size = 512
    end
    object quOrdersTimeCreate: TFloatField
      FieldName = 'TimeCreate'
    end
    object quOrdersTypeReturn: TStringField
      FieldName = 'TypeReturn'
    end
  end
  object dsOrders: TDataSource
    DataSet = quOrders
    Left = 120
  end
  object quSpecBlank: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select convert(int,Article) as Article '
      '     ,convert(int,KolTov) as KolTov '
      '     ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov '
      ' from ImportOrderVebTmp ivt '
      '  where convert(bigint,ivt.OrderNo) = convert(bigint,:OrderNo) '
      '    and convert(smallint,Article) not in (select TovarNo '
      '                                                  from e_blanks '
      
        '                                                   where Documen' +
        't_id in (select idBlank '
      
        '                                                                ' +
        '          from l_BlankForVeb '
      
        '                                                                ' +
        '           where IdVeb = :OrderNom)) '
      '    and convert(bigint,Article) in (select lag.ARTICLE_ID '
      
        '                                     from L_SET_ARTICLE_GROUP ls' +
        'ag left join '
      
        '                                          L_ARTICLE_GROUP lag on' +
        ' lag.ARTICLE_GROUP_ID = lsag.ARTICLE_GROUP_ID '
      
        '                                      where lsag.SET_ARTICLE_GRO' +
        'UP_ID = convert(bigint,:SET_ARTICLE_GROUP_ID))')
    Left = 136
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OrderNo'
      end
      item
        DataType = ftUnknown
        Name = 'OrderNom'
      end
      item
        DataType = ftUnknown
        Name = 'SET_ARTICLE_GROUP_ID'
      end>
  end
  object quColnPriceForOrder: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select distinct lpsagp.SET_ARTICLE_GROUP_ID as SET_ARTICLE_GROUP' +
        '_ID_price'
      '      , isnull(lpsagp.COLNPRICE,0) as COLNPRICE'
      ' from L_POST_SET_ARTGROUP_PRICE lpsagp left join'
      
        '      L_SET_ARTICLE_GROUP lsag on lpsagp.SET_ARTICLE_GROUP_ID = ' +
        'lsag.SET_ARTICLE_GROUP_ID left join'
      
        #9'  L_ARTICLE_GROUP lag on lsag.ARTICLE_GROUP_ID = lag.ARTICLE_GR' +
        'OUP_ID left join'
      #9'  ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID'
      '  where POSTNO = :PostNo'
      '    and lsag.ARTICLE_GROUP_ID in (select ARTICLE_GROUP_ID '
      '                                   from L_SET_ARTICLE_GROUP '
      
        '                                    where SET_ARTICLE_GROUP_ID i' +
        'n (select SET_ARTICLE_GROUP_ID from L_POST_SET_ARTGROUP_DELAY wh' +
        'ere POSTNO = :PostNom and buh = :Buh))'
      
        '    and lsag.ARTICLE_GROUP_ID = ISNULL(:ARTICLE_GROUP_ID,lag.ART' +
        'ICLE_GROUP_ID)'
      '    and convert(smallint,iov.Article) not in (select TovarNo '
      '                                               from e_blanks '
      
        '                                                where Document_i' +
        'd in (select idBlank '
      
        '                                                                ' +
        '       from l_BlankForVeb '
      
        '                                                                ' +
        '        where IdVeb = convert(bigint,:OrderNom)'
      
        '                                                                ' +
        '          and idBlank not in (select id'
      
        '                                                  '#9#9#9'           ' +
        '            from e_blank_head'
      
        #9#9#9#9#9#9'                  '#9#9#9'                                where' +
        ' Status = -1)))'
      ''
      '/*'
      'select distinct /*lag.ARTICLE_GROUP_ID'
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
      '      ImportOrderVebTmp iov on iov.Article = lag.ARTICLE_ID '
      '  where convert(int,iov.OrderNo) = convert(int,:OrderNo)'
      '    and lsag.SET_ARTICLE_GROUP_ID is not null'
      '    and convert(smallint,iov.Article) not in (select TovarNo '
      '                                               from e_blanks '
      
        '                                                where Document_i' +
        'd in (select idBlank '
      
        '                                                                ' +
        '       from l_BlankForVeb '
      
        '                                                                ' +
        '        where IdVeb = convert(bigint,:OrderNom)'
      
        '                                                                ' +
        '          and idBlank not in (select id'
      
        '                                                  '#9#9#9'           ' +
        '            from e_blank_head'
      #9#9#9#9#9#9'                  '#9#9#9'        where Status = -1)))  '
      
        '    and LEN(cast(isnull(lpsagd.SET_ARTICLE_GROUP_ID,0) as varcha' +
        'r(50))+ cast(isnull(lpsagp.SET_ARTICLE_GROUP_ID,0) as varchar(50' +
        '))) > 2'
      
        '    and lag.ARTICLE_GROUP_ID = ISNULL(:ARTICLE_GROUP_ID,lag.ARTI' +
        'CLE_GROUP_ID)'
      '    and lpsagp.SET_ARTICLE_GROUP_ID is not null'
      
        '--    and lpsagd.SET_ARTICLE_GROUP_ID = isnull(:SET_ARTICLE_GROU' +
        'P_ID_DELAY,lpsagd.SET_ARTICLE_GROUP_ID)'
      'order by lpsagp.COLNPRICE'
      '*/')
    Left = 320
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftInteger
        Name = 'PostNom'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftLargeint
        Name = 'ARTICLE_GROUP_ID'
      end
      item
        DataType = ftInteger
        Name = 'OrderNom'
      end
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
        DataType = ftInteger
        Name = 'OrderNo'
      end
      item
        DataType = ftInteger
        Name = 'OrderNom'
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
    end
  end
  object SpCheckBlank: TMSStoredProc
    StoredProcName = 'pr_Check_Blank;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL pr_Check_Blank;1(:p_Postno, :p_Reason_id, ' +
        ':DateNakl, :OtdelNo, :SET_ARTICLE_GROUP_ID, :err_level, :err_mes' +
        'sage)}')
    Left = 301
    Top = 47
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
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
    Left = 352
    Top = 44
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = -6
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
        Value = 3222584
      end
      item
        DataType = ftFloat
        Name = 'summa'
        ParamType = ptInputOutput
      end>
  end
  object quPost1: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'DECLARE  @DateNakl SMALLDATETIME'
      'DECLARE  @IS_ALL SMALLINT'
      'DECLARE  @POSTNO DTFkey'
      'DECLARE  @SotrudNo SMALLINT'
      'DECLARE  @SET_ARTICLE_GROUP_ID bigint'
      ''
      'SET @DateNakl = convert(smalldatetime,:DateNakl)'
      'SET @IS_ALL= :IS_ALL'
      'SET @POSTNO= :POSTNO'
      'SET @SotrudNo = :SotrudNo'
      'SET @SET_ARTICLE_GROUP_ID = :SET_ARTICLE_GROUP_ID'
      '--SET @DateNakl = GETDATE()'
      ''
      'SELECT   u.postno'
      '         ,u.name'
      '         ,u.namelong'
      '         ,u.addressno'
      '         ,u.address'
      '         ,u.sotrudno'
      '         ,u.sotrudname'
      '         ,u.otdelname'
      '         ,u.otdelno'
      '         ,u.contract_num'
      '         ,u.realdaydelay'
      '         ,u.postdaydelay'
      '         ,CASE when u.realdaydelay > u.postdaydelay THEN '#39'Y'#39
      
        '               when ((u.datenakl is not null) and (select isnull' +
        '(max(1),0) from l_firm_prop where postNo=u.PostNo and prop_id=22' +
        ')=1) '
      
        '                                              and (u.is_enable_s' +
        'top_period = 0) THEN '#39'Y'#39
      '                                                    else '#39'N'#39' '
      '          end  as is_stop'
      '         ,SET_ARTICLE_GROUP_NAME'
      '         ,SET_ARTICLE_GROUP_ID'
      '         ,BUH'
      '         ,DAY_DELAY'
      '         ,DAY_DELAY_EXT'
      '         ,Buh_type_name         '
      '         ,AddressID'
      'FROM     (SELECT p.postno'
      '                 ,p.name'
      '                 ,p.namelong'
      '                 ,ap.addressno'
      '                 ,ap.address'
      '                 ,s.sotrudno'
      '                 ,s.sotrudname'
      '                 ,o.otdelname'
      '                 ,o.otdelno'
      '                 ,(SELECT Max(num)'
      '                    FROM   d_firm_contract c'
      '                     WHERE  type_id = 1'
      
        '                       AND ourfirmno = (select PostNo from d_our' +
        '_firm)'
      '                       AND postno = p.postno'
      
        '                       AND (@DateNakl BETWEEN c.create_date AND ' +
        'c.expire_date)) AS contract_num'
      
        '                 ,Datediff(dd,isnull(pdel.DateNakl,@DateNakl),@D' +
        'ateNakl) AS realdaydelay'
      
        '                 ,Isnull(pdel.DAY_DELAY,0)+isnull(pdel.DAY_DELAY' +
        '_EXT,0) AS postdaydelay'
      '                 ,pdel.SET_ARTICLE_GROUP_NAME'
      '                 ,pdel.SET_ARTICLE_GROUP_ID'
      '                 ,pdel.BUH'
      '                 ,pdel.DAY_DELAY'
      '                 ,pdel.DAY_DELAY_EXT'
      '                 ,pdel.datenakl'
      
        '                 ,(select Buh_type_name from d_buh_type where bu' +
        'h=pdel.BUH) as Buh_type_name'
      '                 ,ap.id as AddressID'
      '                 ,pdel.is_stop'
      '                 ,pdel.is_start'
      '                 ,pdel.is_enable_stop_period'
      '          FROM   post p'
      
        '                 INNER JOIN dbo.fu_first_free_nakl(@DateNakl,@Po' +
        'stNo,-1) pdel on pdel.PostNo=p.PostNo'
      '                 INNER JOIN addresspost ap'
      '                   ON p.postno = ap.postno'
      '                 LEFT OUTER JOIN d_sotrud_address a'
      '                   ON a.addresspost_id = ap.id'
      '                 LEFT OUTER JOIN sotrud s'
      '                   ON a.sotrudno = s.sotrudno'
      '                 LEFT OUTER JOIN vidotdel o'
      '                   ON s.sotrudotdel = o.otdelno'
      '          WHERE  (p.PostNo=@POSTNO or @POSTNO=0)'
      '          AND (s.SotrudNo = @SotrudNo or @SotrudNo = 0)'
      
        '          AND (pdel.SET_ARTICLE_GROUP_ID = @SET_ARTICLE_GROUP_ID' +
        ' or @SET_ARTICLE_GROUP_ID = 0)'
      '          AND o.otdelno IS NOT NULL'
      '          AND ap.address IS NOT NULL'
      '          AND p.trash = 0) u'
      'WHERE    (u.contract_num IS NOT NULL OR @IS_ALL = 1)'
      'ORDER BY &_order'
      'OPTION (FAST 100)')
    Left = 480
    Top = 64
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DateNakl'
      end
      item
        DataType = ftInteger
        Name = 'IS_ALL'
      end
      item
        DataType = ftInteger
        Name = 'POSTNO'
      end
      item
        DataType = ftInteger
        Name = 'SotrudNo'
      end
      item
        DataType = ftLargeint
        Name = 'SET_ARTICLE_GROUP_ID'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = 'Name,address,otdelname,sotrudname,Buh_type_name'
      end>
  end
  object quTempTableForCreateBlank: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'declare'
      '    @date datetime'
      ''
      'set @date = getdate()'
      ''
      'truncate table TempTableForCreateBlank'
      ''
      'insert into TempTableForCreateBlank'
      
        'select f.*, l.SET_ARTICLE_GROUP_ID, l.COLNPRICE, dpt.ColName, s.' +
        'SotrudNo, s.SotrudName, s.SotrudOtdel, ap.ID, ap.AddressNo, ap.A' +
        'ddress, dfc.id, dfc.num, getdate() '
      ' from fu_first_free_naklForCite (@date,-1,-1,-1) f left join'
      
        '      L_POST_SET_ARTGROUP_PRICE l on l.POSTNO = f.postno left jo' +
        'in'
      #9'  AddressPost ap on ap.PostNo = f.postno left join'
      
        '      d_sotrud_address dsa on dsa.AddressPost_id = ap.ID left jo' +
        'in'
      #9'  Sotrud s on s.SotrudNo = dsa.SotrudNo left join'
      #9'  d_firm_contract dfc on dfc.PostNo = f.postno left join'
      #9'  D_Price_type dpt on dpt.ColNPrice = l.COLNPRICE left join'
      #9'  Post p on p.PostNo = f.postno and p.trash = 0'
      '  where dsa.Active = 1'
      '    and ap.Active = 1'
      '    and p.Trash = 0'
      '    and l.COLNPRICE is not null'
      '    and @date between dfc.Create_Date and dfc.Expire_Date')
    Left = 1088
    Top = 152
  end
end
