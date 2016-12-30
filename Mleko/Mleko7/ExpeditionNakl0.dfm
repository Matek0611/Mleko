inherited fmExpeditionNakl: TfmExpeditionNakl
  Left = 372
  Top = 224
  Width = 853
  Height = 527
  Caption = #1057#1087#1080#1089#1086#1082' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 461
    Width = 837
    Height = 27
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 753
      Top = 4
      Width = 91
      Height = 23
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 2
      Kind = bkCancel
    end
    object bbOk: TBitBtn
      Left = 657
      Top = 4
      Width = 91
      Height = 23
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 1
      Kind = bkOK
    end
    object bbPriview: TBitBtn
      Left = 561
      Top = 4
      Width = 91
      Height = 23
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      TabOrder = 0
      OnClick = bbPriviewClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
    end
  end
  object DBGridEh1: TDBGridEh [1]
    Left = 0
    Top = 0
    Width = 837
    Height = 461
    Align = alClient
    AllowedSelections = [gstRecordBookmarks, gstColumns, gstAll]
    DataSource = dsNakl
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnGetCellParams = DBGridEh1GetCellParams
    OnKeyDown = DBGridEh1KeyDown
    OnKeyPress = DBGridEh1KeyPress
    OnTitleBtnClick = DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NaklNo'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1076
        Width = 74
      end
      item
        EditButtons = <>
        FieldName = 'DateNakl'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Width = 177
      end
      item
        EditButtons = <>
        FieldName = 'Address'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1040#1076#1088#1077#1089
        Width = 182
      end
      item
        EditButtons = <>
        FieldName = 'Summa'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'Weight'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1042#1077#1089
        Width = 46
      end
      item
        EditButtons = <>
        FieldName = 'KolPerPak'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1071#1097#1080#1082
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'vidnaklname'
        Footers = <>
        Title.Caption = #1042#1080#1076' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        Width = 112
      end>
  end
  object quNakl: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'SELECT u.naklno'
      '       ,u.nom'
      '       ,u.summa'
      '       ,u.datenakl'
      '       ,u.address'
      '       ,u.name'
      '       ,u.kolperpak'
      '       ,u.weight'
      '       ,u.sourcetable'
      '       ,v.vidnaklname'
      'FROM   (SELECT naklr.naklno'
      '               ,naklr.nom'
      '               ,naklr.summa'
      '               ,naklr.datenakl'
      '               ,addresspost.address'
      '               ,post.name'
      '               ,naklr.kolperpak'
      '               ,naklr.weight'
      '               ,'#39'NAKLR'#39'             AS sourcetable'
      '               ,naklr.vidnaklno'
      '        FROM   naklr'
      '               INNER JOIN addresspost'
      '                 ON naklr.postno = addresspost.postno'
      '                    AND naklr.addressno = addresspost.addressno'
      '               INNER JOIN post'
      '                 ON naklr.postno = post.postno'
      '        WHERE  (naklr.expeditionno = 0)'
      '        AND (naklr.datenakl >= :DateBegin)'
      '        AND (naklr.datenakl <= :DateEnd)'
      '        AND naklr.vidnaklno IN (1,3)'
      '        UNION ALL'
      '        SELECT b.id            AS naklno'
      '               ,b.subnum       AS nom'
      '               ,b.summa'
      '               ,b.datenakl'
      '               ,b.address'
      '               ,b.postname     AS name'
      '               ,0              AS kolperpak'
      '               ,b.weight'
      '               ,'#39'E_BLANK_HEAD'#39' AS sourcetable'
      '               ,vidnaklno'
      '        FROM   v_blanklist b'
      '        WHERE  (b.expeditionno = 0)'
      '        AND (b.datenakl >= :DateBegin)'
      '        AND (b.datenakl <= :DateEnd)'
      '        AND NOT EXISTS (SELECT 1'
      '                        FROM   naklr'
      '                        WHERE  id = b.id)'
      '        AND status = 0'
      '        AND summa <> 0) u'
      '       ,vidnakl v'
      'WHERE  u.vidnaklno = v.vidnaklno'
      'order by &_order')
    CachedUpdates = True
    Left = 40
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DateBegin'
      end
      item
        DataType = ftUnknown
        Name = 'DateEnd'
      end
      item
        DataType = ftUnknown
        Name = 'DateBegin'
      end
      item
        DataType = ftUnknown
        Name = 'DateEnd'
      end>
    MacroData = <
      item
        Name = '_order'
        Value = 'NaklNo'
      end>
    object quNaklNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quNaklNom: TIntegerField
      FieldName = 'Nom'
    end
    object quNaklSumma: TFloatField
      FieldName = 'Summa'
    end
    object quNaklAddress: TStringField
      FieldName = 'Address'
      FixedChar = True
      Size = 50
    end
    object quNaklName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object quNaklKolPerPak: TFloatField
      FieldName = 'KolPerPak'
      Precision = 10
    end
    object quNaklWeight: TFloatField
      FieldName = 'Weight'
      Precision = 10
    end
    object quNaklDateNakl: TDateTimeField
      FieldName = 'DateNakl'
    end
    object quNaklSourceTable: TStringField
      FieldName = 'SourceTable'
      FixedChar = True
    end
    object quNaklvidnaklname: TStringField
      FieldName = 'vidnaklname'
    end
  end
  object dsNakl: TDataSource
    DataSet = quNakl
    Left = 40
    Top = 96
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 174
    Top = 78
    ReportForm = {19000000}
  end
end
