inherited Infarmatsionny_AnalysisForm: TInfarmatsionny_AnalysisForm
  Left = 339
  Top = 257
  Width = 1351
  Caption = #1057#1087#1080#1089#1086#1082' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1093' '#1079#1072#1082#1072#1079#1086#1074
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 1335
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 41
    Width = 1335
    Height = 241
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 199
      Width = 1333
      Height = 41
      Align = alBottom
      TabOrder = 0
      object gBPeriod: TGroupBox
        Left = 56
        Top = 4
        Width = 273
        Height = 36
        Caption = #1055#1077#1088#1080#1086#1076
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 18
          Width = 7
          Height = 13
          Caption = #1057
        end
        object Label2: TLabel
          Left = 141
          Top = 18
          Width = 14
          Height = 13
          Caption = #1055#1086
        end
        object EdDateBeg: TcxDateEdit
          Left = 21
          Top = 13
          Properties.ClearKey = 46
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.WeekNumbers = True
          Properties.OnChange = EdDateBegPropertiesChange
          TabOrder = 0
          Width = 105
        end
        object EdDateEnd: TcxDateEdit
          Left = 159
          Top = 13
          Properties.ClearKey = 46
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.WeekNumbers = True
          Properties.OnChange = EdDateEndPropertiesChange
          TabOrder = 1
          Width = 105
        end
      end
    end
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1333
      Height = 198
      Align = alClient
      DataSource = dsInfarmatsionny_AnalysisHead
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGridEh1DblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Id'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'OrderDate'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'PostName'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'SotrudName'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'BuhType'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'OtdelName'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Address'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Price'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'NaklNo'
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
  end
  object dsInfarmatsionny_AnalysisHead: TMSDataSource
    DataSet = quInfarmatsionny_AnalysisHead
    Left = 208
    Top = 8
  end
  object quInfarmatsionny_AnalysisHead: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select   Id '
      '       , OrderDate'
      '       , PosnNo'
      
        '       , (select name from Post where PostNo = h.PosnNo) as Post' +
        'Name'
      '       , SotrudNo'
      
        '       , (select SotrudName from Sotrud where SotrudNo = h.Sotru' +
        'dNo) as SotrudName'
      '       , Buh '
      
        '       , (select Buh_type_name from d_buh_type where Buh = h.Buh' +
        ') as BuhType'
      '       , OtdelNo'
      
        '       , (select OtdelName from VidOtdel where otdelNo = h.Otdel' +
        'No) as OtdelName'
      
        '       , (select Address from AddressPost where PostNo = h.PosnN' +
        'O and AddressNo = h.AddreessNo) as Address'
      '       , NaklNo'
      '       , ColnPrice'
      
        '       , (select ColName from D_Price_type where ColNPrice = h.C' +
        'olnPrice) as Price'
      ' from Infarmatsionny_AnalysisHead h'
      '  where OrderDate between :DateBeg and :DateEnd')
    Left = 240
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateBeg'
      end
      item
        DataType = ftUnknown
        Name = 'DateEnd'
      end>
    object quInfarmatsionny_AnalysisHeadId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
    object quInfarmatsionny_AnalysisHeadOrderDate: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'OrderDate'
    end
    object quInfarmatsionny_AnalysisHeadPosnNo: TIntegerField
      FieldName = 'PosnNo'
    end
    object quInfarmatsionny_AnalysisHeadPostName: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      FieldName = 'PostName'
      ReadOnly = True
      Size = 30
    end
    object quInfarmatsionny_AnalysisHeadSotrudNo: TIntegerField
      FieldName = 'SotrudNo'
    end
    object quInfarmatsionny_AnalysisHeadSotrudName: TStringField
      DisplayLabel = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      FieldName = 'SotrudName'
      ReadOnly = True
      Size = 30
    end
    object quInfarmatsionny_AnalysisHeadBuh: TIntegerField
      FieldName = 'Buh'
    end
    object quInfarmatsionny_AnalysisHeadBuhType: TStringField
      DisplayLabel = #1041#1091#1093'.'#1058#1080#1087
      FieldName = 'BuhType'
      ReadOnly = True
    end
    object quInfarmatsionny_AnalysisHeadOtdelNo: TIntegerField
      FieldName = 'OtdelNo'
    end
    object quInfarmatsionny_AnalysisHeadOtdelName: TStringField
      DisplayLabel = #1054#1090#1076#1077#1083
      DisplayWidth = 25
      FieldName = 'OtdelName'
      ReadOnly = True
      Size = 30
    end
    object quInfarmatsionny_AnalysisHeadAddress: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089' '#1076#1086#1089#1090#1072#1074#1082#1080
      DisplayWidth = 50
      FieldName = 'Address'
      ReadOnly = True
      Size = 256
    end
    object quInfarmatsionny_AnalysisHeadColnPrice: TIntegerField
      FieldName = 'ColnPrice'
    end
    object quInfarmatsionny_AnalysisHeadNaklNo: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      FieldName = 'NaklNo'
    end
    object quInfarmatsionny_AnalysisHeadPrice: TStringField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 15
      FieldName = 'Price'
      ReadOnly = True
      Size = 64
    end
  end
end
