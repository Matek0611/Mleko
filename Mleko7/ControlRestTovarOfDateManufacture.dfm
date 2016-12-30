inherited ControlRestTovarOfDateManufactureForm: TControlRestTovarOfDateManufactureForm
  Left = 542
  Top = 219
  Width = 981
  Height = 424
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1086#1089#1090#1072#1090#1082#1072#1084#1080' '#1087#1086' '#1076#1072#1090#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 344
    Width = 965
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 468
      Top = 15
      Width = 70
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1072#1088#1090#1080#1080' :'
    end
    object EdVidTovar: TcitDBComboEdit
      Left = 122
      Top = 12
      Width = 90
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 115
      LBtnShortCut2 = 40
      LBtnWidth = 30
      LLblAlignment = laLeft
      LLblCaption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1080#1076' '#1090#1086#1074#1072#1088#1072'  :  '
      LLblWidth = 120
      LLblFont.Charset = DEFAULT_CHARSET
      LLblFont.Color = clWindowText
      LLblFont.Height = -11
      LLblFont.Name = 'MS Sans Serif'
      LLblFont.Style = []
      LLblRequiredFont.Charset = DEFAULT_CHARSET
      LLblRequiredFont.Color = clWindowText
      LLblRequiredFont.Height = -11
      LLblRequiredFont.Name = 'MS Sans Serif'
      LLblRequiredFont.Style = []
      Required = True
      TabOrder = 0
      Visible = True
      LocateKey = False
      Owner = 'ControlRestTovarOfDateManufacture'
      EntityCode = 'VidTov'
      multiselect = True
      OnSelectOk = EdVidTovarSelectOk
      EditStyle = edSelect
      AutoTabControl = True
    end
    object dtDateOfManufacture: TDateTimePicker
      Left = 539
      Top = 12
      Width = 97
      Height = 21
      Hint = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1076#1072#1090#1099' '#1087#1072#1088#1090#1080#1080
      Date = 41273.000000000000000000
      Time = 41273.000000000000000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object EdVidTovarDel: TcitDBComboEdit
      Left = 758
      Top = 12
      Width = 84
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 115
      LBtnShortCut2 = 40
      LBtnWidth = 30
      LLblAlignment = laLeft
      LLblCaption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1080#1076' '#1090#1086#1074#1072#1088#1072'  :  '
      LLblWidth = 120
      LLblFont.Charset = DEFAULT_CHARSET
      LLblFont.Color = clWindowText
      LLblFont.Height = -11
      LLblFont.Name = 'MS Sans Serif'
      LLblFont.Style = []
      LLblRequiredFont.Charset = DEFAULT_CHARSET
      LLblRequiredFont.Color = clWindowText
      LLblRequiredFont.Height = -11
      LLblRequiredFont.Name = 'MS Sans Serif'
      LLblRequiredFont.Style = []
      Required = True
      TabOrder = 2
      Visible = True
      LocateKey = False
      Owner = 'ControlRestTovarOfDateManufacture'
      EntityCode = 'VidTov'
      multiselect = True
      OnSelectOk = EdVidTovarDelSelectOk
      EditStyle = edSelect
      AutoTabControl = True
    end
    object EdTovar: TcitDBComboEdit
      Left = 345
      Top = 11
      Width = 92
      Height = 21
      Enabled = True
      OwnesLButton = True
      OwnesLLabel = True
      LBtnAlignment = baRight
      LBtnDown = False
      LBtnGroupIndex = 0
      LBtnAllowAllUp = False
      LBtnGlyphKind = gkDots
      LBtnShortCut1 = 115
      LBtnShortCut2 = 40
      LBtnWidth = 30
      LLblAlignment = laLeft
      LLblCaption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1074#1072#1088'  :  '
      LLblWidth = 100
      LLblFont.Charset = DEFAULT_CHARSET
      LLblFont.Color = clWindowText
      LLblFont.Height = -11
      LLblFont.Name = 'MS Sans Serif'
      LLblFont.Style = []
      LLblRequiredFont.Charset = DEFAULT_CHARSET
      LLblRequiredFont.Color = clWindowText
      LLblRequiredFont.Height = -11
      LLblRequiredFont.Name = 'MS Sans Serif'
      LLblRequiredFont.Style = []
      Required = True
      TabOrder = 3
      Visible = True
      LocateKey = False
      Owner = 'ControlRestTovarOfDateManufacture'
      EntityCode = 'Tovar'
      multiselect = True
      OnSelectOk = EdTovarSelectOk
      EditStyle = edSelect
      AutoTabControl = True
    end
    object DelAll: TButton
      Left = 880
      Top = 8
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077
      TabOrder = 4
      OnClick = DelAllClick
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 965
    Height = 344
    Align = alClient
    TabOrder = 1
    object DBGridEh1: TDBGridEh
      Left = 1
      Top = 1
      Width = 963
      Height = 342
      Align = alClient
      DataSource = dsTovarOfDateManufacture
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
      TitleLines = 2
      OnKeyDown = DBGridEh1KeyDown
      OnKeyPress = DBGridEh1KeyPress
      Columns = <
        item
          EditButtons = <>
          FieldName = 'TovarNo'
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
          FieldName = 'SrokReal'
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
          FieldName = 'DateBegStart'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Kol'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'DateBeg'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'DateEnd'
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 24
    Top = 56
  end
  object quTovarOfDateManufacture: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select --*,'
      '        tdom.TovarNo'
      #9'  , t.NameTovar'
      #9'  , isnull(t.SrokReal,0) as SrokReal'
      #9'  , vt.VidName'
      '          , tdom.DateBegStart'
      #9'  , tdom.Kol'
      #9'  , tdom.DateBeg'
      #9'  , tdom.DateEnd'
      ' from TovarDateOfManufacture tdom left join'
      '      Tovar t on t.TovarNo = tdom.TovarNo left join'
      '      VidTov vt on vt.VidNo = t.VidNo')
    Left = 720
    Top = 40
    object quTovarOfDateManufactureTovarNo: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #1040#1088#1090#1080#1082#1091#1083
      FieldName = 'TovarNo'
    end
    object quTovarOfDateManufactureNameTovar2: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      DisplayWidth = 30
      FieldName = 'NameTovar'
      Size = 128
    end
    object quTovarOfDateManufactureSrokReal2: TSmallintField
      DisplayLabel = #1057#1088#1086#1082' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      FieldName = 'SrokReal'
      ReadOnly = True
    end
    object quTovarOfDateManufactureVidName: TStringField
      DisplayLabel = #1041#1088#1077#1085#1076
      FieldName = 'VidName'
      Size = 30
    end
    object quTovarOfDateManufactureDateBegStart: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1090#1072#1088#1090#1072' '#1087#1086' '#1073#1088#1077#1085#1076#1091
      FieldName = 'DateBegStart'
    end
    object quTovarOfDateManufactureKol: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'Kol'
    end
    object quTovarOfDateManufactureDateBeg: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
      FieldName = 'DateBeg'
    end
    object quTovarOfDateManufactureDateEnd: TDateTimeField
      DisplayLabel = #1050#1086#1085#1077#1095#1085#1099#1081' '#1089#1088#1086#1082' '#1088#1077#1072#1083#1080#1079#1072#1094#1080#1080
      FieldName = 'DateEnd'
    end
  end
  object dsTovarOfDateManufacture: TMSDataSource
    DataSet = quTovarOfDateManufacture
    Left = 696
    Top = 40
  end
end
