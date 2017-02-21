inherited DocPlatHeadForm: TDocPlatHeadForm
  Left = 321
  Top = 200
  Width = 1277
  Caption = #1050#1072#1088#1090#1086#1095#1082#1080' '#1087#1083#1072#1090#1077#1078#1077#1081
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Width = 1261
  end
  inherited ToolBar: TToolBar
    Width = 1261
    Height = 49
    object tbCreate: TToolButton
      Left = 0
      Top = 0
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 0
      OnClick = tbCreateClick
    end
    object tbEdit: TToolButton
      Left = 23
      Top = 0
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 1
      OnClick = tbEditClick
    end
    object tdDel: TToolButton
      Left = 46
      Top = 0
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 2
      OnClick = tdDelClick
    end
    object tbRefresh: TToolButton
      Left = 69
      Top = 0
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 3
      OnClick = tbRefreshClick
    end
    object tbClose: TToolButton
      Left = 92
      Top = 0
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1092#1086#1088#1084#1091
      ImageIndex = 45
      OnClick = tbCloseClick
    end
    object PrintDocPlat: TToolButton
      Left = 115
      Top = 0
      Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
      Caption = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
      ImageIndex = 42
      OnClick = PrintDocPlatClick
    end
    object ToolButton1: TToolButton
      Left = 138
      Top = 0
      Hint = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 24
      Wrap = True
      OnClick = ToolButton1Click
    end
    object Label1: TLabel
      Left = 0
      Top = 22
      Width = 71
      Height = 22
      Caption = #1058#1080#1087' '#1087#1083#1072#1090#1077#1078#1072': '
    end
    object DBLookupComboboxEhTipPlatFilter: TDBLookupComboboxEh
      Left = 71
      Top = 22
      Width = 217
      Height = 22
      EditButtons = <>
      KeyField = 'TipPlat'
      ListField = 'TipPlatName'
      ListSource = dsTipPlatFilrer
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object Label4: TLabel
      Left = 288
      Top = 22
      Width = 64
      Height = 22
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090': '
    end
    object DBLookupComboboxEhPostFilter: TDBLookupComboboxEh
      Left = 352
      Top = 22
      Width = 217
      Height = 22
      EditButtons = <>
      KeyField = 'PostNo'
      ListField = 'PostName'
      ListSource = dsPostFilter
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object Label2: TLabel
      Left = 569
      Top = 22
      Width = 13
      Height = 22
      Caption = #1057': '
    end
    object EdDateBeg: TcxDateEdit
      Left = 582
      Top = 22
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      TabOrder = 1
      Width = 105
    end
    object Label3: TLabel
      Left = 687
      Top = 22
      Width = 17
      Height = 22
      Caption = #1055#1086':'
    end
    object EdDateEnd: TcxDateEdit
      Left = 704
      Top = 22
      Properties.ClearKey = 46
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.WeekNumbers = True
      TabOrder = 2
      Width = 105
    end
    object Label5: TLabel
      Left = 809
      Top = 22
      Width = 91
      Height = 22
      Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074': '
    end
    object DBLookupComboboxEhVidRashodNoFilter: TDBLookupComboboxEh
      Left = 900
      Top = 22
      Width = 217
      Height = 22
      EditButtons = <>
      KeyField = 'VidRashodNo'
      ListField = 'VirDashodName'
      ListSource = dsVidRashodNoFilter
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 328
    Width = 1261
    Height = 41
    Align = alBottom
    TabOrder = 2
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 49
    Width = 1261
    Height = 279
    Align = alClient
    TabOrder = 3
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1259
      Height = 277
      Align = alClient
      AllowedSelections = [gstRecordBookmarks]
      DataSource = dsDocPlatHead
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
      OnDrawDataCell = DBGridEh1DrawDataCell
    end
  end
  inherited ActionList: TActionList
    Top = 32
  end
  object quDocPlatHead: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      '/*'
      'select  *'
      
        '      , (select Name from Post where PostNo = dcch.PostNo) as Po' +
        'stName'
      
        '      , (select SotrudName from Sotrud where SotrudNo = dcch.Sot' +
        'rudNo) as SotrudName'
      
        '      , (select UserName from Users where UserNo = dcch.UserNo) ' +
        'as UserName'
      
        '      , (select OtdelName from VidOtdel where OtdelNo = u.OtdelN' +
        'o) as OtdelName'
      ' from V_DocPlatHead dcch'
      'where &_where'
      'order by DatePlat'
      '*/'
      ''
      'select   *'
      
        '      , (select Name from Post where PostNo = u.PostNo) as PostN' +
        'ame'
      
        '      , (select SotrudName from Sotrud where SotrudNo = u.Sotrud' +
        'No) as SotrudName'
      
        '      , (select UserName from Users where UserNo = u.UserNo) as ' +
        'UserName'
      
        '      , (select OtdelName from VidOtdel where OtdelNo = u.OtdelN' +
        'o) as OtdelName'
      
        '      , (select Name from d_plat_type where id = u.TipPlat) as T' +
        'ipPlatName'
      
        '      , (select VidRashodName from VidRashod where VidRashodNo =' +
        ' u.VidRashodNo) as VirDashodName'
      '      , case when u.EntityType = '#39'PLATP'#39' then '#39#1055#1088#1080#1093#1086#1076#1099' '#1076#1077#1085#1077#1075#39
      '             when u.EntityType = '#39'PLATR'#39' then '#39#1056#1072#1089#1093#1086#1076#1099' '#1076#1077#1085#1077#1075#39
      '        end as EntityTypeName'
      
        ' from (SELECT        PlatNo AS PlatNo, DocDate, '#39'PLATP'#39' AS Entit' +
        'yType, DatePlat, Summa, pkey as table_key, UserNo, SotrudNo, Pos' +
        'tNo, IsApp, NotSignatureOtdel, OtdelNo, Spravka, TipPlat, VidRas' +
        'hodNo '
      '        FROM            DocPlatP'
      '       UNION ALL'
      
        '       SELECT        PlatNo AS PlatNo, DocDate, '#39'PLATR'#39' AS Entit' +
        'yType, DatePlat, summa, pkey as table_key, UserNo, SotrudNo, Pos' +
        'tNo, IsApp, NotSignatureOtdel, OtdelNo, Spravka, TipPlat, VidRas' +
        'hodNo'
      '        FROM            DocPlatR) u'
      'where &_where'
      '  and TipPlat = isnull(:TipPlat,TipPlat)'
      
        '  and DatePlat Between isnull(:DateBeg,DatePlat) and isnull(:Dat' +
        'eEnd,DatePlat)'
      '  and PostNo = isnull(:PostNo,PostNo)'
      '  and VidRashodNo = isnull(:VidRashodNo,VidRashodNo)'
      'order by DatePlat')
    Left = 264
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TipPlat'
      end
      item
        DataType = ftDateTime
        Name = 'DateBeg'
      end
      item
        DataType = ftDateTime
        Name = 'DateEnd'
      end
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftInteger
        Name = 'VidRashodNo'
      end>
    MacroData = <
      item
        Name = '_where'
        Value = '1=1'
      end>
    object quDocPlatHeadPlatNo: TIntegerField
      FieldName = 'PlatNo'
      ReadOnly = True
    end
    object quDocPlatHeadDocDate: TDateTimeField
      FieldName = 'DocDate'
      ReadOnly = True
      Visible = False
    end
    object quDocPlatHeadEntityType: TStringField
      FieldName = 'EntityType'
      ReadOnly = True
      Visible = False
      Size = 5
    end
    object quDocPlatHeadDatePlat: TDateTimeField
      DisplayWidth = 10
      FieldName = 'DatePlat'
      ReadOnly = True
    end
    object quDocPlatHeadEntityTypeName: TStringField
      FieldName = 'EntityTypeName'
      ReadOnly = True
      Size = 13
    end
    object quDocPlatHeadSumma: TFloatField
      FieldName = 'Summa'
      ReadOnly = True
    end
    object quDocPlatHeadtable_key: TLargeintField
      FieldName = 'table_key'
      ReadOnly = True
      Visible = False
    end
    object quDocPlatHeadUserNo: TSmallintField
      FieldName = 'UserNo'
      ReadOnly = True
      Visible = False
    end
    object quDocPlatHeadSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
      ReadOnly = True
      Visible = False
    end
    object quDocPlatHeadPostNo: TSmallintField
      FieldName = 'PostNo'
      ReadOnly = True
      Visible = False
    end
    object quDocPlatHeadIsApp: TBooleanField
      FieldName = 'IsApp'
      ReadOnly = True
      Visible = False
    end
    object quDocPlatHeadPostName: TStringField
      FieldName = 'PostName'
      ReadOnly = True
      Size = 30
    end
    object quDocPlatHeadSotrudName: TStringField
      FieldName = 'SotrudName'
      ReadOnly = True
      Size = 30
    end
    object quDocPlatHeadUserName: TStringField
      DisplayWidth = 15
      FieldName = 'UserName'
      ReadOnly = True
    end
    object quDocPlatHeadNotSignatureOtdel: TStringField
      DisplayLabel = #1053#1077' '#1087#1086#1076#1087#1080#1089#1072#1083#1080
      DisplayWidth = 30
      FieldName = 'NotSignatureOtdel'
      ReadOnly = True
      Size = 256
    end
    object quDocPlatHeadOtdelNo: TIntegerField
      FieldName = 'OtdelNo'
      ReadOnly = True
      Visible = False
    end
    object quDocPlatHeadOtdelName: TStringField
      DisplayWidth = 15
      FieldName = 'OtdelName'
      ReadOnly = True
      Size = 30
    end
    object quDocPlatHeadSpravka: TStringField
      DisplayWidth = 50
      FieldName = 'Spravka'
      ReadOnly = True
      Size = 200
    end
    object quDocPlatHeadTipPlatName: TStringField
      DisplayWidth = 30
      FieldName = 'TipPlatName'
      ReadOnly = True
      Size = 512
    end
    object quDocPlatHeadVirDashodName: TStringField
      FieldName = 'VirDashodName'
      ReadOnly = True
      Size = 50
    end
  end
  object dsDocPlatHead: TMSDataSource
    DataSet = quDocPlatHead
    Left = 232
    Top = 80
  end
  object frReport: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    PrintIfEmpty = False
    ReportType = rtMultiple
    RebuildPrinter = False
    Left = 424
    Top = 125
    ReportForm = {19000000}
  end
  object quTipPlatFilrer: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      '-- select * from d_plat_type'
      'select distinct  TipPlat'
      
        '       , (select Name from d_plat_type where id = u.TipPlat) as ' +
        'TipPlatName'
      
        ' from (SELECT        PlatNo AS PlatNo, DocDate, '#39'PLATP'#39' AS Entit' +
        'yType, DatePlat, Summa, pkey as table_key, UserNo, SotrudNo, Pos' +
        'tNo, IsApp, NotSignatureOtdel, OtdelNo, Spravka, TipPlat'
      '        FROM            DocPlatP'
      '       UNION ALL'
      
        '       SELECT        PlatNo AS PlatNo, DocDate, '#39'PLATR'#39' AS Entit' +
        'yType, DatePlat, summa, pkey as table_key, UserNo, SotrudNo, Pos' +
        'tNo, IsApp, NotSignatureOtdel, OtdelNo, Spravka, TipPlat'
      '        FROM            DocPlatR) u'
      'order by TipPlatName')
    Left = 136
    Top = 16
    object quTipPlatFilrerTipPlat: TSmallintField
      FieldName = 'TipPlat'
      ReadOnly = True
    end
    object quTipPlatFilrerTipPlatName: TStringField
      FieldName = 'TipPlatName'
      ReadOnly = True
      Size = 512
    end
  end
  object dsTipPlatFilrer: TMSDataSource
    DataSet = quTipPlatFilrer
    Left = 168
    Top = 16
  end
  object quPostFilter: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  distinct u.PostNo'
      
        '               , (select Name from Post where PostNo = u.PostNo)' +
        ' as PostName'
      
        ' from (SELECT        PlatNo AS PlatNo, DocDate, '#39'PLATP'#39' AS Entit' +
        'yType, DatePlat, Summa, pkey as table_key, UserNo, SotrudNo, Pos' +
        'tNo, IsApp, NotSignatureOtdel, OtdelNo, Spravka, TipPlat'
      '        FROM            DocPlatP'
      '       UNION ALL'
      
        '       SELECT        PlatNo AS PlatNo, DocDate, '#39'PLATR'#39' AS Entit' +
        'yType, DatePlat, summa, pkey as table_key, UserNo, SotrudNo, Pos' +
        'tNo, IsApp, NotSignatureOtdel, OtdelNo, Spravka, TipPlat'
      '        FROM            DocPlatR) u'
      'order by PostName')
    Left = 392
    Top = 81
    object quPostFilterPostNo: TSmallintField
      FieldName = 'PostNo'
      ReadOnly = True
    end
    object quPostFilterPostName: TStringField
      FieldName = 'PostName'
      ReadOnly = True
      Size = 30
    end
  end
  object dsPostFilter: TMSDataSource
    DataSet = quPostFilter
    Left = 368
    Top = 81
  end
  object dsVidRashodNoFilter: TMSDataSource
    DataSet = quVidRashodNoFilter
    Left = 488
    Top = 81
  end
  object quVidRashodNoFilter: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  distinct u.VidRashodNo'
      
        '      , (select VidRashodName from VidRashod where VidRashodNo =' +
        ' u.VidRashodNo) as VirDashodName'
      
        ' from (SELECT        PlatNo AS PlatNo, DocDate, '#39'PLATP'#39' AS Entit' +
        'yType, DatePlat, Summa, pkey as table_key, UserNo, SotrudNo, Pos' +
        'tNo, IsApp, NotSignatureOtdel, OtdelNo, Spravka, TipPlat, VidRas' +
        'hodNo'
      '        FROM            DocPlatP'
      '       UNION ALL'
      
        '       SELECT        PlatNo AS PlatNo, DocDate, '#39'PLATR'#39' AS Entit' +
        'yType, DatePlat, summa, pkey as table_key, UserNo, SotrudNo, Pos' +
        'tNo, IsApp, NotSignatureOtdel, OtdelNo, Spravka, TipPlat, VidRas' +
        'hodNo'
      '        FROM            DocPlatR) u'
      'order by VirDashodName')
    Left = 512
    Top = 81
    object quVidRashodNoFilterVidRashodNo: TIntegerField
      FieldName = 'VidRashodNo'
      ReadOnly = True
    end
    object quVidRashodNoFilterVirDashodName: TStringField
      FieldName = 'VirDashodName'
      ReadOnly = True
      Size = 50
    end
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = quPrintPlat
    Left = 456
    Top = 129
  end
  object quPrintPlat: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  DateEntity'
      '      , OtdelName'
      '      , Summa'
      '      , PostName'
      '      , SotrudName'
      '      , Description '
      ' from V_List_entity_Doc '
      '  where &_where'
      ''
      '-- table_key in (:Pkey)')
    Left = 600
    Top = 89
    MacroData = <
      item
        Name = '_where'
        Value = '1=1'
      end>
    object quPrintPlatDateEntity: TDateTimeField
      FieldName = 'DateEntity'
    end
    object quPrintPlatOtdelName: TStringField
      FieldName = 'OtdelName'
      Size = 30
    end
    object quPrintPlatSumma: TFloatField
      FieldName = 'Summa'
    end
    object quPrintPlatPostName: TStringField
      FieldName = 'PostName'
      ReadOnly = True
      Size = 30
    end
    object quPrintPlatSotrudName: TStringField
      FieldName = 'SotrudName'
      ReadOnly = True
      Size = 30
    end
    object quPrintPlatDescription: TStringField
      FieldName = 'Description'
      Size = 200
    end
  end
end
