object ListMinusPostPaymentForm: TListMinusPostPaymentForm
  Left = 988
  Top = 437
  Width = 482
  Height = 336
  Caption = 'ListMinusPostPaymentForm'
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
    Width = 466
    Height = 256
    Align = alClient
    DataSource = dsListMinusPostPayment
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
        Width = 349
      end
      item
        EditButtons = <>
        FieldName = 'CheckMinus'
        Footers = <>
        Title.Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100
        Width = 74
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 256
    Width = 466
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
    object Jnvtyf: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = JnvtyfClick
    end
  end
  object dsListMinusPostPayment: TMSDataSource
    DataSet = quListMinusPostPayment
  end
  object quListMinusPostPayment: TMSQuery
    SQLUpdate.Strings = (
      'update ListMinusPostPayment'
      ' set CheckMinus = :CheckMinus'
      'where PostNo = :PostNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select lmp.PostNo'
      '      ,p.Name '
      '      ,lmp.CheckMinus'
      ' from ListMinusPostPayment lmp inner join'
      '      Post p on p.PostNo = lmp.PostNo')
    Left = 24
    object quListMinusPostPaymentPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quListMinusPostPaymentName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object quListMinusPostPaymentCheckMinus: TBooleanField
      FieldName = 'CheckMinus'
    end
  end
end
