inherited MlekoBlankListWithKPKForm: TMlekoBlankListWithKPKForm
  Left = 364
  Top = 255
  Width = 1253
  Height = 557
  Caption = 'MlekoBlankListWithKPKForm'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1237
    Height = 472
    Align = alClient
    TabOrder = 0
    object DBGridEhOrders: TDBGridEh
      Left = 1
      Top = 1
      Width = 1235
      Height = 470
      Align = alClient
      DataSource = dse_blank_head_online
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
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 472
    Width = 1237
    Height = 46
    Align = alBottom
    TabOrder = 1
    object Label2: TLabel
      Left = 245
      Top = 17
      Width = 20
      Height = 13
      Caption = #1055#1086' :'
    end
    object Label3: TLabel
      Left = 9
      Top = 15
      Width = 100
      Height = 13
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1079#1072#1082#1072#1079#1099' '#1089' :'
    end
    object Button1: TButton
      Left = 624
      Top = 8
      Width = 137
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1082#1072#1079
      TabOrder = 0
      OnClick = Button1Click
    end
    object cbxDate: TCheckBox
      Left = 416
      Top = 16
      Width = 121
      Height = 17
      Hint = #1055#1088#1080' '#1089#1085#1103#1090#1086#1081' '#1075#1072#1083#1086#1095#1082#1077' '#1073#1083#1086#1082#1080#1088#1091#1077#1090#1089#1103' '#1074#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      Checked = True
      ParentShowHint = False
      ShowHint = True
      State = cbChecked
      TabOrder = 1
      OnClick = cbxDateClick
    end
    object dtDateEnd: TDBDateTimeEditEh
      Left = 275
      Top = 13
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 2
      Visible = True
      OnChange = dtDateEndChange
    end
    object dtDateBeg: TDBDateTimeEditEh
      Left = 113
      Top = 13
      Width = 121
      Height = 21
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
      OnChange = dtDateBegChange
    end
  end
  inherited ActionList: TActionList
    Left = 0
  end
  object dse_blank_head_online: TMSDataSource
    DataSet = que_blank_head_online
    Left = 32
  end
  object que_blank_head_online: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select Distinct  ebo.id'
      '                ,ebo.DateNakl'
      #9#9#9#9',ebo.summa as Summa'
      #9#9#9#9',stat.IdBlank'
      #9#9#9#9',stat.SummaBlank'
      #9#9#9#9',ebo.Buhname'
      #9#9#9#9',ebo.VidNakname'
      
        #9#9#9#9',(select SotrudName from Sotrud where SotrudNo = ebo.SotrudN' +
        'o) as SotrudName'
      #9#9#9#9',ebo.PostNo'
      
        #9#9#9#9',(select Name from Post where PostNo = ebo.PostNo) as NameCl' +
        'ientOnline'
      #9#9#9#9',stat.Name as PostName'
      #9#9'        ,ebo.Address'
      '                ,ebo.AddressNo'
      #9#9#9#9',(select vo.OtdelName'
      '                   from Sotrud s, VidOtdel vo'
      '                    where s.SotrudOtdel = vo.OtdelNo'
      
        '                      and s.SotrudNo = ebo.SotrudNo) as Otdelnam' +
        'e'
      '            '#9',ebo.weight'
      #9#9'        ,ebo.Status'
      
        #9#9'        ,case when stat.StatusBlank is null then 0 -- '#1079#1072#1082#1072#1079' '#1085#1077 +
        ' '#1089#1086#1079#1076#1072#1074#1072#1083#1089#1103
      #9#9'              when stat.StatusBlank = 0 then 1 -- '#1079#1072#1082#1072#1079' '#1089#1086#1079#1076#1072#1085
      
        #9#9'              when stat.StatusBlank = -1 then 2 -- '#1079#1072#1082#1072#1079' '#1089#1086#1079#1076#1072 +
        #1085' '#1080' '#1087#1086#1084#1077#1095#1077#1085' '#1082#1072#1082' '#1091#1076#1072#1083#1077#1085#1085#1099#1081
      
        #9#9'              when stat.StatusBlank = 1 then 3 -- '#1079#1072#1082#1072#1079' '#1089#1086#1079#1076#1072#1085 +
        ' '#1080' '#1076#1086#1073#1072#1074#1083#1077#1085' '#1074' '#1089#1077#1090#1082#1091
      #9#9'         end as StateBlank'
      #9#9'        ,stat.CntBlanks'
      #9#9'        ,stat.CntDelBlanks'
      #9#9'        ,stat.is_del as IsDelOrderBlank'
      '                ,ebo.VidNaklNo'
      #9#9'        ,ebo.Buh'
      #9#9#9#9',ebo.SotrudNo'
      #9#9'        ,ebo.Sotrudname'
      #9#9'        ,ebo.OtdelNo'
      #9#9'        ,ebo.ColnPrice'
      #9#9#9#9',ebo.KolDayPlan'
      #9#9#9#9',ebo.SubNum'
      #9#9#9#9',ebo.CreateDate'
      #9#9#9#9',ebo.DateCorrelation'
      #9#9#9#9',ebo.EditUserNo'
      #9#9#9#9',ebo.ReasonId'
      #9#9#9#9',ebo.Reasonname'
      #9#9#9#9',ebo.VidtovGroupId'
      #9#9#9#9',ebo.VidtovGroupName'
      #9#9#9#9',ebo.description'
      #9#9#9#9',ebo.contract_id'
      #9#9#9#9',ebo.OurFirmNo'
      #9#9#9#9',ebo.EmployeeNo'
      #9#9#9#9',ebo.HostName'
      #9#9#9#9',ebo.'#1096#1080#1088#1086#1090#1072
      #9#9#9#9',ebo.'#1076#1086#1083#1075#1086#1090#1072
      #9#9#9#9',ebo.TypeReturnNo'
      #9#9#9#9',ebo.TypeReturnName'
      ' from e_blank_head_online ebo left join'
      '      (select  lbfbo.IdBlankOnline'
      '             , ebh.id as IdBlank '
      #9'     , ebh.Status as StatusBlank'
      #9'     , ebh.summa as SummaBlank'
      '             , case when c.IdBlankOnline is null then 0'
      '                    when c.IdBlankOnline is not null then 1'
      '               end as is_del'
      '             , c.CntDelBlanks'
      '             , c1.CntBlanks'
      '             , p.Name'
      '        from e_blank_head_online ebho left join'
      '             Post p on p.PostNo = ebho.PostNo left join'
      
        #9'     L_BlankForBlankOnline lbfbo on lbfbo.IdBlankOnline = ebho.' +
        'ID left join'
      #9'     e_blank_head ebh on ebh.id = lbfbo.IdBlank left join'
      #9'    (select IdBlankOnline, count(IdBlank) as CntDelBlanks'
      #9'      from L_BlankForBlankOnline'
      #9'       where idBlank in (select id '
      '                                  from e_blank_head'
      '                                   where Status = -1)'
      
        '             group by IdBlankOnline) c on c.IdBlankOnline = lbfb' +
        'o.IdBlankOnline left join'
      '            (select IdBlankOnline, count(IdBlank) as CntBlanks'
      #9'      from L_BlankForBlankOnline'
      
        #9'     group by IdBlankOnline) c1 on c1.IdBlankOnline = lbfbo.IdB' +
        'lankOnline) stat on stat.IdBlankOnline = ebo.Id'
      
        '  where Isnull (:date1,cast(ebo.DateNakl as date)) <= cast(ebo.D' +
        'ateNakl as date)'
      
        '    and Isnull (:date2,cast(ebo.DateNakl as date)) >= cast(ebo.D' +
        'ateNakl as date)')
    Left = 64
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'date2'
        ParamType = ptInput
      end>
    object que_blank_head_onlineid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object que_blank_head_onlineDateNakl: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DateNakl'
    end
    object que_blank_head_onlineSumma: TFloatField
      FieldName = 'Summa'
    end
    object que_blank_head_onlineIdBlank: TIntegerField
      FieldName = 'IdBlank'
    end
    object que_blank_head_onlineSummaBlank: TFloatField
      FieldName = 'SummaBlank'
    end
    object que_blank_head_onlinedescription: TStringField
      DisplayWidth = 25
      FieldName = 'description'
      Size = 1024
    end
    object que_blank_head_onlineBuhname: TStringField
      DisplayWidth = 8
      FieldName = 'Buhname'
      Size = 50
    end
    object que_blank_head_onlineVidNakname: TStringField
      DisplayWidth = 25
      FieldName = 'VidNakname'
      Size = 50
    end
    object que_blank_head_onlineSotrudName: TStringField
      FieldName = 'SotrudName'
      ReadOnly = True
      Size = 30
    end
    object que_blank_head_onlinePostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object que_blank_head_onlineNameClientOnline: TStringField
      FieldName = 'NameClientOnline'
      ReadOnly = True
      Size = 30
    end
    object que_blank_head_onlinePostName: TStringField
      FieldName = 'PostName'
      Size = 30
    end
    object que_blank_head_onlineAddress: TStringField
      DisplayWidth = 30
      FieldName = 'Address'
      Size = 256
    end
    object que_blank_head_onlineAddressNo: TSmallintField
      DisplayWidth = 5
      FieldName = 'AddressNo'
    end
    object que_blank_head_onlineOtdelname: TStringField
      FieldName = 'Otdelname'
      ReadOnly = True
      Size = 30
    end
    object que_blank_head_onlineweight: TFloatField
      FieldName = 'weight'
    end
    object que_blank_head_onlineStatus: TSmallintField
      FieldName = 'Status'
    end
    object que_blank_head_onlineStateBlank: TIntegerField
      FieldName = 'StateBlank'
      ReadOnly = True
    end
    object que_blank_head_onlineCntBlanks: TIntegerField
      FieldName = 'CntBlanks'
      ReadOnly = True
    end
    object que_blank_head_onlineCntDelBlanks: TIntegerField
      FieldName = 'CntDelBlanks'
      ReadOnly = True
    end
    object que_blank_head_onlineIsDelOrderBlank: TIntegerField
      FieldName = 'IsDelOrderBlank'
      ReadOnly = True
    end
    object que_blank_head_onlineVidNaklNo: TSmallintField
      FieldName = 'VidNaklNo'
    end
    object que_blank_head_onlineBuh: TSmallintField
      FieldName = 'Buh'
    end
    object que_blank_head_onlineSotrudNo: TSmallintField
      FieldName = 'SotrudNo'
    end
    object que_blank_head_onlineSotrudname_1: TStringField
      DisplayWidth = 25
      FieldName = 'Sotrudname_1'
      Size = 50
    end
    object que_blank_head_onlineOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
    end
    object que_blank_head_onlineColnPrice: TSmallintField
      FieldName = 'ColnPrice'
    end
    object que_blank_head_onlineKolDayPlan: TSmallintField
      FieldName = 'KolDayPlan'
    end
    object que_blank_head_onlineSubNum: TIntegerField
      FieldName = 'SubNum'
    end
    object que_blank_head_onlineCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object que_blank_head_onlineDateCorrelation: TDateTimeField
      DisplayWidth = 15
      FieldName = 'DateCorrelation'
    end
    object que_blank_head_onlineEditUserNo: TSmallintField
      FieldName = 'EditUserNo'
    end
    object que_blank_head_onlineReasonId: TSmallintField
      FieldName = 'ReasonId'
    end
    object que_blank_head_onlineReasonname: TStringField
      DisplayWidth = 20
      FieldName = 'Reasonname'
      Size = 50
    end
    object que_blank_head_onlineVidtovGroupId: TLargeintField
      FieldName = 'VidtovGroupId'
    end
    object que_blank_head_onlineVidtovGroupName: TStringField
      DisplayWidth = 25
      FieldName = 'VidtovGroupName'
      Size = 50
    end
    object que_blank_head_onlinecontract_id: TIntegerField
      FieldName = 'contract_id'
    end
    object que_blank_head_onlineOurFirmNo: TIntegerField
      FieldName = 'OurFirmNo'
    end
    object que_blank_head_onlineEmployeeNo: TSmallintField
      FieldName = 'EmployeeNo'
    end
    object que_blank_head_onlineHostName: TStringField
      FieldName = 'HostName'
      Size = 50
    end
    object que_blank_head_onlineDSDesigner: TWideStringField
      DisplayWidth = 30
      FieldName = #1096#1080#1088#1086#1090#1072
      Size = 150
    end
    object que_blank_head_onlineDSDesigner2: TWideStringField
      DisplayWidth = 30
      FieldName = #1076#1086#1083#1075#1086#1090#1072
      Size = 150
    end
    object que_blank_head_onlineTypeReturnNo: TIntegerField
      FieldName = 'TypeReturnNo'
    end
    object que_blank_head_onlineTypeReturnName: TStringField
      DisplayWidth = 25
      FieldName = 'TypeReturnName'
      Size = 50
    end
  end
  object spEditBlankPosition: TMSStoredProc
    StoredProcName = 'sp_EditBlankPosition;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditBlankPosition;1(:document_id, :tova' +
        'rNo, :UserNo, :KolBeg, :KolOrd, :Boss_Price, :id, :summa)}')
    Left = 96
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
