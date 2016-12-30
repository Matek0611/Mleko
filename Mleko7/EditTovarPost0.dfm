object fmEditTovarPost: TfmEditTovarPost
  Left = 900
  Top = 317
  Width = 472
  Height = 415
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 7
    Top = 19
    Width = 61
    Height = 13
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090':'
  end
  object Label15: TLabel
    Left = 8
    Top = 134
    Width = 179
    Height = 14
    Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1081' '#1082#1086#1076'  '#1090#1086#1074#1072#1088#1072' '#1091' '#1087#1072#1088#1090#1085#1077#1088#1072
  end
  object Label16: TLabel
    Left = 9
    Top = 178
    Width = 139
    Height = 27
    Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1077#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072' '#1091' '#1087#1072#1088#1090#1085#1077#1088#1072
    Transparent = False
    WordWrap = True
  end
  object cbPostForTovar: TDBLookupComboBox
    Left = 88
    Top = 16
    Width = 273
    Height = 21
    KeyField = 'PostNo'
    ListField = 'NameLong'
    ListSource = dsPostForTovar
    TabOrder = 0
  end
  object TovarNoPost: TDBEdit
    Left = 8
    Top = 153
    Width = 188
    Height = 22
    DataField = 'TovarNoPost'
    DataSource = dsTovarPost
    MaxLength = 9
    TabOrder = 1
  end
  object NameTovarPost: TDBEdit
    Left = 11
    Top = 209
    Width = 323
    Height = 22
    DataField = 'NameTovarPost'
    DataSource = dsTovarPost
    TabOrder = 2
  end
  object ftTovar: TcitDBComboEdit
    Left = 42
    Top = 99
    Width = 282
    Height = 21
    Enabled = True
    OwnesLButton = True
    OwnesLLabel = True
    LBtnAlignment = baRight
    LBtnDown = False
    LBtnGroupIndex = 0
    LBtnAllowAllUp = False
    LBtnGlyphKind = gkDots
    LBtnShortCut1 = 115
    LBtnShortCut2 = 40
    LBtnWidth = 25
    LLblAlignment = laLeft
    LLblCaption = #1058#1086#1074#1072#1088
    LLblWidth = 40
    LLblFont.Charset = DEFAULT_CHARSET
    LLblFont.Color = clWindowText
    LLblFont.Height = -11
    LLblFont.Name = 'MS Sans Serif'
    LLblFont.Style = []
    LLblRequiredFont.Charset = DEFAULT_CHARSET
    LLblRequiredFont.Color = clWindowText
    LLblRequiredFont.Height = -11
    LLblRequiredFont.Name = 'MS Sans Serif'
    LLblRequiredFont.Style = [fsBold]
    Required = False
    TabOrder = 3
    Visible = True
    LocateKey = False
    KeyField = 'TovarNo'
    TextField = 'NameTovar'
    EntityCode = 'Tovar'
    OnIsSelect = ftTovarIsSelect
    EditStyle = edSelect
    AutoTabControl = False
  end
  object quTovarPost: TMSQuery
    SQLInsert.Strings = (
      'INSERT INTO TovarPost'
      
        '  (PostNo, TovarNo, TovarNoPost, NameTovarPost, NameTovar, NameT' +
        'ovarShort, BarCode)'
      'VALUES'
      
        '  (:PostNo, :TovarNo, :TovarNoPost, :NameTovarPost, :NameTovar, ' +
        ':NameTovarShort, :BarCode)'
      'SET :id = SCOPE_IDENTITY()')
    SQLDelete.Strings = (
      'DELETE FROM TovarPost'
      'WHERE'
      '  id = :Old_id')
    SQLUpdate.Strings = (
      'UPDATE TovarPost'
      'SET'
      '  PostNo = :PostNo, '
      '  TovarNo = :TovarNo, '
      '  TovarNoPost = :TovarNoPost, '
      '  NameTovarPost = :NameTovarPost,'
      '  NameTovar = :NameTovar, '
      '  NameTovarShort = :NameTovarShort, '
      '  BarCode = :BarCode'
      'WHERE'
      '  id = :Old_id')
    SQLRefresh.Strings = (
      'SELECT TovarPost.PostNo, '
      '       TovarPost.TovarNo, '
      '       TovarPost.TovarNoPost,'
      '       TovarPost.NameTovarPost, '
      '       TovarPost.NameTovar, '
      '       TovarPost.NameTovarShort, '
      '       TovarPost.BarCode '
      ' FROM TovarPost'
      '  WHERE id = :id')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'Select * '
      ' from TovarPost '
      '  where TovarNo = Isnull(:TovarNo ,TovarNo)'
      '    and (PostNO = Isnull(:PostNo ,PostNo)'
      '    and PostNO in (select PostNo'
      '                    from dbo.Post_Mail'
      '                     where (LEN(Mail1) > 0) OR'
      '                           (LEN(Mail2) > 0) OR'
      '                           (LEN(Mail3) > 0)))')
    Left = 424
    Top = 345
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TovarNo'
      end
      item
        DataType = ftInteger
        Name = 'PostNo'
        Value = 490
      end>
    object quTovarPostid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
    end
    object quTovarPostPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quTovarPostTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object quTovarPostTovarNoPost: TIntegerField
      DisplayWidth = 128
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
  object dsTovarPost: TDataSource
    DataSet = quTovarPost
    Left = 393
    Top = 345
  end
  object dsPostForTovar: TDataSource
    DataSet = quPostForTovar
    Left = 393
    Top = 313
  end
  object quPostForTovar: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select PostNo,'
      '       Name,'
      '       Isnull(NameLong,Name) NameLong'
      ' from Post'
      '  where Post.Trash=0 '
      '    and Post.Visible=0'
      '    and PostNO = Isnull( :PostNo ,PostNo)'
      '    and PostNO in (select PostNo'
      '                    from dbo.Post_Mail'
      '                     where (LEN(Mail1) > 0) OR'
      '                           (LEN(Mail2) > 0) OR'
      '                           (LEN(Mail3) > 0)))'
      'order by NameLong')
    Filtered = True
    Left = 424
    Top = 313
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PostNo'
      end>
    object quPostForTovarPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quPostForTovarName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object quPostForTovarNameLong: TStringField
      FieldName = 'NameLong'
      Size = 80
    end
  end
end
