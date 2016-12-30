inherited RestTovarOfDateManufactureForm: TRestTovarOfDateManufactureForm
  Left = 537
  Top = 373
  Width = 1024
  Height = 405
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1087#1086' '#1076#1072#1090#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072' '#1090#1086#1074#1072#1088#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 304
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 325
    Width = 1008
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Label2: TLabel
      Left = 864
      Top = 16
      Width = 112
      Height = 13
      Caption = #1042#1099#1074#1086#1076#1080#1090#1100' '#1087#1088#1086#1094#1077#1085#1090' >= '
      Visible = False
    end
    object Label3: TLabel
      Left = 8
      Top = 16
      Width = 37
      Height = 13
      Caption = #1041#1088#1077#1085#1076': '
    end
    object DBLookupComboboxEhFltVidTovara: TDBLookupComboboxEh
      Left = 50
      Top = 10
      Width = 233
      Height = 21
      EditButtons = <>
      KeyField = 'VidNo'
      ListField = 'VidName'
      ListSource = dsFltVidTovara
      TabOrder = 0
      Visible = True
      OnChange = DBLookupComboboxEhFltVidTovaraChange
    end
    object bRefresh: TButton
      Left = 320
      Top = 11
      Width = 75
      Height = 25
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      OnClick = bRefreshClick
    end
    object Is_NotZero: TCheckBox
      Left = 424
      Top = 16
      Width = 185
      Height = 17
      Caption = #1053#1077' '#1074#1099#1074#1086#1076#1080#1090#1100' '#1085#1091#1083#1077#1074#1099#1077' '#1086#1089#1090#1072#1090#1082#1080
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object bExportExel: TButton
      Left = 616
      Top = 8
      Width = 121
      Height = 25
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1045#1082#1089#1077#1083#1100
      TabOrder = 3
      OnClick = bExportExelClick
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 1008
    Height = 325
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 1006
      Height = 323
      Align = alClient
      DataSource = dsTovarDateOfManufacture
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridEh1DrawColumnCell
      OnDrawDataCell = DBGridEh1DrawDataCell
      OnKeyDown = DBGridEh1KeyDown
      OnKeyPress = DBGridEh1KeyPress
      OnTitleBtnClick = DBGridEh1TitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TovarNo'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 74
        end
        item
          EditButtons = <>
          FieldName = 'NameTovar'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
          Width = 305
        end
        item
          EditButtons = <>
          FieldName = 'VidName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Kol'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'DateBeg'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'DateEnd'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'SrokReal'
          Footers = <>
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'PercentReallizDay'
          Footers = <>
          Title.TitleButton = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 984
    Top = 336
  end
  object dsTovarDateOfManufacture: TMSDataSource
    DataSet = quTovarDateOfManufacture
    Top = 40
  end
  object quTovarDateOfManufacture: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select --*,'
      '        tdom.TovarNo'
      #9'  , t.NameTovar'
      #9'  , isnull(t.SrokReal,0) as SrokReal'
      #9'  , vt.VidName'
      #9'  , tdom.Kol'
      #9'  , tdom.DateBeg'
      #9'  , tdom.DateEnd'
      
        #9'  , case when ((t.SrokReal is not null) and (t.SrokReal <> 0)) ' +
        'then (datediff(dd, tdom.DateBeg, getdate())+1)*100/t.SrokReal'
      
        #9'                                                               ' +
        'else 0'
      #9'    end as PercentReallizDay'
      ' from TovarDateOfManufacture tdom left join'
      '      Tovar t on t.TovarNo = tdom.TovarNo left join'
      '      VidTov vt on vt.VidNo = t.VidNo'
      '  where 1=1'
      '&_where'
      '&_wherezero'
      'order by &_order')
    BeforeOpen = quTovarDateOfManufactureBeforeOpen
    Left = 32
    Top = 40
    MacroData = <
      item
        Name = '_where'
      end
      item
        Name = '_wherezero'
      end
      item
        Name = '_order'
        Value = 'tdom.TovarNo'
      end>
    object quTovarDateOfManufactureTovarNo: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1090#1086#1074#1072#1088#1072
      FieldName = 'TovarNo'
    end
    object quTovarDateOfManufactureNameTovar: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 50
      FieldName = 'NameTovar'
      Size = 128
    end
    object quTovarDateOfManufactureSrokReal: TSmallintField
      DisplayLabel = #1057#1088#1086#1082' '#1075#1086#1076#1085#1086#1089#1090#1080
      FieldName = 'SrokReal'
    end
    object quTovarDateOfManufactureVidName: TStringField
      DisplayLabel = #1041#1088#1077#1085#1076
      FieldName = 'VidName'
      Size = 30
    end
    object quTovarDateOfManufactureKol: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'Kol'
    end
    object quTovarDateOfManufactureDateBeg: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
      FieldName = 'DateBeg'
    end
    object quTovarDateOfManufactureDateEnd: TDateTimeField
      DisplayLabel = #1050#1086#1085#1077#1095#1085#1099#1081' '#1089#1088#1086#1082' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      FieldName = 'DateEnd'
    end
    object quTovarDateOfManufacturePercentReallizDay: TIntegerField
      DisplayLabel = #1055#1088#1086#1094#1077#1085#1090' '#1087#1088#1086#1076#1072#1078#1080' '#1076#1085#1077#1081
      FieldName = 'PercentReallizDay'
      ReadOnly = True
    end
  end
  object quFltVidTovara: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select distinct vt.VidName'
      '              , vt.VidNo'
      ' from TovarDateOfManufacture tdom left join'
      '      Tovar t on t.TovarNo = tdom.TovarNo left join'
      '      VidTov vt on vt.VidNo = t.VidNo')
    Left = 32
    Top = 75
    object quFltVidTovaraVidName: TStringField
      FieldName = 'VidName'
      Size = 30
    end
    object quFltVidTovaraVidNo: TSmallintField
      FieldName = 'VidNo'
    end
  end
  object dsFltVidTovara: TMSDataSource
    DataSet = quFltVidTovara
    Top = 75
  end
  object sdExportRestTovar: TSaveDialog
    Left = 88
    Top = 40
  end
end
