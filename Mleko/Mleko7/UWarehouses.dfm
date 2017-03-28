inherited frmWarehouses: TfrmWarehouses
  Left = 386
  Top = 331
  BorderStyle = bsDialog
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1082#1083#1072#1076#1086#1074
  ClientHeight = 280
  ClientWidth = 484
  OldCreateOrder = True
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnAdd: TButton [0]
    Left = 286
    Top = 242
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = btnAddClick
  end
  object btnOK: TButton [1]
    Left = 16
    Top = 242
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnDelete: TButton [2]
    Left = 376
    Top = 242
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object dbgWarehouses: TDBGridEh [3]
    Left = 8
    Top = 8
    Width = 521
    Height = 219
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dsWarehouses
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
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnCellClick = dbgWarehousesCellClick
    OnTitleBtnClick = dbgWarehousesTitleBtnClick
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
  object btnCancel: TButton [4]
    Left = 120
    Top = 242
    Width = 75
    Height = 25
    Anchors = [akBottom]
    Cancel = True
    Caption = #1054#1090#1082#1072#1079
    ModalResult = 2
    TabOrder = 4
  end
  inherited ActionList: TActionList
    Left = 32
    Top = 64
  end
  object dsWarehouses: TDataSource
    DataSet = tbWarehouses
    Left = 72
    Top = 72
  end
  object quMaxID: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select isnull((select max(id) from dbo.Warehouses), 0) as ID')
    Left = 160
    Top = 80
    object quMaxIDID: TSmallintField
      FieldName = 'ID'
      ReadOnly = True
    end
  end
  object tbWarehouses: TMSTable
    TableName = 'dbo.Warehouses'
    OrderFields = 'id'
    Connection = dmDataModule.DB
    AutoCalcFields = False
    Left = 240
    Top = 88
    object tbWarehousesid: TSmallintField
      FieldName = 'id'
      Origin = 'work.dbo.Stores.id'
    end
    object tbWarehousesName: TStringField
      FieldName = 'Name'
      Origin = 'work.dbo.Stores.Name'
      Size = 50
    end
    object tbWarehousesActive: TBooleanField
      FieldName = 'Active'
      Origin = 'work.dbo.Stores.Active'
    end
  end
end
