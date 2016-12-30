inherited fmCrossReturne: TfmCrossReturne
  Left = 875
  Top = 244
  Width = 544
  Height = 375
  Caption = 'fmCrossReturne'
  Position = poOwnerFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 296
    Width = 528
    Height = 41
    Align = alBottom
    TabOrder = 0
    object bbExit: TBitBtn
      Left = 416
      Top = 8
      Width = 81
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
    object BitBtn1: TBitBtn
      Left = 328
      Top = 8
      Width = 81
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      TabOrder = 1
      OnClick = BitBtn1Click
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
  object DBGridEh1: TDBGridEh [1]
    Left = 0
    Top = 0
    Width = 528
    Height = 296
    Align = alClient
    DataSource = dsCrossPostNaklR
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghTraceColSizing]
    ParentShowHint = False
    RowHeight = 2
    RowLines = 1
    RowSizingAllowed = True
    ShowHint = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    UseMultiTitle = True
    VTitleMargin = 30
    OnColEnter = DBGridEh1ColEnter
  end
  object dsCrossPostNaklR: TDataSource
    DataSet = mdCrossReturne
    Left = 144
    Top = 104
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = dsCrossPrintNakl
    Left = 336
    Top = 160
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    Left = 144
    Top = 240
    ReportForm = {19000000}
  end
  object qKolR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     VidTov.VidName, Tovar.NameTovar, Rashod.Kol, Post.Nam' +
        'e, Post.PostNo, AddressPost.AddressNo, AddressPost.Address'
      'FROM         Rashod INNER JOIN'
      
        '                      Tovar ON Rashod.TovarNo = Tovar.TovarNo IN' +
        'NER JOIN'
      
        '                      NaklR ON Rashod.NaklNo = NaklR.NaklNo INNE' +
        'R JOIN'
      
        '                      Post ON NaklR.PostNoFirst = Post.PostNo IN' +
        'NER JOIN'
      
        '                      VidTov ON Tovar.VidNo = VidTov.VidNo INNER' +
        ' JOIN'
      
        '                      AddressPost ON NaklR.PostNoFirst = Address' +
        'Post.PostNo AND NaklR.AddressNo = AddressPost.AddressNo'
      'WHERE     (Rashod.Kol < 0)'
      
        '                   AND ((NaklR.DateNaklFirst >= :DatePostB) AND ' +
        ' (NaklR.DateNaklFirst <= :DatePostE))'
      'ORDER BY VidTov.VidName, Tovar.NameTovar, Post.Name')
    Left = 160
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DatePostB'
      end
      item
        DataType = ftUnknown
        Name = 'DatePostE'
      end>
    object qKolRVidName: TStringField
      FieldName = 'VidName'
      FixedChar = True
      Size = 30
    end
    object qKolRNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object qKolRKol: TFloatField
      FieldName = 'Kol'
    end
    object qKolRName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object qKolRPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qKolRAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object qKolRAddress: TStringField
      FieldName = 'Address'
      FixedChar = True
      Size = 50
    end
  end
  object mdCrossReturne: TRxMemoryData
    Active = True
    FieldDefs = <>
    Left = 144
    Top = 56
  end
  object qSummR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Rashod.Kol, Post.PostNo, Post.Name, Post.NameLong, Ra' +
        'shod.Kol * Rashod.PriceOut AS RashodSumm, NaklR.NaklNo, Tovar.Na' +
        'meTovar, '
      '                      AddressPost.Address, AddressPost.AddressNo'
      'FROM         Rashod INNER JOIN'
      
        '                      NaklR ON Rashod.NaklNo = NaklR.NaklNo INNE' +
        'R JOIN'
      
        '                      Post ON NaklR.PostNoFirst = Post.PostNo IN' +
        'NER JOIN'
      
        '                      Tovar ON Rashod.TovarNo = Tovar.TovarNo IN' +
        'NER JOIN'
      
        '                      AddressPost ON NaklR.PostNoFirst = Address' +
        'Post.PostNo AND NaklR.AddressNo = AddressPost.AddressNo'
      'WHERE     (Rashod.Kol < 0) '
      
        '                   AND ((NaklR.DateNaklFirst >= :DatePostB) AND ' +
        ' (NaklR.DateNaklFirst <= :DatePostE))'
      'ORDER BY Post.Name, AddressPost.Address, NaklR.NaklNo')
    Left = 232
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DatePostB'
      end
      item
        DataType = ftUnknown
        Name = 'DatePostE'
      end>
    object qSummRKol: TFloatField
      FieldName = 'Kol'
    end
    object qSummRName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object qSummRRashodSumm: TFloatField
      FieldName = 'RashodSumm'
    end
    object qSummRNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object qSummRNameLong: TStringField
      FieldName = 'NameLong'
      FixedChar = True
      Size = 80
    end
    object qSummRPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qSummRNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object qSummRAddress: TStringField
      FieldName = 'Address'
      FixedChar = True
      Size = 50
    end
    object qSummRAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
  end
  object mdCrossSumm: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'PostName'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NaklNom'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Summ'
        DataType = ftFloat
      end
      item
        Name = 'PostNo'
        DataType = ftInteger
      end
      item
        Name = 'AddressNo'
        DataType = ftInteger
      end
      item
        Name = 'Address'
        DataType = ftString
        Size = 200
      end>
    Left = 232
    Top = 56
    object mdCrossSummPostName: TStringField
      FieldName = 'PostName'
      Size = 40
    end
    object mdCrossSummNaklNom: TStringField
      DisplayWidth = 255
      FieldName = 'NaklNom'
      Size = 255
    end
    object mdCrossSummSumm: TFloatField
      FieldName = 'Summ'
    end
    object mdCrossSummPostNo: TIntegerField
      FieldName = 'PostNo'
    end
    object mdCrossSummAddressNo: TIntegerField
      FieldName = 'AddressNo'
    end
    object mdCrossSummAddress: TStringField
      FieldName = 'Address'
      Size = 200
    end
  end
  object dsCrossPrintNakl: TDataSource
    DataSet = mdCrossPrintNakl
    Left = 336
    Top = 104
  end
  object mdCrossPrintNakl: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'PostName'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'NaklNom'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Summ'
        DataType = ftFloat
      end
      item
        Name = 'PostNo'
        DataType = ftInteger
      end
      item
        Name = 'Address'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'AddressNo'
        DataType = ftInteger
      end>
    Left = 336
    Top = 56
    object mdCrossPrintNaklPostName: TStringField
      FieldName = 'PostName'
      Size = 40
    end
    object mdCrossPrintNaklNaklNom: TStringField
      DisplayWidth = 255
      FieldName = 'NaklNom'
      Size = 255
    end
    object mdCrossPrintNaklSumm: TFloatField
      FieldName = 'Summ'
    end
    object mdCrossPrintNaklPostNo: TIntegerField
      FieldName = 'PostNo'
    end
    object mdCrossPrintNaklAddress: TStringField
      FieldName = 'Address'
      Size = 200
    end
    object mdCrossPrintNaklAddressNo: TIntegerField
      FieldName = 'AddressNo'
    end
  end
  object qPostR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT    Post.PostNo, Post.Name, Post.NameLong, NaklR.AddressNo' +
        ', AddressPost.Address'
      'FROM         Rashod INNER JOIN'
      
        '                      NaklR ON Rashod.NaklNo = NaklR.NaklNo INNE' +
        'R JOIN'
      
        '                      Post ON NaklR.PostNoFirst = Post.PostNo IN' +
        'NER JOIN'
      
        '                      AddressPost ON NaklR.PostNoFirst = Address' +
        'Post.PostNo AND NaklR.AddressNo = AddressPost.AddressNo'
      'WHERE     (Rashod.Kol < 0)'
      
        '                   AND ((NaklR.DateNaklFirst >= :DatePostB) AND ' +
        ' (NaklR.DateNaklFirst <= :DatePostE))'
      
        'GROUP BY Post.PostNo, Post.Name, Post.NameLong, AddressPost.Addr' +
        'ess, NaklR.AddressNo'
      'ORDER BY Post.Name, AddressPost.Address')
    Left = 32
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DatePostB'
      end
      item
        DataType = ftUnknown
        Name = 'DatePostE'
      end>
    object qPostRPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qPostRName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object qPostRNameLong: TStringField
      FieldName = 'NameLong'
      FixedChar = True
      Size = 80
    end
    object qPostRAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object qPostRAddress: TStringField
      FieldName = 'Address'
      FixedChar = True
      Size = 50
    end
  end
  object dsPostR: TDataSource
    DataSet = qPostR
    Left = 32
    Top = 128
  end
  object frDBDataSet2: TfrDBDataSet
    DataSource = dsCrossPostNaklR
    Left = 144
    Top = 160
  end
  object dsSummaR: TDataSource
    DataSet = qSummR
    Left = 232
    Top = 104
  end
  object mdCrossPrintTovar: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'PostNo'
        DataType = ftInteger
      end
      item
        Name = 'PostName'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Kol'
        DataType = ftFloat
      end
      item
        Name = 'RashodSumm'
        DataType = ftFloat
      end
      item
        Name = 'VidTovar'
        DataType = ftString
        Size = 20
      end>
    Left = 432
    Top = 56
    object mdCrossPrintTovarPostNo: TIntegerField
      FieldName = 'PostNo'
    end
    object mdCrossPrintTovarPostName: TStringField
      FieldName = 'PostName'
    end
    object mdCrossPrintTovarName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object mdCrossPrintTovarKol: TFloatField
      FieldName = 'Kol'
    end
    object mdCrossPrintTovarRashodSumm: TFloatField
      FieldName = 'RashodSumm'
    end
    object mdCrossPrintTovarVidTovar: TStringField
      FieldName = 'VidTovar'
    end
  end
  object dsCrossPrintTovar: TDataSource
    DataSet = qPrintTovar
    Left = 432
    Top = 104
  end
  object frDBDataSet3: TfrDBDataSet
    DataSource = dsCrossPrintTovar
    Left = 432
    Top = 160
  end
  object qPrintTovar: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     Tovar.TovarNo, VidTov.VidName, Tovar.NameTovar, NaklR' +
        '.PostNo, Post.Name, Post.NameLong, NaklR.NaklNo, NaklR.DateNaklF' +
        'irst, Rashod.Kol, '
      
        '                      Rashod.PriceOut, Rashod.Kol * Rashod.Price' +
        'Out AS RashodSumm, AddressPost.AddressNo, AddressPost.Address, P' +
        'ost.Name+AddressPost.Address AS NameOrder'
      'FROM         Rashod INNER JOIN'
      
        '                      Tovar ON Rashod.TovarNo = Tovar.TovarNo IN' +
        'NER JOIN'
      
        '                      NaklR ON Rashod.NaklNo = NaklR.NaklNo INNE' +
        'R JOIN'
      
        '                      Post ON NaklR.PostNoFirst = Post.PostNo IN' +
        'NER JOIN'
      
        '                      VidTov ON Tovar.VidNo = VidTov.VidNo INNER' +
        ' JOIN'
      
        '                      AddressPost ON NaklR.PostNoFirst = Address' +
        'Post.PostNo AND NaklR.AddressNo = AddressPost.AddressNo'
      'WHERE     (Rashod.Kol < 0)'
      
        '                   AND (NaklR.DateNaklFirst >= :DatePostB  AND  ' +
        'NaklR.DateNaklFirst <= :DatePostE)'
      '                  AND (&SQLString)'
      'ORDER BY NameOrder, Post.Name, VidTov.VidName, Tovar.NameTovar')
    Left = 432
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DatePostB'
      end
      item
        DataType = ftUnknown
        Name = 'DatePostE'
      end>
    MacroData = <
      item
        Name = 'SQLString'
        Value = '0=0'
      end>
    object qPrintTovarTovarNo: TSmallintField
      FieldName = 'TovarNo'
    end
    object qPrintTovarVidName: TStringField
      FieldName = 'VidName'
      FixedChar = True
      Size = 30
    end
    object qPrintTovarNameTovar: TStringField
      FieldName = 'NameTovar'
      FixedChar = True
      Size = 30
    end
    object qPrintTovarPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object qPrintTovarName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 30
    end
    object qPrintTovarNameLong: TStringField
      FieldName = 'NameLong'
      FixedChar = True
      Size = 80
    end
    object qPrintTovarNaklNo: TIntegerField
      FieldName = 'NaklNo'
    end
    object qPrintTovarDateNaklFirst: TDateTimeField
      FieldName = 'DateNaklFirst'
    end
    object qPrintTovarKol: TFloatField
      FieldName = 'Kol'
    end
    object qPrintTovarPriceOut: TFloatField
      FieldName = 'PriceOut'
    end
    object qPrintTovarRashodSumm: TFloatField
      FieldName = 'RashodSumm'
    end
    object qPrintTovarAddressNo: TSmallintField
      FieldName = 'AddressNo'
    end
    object qPrintTovarAddress: TStringField
      FieldName = 'Address'
      FixedChar = True
      Size = 50
    end
    object qPrintTovarNameOrder: TStringField
      FieldName = 'NameOrder'
      FixedChar = True
      Size = 80
    end
  end
end
