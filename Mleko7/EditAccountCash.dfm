inherited fmEditAccountCash: TfmEditAccountCash
  Left = 943
  Top = 298
  Width = 427
  Height = 370
  Caption = #1057#1087#1080#1089#1086#1082' '#1084#1072#1090'. '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1093' '#1083#1080#1094
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 291
    Width = 411
    Height = 41
    Align = alBottom
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      Kind = bkOK
    end
    object bbCancel: TBitBtn
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 411
    Height = 291
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 6
      Top = 6
      Width = 399
      Height = 279
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsAccountCash
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      OnKeyPress = DBGrid1KeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1077' '#1083#1080#1094#1072
          Width = 382
          Visible = True
        end>
    end
  end
  object quAccountCash: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT Name, PostNo'
      'FROM Post'
      'WHERE  AccountCash = 1 '
      'ORDER BY Name')
    Left = 43
    Top = 189
    object quAccountCashName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object quAccountCashPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'BASE.Post.PostNo'
    end
  end
  object dsAccountCash: TDataSource
    DataSet = quAccountCash
    Left = 7
    Top = 189
  end
end
