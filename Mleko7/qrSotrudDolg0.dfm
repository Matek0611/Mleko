object qrSotrudDolg: TqrSotrudDolg
  Left = 0
  Top = 0
  Width = 979
  Height = 1267
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  DataSet = quMaster
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Functions.Strings = (
    'PAGENUMBER'
    'COLUMNNUMBER'
    'REPORTTITLE')
  Functions.DATA = (
    '0'
    '0'
    #39#39)
  Options = []
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = Letter
  Page.Values = (
    100.000000000000000000
    2794.000000000000000000
    100.000000000000000000
    2159.000000000000000000
    100.000000000000000000
    100.000000000000000000
    0.000000000000000000)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = First
  PrintIfEmpty = False
  ReportTitle = #1044#1086#1083#1075#1080' '#1087#1086' '#1084#1077#1085#1077#1076#1078#1077#1088#1072#1084
  SnapToGrid = True
  Units = MM
  Zoom = 120
  object TitleBand1: TQRBand
    Left = 45
    Top = 45
    Width = 888
    Height = 34
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      74.965277777777790000
      1957.916666666667000000)
    BandType = rbTitle
    object QRSysData1: TQRSysData
      Left = 550
      Top = 5
      Width = 64
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        61.736111111111100000
        1212.673611111110000000
        11.024305555555600000
        141.111111111111000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      Color = clWhite
      Data = qrsDate
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FontSize = 14
    end
    object QRLabel6: TQRLabel
      Left = 274
      Top = 5
      Width = 272
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        61.736111111111120000
        604.131944444444400000
        11.024305555555560000
        599.722222222222300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1044#1086#1083#1075#1080' '#1087#1086' '#1084#1077#1085#1077#1076#1078#1077#1088#1072#1084' '#1085#1072' '
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 14
    end
  end
  object QRBand1: TQRBand
    Left = 45
    Top = 179
    Width = 888
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRBand3
    Size.Values = (
      52.916666666666660000
      1957.916666666667000000)
    BandType = rbGroupFooter
    object QRShape2: TQRShape
      Left = 3
      Top = -8
      Width = 889
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        41.892361111111100000
        6.614583333333330000
        -17.638888888888900000
        1960.121527777780000000)
      Shape = qrsHorLine
    end
    object QRExpr1: TQRExpr
      Left = 478
      Top = 4
      Width = 126
      Height = 18
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        1053.372395833330000000
        8.268229166666670000
        277.812500000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      Color = clWhite
      ParentFont = False
      ResetAfterPrint = True
      Transparent = False
      WordWrap = True
      Expression = 'SUM(quMaster.SummaDolg)'
      Mask = '0.00'
      FontSize = 8
    end
  end
  object QRGroup1: TQRGroup
    Left = 45
    Top = 79
    Width = 888
    Height = 82
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      180.798611111111100000
      1957.916666666667000000)
    Expression = 'quMaster.SotrudName'
    FooterBand = QRBand1
    Master = Owner
    ReprintOnNewPage = False
    object QRShape1: TQRShape
      Left = 2
      Top = 26
      Width = 886
      Height = 55
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        121.267361111111000000
        4.409722222222220000
        57.326388888888900000
        1953.506944444440000000)
      Shape = qrsTopAndBottom
    end
    object QRDBText1: TQRDBText
      Left = 5
      Top = 0
      Width = 280
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.994791666666700000
        11.575520833333300000
        0.000000000000000000
        616.809895833333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quMaster
      DataField = 'SotrudName'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 214
      Top = 43
      Width = 218
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.482638888888900000
        471.840277777778000000
        94.809027777777800000
        480.659722222222000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel2: TQRLabel
      Left = 84
      Top = 43
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.482638888888900000
        185.208333333333000000
        94.809027777777800000
        149.930555555556000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1044#1072#1090#1072
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel3: TQRLabel
      Left = 151
      Top = 43
      Width = 64
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.482638888888900000
        332.934027777778000000
        94.809027777777800000
        141.111111111111000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1058#1080#1087
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel4: TQRLabel
      Left = 546
      Top = 27
      Width = 53
      Height = 54
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        119.062500000000000000
        1203.854166666670000000
        59.531250000000000000
        116.857638888889000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1044#1086#1083#1075' '#1087#1086' '#1085#1072#1082#1083'.'
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel8: TQRLabel
      Left = 600
      Top = 43
      Width = 106
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.482638888888900000
        1322.916666666670000000
        94.809027777777800000
        233.715277777778000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1058#1077#1083#1077#1092#1086#1085
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel7: TQRLabel
      Left = 708
      Top = 43
      Width = 179
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.482638888888900000
        1561.041666666670000000
        94.809027777777800000
        394.670138888889000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel10: TQRLabel
      Left = 0
      Top = 43
      Width = 38
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.482638888888900000
        0.000000000000000000
        94.809027777777800000
        83.784722222222200000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1044#1085#1077#1081
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel5: TQRLabel
      Left = 38
      Top = 43
      Width = 46
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        37.482638888888900000
        83.784722222222200000
        94.809027777777800000
        101.423611111111000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #8470
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel11: TQRLabel
      Left = 486
      Top = 32
      Width = 60
      Height = 41
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        90.399305555555600000
        1071.562500000000000000
        70.555555555555600000
        132.291666666667000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1054#1087#1083'. '#1087#1086' '#1085#1072#1082#1083'.'
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object QRLabel12: TQRLabel
      Left = 432
      Top = 32
      Width = 53
      Height = 41
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        90.399305555555600000
        952.500000000000000000
        70.555555555555600000
        116.857638888889000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1057#1091#1084#1084#1072' '#1085#1072#1082#1083'.'
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
  end
  object QRBand2: TQRBand
    Left = 45
    Top = 161
    Width = 888
    Height = 18
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    LinkBand = QRBand3
    Size.Values = (
      39.687500000000000000
      1957.916666666667000000)
    BandType = rbDetail
    object QRDBText3: TQRDBText
      Left = 84
      Top = 0
      Width = 68
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        38.033854166666700000
        185.208333333333000000
        0.000000000000000000
        150.481770833333000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quMaster
      DataField = 'DateNakl'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText4: TQRDBText
      Left = 152
      Top = 0
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        38.033854166666700000
        335.690104166667000000
        0.000000000000000000
        142.213541666667000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quMaster
      DataField = 'BuhName'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText5: TQRDBText
      Left = 220
      Top = 0
      Width = 213
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        38.033854166666700000
        484.518229166667000000
        0.000000000000000000
        469.635416666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quMaster
      DataField = 'Name'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText6: TQRDBText
      Left = 546
      Top = 0
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        38.033854166666700000
        1203.854166666670000000
        0.000000000000000000
        117.408854166667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quMaster
      DataField = 'SummaDolg'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText8: TQRDBText
      Left = 603
      Top = 0
      Width = 104
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        38.033854166666700000
        1329.531250000000000000
        0.000000000000000000
        228.203125000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quMaster
      DataField = 'Phone'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 8
    end
    object QRDBText7: TQRDBText
      Left = 712
      Top = 0
      Width = 176
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        38.033854166666700000
        1569.309895833330000000
        0.000000000000000000
        386.953125000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quMaster
      DataField = 'ContactFace'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = False
      FontSize = 8
    end
    object QRLabel9: TQRLabel
      Left = 0
      Top = 0
      Width = 38
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        38.033854166666700000
        0.000000000000000000
        0.000000000000000000
        84.335937500000000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel9'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      OnPrint = QRLabel9Print
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText2: TQRDBText
      Left = 38
      Top = 0
      Width = 47
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        38.033854166666700000
        82.682291666666700000
        0.000000000000000000
        102.526041666667000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quMaster
      DataField = 'Nom'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText9: TQRDBText
      Left = 492
      Top = 0
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        38.033854166666700000
        1084.791666666670000000
        0.000000000000000000
        117.408854166667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quMaster
      DataField = 'SummaPlat'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRDBText10: TQRDBText
      Left = 432
      Top = 0
      Width = 53
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        38.033854166666700000
        952.500000000000000000
        0.000000000000000000
        117.408854166667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quMaster
      DataField = 'Summa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 8
    end
    object QRShape3: TQRShape
      Left = 1
      Top = 0
      Width = 1
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        54.570312500000000000
        1.653645833333330000
        0.000000000000000000
        1.653645833333330000)
      Shape = qrsVertLine
    end
    object QRShape4: TQRShape
      Left = 38
      Top = 0
      Width = 1
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        54.570312500000000000
        82.682291666666700000
        0.000000000000000000
        1.653645833333330000)
      Shape = qrsVertLine
    end
    object QRShape5: TQRShape
      Left = 84
      Top = 0
      Width = 1
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        54.570312500000000000
        185.208333333333000000
        0.000000000000000000
        1.653645833333330000)
      Shape = qrsVertLine
    end
    object QRShape6: TQRShape
      Left = 152
      Top = 0
      Width = 1
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        54.570312500000000000
        335.690104166667000000
        0.000000000000000000
        1.653645833333330000)
      Shape = qrsVertLine
    end
    object QRShape7: TQRShape
      Left = 218
      Top = 0
      Width = 1
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        54.570312500000000000
        481.210937500000000000
        0.000000000000000000
        1.653645833333330000)
      Shape = qrsVertLine
    end
    object QRShape8: TQRShape
      Left = 432
      Top = 0
      Width = 1
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        54.570312500000000000
        952.500000000000000000
        0.000000000000000000
        1.653645833333330000)
      Shape = qrsVertLine
    end
    object QRShape9: TQRShape
      Left = 486
      Top = 0
      Width = 1
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        54.570312500000000000
        1071.562500000000000000
        0.000000000000000000
        1.653645833333330000)
      Shape = qrsVertLine
    end
    object QRShape10: TQRShape
      Left = 545
      Top = 0
      Width = 1
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        55.121527777777800000
        1201.649305555560000000
        0.000000000000000000
        2.204861111111110000)
      Shape = qrsVertLine
    end
    object QRShape11: TQRShape
      Left = 601
      Top = 0
      Width = 1
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        54.570312500000000000
        1324.570312500000000000
        0.000000000000000000
        1.653645833333330000)
      Shape = qrsVertLine
    end
    object QRShape12: TQRShape
      Left = 707
      Top = 0
      Width = 1
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        54.570312500000000000
        1559.388020833330000000
        0.000000000000000000
        1.653645833333330000)
      Shape = qrsVertLine
    end
    object QRShape13: TQRShape
      Left = 888
      Top = 0
      Width = 1
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        54.570312500000000000
        1957.916666666670000000
        0.000000000000000000
        1.653645833333330000)
      Shape = qrsVertLine
    end
  end
  object QRBand3: TQRBand
    Left = 45
    Top = 203
    Width = 888
    Height = 28
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      61.736111111111120000
      1957.916666666667000000)
    BandType = rbGroupHeader
    object QRDBText11: TQRDBText
      Left = 5
      Top = 0
      Width = 280
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.994791666666700000
        11.575520833333300000
        0.000000000000000000
        616.809895833333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quMaster
      DataField = 'VIP'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      WordWrap = True
      FontSize = 10
    end
  end
  object QRBand4: TQRBand
    Left = 45
    Top = 231
    Width = 888
    Height = 48
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      105.833333333333300000
      1957.916666666667000000)
    BandType = rbGroupHeader
  end
  object quMaster: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        'SELECT     NaklR.Nom, NaklR.SummaDolg, NaklR.Summa, NaklR.Summa ' +
        '- NaklR.SummaDolg AS SummaPlat, NaklR.DateNakl, NaklR.DateOpl, '
      
        '                      Sotrud.SotrudName, Post.Name, Post.Contact' +
        ' AS ContactFace, Post.Phone, TipNakl.TipName AS BuhName, Post.VI' +
        'P'
      'from NaklR,Sotrud,Post,TipNakl'
      'where (SummaDolg>0) and'
      '      (Post.PostNo=NaklR.PostNo) and'
      '      (NaklR.Buh=TipNakl.TipNo)  and'
      '      (Sotrud.SotrudNo=NaklR.SotrudNo) &_Sotrud'
      'order by SotrudName, Post.VIP,Name,NaklR.DateNakl'
      ''
      ''
      '')
    OnCalcFields = quMasterCalcFields
    Left = 16
    Top = 8
    MacroData = <
      item
        Name = '_Sotrud'
        Value = ' '
      end>
    object quMasterSotrudName: TStringField
      FieldName = 'SotrudName'
      Size = 30
    end
    object quMasterNom: TIntegerField
      FieldName = 'Nom'
    end
    object quMasterName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object quMasterPhone: TStringField
      FieldName = 'Phone'
      Size = 15
    end
    object quMasterPSrok: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'PSrok'
      Calculated = True
    end
    object quMasterDateNakl: TDateTimeField
      FieldName = 'DateNakl'
      Origin = 'NaklR.DateNakl'
    end
    object quMasterSummaDolg: TFloatField
      FieldName = 'SummaDolg'
      Origin = 'NaklR.SummaDolg'
      DisplayFormat = '0.00'
    end
    object quMasterDateOpl: TDateTimeField
      FieldName = 'DateOpl'
      Origin = 'NaklR.DateOpl'
    end
    object quMasterContactFace: TStringField
      FieldName = 'ContactFace'
      Origin = 'Post.Contact'
      Size = 50
    end
    object quMasterBuhName: TStringField
      FieldName = 'BuhName'
      Origin = 'TipNakl.TipName'
      Size = 10
    end
    object quMasterSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'BASE.NaklR.Summa'
    end
    object quMasterSummaPlat: TFloatField
      FieldName = 'SummaPlat'
      Origin = 'BASE.NaklR.Summa'
    end
    object quMasterVIP: TBooleanField
      FieldName = 'VIP'
      Origin = 'BASE.Post.VIP'
    end
  end
end
