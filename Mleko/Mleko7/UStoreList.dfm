inherited frmStoreList: TfrmStoreList
  Left = 394
  Top = 307
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1082#1083#1072#1076#1086#1074
  ClientHeight = 217
  ClientWidth = 536
  OldCreateOrder = True
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnAdd: TButton [0]
    Left = 174
    Top = 176
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = btnAddClick
  end
  object btnClose: TButton [1]
    Left = 24
    Top = 176
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Default = True
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object btnDelete: TButton [2]
    Left = 328
    Top = 176
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object dbgStores: TDBGridEh [3]
    Left = 8
    Top = 8
    Width = 521
    Height = 153
    DataSource = dsStores
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
    OnTitleBtnClick = dbgStoresTitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1082#1083#1072#1076#1072
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
      end
      item
        EditButtons = <>
        FieldName = 'Active'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1040#1082#1090#1080#1074#1077#1085
        Width = 60
      end>
  end
  inherited ActionList: TActionList
    Left = 32
    Top = 64
  end
  object dsStores: TDataSource
    DataSet = tbStores
    Left = 72
    Top = 72
  end
  object quMaxID: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select isnull((select max(id) from work.dbo.Stores), 0) as ID')
    Left = 160
    Top = 80
    object quMaxIDID: TSmallintField
      FieldName = 'ID'
      ReadOnly = True
    end
  end
  object tbStores: TMSTable
    TableName = 'work.dbo.Stores'
    OrderFields = 'id'
    Connection = dmDataModule.DB
    AutoCalcFields = False
    Left = 240
    Top = 88
    object tbStoresid: TSmallintField
      FieldName = 'id'
      Origin = 'work.dbo.Stores.id'
    end
    object tbStoresName: TStringField
      FieldName = 'Name'
      Origin = 'work.dbo.Stores.Name'
      Size = 50
    end
    object tbStoresActive: TBooleanField
      FieldName = 'Active'
      Origin = 'work.dbo.Stores.Active'
    end
  end
end
