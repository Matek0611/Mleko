inherited fmPodotchetR: TfmPodotchetR
  Left = 79
  Top = 118
  Width = 669
  Height = 399
  Caption = #1055#1086#1076#1086#1090#1095#1077#1090
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 320
    Width = 661
    Height = 52
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 552
      Top = 16
      Width = 91
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 1
      Kind = bkCancel
    end
    object bbPriview: TBitBtn
      Left = 456
      Top = 16
      Width = 91
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
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
    Width = 661
    Height = 320
    Align = alClient
    AllowedSelections = [gstRecordBookmarks, gstColumns, gstAll]
    DataSource = dsPodotchetR
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnKeyDown = DBGridEh1KeyDown
    OnKeyPress = DBGridEh1KeyPress
    OnTitleBtnClick = DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'PodotchetNom'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #8470
        Title.TitleButton = True
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'DatePodotche'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Title.TitleButton = True
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'NaklNo'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1082#1083'. '#8470
        Title.TitleButton = True
        Width = 57
      end
      item
        EditButtons = <>
        FieldName = 'DateNaklFirst'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083'.'
        Title.TitleButton = True
        Width = 63
      end
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 171
      end
      item
        EditButtons = <>
        FieldName = 'SotrudName'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        Title.TitleButton = True
        Width = 116
      end
      item
        EditButtons = <>
        FieldName = 'Summa'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1057#1091#1084#1084#1072
        Title.TitleButton = True
        Width = 62
      end
      item
        EditButtons = <>
        FieldName = 'SummaDolg'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1086#1083#1075
        Title.TitleButton = True
        Width = 61
      end>
  end
  object quPodotchetR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Podotchetr.PodotchetRNo, Podotchetr.PodotchetNom, Nak' +
        'lr.NaklNo, Naklr.DateNaklFirst, Podotchetr.Summa, Sotrud.SotrudN' +
        'ame, '
      
        '                      Podotchetr.Summa - Podotchetr.SummaPlat AS' +
        ' SummaDolg, Podotchetr.DatePodotche, Post.Name'
      'FROM         PodotchetR Podotchetr INNER JOIN'
      
        '                      NaklR Naklr ON Podotchetr.NaklNo = Naklr.N' +
        'aklNo INNER JOIN'
      
        '                      Post Post ON Naklr.PostNoFirst = Post.Post' +
        'No INNER JOIN'
      
        '                      Sotrud Sotrud ON Podotchetr.SotrudNo = Sot' +
        'rud.SotrudNo'
      'WHERE &_where '
      'ORDER BY &_order'
      ''
      ''
      '')
    CachedUpdates = True
    Left = 40
    Top = 32
    MacroData = <
      item
        Name = '_where'
        Value = '0=0'
      end
      item
        Name = '_order'
        Value = '0=0'
      end>
    object quPodotchetRPodotchetNom: TStringField
      FieldName = 'PodotchetNom'
      FixedChar = True
      Size = 10
    end
    object quPodotchetRNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quPodotchetRDateNaklFirst: TDateTimeField
      FieldName = 'DateNaklFirst'
    end
    object quPodotchetRSumma: TFloatField
      FieldName = 'Summa'
    end
    object quPodotchetRSotrudName: TStringField
      FieldName = 'SotrudName'
      FixedChar = True
      Size = 30
    end
    object quPodotchetRSummaDolg: TFloatField
      FieldName = 'SummaDolg'
    end
    object quPodotchetRDatePodotche: TDateTimeField
      FieldName = 'DatePodotche'
    end
    object quPodotchetRName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object quPodotchetRPodotchetRNo: TSmallintField
      FieldName = 'PodotchetRNo'
    end
  end
  object dsPodotchetR: TDataSource
    DataSet = quPodotchetR
    Left = 40
    Top = 96
  end
  object quPodotchetRPrint: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Podotchetr.PodotchetNom, Post.NameLong, Naklr.NaklNo,' +
        ' Naklr.DateNaklFirst, Podotchetr.Summa, Sotrud.SotrudName'
      'FROM         PodotchetR Podotchetr INNER JOIN'
      
        '                      NaklR Naklr ON Podotchetr.NaklNo = Naklr.N' +
        'aklNo INNER JOIN'
      
        '                      Post Post ON Naklr.PostNoFirst = Post.Post' +
        'No INNER JOIN'
      
        '                      Sotrud Sotrud ON Podotchetr.SotrudNo = Sot' +
        'rud.SotrudNo'
      'WHERE     (Podotchetr.PodotchetRNo = :PodotchetRNo)')
    Left = 80
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PodotchetRNo'
      end>
    object quPodotchetRPrintPodotchetNom: TStringField
      FieldName = 'PodotchetNom'
      FixedChar = True
      Size = 10
    end
    object quPodotchetRPrintNameLong: TStringField
      FieldName = 'NameLong'
      FixedChar = True
      Size = 80
    end
    object quPodotchetRPrintNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object quPodotchetRPrintDateNaklFirst: TDateTimeField
      FieldName = 'DateNaklFirst'
    end
    object quPodotchetRPrintSumma: TFloatField
      FieldName = 'Summa'
    end
    object quPodotchetRPrintSotrudName: TStringField
      FieldName = 'SotrudName'
      FixedChar = True
      Size = 30
    end
  end
  object frReportChek: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReportChekGetValue
    Left = 120
    Top = 32
    ReportForm = {19000000}
  end
end
