object fmTovarPost: TfmTovarPost
  Left = 626
  Top = 262
  Width = 870
  Height = 640
  Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1090#1086#1074#1072#1088#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbFilterPost: TLabel
    Left = 17
    Top = 168
    Width = 152
    Height = 13
    Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091':'
  end
  object lbFilterBarCode: TLabel
    Left = 238
    Top = 168
    Width = 143
    Height = 13
    Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1096#1090#1088#1080#1093#1082#1086#1076#1091':'
  end
  object lbFilterNameTovar: TLabel
    Left = 399
    Top = 168
    Width = 204
    Height = 13
    Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1102' '#1090#1086#1074#1072#1088#1072':'
  end
  object sbNewItems: TSpeedButton
    Left = 16
    Top = 8
    Width = 23
    Height = 22
    OnClick = sbNewItemsClick
  end
  object bbOk: TButton
    Left = 288
    Top = 568
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 0
    OnClick = bbOkClick
  end
  object bbCancel: TButton
    Left = 368
    Top = 568
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = bbCancelClick
  end
  object bbApply: TButton
    Left = 448
    Top = 568
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = bbApplyClick
  end
  object dbgTovarPost: TDBGridEh
    Left = 16
    Top = 208
    Width = 825
    Height = 233
    DataSource = dsTovarPost
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'PostNo'
        Footers = <>
        ReadOnly = True
        Title.Caption = #8470' '#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      end
      item
        EditButtons = <>
        FieldName = 'NameLong'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
        Width = 110
      end
      item
        EditButtons = <>
        FieldName = 'TovarNo'
        Footers = <>
        ReadOnly = True
        Title.Caption = #8470' '#1058#1086#1074#1072#1088#1072
      end
      item
        EditButtons = <>
        FieldName = 'TovarNoPost'
        Footers = <>
        Title.Caption = #8470' '#1058#1086#1074#1072#1088#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      end
      item
        EditButtons = <>
        FieldName = 'NameTovarPost'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
      end
      item
        EditButtons = <>
        FieldName = 'NameTovar'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      end
      item
        EditButtons = <>
        FieldName = 'NameTovarShort'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1088#1086#1090#1082#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      end
      item
        EditButtons = <>
        FieldName = 'BarCode'
        Footers = <>
        Title.Caption = #1064#1090#1088#1080#1093#1082#1086#1076
      end>
  end
  object cbFilterPost: TDBLookupComboboxEh
    Left = 16
    Top = 184
    Width = 209
    Height = 21
    EditButtons = <>
    KeyField = 'PostNo'
    ListField = 'NameLong'
    ListSource = dsFilterPost
    TabOrder = 4
    Visible = True
    OnExit = cbFilterPostExit
  end
  object cbFilterBarCode: TDBLookupComboboxEh
    Left = 240
    Top = 184
    Width = 145
    Height = 21
    EditButtons = <>
    KeyField = 'BarCode'
    ListField = 'BarCode'
    ListSource = dsFilterBarCode
    TabOrder = 5
    Visible = True
    OnExit = cbFilterBarCodeExit
  end
  object cbFilterNameTovar: TDBLookupComboboxEh
    Left = 400
    Top = 184
    Width = 249
    Height = 21
    EditButtons = <>
    KeyField = 'TovarNo'
    ListField = 'NameTovar'
    ListSource = dsFilterNameTovar
    TabOrder = 6
    Visible = True
    OnExit = cbFilterNameTovarExit
  end
  object dsTovarPost: TDataSource
    DataSet = quTovarPost
    Left = 784
    Top = 568
  end
  object quTovarPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select tp.*,p.NameLong'
      ' from TovarPost tp left join'
      '      Post p on tp.PostNo = p.PostNo'
      '  where tp.PostNO = Isnull( :PostNo ,tp.PostNo)'
      '    and tp.BarCode = Isnull( :BarCode ,tp.BarCode)'
      '    and tp.TovarNo = Isnull( :TovarNo ,tp.TovarNo)')
    Left = 816
    Top = 568
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end
      item
        DataType = ftLargeint
        Name = 'BarCode'
      end
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end>
    object quTovarPostid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object quTovarPostPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quTovarPostNameLong: TStringField
      FieldName = 'NameLong'
      Size = 80
    end
    object quTovarPostTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarPostTovarNoPost: TIntegerField
      FieldName = 'TovarNoPost'
    end
    object quTovarPostNameTovarPost: TStringField
      FieldName = 'NameTovarPost'
      Size = 128
    end
    object quTovarPostNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 128
    end
    object quTovarPostNameTovarShort: TStringField
      FieldName = 'NameTovarShort'
      Size = 64
    end
    object quTovarPostBarCode: TLargeintField
      FieldName = 'BarCode'
    end
  end
  object dsFilterPost: TDataSource
    DataSet = quFilterPost
    Left = 784
    Top = 540
  end
  object quFilterPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select distinct'
      '       tp.PostNo,'
      '       p.NameLong'
      ' from TovarPost tp left join'
      '      Post p on tp.PostNo = p.PostNo')
    Left = 816
    Top = 540
    object quFilterPostPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quFilterPostNameLong: TStringField
      FieldName = 'NameLong'
      Size = 80
    end
  end
  object dsFilterBarCode: TDataSource
    DataSet = quFilterBarCode
    Left = 784
    Top = 511
  end
  object quFilterBarCode: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select tp.BarCode'
      ' from TovarPost tp')
    Left = 816
    Top = 511
    object quFilterBarCodeBarCode: TLargeintField
      FieldName = 'BarCode'
    end
  end
  object dsFilterNameTovar: TDataSource
    DataSet = quFilterNameTovar
    Left = 784
    Top = 482
  end
  object quFilterNameTovar: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select distinct tp.NameTovar,'
      '                tp.TovarNo'
      ' from TovarPost tp')
    Left = 816
    Top = 482
    object quFilterNameTovarNameTovar: TStringField
      FieldName = 'NameTovar'
      Size = 128
    end
    object quFilterNameTovarTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
  end
end
