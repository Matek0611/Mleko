inherited Infarmatsionny_AnalysisSpecForm: TInfarmatsionny_AnalysisSpecForm
  Width = 757
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1081' '#1079#1072#1082#1072#1079
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 741
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 41
    Width = 741
    Height = 241
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 199
      Width = 739
      Height = 41
      Align = alBottom
      TabOrder = 0
    end
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 739
      Height = 198
      Align = alClient
      DataSource = dsInfarmatsionny_AnalysisSpec
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
      Columns = <
        item
          EditButtons = <>
          FieldName = 'IdInfarmatsionny_Analysis'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'VidName'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'NameTovar'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Qty'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Residue'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Need'
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
  end
  object quInfarmatsionny_AnalysisSpec: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select    IdInfarmatsionny_Analysis'
      '        , TovarNo'
      '        , VidNo'
      
        '        , (select VidName from VidTov where VidNo = s.VidNo) as ' +
        'VidName'
      '        , NameTovar'
      '        , Qty'
      '        , Residue'
      '        , Need'
      ' from Infarmatsionny_AnalysisSpec s'
      '  where IdInfarmatsionny_Analysis = :IdInfarmatsionny_Analysis')
    Left = 80
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdInfarmatsionny_Analysis'
      end>
    object quInfarmatsionny_AnalysisSpecId: TIntegerField
      FieldName = 'Id'
      ReadOnly = True
    end
    object quInfarmatsionny_AnalysisSpecIdInfarmatsionny_Analysis: TIntegerField
      DisplayLabel = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1081' '#1079#1072#1082#1072#1079
      FieldName = 'IdInfarmatsionny_Analysis'
    end
    object quInfarmatsionny_AnalysisSpecTovarNo: TIntegerField
      DisplayLabel = #1040#1088#1090#1080#1082#1091#1083
      FieldName = 'TovarNo'
    end
    object quInfarmatsionny_AnalysisSpecVidNo: TIntegerField
      FieldName = 'VidNo'
    end
    object quInfarmatsionny_AnalysisSpecNameTovar: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 30
      FieldName = 'NameTovar'
      Size = 64
    end
    object quInfarmatsionny_AnalysisSpecQty: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'Qty'
    end
    object quInfarmatsionny_AnalysisSpecResidue: TFloatField
      DisplayLabel = #1054#1089#1090#1072#1090#1086#1082
      FieldName = 'Residue'
    end
    object quInfarmatsionny_AnalysisSpecNeed: TFloatField
      DisplayLabel = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100
      FieldName = 'Need'
    end
    object quInfarmatsionny_AnalysisSpecVidName: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'VidName'
      ReadOnly = True
      Size = 30
    end
  end
  object dsInfarmatsionny_AnalysisSpec: TMSDataSource
    DataSet = quInfarmatsionny_AnalysisSpec
    Left = 112
    Top = 8
  end
end
