inherited WriteOffCostsForm: TWriteOffCostsForm
  Left = 566
  Top = 218
  Width = 920
  Height = 483
  Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1079#1072#1090#1088#1072#1090
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 416
    Width = 904
    Height = 28
    Align = alBottom
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 281
      Top = 3
      Width = 75
      Height = 23
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = bbOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbCancel: TBitBtn
      Left = 358
      Top = 3
      Width = 75
      Height = 23
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object GroupBox1: TGroupBox [1]
    Left = 0
    Top = 0
    Width = 904
    Height = 416
    Align = alClient
    Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 900
      Height = 258
      Align = alClient
      DataSource = dsWriteOffCosts
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
      OnColExit = DBGridEh1ColExit
      OnEnter = DBGridEh1Enter
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Nom'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1053#1086#1084#1077#1088
        end
        item
          EditButtons = <>
          FieldName = 'DatePlat'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1072#1090#1072
        end
        item
          EditButtons = <>
          FieldName = 'Otdel'
          Footers = <>
          Title.Caption = #1054#1090#1076#1077#1083
          Width = 92
        end
        item
          EditButtons = <>
          FieldName = 'Summa'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1091#1084#1084#1072
        end
        item
          EditButtons = <>
          FieldName = 'SummaDolg'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1086#1083#1075
        end
        item
          EditButtons = <>
          FieldName = 'SumOplat'
          Footers = <>
          Title.Caption = #1054#1087#1083#1072#1090#1072
        end
        item
          EditButtons = <>
          FieldName = 'EntityTypeName'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Spravka'
          Footers = <>
          ReadOnly = True
        end
        item
          EditButtons = <>
          FieldName = 'BuhTypeName'
          Footers = <>
          Width = 124
        end>
    end
    object Panel2: TPanel
      Left = 2
      Top = 273
      Width = 900
      Height = 141
      Align = alBottom
      TabOrder = 1
      object ScrollBox: TScrollBox
        Left = 1
        Top = 1
        Width = 898
        Height = 139
        HorzScrollBar.Margin = 6
        HorzScrollBar.Range = 331
        VertScrollBar.Margin = 6
        VertScrollBar.Range = 84
        Align = alClient
        AutoScroll = False
        BorderStyle = bsNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 6
          Width = 37
          Height = 13
          Caption = #1053#1086#1084#1077#1088':'
        end
        object Label4: TLabel
          Left = 309
          Top = 6
          Width = 29
          Height = 13
          Caption = #1044#1072#1090#1072':'
          FocusControl = EditDate
        end
        object Label5: TLabel
          Left = 8
          Top = 46
          Width = 37
          Height = 13
          Caption = #1057#1091#1084#1084#1072':'
          FocusControl = EditSumma
        end
        object Label6: TLabel
          Left = 8
          Top = 84
          Width = 43
          Height = 13
          Caption = #1057#1087#1088#1072#1074#1082#1072
          FocusControl = EditSpravka
        end
        object Label2: TLabel
          Left = 72
          Top = 8
          Width = 46
          Height = 13
          Caption = #1055#1072#1088#1090#1085#1077#1088':'
        end
        object Label3: TLabel
          Left = 232
          Top = 46
          Width = 56
          Height = 13
          Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082':'
        end
        object Label7: TLabel
          Left = 136
          Top = 46
          Width = 22
          Height = 13
          Caption = #1058#1080#1087':'
        end
        object Label8: TLabel
          Left = 448
          Top = 6
          Width = 34
          Height = 13
          Caption = #1054#1090#1076#1077#1083':'
        end
        object Label9: TLabel
          Left = 448
          Top = 44
          Width = 30
          Height = 13
          Caption = #1062#1060#1054':'
        end
        object Label10: TLabel
          Left = 447
          Top = 84
          Width = 95
          Height = 13
          Caption = #1042#1080#1076' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080':'
        end
        object Label11: TLabel
          Left = 648
          Top = 8
          Width = 68
          Height = 13
          Caption = #1058#1080#1087' '#1087#1083#1072#1090#1077#1078#1072':'
        end
        object EditDate: TDBEdit
          Left = 309
          Top = 21
          Width = 68
          Height = 21
          AutoSelect = False
          DataField = 'DatePlat'
          DataSource = dsPlatP
          MaxLength = 10
          TabOrder = 2
          OnExit = EditDateExit
        end
        object EditSumma: TDBEdit
          Left = 8
          Top = 62
          Width = 109
          Height = 21
          DataField = 'Summa'
          DataSource = dsPlatP
          ReadOnly = True
          TabOrder = 3
        end
        object EditSpravka: TDBEdit
          Left = 8
          Top = 99
          Width = 425
          Height = 21
          DataField = 'Spravka'
          DataSource = dsPlatP
          TabOrder = 6
        end
        object deNom: TDBEdit
          Left = 8
          Top = 21
          Width = 49
          Height = 21
          DataField = 'Nom'
          DataSource = dsPlatP
          TabOrder = 0
        end
        object lcPost: TDBLookupComboBox
          Left = 72
          Top = 21
          Width = 225
          Height = 21
          DataField = 'PostNo'
          DataSource = dsPlatP
          KeyField = 'PostNo'
          ListField = 'Name'
          ListSource = DSPost
          TabOrder = 1
        end
        object lcTipNakl: TDBLookupComboBox
          Left = 136
          Top = 62
          Width = 89
          Height = 21
          DataField = 'Buh'
          DataSource = dsPlatP
          KeyField = 'buh'
          ListField = 'Buh_type_name'
          ListSource = DSBuh
          TabOrder = 4
        end
        object lcSotrud: TDBLookupComboBox
          Left = 232
          Top = 62
          Width = 145
          Height = 21
          DataField = 'SotrudNo'
          DataSource = dsPlatP
          KeyField = 'SotrudNo'
          ListField = 'SotrudName'
          ListSource = dmDataModule.dsSotrud
          TabOrder = 5
        end
        object lcOtdel: TDBLookupComboBox
          Left = 448
          Top = 22
          Width = 145
          Height = 21
          DataField = 'OtdelNo'
          DataSource = dsPlatP
          KeyField = 'OtdelNo'
          ListField = 'OtdelName'
          ListSource = dsOtdel
          TabOrder = 7
        end
        object stResponse_dept_id: TStaticText
          Left = 448
          Top = 63
          Width = 4
          Height = 4
          BorderStyle = sbsSunken
          Color = clBtnHighlight
          ParentColor = False
          TabOrder = 8
        end
        object stActivity_type_id: TStaticText
          Left = 448
          Top = 102
          Width = 4
          Height = 4
          BorderStyle = sbsSunken
          Color = clBtnHighlight
          ParentColor = False
          TabOrder = 9
        end
        object lcPlatType: TDBLookupComboBox
          Left = 648
          Top = 22
          Width = 145
          Height = 21
          DataField = 'TipPlat'
          DataSource = dsPlatP
          KeyField = 'ID'
          ListField = 'Name'
          ListFieldIndex = 1
          ListSource = dsPlatType
          TabOrder = 10
        end
      end
    end
  end
  object quWriteOffCosts: TMSQuery
    SQLUpdate.Strings = (
      'begin'
      '  select 1'
      'end')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  Nom '
      '       ,DatePlat'
      
        '       ,(select OtdelName from VidOtdel where OtdelNo = pr.Otdel' +
        'No) as Otdel'
      '       ,Summa'
      '       ,SummaDolg'
      '       ,CAST(0 AS decimal(18, 2)) AS SumOplat'
      '       ,'#39#1056#1072#1089#1093#1086#1076#1099' '#1076#1077#1085#1077#1075#39' as EntityTypeName'
      
        '       ,(select Buh_Type_Name from d_buh_type where buh = pr.buh' +
        ') as BuhTypeName'
      '       ,*'
      ' from PlatR pr'
      '  where (VidRashodNo = isnull(:VidRashodNo,VidRashodNo))'
      '    and (SummaDolg <> 0)'
      '    and (PostNo = isnull(:SelectPostNo,PostNo))'
      '--    and (Buh = isnull(:Buh,Buh))'
      'order by DatePlat,Nom')
    CachedUpdates = True
    AfterInsert = quWriteOffCostsAfterInsert
    BeforePost = quWriteOffCostsBeforePost
    AfterPost = quWriteOffCostsAfterPost
    Left = 200
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VidRashodNo'
      end
      item
        DataType = ftInteger
        Name = 'SelectPostNo'
      end>
    object quWriteOffCostsNom: TIntegerField
      FieldName = 'Nom'
    end
    object quWriteOffCostsDatePlat: TDateTimeField
      FieldName = 'DatePlat'
    end
    object quWriteOffCostsOtdel: TStringField
      FieldName = 'Otdel'
      ReadOnly = True
      Size = 30
    end
    object quWriteOffCostsSumma: TFloatField
      FieldName = 'Summa'
    end
    object quWriteOffCostsSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
    object quWriteOffCostsSumOplat: TFloatField
      FieldName = 'SumOplat'
    end
    object quWriteOffCostsPlatNo: TIntegerField
      FieldName = 'PlatNo'
    end
    object quWriteOffCostsSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
    end
    object quWriteOffCostsBuh: TSmallintField
      FieldName = 'Buh'
    end
    object quWriteOffCostsEntityTypeName: TStringField
      DisplayLabel = #1042#1080#1076' '#1076#1086#1082'.'
      FieldName = 'EntityTypeName'
      ReadOnly = True
      Size = 13
    end
    object quWriteOffCostsSpravka: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077
      DisplayWidth = 30
      FieldName = 'Spravka'
      Size = 55
    end
    object quWriteOffCostsBuhTypeName: TStringField
      DisplayLabel = #1041#1091#1093'. '#1090#1080#1087
      DisplayWidth = 10
      FieldName = 'BuhTypeName'
      ReadOnly = True
    end
  end
  object dsWriteOffCosts: TMSDataSource
    DataSet = quWriteOffCosts
    Left = 200
    Top = 78
  end
  object dsPlatP: TDataSource
    DataSet = quPlatP
    Left = 230
    Top = 78
  end
  object quPlatP: TMSQuery
    SQLInsert.Strings = (
      'DECLARE @return_value   INT'
      ''
      'EXEC  @return_value = sp_AddEntity'
      '    @p_Entity_type = '#39'PLATP'#39','
      '    @p_Nom = NULL,'
      '    @p_PostNo = :PostNo,'
      '    @p_PostNoFirst = :PostNoFirst,'
      '    @p_DatePlat = :DatePlat,'
      '    @p_Summa = :Summa,'
      '    @p_Buh = :Buh,'
      '    @p_Spravka = :Spravka,'
      '    @p_TipPlat = :TipPlat,'
      '    @p_UserNo = :UserNo,'
      '    @p_SotrudNo = :SotrudNo,'
      '    @p_bank_invoice_id = NULL,'
      '    @p_activity_type_id = :activity_type_id,'
      '    @p_response_dept_id = :response_dept_id,'
      '    @p_VidRashodNo = :VidRashodNo,'
      '    @p_OtdelNo = :OtdelNo,'
      '    @p_our_firmNo = :OurFirmNo,'
      '    @p_is_econom = 0,'
      '    @p_Pkey = :Pkey OUT')
    SQLDelete.Strings = (
      'EXEC  dbo.sp_DelEntity   @Pkey = :Pkey')
    SQLUpdate.Strings = (
      'DECLARE @return_value   INT'
      ''
      'EXEC  @return_value = sp_EditEntity'
      '    @p_Entity_type = '#39'PLATP'#39','
      '    @p_Nom = NULL,'
      '    @p_PostNo = :PostNo,'
      '    @p_PostNoFirst = :PostNoFirst,'
      '    @p_DatePlat = :DatePlat,'
      '    @p_Summa = :Summa,'
      '    @p_Buh = :Buh,'
      '    @p_Spravka = :Spravka,'
      '    @p_TipPlat = 1,'
      '    @p_UserNo = :UserNo,'
      '    @p_SotrudNo = :SotrudNo,'
      '    @p_bank_invoice_id = NULL,'
      '    @p_activity_type_id = 17,'
      '    @p_response_dept_id = 17,'
      '    @p_VidRashodNo = 49,'
      '    @p_OtdelNo = 4,'
      '    @p_our_firmNo = :OurFirmNo,'
      '    @p_is_econom = 0,'
      '    @p_Pkey = :Pkey')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT PlatP.PlatNo'
      '      ,PlatP.DatePlat'
      '      ,PlatP.Nom'
      '      ,PlatP.PostNo'
      '      ,PlatP.PostNoFirst'
      '      ,PlatP.Summa'
      '      ,PlatP.Buh'
      '      ,PlatP.SotrudNo'
      '      ,PlatP.Spravka'
      '      ,PlatP.UserNo'
      '      ,SummaDolg'
      '      ,FreeSumma'
      '      ,OurFirmNo'
      '      ,OtdelNo'
      '      ,activity_type_id'
      '      ,RESPONSE_DEPT_ID'
      '      ,TipPlat'
      '      ,VidRashodNo'
      '      ,PlatP.Pkey'
      '  FROM    PlatP'
      ' WHERE PlatP.Pkey = :pPkey')
    BeforeUpdateExecute = quPlatPBeforeUpdateExecute
    AfterUpdateExecute = quPlatPAfterUpdateExecute
    AfterPost = quPlatPAfterPost
    OnNewRecord = quPlatPNewRecord
    Options.StrictUpdate = False
    Left = 230
    Top = 105
    ParamData = <
      item
        DataType = ftLargeint
        Name = 'pPkey'
        ParamType = ptInputOutput
      end>
    object quPlatPPlatNo: TIntegerField
      FieldName = 'PlatNo'
    end
    object quPlatPDatePlat: TDateTimeField
      FieldName = 'DatePlat'
    end
    object quPlatPNom: TIntegerField
      FieldName = 'Nom'
    end
    object quPlatPPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quPlatPPostNoFirst: TSmallintField
      FieldName = 'PostNoFirst'
    end
    object quPlatPSumma: TFloatField
      FieldName = 'Summa'
    end
    object quPlatPBuh: TSmallintField
      FieldName = 'Buh'
    end
    object quPlatPSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
    end
    object quPlatPSpravka: TStringField
      FieldName = 'Spravka'
      Size = 200
    end
    object quPlatPUserNo: TSmallintField
      FieldName = 'UserNo'
    end
    object quPlatPSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
    object quPlatPFreeSumma: TFloatField
      FieldName = 'FreeSumma'
    end
    object quPlatPOurFirmNo: TIntegerField
      FieldName = 'OurFirmNo'
    end
    object quPlatPPkey: TLargeintField
      FieldName = 'Pkey'
    end
    object quPlatPOtdelNo: TIntegerField
      FieldName = 'OtdelNo'
    end
    object quPlatPactivity_type_id: TSmallintField
      FieldName = 'activity_type_id'
    end
    object quPlatPRESPONSE_DEPT_ID: TIntegerField
      FieldName = 'RESPONSE_DEPT_ID'
    end
    object quPlatPTipPlat: TSmallintField
      FieldName = 'TipPlat'
    end
    object quPlatPVidRashodNo: TIntegerField
      FieldName = 'VidRashodNo'
    end
  end
  object DSBuh: TDataSource
    DataSet = QuBuh
    Left = 230
    Top = 171
  end
  object QuBuh: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from d_buh_type')
    Left = 230
    Top = 199
  end
  object DSPost: TDataSource
    DataSet = quPost
    Left = 198
    Top = 171
  end
  object quPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from Post'
      'order by Name')
    Left = 198
    Top = 199
  end
  object mdSpravka: TRxMemoryData
    FieldDefs = <>
    Left = 110
    Top = 207
    object mdSpravkaNom: TIntegerField
      FieldName = 'Nom'
    end
    object mdSpravkaSumma: TFloatField
      FieldName = 'Summa'
    end
  end
  object quMaxNom: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select max(nom) Nom from PlatP '
      'where Buh=:Buh')
    Left = 374
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Buh'
      end>
    object quMaxNomNom: TIntegerField
      FieldName = 'Nom'
    end
  end
  object spModify_Plat_Nakl_link: TMSStoredProc
    StoredProcName = 'sp_Modify_Plat_Nakl_link;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Modify_Plat_Nakl_link;1(:p_ID, :p_entit' +
        'yNo_1, :p_entityNo_2, :p_Entity_Type_1, :p_Entity_Type_2, :p_Lin' +
        'k_Summa, :p_UserNo)}')
    Left = 366
    Top = 175
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_entityNo_1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_entityNo_2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'p_Entity_Type_1'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftString
        Name = 'p_Entity_Type_2'
        ParamType = ptInput
        Size = 5
      end
      item
        DataType = ftFloat
        Name = 'p_Link_Summa'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_UserNo'
        ParamType = ptInput
      end>
  end
  object quOtdel: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * from VidOtdel order by OtdelName')
    Left = 670
    Top = 135
    object quOtdelOtdelNo: TSmallintField
      FieldName = 'OtdelNo'
    end
    object quOtdelOtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 30
    end
    object quOtdelmanager_team_id: TSmallintField
      FieldName = 'manager_team_id'
    end
    object quOtdelOtdelPostNo: TIntegerField
      FieldName = 'OtdelPostNo'
    end
    object quOtdelpkey: TLargeintField
      FieldName = 'pkey'
    end
    object quOtdelnew_otdel_no: TSmallintField
      FieldName = 'new_otdel_no'
    end
    object quOtdelarea_id: TLargeintField
      FieldName = 'area_id'
    end
    object quOtdelbrand_type_id: TLargeintField
      FieldName = 'brand_type_id'
    end
  end
  object dsOtdel: TMSDataSource
    DataSet = quOtdel
    OnDataChange = dsOtdelDataChange
    Left = 640
    Top = 136
  end
  object quPlatType: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select * from d_plat_type')
    Left = 760
    Top = 136
    object quPlatTypeID: TSmallintField
      FieldName = 'ID'
      ReadOnly = True
    end
    object quPlatTypeName: TStringField
      DisplayWidth = 30
      FieldName = 'Name'
      Size = 512
    end
  end
  object dsPlatType: TMSDataSource
    DataSet = quPlatType
    Left = 736
    Top = 136
  end
end
