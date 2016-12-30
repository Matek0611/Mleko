object ListPostForMail: TListPostForMail
  Left = 664
  Top = 277
  Width = 901
  Height = 451
  Caption = #1057#1087#1080#1089#1086#1082' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074' '#1076#1083#1103' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1085#1072#1082#1083#1072#1076#1085#1099#1093' '#1087#1086' '#1101#1083'. '#1087#1086#1095#1090#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Ok: TButton
    Left = 232
    Top = 368
    Width = 113
    Height = 25
    Caption = #1054#1050
    TabOrder = 0
    OnClick = OkClick
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 881
    Height = 353
    DataSource = dsListPostForMail
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
        FieldName = 'NameLong'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'Address'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 400
      end
      item
        EditButtons = <>
        FieldName = 'DateBeg'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      end
      item
        EditButtons = <>
        FieldName = 'DateEnd'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      end
      item
        EditButtons = <>
        FieldName = 'Check1'
        Footers = <>
        Title.Caption = #1054#1090#1087#1088#1072#1074#1082#1072
        Width = 54
      end
      item
        EditButtons = <>
        FieldName = 'PostNo'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'AddresNo'
        Footers = <>
        Visible = False
      end>
  end
  object Cencel: TButton
    Left = 432
    Top = 368
    Width = 123
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = CencelClick
  end
  object quListPostForMail: TMSQuery
    SQLUpdate.Strings = (
      'UPDATE ListPostMail'
      'SET'
      '  Check1 = :Check1'
      'WHERE'
      '  PostNo = :Old_PostNo AND AddresNo = :Old_AddresNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select p.NameLong'
      '      ,ap.Address'
      '      ,lp.DateBeg'
      '      ,lp.DateEnd'
      '      ,lp.Check1'
      '      ,lp.PostNo'
      '      ,lp.AddresNo'
      ' from ListPostMail lp left join '
      '      Post p on lp.PostNo = p.PostNo left join'
      
        '      AddressPost ap on lp.AddresNo = ap.AddressNo and lp.PostNo' +
        ' = ap.PostNo'
      'order by p.NameLong')
    Left = 24
    Top = 48
    object quListPostForMailNameLong: TStringField
      FieldName = 'NameLong'
      LookupDataSet = dmDataModule.quPost
      KeyFields = 'PostNo'
      Size = 80
    end
    object quListPostForMailAddress: TStringField
      FieldName = 'Address'
      Size = 256
    end
    object quListPostForMailDateBeg: TWideStringField
      FieldName = 'DateBeg'
      Size = 10
    end
    object quListPostForMailDateEnd: TWideStringField
      FieldName = 'DateEnd'
      Size = 10
    end
    object quListPostForMailCheck1: TBooleanField
      FieldName = 'Check1'
    end
    object quListPostForMailPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quListPostForMailAddresNo: TSmallintField
      FieldName = 'AddresNo'
    end
  end
  object dsListPostForMail: TDataSource
    DataSet = quListPostForMail
    Left = 48
    Top = 48
  end
end
