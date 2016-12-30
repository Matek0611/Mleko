inherited fmOrdersRash: TfmOrdersRash
  Left = 440
  Top = 238
  ActiveControl = RxDBGrid1
  BorderStyle = bsSingle
  Caption = #1056#1072#1089#1093#1086#1076#1099
  ClientHeight = 366
  ClientWidth = 611
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 325
    Width = 611
    Height = 41
    Align = alBottom
    TabOrder = 0
    object bbOk: TBitBtn
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
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
    object bbCancel: TBitBtn
      Left = 320
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
    object bbPrint: TBitBtn
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 2
      OnClick = bbPrintClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object RxDBGrid1: TRxDBGrid [1]
    Left = 0
    Top = 0
    Width = 611
    Height = 325
    Align = alClient
    DataSource = dsPlat
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RxDBGrid1DblClick
    OnKeyDown = RxDBGrid1KeyDown
    ClearSelection = False
    MultiSelect = True
    TitleButtons = True
    OnTitleBtnClick = RxDBGrid1TitleBtnClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PlatNo'
        Title.Caption = #1050#1086#1076
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nom'
        Title.Caption = #8470
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DatePlat'
        Title.Caption = #1044#1072#1090#1072
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameBuh'
        Title.Caption = #1058#1080#1087
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #1055#1072#1088#1090#1085#1077#1088
        Width = 201
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Summa'
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kass_num'
        Title.Caption = #1050#1072#1089#1089#1072' '#8470
        Visible = True
      end>
  end
  object quPlatR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'select PlatR.PlatNo,PlatR.Nom,PlatR.PostNo,PlatR.Summa,PlatR.Dat' +
        'ePlat,'
      '       PlatR.Spravka,PlatR.Buh,Post.Name,f.num as  kass_num '
      
        'from PlatR join Post on (Post.PostNo=PlatR.PostNo) and PlatR.is_' +
        'econom=0'
      
        'left outer join d_fiscal f on upper(f.HostName)=upper(PlatR.Host' +
        'NAme)'
      'where &_where'
      'order by &_order')
    CachedUpdates = True
    UpdateObject = UpdateSQL1
    BeforePost = quPlatRBeforePost
    BeforeDelete = quPlatRBeforeDelete
    OnNewRecord = quPlatRNewRecord
    Left = 128
    Top = 88
    MacroData = <
      item
        Name = '_where'
        Value = '0=0'
      end
      item
        Name = '_order'
        Value = 'PlatNo'
      end>
    object quPlatRPlatNo: TIntegerField
      FieldName = 'PlatNo'
      Origin = 'PlatR.PlatNo'
    end
    object quPlatRNom: TIntegerField
      FieldName = 'Nom'
      Origin = 'PlatR.Nom'
    end
    object quPlatRPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'PlatR.PostNo'
    end
    object quPlatRName: TStringField
      FieldName = 'Name'
      Origin = 'Post.Name'
      Size = 30
    end
    object quPlatRDatePlat: TDateTimeField
      FieldName = 'DatePlat'
      Origin = 'PlatR.DatePlat'
      EditMask = '!90/90/0099;1;_'
    end
    object quPlatRBuh: TSmallintField
      FieldName = 'Buh'
      Origin = 'PlatR.Buh'
    end
    object quPlatRNameBuh: TStringField
      FieldKind = fkLookup
      FieldName = 'NameBuh'
      LookupDataSet = quBuhTipPlat
      LookupKeyFields = 'TipNo'
      LookupResultField = 'TipName'
      KeyFields = 'Buh'
      Size = 10
      Lookup = True
    end
    object quPlatRSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'PlatR.Summa'
      DisplayFormat = '0.00'
    end
    object quPlatRSpravka: TStringField
      FieldName = 'Spravka'
      Origin = 'PlatR.Spravka'
      Size = 55
    end
    object quPlatRkass_num: TIntegerField
      FieldName = 'kass_num'
      Origin = 'd_fiscal.num'
      ReadOnly = True
    end
  end
  object dsPlat: TDataSource
    DataSet = quPlatR
    Left = 128
    Top = 144
  end
  object UpdateSQL1: TMSUpdateSQL
    InsertSQL.Strings = (
      'insert into PlatR'
      '  (PlatNo, Nom, PostNo, Summa, DatePlat, Spravka, Buh)'
      'values'
      '  (:PlatNo, :Nom, :PostNo, :Summa, :DatePlat, :Spravka, :Buh)')
    DeleteSQL.Strings = (
      'delete from PlatR'
      'where'
      '  PlatNo = :OLD_PlatNo')
    ModifySQL.Strings = (
      'update PlatR'
      'set'
      '  PlatNo = :PlatNo,'
      '  Nom = :Nom,'
      '  PostNo = :PostNo,'
      '  Summa = :Summa,'
      '  DatePlat = :DatePlat,'
      '  Spravka = :Spravka,'
      '  Buh = :Buh'
      'where'
      '  PlatNo = :OLD_PlatNo')
    Left = 128
    Top = 200
  end
  object quBuhTipPlat: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select TipNo,TipName'
      'from TipNakl'
      'order by TipNo')
    Active = True
    Left = 224
    Top = 88
    object quBuhTipPlatTipNo: TSmallintField
      FieldName = 'TipNo'
      Origin = 'TipNakl.TipNo'
    end
    object quBuhTipPlatTipName: TStringField
      FieldName = 'TipName'
      Origin = 'TipNakl.TipName'
      Size = 10
    end
  end
end
