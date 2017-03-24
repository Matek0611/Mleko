inherited frmSelectItemBuhDlg: TfrmSelectItemBuhDlg
  Left = 564
  Top = 299
  BorderStyle = bsDialog
  Caption = #1057#1087#1080#1089#1086#1082' '#1073#1091#1093#1075#1072#1083#1090#1077#1088#1086#1074
  ClientHeight = 217
  ClientWidth = 342
  OldCreateOrder = True
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnAdd: TButton [0]
    Left = 128
    Top = 176
    Width = 75
    Height = 25
    Anchors = [akBottom]
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
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object btnDelete: TButton [2]
    Left = 224
    Top = 176
    Width = 75
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object dbgBuhPersons: TDBGrid [3]
    Left = 8
    Top = 16
    Width = 320
    Height = 145
    DataSource = dsBuhPersons
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = dbgBuhPersonsCellClick
    OnDrawColumnCell = dbgBuhPersonsDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Person'
        Title.Caption = #1048#1084#1103
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Active'
        Title.Caption = #1040#1082#1090#1080#1074#1077#1085
        Width = 60
        Visible = True
      end>
  end
  object dsBuhPersons: TDataSource
    DataSet = tbBuhPersons
    Left = 72
    Top = 72
  end
  object quMaxID: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select max(id) as ID from dbo.Buh_Persons')
    Left = 160
    Top = 80
    object quMaxIDID: TSmallintField
      FieldName = 'ID'
      ReadOnly = True
    end
  end
  object tbBuhPersons: TMSTable
    TableName = 'dbo.Buh_Persons'
    OrderFields = 'id'
    Connection = dmDataModule.DB
    Left = 240
    Top = 96
    object tbBuhPersonsid: TSmallintField
      FieldName = 'id'
    end
    object tbBuhPersonsPerson: TStringField
      FieldName = 'Person'
    end
    object tbBuhPersonsActive: TBooleanField
      FieldName = 'Active'
    end
  end
  object quActive: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select ISNULL((select ID from dbo.Buh_Persons where Active=1), -' +
        '1) as ID')
    Left = 216
    Top = 56
    object quActiveID: TSmallintField
      FieldName = 'ID'
      ReadOnly = True
    end
  end
end
