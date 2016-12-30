inherited PostFromGroupCuttingForm: TPostFromGroupCuttingForm
  Left = 498
  Top = 218
  Width = 559
  Height = 386
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 543
    Height = 306
    Align = alClient
    Caption = #1055#1072#1088#1090#1085#1077#1088#1099' '#1089' '#1075#1088#1091#1087#1087#1072#1084#1080' '#1087#1086#1088#1077#1079#1082#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 15
      Width = 539
      Height = 289
      Align = alClient
      DataSource = dsPostFromGroupCutting
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnKeyDown = DBGridEh1KeyDown
      OnKeyPress = DBGridEh1KeyPress
      OnTitleBtnClick = DBGridEh1TitleBtnClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PostNo'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'NameGropCutting'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end
        item
          EditButtons = <>
          FieldName = 'VidName'
          Footers = <>
          Title.Alignment = taCenter
          Title.TitleButton = True
        end>
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 306
    Width = 543
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 232
      Top = 12
      Width = 35
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072
    end
    object Label2: TLabel
      Left = 1
      Top = 11
      Width = 43
      Height = 13
      Caption = #1055#1072#1088#1090#1085#1077#1088
    end
    object Label3: TLabel
      Left = 393
      Top = 12
      Width = 19
      Height = 13
      Caption = #1042#1080#1076
    end
    object lGroupCutting: TDBLookupComboboxEh
      Left = 271
      Top = 10
      Width = 121
      Height = 21
      EditButtons = <>
      KeyField = 'id'
      ListField = 'NameGropCutting'
      ListSource = dsGroupCutting
      TabOrder = 0
      Visible = True
      OnChange = lGroupCuttingChange
    end
    object lPost: TDBLookupComboboxEh
      Left = 48
      Top = 9
      Width = 182
      Height = 21
      EditButtons = <>
      KeyField = 'PostNo'
      ListField = 'Name'
      ListSource = dsPost
      TabOrder = 1
      Visible = True
      OnChange = lPostChange
    end
    object lVidTov: TDBLookupComboboxEh
      Left = 419
      Top = 10
      Width = 121
      Height = 21
      EditButtons = <>
      KeyField = 'VidNo'
      ListField = 'VidName'
      ListSource = dsVidTov
      TabOrder = 2
      Visible = True
      OnChange = lVidTovChange
    end
  end
  object dsPostFromGroupCutting: TMSDataSource
    DataSet = quPostFromGroupCutting
    Left = 456
    Top = 64
  end
  object quPostFromGroupCutting: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  p.PostNo'
      '      , p.Name'
      '      , gc.NameGropCutting'
      '      , vt.VidName'
      ' from l_PostGroupCutting l inner join'
      '      Post p on p.PostNo = l.PostNo left join'
      '      GroupCutting gc on gc.id = l.GroupCuttingId left join'
      '      VidTov vt on vt.VidNo = l.GroupCuttingVidNo'
      '  where 1=1'
      '&_wherePost'
      '&_whereGroupCutting'
      '&_whereVidTov'
      'order by &_order')
    Left = 456
    Top = 88
    MacroData = <
      item
        Name = '_wherePost'
      end
      item
        Name = '_whereGroupCutting'
      end
      item
        Name = '_whereVidTov'
      end
      item
        Name = '_order'
        Value = ' p.Name'
      end>
    object quPostFromGroupCuttingPostNo: TSmallintField
      DisplayLabel = #8470
      FieldName = 'PostNo'
    end
    object quPostFromGroupCuttingName: TStringField
      DisplayLabel = #1055#1072#1088#1090#1085#1077#1088
      FieldName = 'Name'
      Size = 30
    end
    object quPostFromGroupCuttingNameGropCutting: TStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 20
      FieldName = 'NameGropCutting'
      Size = 50
    end
    object quPostFromGroupCuttingVidName: TStringField
      DisplayLabel = #1042#1080#1076
      DisplayWidth = 20
      FieldName = 'VidName'
      Size = 30
    end
  end
  object dsGroupCutting: TMSDataSource
    DataSet = quGroupCutting
    Left = 456
    Top = 144
  end
  object quGroupCutting: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from GroupCutting')
    Left = 456
    Top = 168
    object quGroupCuttingid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object quGroupCuttingNameGropCutting: TStringField
      FieldName = 'NameGropCutting'
      Size = 50
    end
    object quGroupCuttingPriorityGroupCutting: TIntegerField
      FieldName = 'PriorityGroupCutting'
    end
    object quGroupCuttingPercentGroupCutting: TIntegerField
      FieldName = 'PercentGroupCutting'
    end
  end
  object dsPost: TMSDataSource
    DataSet = quPost
    Left = 456
    Top = 199
  end
  object quPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from Post')
    Left = 456
    Top = 223
    object quPostPostNo: TSmallintField
      DisplayLabel = #1050#1086#1076' '#1087#1072#1088#1090#1085#1077#1088#1072
      FieldName = 'PostNo'
    end
    object quPostName: TStringField
      DisplayLabel = #1055#1072#1088#1090#1085#1077#1088
      FieldName = 'Name'
      Size = 30
    end
  end
  object dsVidTov: TMSDataSource
    DataSet = quVidTov
    Left = 456
    Top = 252
  end
  object quVidTov: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      ' from VidTov')
    Left = 456
    Top = 276
    object quVidTovVidNo: TSmallintField
      FieldName = 'VidNo'
    end
    object quVidTovVidName: TStringField
      FieldName = 'VidName'
      Size = 30
    end
  end
end
