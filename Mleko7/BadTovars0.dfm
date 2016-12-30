inherited fmBadTovars: TfmBadTovars
  Left = 475
  Top = 147
  Width = 544
  Height = 375
  Caption = #1055#1088#1086#1089#1088#1086#1095#1077#1085#1085#1099#1081' '#1090#1086#1074#1072#1088
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid [0]
    Left = 0
    Top = 0
    Width = 528
    Height = 295
    Align = alClient
    DataSource = dsBadTovars
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = RxDBGrid1KeyDown
    TitleButtons = True
    OnTitleBtnClick = RxDBGrid1TitleBtnClick
    Columns = <
      item
        Expanded = False
        FieldName = 'TovarNo'
        ReadOnly = True
        Title.Caption = #1050#1086#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VidName'
        ReadOnly = True
        Title.Caption = #1042#1080#1076
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameTovar'
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 225
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Visible = True
      end>
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 295
    Width = 528
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbExit: TBitBtn
      Left = 416
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 2
      TabOrder = 0
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object quBadTovars: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select  BadTovars.TovarNo'
      '      , BadTovars.Kol'
      '      , Tovar.NameTovar'
      '      , VidTov.VidName'
      'from BadTovars'
      '   , Tovar left outer join '
      '     VidTov on (VidTov.VidNo=Tovar.VidNo)'
      'where BadTovars.TovarNo = Tovar.TovarNo'
      'order by &_order')
    CachedUpdates = True
    UpdateObject = UpdateBadTovars
    BeforePost = quBadTovarsBeforePost
    BeforeDelete = quBadTovarsBeforeDelete
    OnNewRecord = quBadTovarsNewRecord
    Left = 136
    Top = 16
    MacroData = <
      item
        Name = '_order'
        Value = 'VidName,NameTovar'
      end>
    object quBadTovarsTovarNo: TSmallintField
      FieldName = 'TovarNo'
      Origin = 'TopTovars.TovarNo'
    end
    object quBadTovarsKol: TFloatField
      FieldName = 'Kol'
      Origin = 'TopTovars.Kol'
    end
    object quBadTovarsNameTovar: TStringField
      FieldName = 'NameTovar'
      Origin = 'Tovar.NameTovar'
      Size = 30
    end
    object quBadTovarsVidName: TStringField
      FieldName = 'VidName'
      Origin = 'TopTovars.TovarNo'
      Size = 30
    end
  end
  object dsBadTovars: TDataSource
    DataSet = quBadTovars
    Left = 136
    Top = 72
  end
  object UpdateBadTovars: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into BadTovars'
      '  (TovarNo, Kol)'
      'values'
      '  (:TovarNo, :Kol)')
    DeleteSQL.Strings = (
      'delete from BadTovars'
      'where'
      '  TovarNo = :OLD_TovarNo')
    ModifySQL.Strings = (
      'update BadTovars'
      'set'
      '  TovarNo = :TovarNo,'
      '  Kol = :Kol'
      'where'
      '  TovarNo = :OLD_TovarNo')
    Left = 136
    Top = 128
  end
end
