inherited MlekoBlankSpecOutSideForm: TMlekoBlankSpecOutSideForm
  Left = 689
  Top = 226
  Width = 751
  Height = 468
  Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103' '#1074#1085#1077#1096#1085#1077#1075#1086' '#1079#1072#1082#1072#1079#1072
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 735
    Height = 429
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object DBGridEhOrderSpec: TDBGridEh
      Left = 1
      Top = 1
      Width = 733
      Height = 427
      Align = alClient
      DataSource = dsOrderSpec
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
    end
  end
  object dsOrderSpec: TDataSource
    DataSet = quOrderSpec
    Left = 56
  end
  object quOrderSpec: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select convert(int,OrderNo) as OrderNo'
      '      ,convert(int,Article) as Article'
      '      ,t.NameTovar'
      '      ,BrandTov'
      '      ,convert(Decimal(18,3),KolTov) as KolTov'
      '      ,convert(numeric(18,2),ltrim(rtrim(PriceTov))) as PriceTov'
      '      ,ivt.Residue '
      '      ,ivt.Need'
      ' from ImportOrderVebTmp ivt left join'
      '      Tovar t on ivt.Article = t.TovarNo'
      '  where OrderNo = :OdrerNo')
    Left = 85
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OdrerNo'
        Value = 0
      end>
  end
end
