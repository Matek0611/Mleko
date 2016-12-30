object ListPlusPostPaymentForm: TListPlusPostPaymentForm
  Left = 643
  Top = 281
  Width = 483
  Height = 336
  Caption = 'ListPlusPostPaymentForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 467
    Height = 256
    Align = alClient
    DataSource = dsListPlusPostPayment
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
        Width = 360
      end
      item
        EditButtons = <>
        FieldName = 'CheckPlus'
        Footers = <>
        Title.Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100
        Width = 63
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 256
    Width = 467
    Height = 41
    Align = alBottom
    TabOrder = 1
    object OK: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = OKClick
    end
    object Cancel: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = CancelClick
    end
  end
  object dsListPlusPostPayment: TMSDataSource
    DataSet = quListPlusPostPayment
  end
  object quListPlusPostPayment: TMSQuery
    SQLUpdate.Strings = (
      'update ListPlusPostPayment'
      ' set CheckPlus = :CheckPlus'
      'where PostNo = :PostNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select lmp.PostNo'
      '      ,p.Name '
      '      ,lmp.CheckPlus'
      ' from ListPlusPostPayment lmp inner join'
      '      Post p on p.PostNo = lmp.PostNo')
    Left = 24
    object quListPlusPostPaymentPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quListPlusPostPaymentName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object quListPlusPostPaymentCheckPlus: TBooleanField
      FieldName = 'CheckPlus'
    end
  end
end
