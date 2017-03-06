object fmNaklRPost: TfmNaklRPost
  Left = 322
  Top = 155
  Width = 1306
  Height = 736
  Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077' '#1076#1083#1103' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1087#1086' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1081' '#1087#1086#1095#1090#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RxdbgNaklRPost: TRxDBGrid
    Left = 0
    Top = 121
    Width = 1290
    Height = 531
    Hint = 
      #1069#1090#1086' '#1090#1072#1073#1083#1080#1094#1072' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1074#1080#1079#1091#1083#1100#1085#1086#1075#1086' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' '#1074#1099#1075#1088#1091#1078#1072#1077#1084#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099 +
      #1093
    Align = alClient
    DataSource = dsNaklRPostExport
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TovarNoP'
        Title.Caption = #8470' '#1058#1086#1074#1072#1088#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BarCode'
        Title.Caption = #1064#1090#1088#1080#1093#1082#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameTov'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
        Width = 267
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EdIzm'
        Title.Caption = #1045#1076'.'#1048#1079#1084'.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrNoNDS'
        Title.Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Price'
        Title.Caption = #1062#1077#1085#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'StavNDS'
        Title.Caption = #1053#1044#1057' %'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY'
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SumNoNDS'
        Title.Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Title.Caption = #1057#1091#1084#1084#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomNaklR'
        Title.Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Date'
        Title.Caption = #1044#1072#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SumNaklR'
        Title.Caption = #1057#1091#1084#1084#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SNRNoNDS'
        Title.Caption = #1057#1091#1084#1084#1072' '#1085#1072#1082#1083'. '#1073#1077#1079' '#1053#1044#1057
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OurFirm'
        Title.Caption = #1053#1072#1096#1072' '#1092#1080#1088#1084#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OurOKPO'
        Title.Caption = #1053#1072#1096#1077' '#1054#1050#1055#1054
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Firm'
        Title.Caption = #1060#1080#1088#1084#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AdrPost'
        Title.Caption = #1040#1076#1088#1077#1089
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PostNo'
        Title.Caption = #8470' '#1092#1080#1088#1084#1099
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AddresId'
        Title.Caption = #8470' '#1072#1076#1088#1077#1089#1072
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 652
    Width = 1290
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object SendDBF: TButton
      Left = 118
      Top = 8
      Width = 251
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      TabOrder = 0
      OnClick = SendDBFClick
    end
    object SendDBFAll: TButton
      Left = 817
      Top = 7
      Width = 129
      Height = 25
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074#1099#1073#1080#1088#1072#1077#1084#1099#1084' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072#1084
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1084
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = SendDBFAllClick
    end
    object SendDBFOneFile: TButton
      Left = 438
      Top = 8
      Width = 323
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1099#1081' '#1072#1076#1088#1077#1089' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072' '#1086#1076#1085#1080#1084' '#1092#1072#1081#1083#1086#1084
      TabOrder = 2
      OnClick = SendDBFOneFileClick
    end
    object bDeskription: TButton
      Left = 1064
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
      TabOrder = 3
      OnClick = bDeskriptionClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1290
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lbFilterPost: TLabel
      Left = 8
      Top = 70
      Width = 64
      Height = 13
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090' :'
    end
    object Label1: TLabel
      Left = 7
      Top = 4
      Width = 723
      Height = 60
      Caption = 
        '     '#1044#1083#1103' '#1074#1099#1075#1088#1091#1079#1082#1080' '#1085#1072#1082#1083#1072#1076#1085#1099#1093' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1073#1088#1072#1090#1100' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072' '#1080' '#1087#1077#1088 +
        #1080#1086#1076' '#1079#1072' '#1082#1086#1090#1086#1088#1099#1081' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1089#1103' '#1074#1099#1075#1088#1091#1079#1082#1072' '#1085#1072#1082#1083#1072#1076#1085#1099#1093'. '#1055#1088#1080' '#1089#1085#1103#1090#1080#1080' '#1075#1072#1083#1086#1095 +
        #1082#1080' '#1089' "'#1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076'" '#1073#1091#1076#1091#1090' '#1074#1099#1073#1088#1072#1085#1099' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091' '#1079#1072 +
        ' '#1074#1077#1089#1100' '#1087#1077#1088#1080#1086#1076' '#1088#1072#1073#1086#1090#1099' '#1089' '#1076#1072#1085#1085#1099#1084' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 624
      Top = 104
      Width = 412
      Height = 64
      Caption = 
        '      '#1045#1089#1083#1080' '#1074' '#1074#1099#1087#1072#1076#1072#1102#1097#1077#1084' '#1089#1087#1080#1089#1082#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074', '#1085#1077#1090' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072', '#1082#1086 +
        #1090#1086#1088#1086#1075#1086' '#1074#1099' '#1080#1097#1080#1090#1077', '#1086#1073#1088#1072#1090#1080#1090#1077#1089#1100' '#1082' '#1050#1091#1096#1085#1080#1088' '#1054#1082#1089#1072#1085#1077', '#1076#1083#1103' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1074' '#1073#1072#1079#1091 +
        ' '#1101#1083#1077#1082#1090#1088#1086#1085#1085#1086#1075#1086' '#1072#1076#1088#1077#1089#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
      WordWrap = True
    end
    object cbFilterPost: TDBLookupComboboxEh
      Left = 8
      Top = 89
      Width = 209
      Height = 21
      Hint = #1042#1099#1073#1086#1088' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      EditButtons = <>
      KeyField = 'PostNo'
      ListField = 'Firm'
      ListSource = dsFilterPost
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = cbFilterPostChange
    end
    object ExportNakl: TButton
      Left = 768
      Top = 8
      Width = 210
      Height = 25
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1099#1077' '#1086#1076#1085#1080#1084' '#1092#1072#1081#1083#1086#1084
      TabOrder = 1
      OnClick = ExportNaklClick
    end
    object ExportList: TButton
      Left = 992
      Top = 8
      Width = 143
      Height = 25
      Hint = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1072
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ExportListClick
    end
    object ImportList: TButton
      Left = 991
      Top = 40
      Width = 145
      Height = 25
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1072' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1072
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ImportListClick
    end
    object ExpotrDBF: TButton
      Left = 768
      Top = 40
      Width = 137
      Height = 25
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
      TabOrder = 4
      OnClick = ExpotrDBFClick
    end
    object GroupBox1: TGroupBox
      Left = 224
      Top = 66
      Width = 360
      Height = 49
      Caption = #1055#1077#1088#1080#1086#1076
      TabOrder = 5
      object lbDateBeg: TLabel
        Left = 6
        Top = 23
        Width = 13
        Height = 13
        Caption = #1057' :'
      end
      object lbDateEnd: TLabel
        Left = 121
        Top = 23
        Width = 20
        Height = 13
        Caption = #1055#1086' :'
      end
      object dtDateBeg: TDateTimePicker
        Left = 22
        Top = 20
        Width = 97
        Height = 21
        Hint = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
        Date = 36890.648554236110000000
        Time = 36890.648554236110000000
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = dtDateBegChange
      end
      object dtDateEnd: TDateTimePicker
        Left = 145
        Top = 20
        Width = 105
        Height = 21
        Hint = #1050#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072
        Date = 36890.648717442120000000
        Time = 36890.648717442120000000
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnChange = dtDateEndChange
      end
      object cbxDate: TCheckBox
        Left = 255
        Top = 22
        Width = 103
        Height = 17
        Hint = #1055#1088#1080' '#1089#1085#1103#1090#1086#1081' '#1075#1072#1083#1086#1095#1082#1077' '#1073#1083#1086#1082#1080#1088#1091#1077#1090#1089#1103' '#1074#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
        Checked = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 2
        OnClick = cbxDateClick
      end
    end
  end
  object TableDbf: TTable
    Left = 1192
    Top = 608
  end
  object dsNaklRPostExport: TDataSource
    DataSet = quNaklRpostExport
    Left = 1224
    Top = 608
  end
  object dsFilterPost: TDataSource
    DataSet = quFilterPost
    Left = 1224
    Top = 572
  end
  object quFilterPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select distinct'
      '       Firm,'
      '       PostNo'
      ' from v_NaklRPost_export')
    Left = 1256
    Top = 572
    object quFilterPostFirm: TStringField
      FieldName = 'Firm'
      ReadOnly = True
      Size = 80
    end
    object quFilterPostPostNo: TSmallintField
      FieldName = 'PostNo'
    end
  end
  object qu_NaklRPostExport: TMSQuery
    Left = 1256
    Top = 536
  end
  object ds_NaklRPostExport: TDataSource
    DataSet = qu_NaklRPostExport
    Left = 1224
    Top = 540
  end
  object quNaklRpostExport: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select TovarNoP'
      '      ,BarCode'
      '      ,NameTov'
      '      ,EdIzm'
      '      ,PrNoNDS'
      '      ,Price'
      '      ,StavNDS'
      '      ,QTY'
      '      ,SumNoNDS'
      '      ,Summa'
      '      ,NomNaklR'
      '      ,cast(Date as datetime) Date'
      '      ,SumNaklR'
      '      ,SNRNoNDS'
      '      ,OurFirm'
      '      ,OurOKPO'
      '      ,Firm'
      '      ,AdrPost'
      '      ,PostNo'
      '      ,AddresId'
      '      ,AddressNo'
      '      ,VidName'
      '      ,NameTovar'
      ' from v_NaklRPost_Export v'
      '  where v.PostNo = Isnull( :PostNo ,v.PostNo)'
      
        '    and Isnull (:date1,cast(v.date as date)) <= cast(v.date as d' +
        'ate)'
      
        '    and Isnull (:date2,cast(v.date as date)) >= cast(v.date as d' +
        'ate)'
      '    and v.AddressNo = Isnull(:AddressNo, v.AddressNo)'
      '    and v.NomNaklR = Isnull(:NomNaklR, v.NomNaklR)'
      'order by VidName, NameTovar')
    Left = 1256
    Top = 608
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftDateTime
        Name = 'date1'
      end
      item
        DataType = ftDateTime
        Name = 'date2'
      end
      item
        DataType = ftInteger
        Name = 'AddressNo'
      end
      item
        DataType = ftInteger
        Name = 'NomNaklR'
      end>
    object quNaklRpostExportTovarNoP: TLargeintField
      FieldName = 'TovarNoP'
      ReadOnly = True
    end
    object quNaklRpostExportBarCode: TLargeintField
      FieldName = 'BarCode'
      ReadOnly = True
    end
    object quNaklRpostExportNameTov: TStringField
      FieldName = 'NameTov'
      ReadOnly = True
      Size = 128
    end
    object quNaklRpostExportEdIzm: TStringField
      FieldName = 'EdIzm'
      Size = 5
    end
    object quNaklRpostExportPrNoNDS: TFloatField
      FieldName = 'PrNoNDS'
      ReadOnly = True
    end
    object quNaklRpostExportPrice: TFloatField
      FieldName = 'Price'
      ReadOnly = True
    end
    object quNaklRpostExportStavNDS: TStringField
      FieldName = 'StavNDS'
      ReadOnly = True
      Size = 2
    end
    object quNaklRpostExportQTY: TFloatField
      FieldName = 'QTY'
    end
    object quNaklRpostExportSumNoNDS: TFloatField
      FieldName = 'SumNoNDS'
      ReadOnly = True
    end
    object quNaklRpostExportSumma: TFloatField
      FieldName = 'Summa'
      ReadOnly = True
    end
    object quNaklRpostExportNomNaklR: TIntegerField
      FieldName = 'NomNaklR'
    end
    object quNaklRpostExportDate: TDateTimeField
      FieldName = 'Date'
      ReadOnly = True
    end
    object quNaklRpostExportSumNaklR: TFloatField
      FieldName = 'SumNaklR'
    end
    object quNaklRpostExportSNRNoNDS: TFloatField
      FieldName = 'SNRNoNDS'
      ReadOnly = True
    end
    object quNaklRpostExportOurFirm: TStringField
      FieldName = 'OurFirm'
      ReadOnly = True
      Size = 80
    end
    object quNaklRpostExportOurOKPO: TStringField
      FieldName = 'OurOKPO'
      ReadOnly = True
      Size = 10
    end
    object quNaklRpostExportFirm: TStringField
      FieldName = 'Firm'
      ReadOnly = True
      Size = 80
    end
    object quNaklRpostExportAdrPost: TStringField
      FieldName = 'AdrPost'
      ReadOnly = True
      Size = 256
    end
    object quNaklRpostExportPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quNaklRpostExportAddresId: TIntegerField
      FieldName = 'AddresId'
      ReadOnly = True
    end
  end
  object quExecuteExport: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'exec work.dbo.sp_ExportTovarPost :PostNo, :DateBegin, :DateEnd')
    Left = 1192
    Top = 584
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
        ParamType = ptInput
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
      end>
  end
  object quExecuteImport: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'exec sp_ImportTovarPost :PostNo')
    Left = 1160
    Top = 608
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
        ParamType = ptInput
      end>
  end
  object MSQuery1: TMSQuery
    SQL.Strings = (
      'declare'
      '  @PostNo int'
      ''
      'set @PostNo = :PostNo'
      ''
      'select *'
      ' from Post_Mail'
      '  where Mail1 in (select mail'
      '                   from'
      '                       ('
      '                        select distinct mail1 as mail'
      '                         from Post_Mail'
      '                          where PostNo = @PostNo'
      '                        union  '
      '                        select distinct Mail2 as mail'
      '                         from Post_Mail'
      '                          where PostNo = @PostNo'
      '                        union  '
      '                        select distinct Mail3 as mail'
      '                         from Post_Mail'
      '                          where PostNo = @PostNo'
      '                        ) u'
      '                    where u.mail is not null)'
      '     or Mail2 in (select mail'
      '                   from'
      '                       ('
      '                        select distinct mail1 as mail'
      '                         from Post_Mail'
      '                          where PostNo = @PostNo'
      '                        union  '
      '                        select distinct Mail2 as mail'
      '                         from Post_Mail'
      '                          where PostNo = @PostNo'
      '                        union  '
      '                        select distinct Mail3 as mail'
      '                         from Post_Mail'
      '                          where PostNo = @PostNo'
      '                        ) u'
      '                    where u.mail is not null)'
      '     or Mail3 in (select mail'
      '                   from'
      '                       ('
      '                        select distinct mail1 as mail'
      '                         from Post_Mail'
      '                          where PostNo = @PostNo'
      '                        union  '
      '                        select distinct Mail2 as mail'
      '                         from Post_Mail'
      '                          where PostNo = @PostNo'
      '                        union  '
      '                        select distinct Mail3 as mail'
      '                         from Post_Mail'
      '                          where PostNo = @PostNo'
      '                        ) u'
      '                    where u.mail is not null)')
    Left = 1256
    Top = 496
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PostNo'
      end>
  end
  object od_ExportFile: TOpenDialog
    Left = 1264
  end
  object sd_SaveFile: TSaveDialog
    Left = 1264
    Top = 32
  end
end
