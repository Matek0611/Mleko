inherited TempTableForCreateBlankForm: TTempTableForCreateBlankForm
  Left = 488
  Top = 189
  Width = 1084
  Height = 506
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1068
    Height = 467
    Align = alClient
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1066
      Height = 424
      Align = alClient
      DataSource = dsTempTableForCreateBlank
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FrozenCols = 1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 3
      OnKeyDown = DBGridEh1KeyDown
      OnKeyPress = DBGridEh1KeyPress
    end
    object Panel2: TPanel
      Left = 1
      Top = 425
      Width = 1066
      Height = 41
      Align = alBottom
      TabOrder = 1
      object bbCancel: TBitBtn
        Left = 518
        Top = 8
        Width = 75
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 0
        Kind = bkCancel
      end
      object bbOk: TBitBtn
        Left = 430
        Top = 8
        Width = 75
        Height = 25
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 1
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
    end
  end
  object quTempTableForCreateBlank: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct'
      '       (select name from post where Postno = t.postno) as name,'
      
        '       (select name from d_set_article_group where id = t.SET_AR' +
        'TICLE_GROUP_ID ) as GroupPrice,'
      
        '       (select OtdelName from VidOtdel where t.OtdelNo = OtdelNo' +
        ') as OtdelName,'
      '       * '
      ' from TempTableForCreateBlank t'
      '  where t.postno = isnull(:Postno,postno) '
      '    and t.buh = isnull(:Buh,t.buh)'
      
        '    and t.AddressPost_ID = isnull(:AddressPost_ID, t.AddressPost' +
        '_ID)'
      '    and t.SotrudNo = isnull(:SotrudNo,t.SotrudNo)'
      'order by name')
    Left = 112
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Postno'
      end
      item
        DataType = ftInteger
        Name = 'Buh'
      end
      item
        DataType = ftInteger
        Name = 'AddressPost_ID'
      end
      item
        DataType = ftInteger
        Name = 'SotrudNo'
      end>
    object quTempTableForCreateBlankname: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      FieldName = 'name'
      ReadOnly = True
      Size = 30
    end
    object quTempTableForCreateBlankpostno: TLargeintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      FieldName = 'postno'
    end
    object quTempTableForCreateBlankSet_Name: TStringField
      DisplayLabel = #1053#1072#1073#1086#1088' '#1086#1090#1089#1088#1086#1095#1082#1080
      DisplayWidth = 30
      FieldName = 'Set_Name'
      Size = 512
    end
    object quTempTableForCreateBlankSotrudName: TStringField
      DisplayLabel = #1048#1084#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      FieldName = 'SotrudName'
      Size = 30
    end
    object quTempTableForCreateBlankBuh_Type_Name: TStringField
      DisplayLabel = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1089#1082#1080#1081' '#1090#1080#1087
      DisplayWidth = 10
      FieldName = 'Buh_Type_Name'
    end
    object quTempTableForCreateBlankAddress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089
      DisplayWidth = 30
      FieldName = 'Address'
      Size = 256
    end
    object quTempTableForCreateBlankColnprice: TIntegerField
      DisplayLabel = #1058#1080#1087' '#1094#1077#1085#1099
      FieldName = 'Colnprice'
    end
    object quTempTableForCreateBlankGroupPrice: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' '#1094#1077#1085#1099
      DisplayWidth = 25
      FieldName = 'GroupPrice'
      ReadOnly = True
      Size = 512
    end
    object quTempTableForCreateBlankIs_All_Group: TIntegerField
      DisplayLabel = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1079#1072#1082#1072#1079#1072
      FieldName = 'is_all_group'
    end
    object quTempTableForCreateBlankDay_Delay: TIntegerField
      DisplayLabel = #1044#1085#1077#1081' '#1086#1090#1089#1088#1086#1095#1082#1080
      FieldName = 'Day_Delay'
    end
    object quTempTableForCreateBlankDay_Delay_Main: TIntegerField
      DisplayLabel = #1054#1089#1085#1086#1074#1085#1072#1103' '#1086#1090#1089#1088#1086#1095#1082#1072
      FieldName = 'Day_Delay_Main'
    end
    object quTempTableForCreateBlankBuh: TIntegerField
      FieldName = 'Buh'
    end
    object quTempTableForCreateBlankColName: TStringField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'ColName'
      Size = 64
    end
    object quTempTableForCreateBlankDay_Delay_Ext: TIntegerField
      DisplayLabel = #1044#1086#1087'.'#1086#1090#1089#1088#1086#1095#1082#1072
      FieldName = 'Day_Delay_Ext'
    end
    object quTempTableForCreateBlankSet_Article_Group_id: TLargeintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1085#1072#1073#1086#1088#1072' '#1086#1090#1089#1088#1086#1095#1082#1080
      FieldName = 'Set_Article_Group_id'
    end
    object quTempTableForCreateBlankLastEnabledDey: TDateTimeField
      DisplayLabel = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1086#1090#1075#1088#1091#1079#1082#1072
      FieldName = 'LastEnabledDey'
    end
    object quTempTableForCreateBlankFifrsDateDolg: TDateTimeField
      DisplayLabel = #1053#1072#1095#1072#1083#1086' '#1076#1086#1083#1075#1072
      FieldName = 'FifrsDateDolg'
    end
    object quTempTableForCreateBlankcurdatenakl: TDateTimeField
      DisplayLabel = #1056#1072#1073#1086#1095#1072#1103' '#1076#1072#1090#1072
      FieldName = 'curdatenakl'
    end
    object quTempTableForCreateBlankis_Prosr: TIntegerField
      DisplayLabel = #1055#1088#1086#1089#1088#1086#1095#1082#1072
      FieldName = 'is_Prosr'
    end
    object quTempTableForCreateBlankIs_Enable_Stop_Period: TIntegerField
      DisplayLabel = #1054#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1082#1086#1085#1090#1088#1086#1083#1103' '#1087#1077#1088#1080#1086#1076#1072' '#1087#1088#1086#1089#1088#1086#1095#1082#1080' '
      FieldName = 'Is_Enable_Stop_Period'
    end
    object quTempTableForCreateBlankIs_Enable_Stop_Pay_Ban: TIntegerField
      DisplayLabel = #1054#1090#1082#1083#1102#1095#1077#1085' '#1083#1080' '#1082#1086#1085#1090#1088#1086#1083#1100' '#1087#1086' '#1083#1080#1084#1080#1090#1072#1084' '
      FieldName = 'Is_Enable_Stop_Pay_Ban'
    end
    object quTempTableForCreateBlankIs_Stop: TIntegerField
      DisplayLabel = #1047#1072#1087#1088#1077#1090' '#1086#1090#1075#1088#1091#1079#1082#1080' '
      FieldName = 'Is_Stop'
    end
    object quTempTableForCreateBlankIs_Stop_Check: TIntegerField
      DisplayLabel = #1050#1086#1085#1090#1088#1086#1083#1100' '#1086#1090#1089#1088#1086#1095#1077#1082' '#1076#1086#1083#1075#1072' '
      FieldName = 'Is_Stop_Check'
    end
    object quTempTableForCreateBlankPayBan: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1083#1080#1084#1080#1090#1072' '
      FieldName = 'PayBan'
    end
    object quTempTableForCreateBlankDay_Prosr: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081' '#1087#1088#1086#1089#1088#1086#1095#1082#1080' '
      FieldName = 'Day_Prosr'
    end
    object quTempTableForCreateBlankDay_Prosr_Nabor: TIntegerField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1085#1077#1081' '#1087#1088#1086#1089#1088#1086#1095#1082#1080' '#1087#1083#1072#1090#1077#1078#1072' '#1087#1086' '#1085#1072#1073#1086#1088#1091
      FieldName = 'Day_Prosr_Nabor'
    end
    object quTempTableForCreateBlankIs_Stop_Return_Blank: TBooleanField
      DisplayLabel = #1047#1072#1087#1088#1077#1090' '#1089#1086#1079#1076#1072#1085#1080#1077' '#1074#1086#1079#1074#1088#1072#1090#1072' '
      FieldName = 'Is_Stop_Return_Blank'
    end
    object quTempTableForCreateBlankDescription_Stop_Return_Blank: TStringField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1088#1080#1095#1080#1085#1099' '#1079#1072#1087#1088#1077#1090#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
      DisplayWidth = 30
      FieldName = 'Description_Stop_Return_Blank'
      Size = 85
    end
    object quTempTableForCreateBlankLastDayStopControlDelay: TDateTimeField
      DisplayLabel = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1076#1077#1085#1100' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1103' '#1087#1088#1086#1089#1088#1086#1095#1082#1080
      FieldName = 'LastDayStopControlDelay'
    end
    object quTempTableForCreateBlankLastDayStopControlPayBan: TDateTimeField
      DisplayLabel = #1055#1086#1089#1083#1077#1076#1085#1080#1081' '#1076#1077#1085#1100' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1103' '#1083#1080#1084#1080#1090#1086#1074
      FieldName = 'LastDayStopControlPayBan'
    end
    object quTempTableForCreateBlankSET_ARTICLE_GROUP_IDforColnprice: TLargeintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1075#1091#1087#1087#1099' '#1094#1077#1085#1099
      FieldName = 'SET_ARTICLE_GROUP_IDforColnprice'
    end
    object quTempTableForCreateBlankSotrudNo: TSmallintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      FieldName = 'SotrudNo'
    end
    object quTempTableForCreateBlankAddressPost_ID: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1072#1076#1088#1077#1089#1072
      FieldName = 'AddressPost_ID'
    end
    object quTempTableForCreateBlankAddressNo: TSmallintField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1072#1076#1088#1077#1089#1072
      FieldName = 'AddressNo'
    end
    object quTempTableForCreateBlankD_Firm_Contract_id: TIntegerField
      DisplayLabel = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1082#1086#1085#1090#1088#1072#1082#1090#1072
      FieldName = 'D_Firm_Contract_id'
    end
    object quTempTableForCreateBlankD_Firm_Contract_num: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1086#1085#1090#1088#1072#1082#1090#1072
      FieldName = 'D_Firm_Contract_num'
      Size = 24
    end
    object quTempTableForCreateBlankCreateDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1090#1072#1073#1083#1080#1094#1099
      FieldName = 'CreateDate'
    end
    object quTempTableForCreateBlankOtdelNo: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1086#1090#1076#1077#1083#1072
      FieldName = 'OtdelNo'
    end
    object quTempTableForCreateBlankOtdelName: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1076#1077#1083#1072
      FieldName = 'OtdelName'
      ReadOnly = True
      Size = 30
    end
  end
  object dsTempTableForCreateBlank: TMSDataSource
    DataSet = quTempTableForCreateBlank
    Left = 144
    Top = 24
  end
end
