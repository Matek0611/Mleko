object qrPlatPoruch: TqrPlatPoruch
  Left = 0
  Top = 0
  Width = 635
  Height = 898
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
  BeforePrint = qrPlatPoruchBeforePrint
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
  Options = [FirstPageHeader, LastPageFooter]
  Page.Columns = 1
  Page.Orientation = poPortrait
  Page.PaperSize = A4
  Page.Values = (
    150.000000000000000000
    2970.000000000000000000
    100.000000000000000000
    2100.000000000000000000
    150.000000000000000000
    50.000000000000000000
    0.000000000000000000)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = First
  PrintIfEmpty = False
  SnapToGrid = True
  Units = MM
  Zoom = 80
  object QRLabel1: TQRLabel
    Left = 120
    Top = 40
    Width = 122
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.994791666666670000
      396.875000000000000000
      132.291666666666700000
      403.489583333333400000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1055#1051#1040#1058#1030#1046#1053#1045' '#1044#1054#1056#1059#1063#1045#1053#1053#1071' '#8470
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRLabel2: TQRLabel
    Left = 96
    Top = 64
    Width = 13
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      317.500000000000000000
      211.666666666666700000
      42.994791666666670000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1042#1110#1076
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel3: TQRLabel
    Left = 48
    Top = 96
    Width = 34
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      317.500000000000000000
      112.447916666666700000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1055#1083#1072#1090#1085#1080#1082
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel4: TQRLabel
    Left = 48
    Top = 204
    Width = 46
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.994791666666700000
      158.750000000000000000
      674.687500000000000000
      152.135416666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = #1050#1086#1076
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel5: TQRLabel
    Left = 48
    Top = 140
    Width = 60
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      463.020833333333400000
      198.437500000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1041#1072#1085#1082' '#1087#1083#1072#1090#1085#1080#1082#1072
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRShape1: TQRShape
    Left = 98
    Top = 114
    Width = 72
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      66.145833333333300000
      324.114583333333000000
      377.031250000000000000
      238.125000000000000000)
    Shape = qrsRectangle
  end
  object QRShape2: TQRShape
    Left = 296
    Top = 152
    Width = 64
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      79.375000000000000000
      978.958333333334000000
      502.708333333333000000
      211.666666666667000000)
    Shape = qrsRectangle
  end
  object QRShape3: TQRShape
    Left = 393
    Top = 152
    Width = 104
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      79.375000000000000000
      1299.765625000000000000
      502.708333333333000000
      343.958333333333000000)
    Shape = qrsRectangle
  end
  object QRShape4: TQRShape
    Left = 496
    Top = 152
    Width = 96
    Height = 105
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      347.265625000000000000
      1640.416666666670000000
      502.708333333333000000
      317.500000000000000000)
    Shape = qrsRectangle
  end
  object QRShape5: TQRShape
    Left = 296
    Top = 232
    Width = 64
    Height = 25
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      82.682291666666700000
      978.958333333334000000
      767.291666666667000000
      211.666666666667000000)
    Shape = qrsRectangle
  end
  object QRShape6: TQRShape
    Left = 393
    Top = 232
    Width = 104
    Height = 25
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      82.682291666666700000
      1299.765625000000000000
      767.291666666667000000
      343.958333333333000000)
    Shape = qrsRectangle
  end
  object QRShape7: TQRShape
    Left = 393
    Top = 210
    Width = 104
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      79.375000000000000000
      1299.765625000000000000
      694.531250000000000000
      343.958333333333000000)
    Shape = qrsRectangle
  end
  object QRShape8: TQRShape
    Left = 98
    Top = 206
    Width = 72
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      66.145833333333300000
      324.114583333333000000
      681.302083333334000000
      238.125000000000000000)
    Shape = qrsRectangle
  end
  object QRLabel6: TQRLabel
    Left = 48
    Top = 178
    Width = 48
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      588.697916666666800000
      158.750000000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1054#1076#1077#1088#1078#1091#1074#1072#1095
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel7: TQRLabel
    Left = 48
    Top = 114
    Width = 46
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      49.609375000000000000
      158.750000000000000000
      377.031250000000000000
      152.135416666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = #1050#1086#1076
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel8: TQRLabel
    Left = 48
    Top = 232
    Width = 73
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      767.291666666666800000
      241.432291666666700000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1041#1072#1085#1082' '#1086#1076#1077#1088#1078#1091#1074#1072#1095#1072
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel9: TQRLabel
    Left = 48
    Top = 272
    Width = 61
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      899.583333333333000000
      201.744791666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1057#1091#1084#1072' '#1089#1083#1086#1074#1072#1084#1080
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel10: TQRLabel
    Left = 48
    Top = 304
    Width = 91
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      1005.416666666670000000
      300.963541666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1055#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103' '#1087#1083#1072#1090#1077#1078#1091
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel11: TQRLabel
    Left = 63
    Top = 372
    Width = 27
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      49.609375000000000000
      208.359375000000000000
      1230.312500000000000000
      89.296875000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = #1052'.'#1055'.'
    Color = clWhite
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLabel12: TQRLabel
    Left = 112
    Top = 380
    Width = 27
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      370.416666666667000000
      1256.770833333330000000
      89.296875000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1055#1110#1076#1087#1080#1089
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel13: TQRLabel
    Left = 464
    Top = 360
    Width = 78
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1534.583333333330000000
      1190.625000000000000000
      257.968750000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1055#1088#1086#1074#1077#1076#1077#1085#1086' '#1073#1072#1085#1082#1086#1084
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel14: TQRLabel
    Left = 480
    Top = 400
    Width = 52
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1587.500000000000000000
      1322.916666666670000000
      171.979166666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1087#1110#1076#1087#1080#1089' '#1073#1072#1085#1082#1091
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel19: TQRLabel
    Left = 412
    Top = 136
    Width = 62
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.994791666666670000
      1362.604166666667000000
      449.791666666666700000
      205.052083333333400000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1044#1045#1041#1045#1058' '#1088#1072#1093'.'#8470
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRLabel20: TQRLabel
    Left = 412
    Top = 196
    Width = 76
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333340000
      1362.604166666667000000
      648.229166666666600000
      251.354166666666700000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1050#1056#1045#1044#1048#1058' '#1088#1072#1093'.'#8470
    Color = clWhite
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLabel21: TQRLabel
    Left = 524
    Top = 136
    Width = 27
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.994791666666700000
      1733.020833333330000000
      449.791666666667000000
      89.296875000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1057#1059#1052#1040
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRShape10: TQRShape
    Left = 528
    Top = 46
    Width = 57
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      56.223958333333300000
      1746.250000000000000000
      152.135416666667000000
      188.515625000000000000)
    Shape = qrsRectangle
  end
  object QRLabel22: TQRLabel
    Left = 540
    Top = 48
    Width = 34
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1785.937500000000000000
      158.750000000000000000
      112.447916666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = '0410001'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRDBText1: TQRDBText
    Left = 248
    Top = 40
    Width = 22
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.994791666666670000
      820.208333333333500000
      132.291666666666700000
      72.760416666666680000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Color = clWhite
    DataSet = quPlatR
    DataField = 'Nom'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRLSumma: TQRLabel
    Left = 497
    Top = 165
    Width = 91
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      49.609375000000000000
      1643.723958333330000000
      545.703125000000000000
      300.963541666667000000)
    Alignment = taCenter
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLSumma'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLDate: TQRLabel
    Left = 124
    Top = 64
    Width = 46
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333340000
      410.104166666666800000
      211.666666666666700000
      152.135416666666700000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'QRLDate'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLSummaStr: TQRLabel
    Left = 48
    Top = 285
    Width = 441
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      49.609375000000000000
      158.750000000000000000
      942.578125000000000000
      1458.515625000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLSummaStr'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMyKod: TQRLabel
    Left = 101
    Top = 116
    Width = 65
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      48.506944444444400000
      335.138888888889000000
      383.645833333333000000
      216.076388888889000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMyKod'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLKod: TQRLabel
    Left = 101
    Top = 211
    Width = 65
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      48.506944444444400000
      335.138888888889000000
      696.736111111111000000
      216.076388888889000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLKod'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMyMFO: TQRLabel
    Left = 312
    Top = 155
    Width = 37
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333300000
      1031.875000000000000000
      512.630208333333000000
      122.369791666667000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMyMFO'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMFO: TQRLabel
    Left = 312
    Top = 237
    Width = 37
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      48.506944444444400000
      1031.875000000000000000
      784.930555555556000000
      123.472222222222000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMFO'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLBank: TQRLabel
    Left = 48
    Top = 244
    Width = 153
    Height = 26
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      85.989583333333300000
      158.750000000000000000
      806.979166666667000000
      506.015625000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLBank'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMyBank: TQRLabel
    Left = 48
    Top = 152
    Width = 153
    Height = 26
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      85.989583333333300000
      158.750000000000000000
      502.708333333333000000
      506.015625000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMyBank'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMyRs: TQRLabel
    Left = 395
    Top = 155
    Width = 99
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      49.609375000000000000
      1306.380208333330000000
      512.630208333333000000
      327.421875000000000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMyRs'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLRS: TQRLabel
    Left = 395
    Top = 213
    Width = 99
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333300000
      1306.380208333330000000
      704.453125000000000000
      327.421875000000000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLRS'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMyName: TQRLabel
    Left = 96
    Top = 96
    Width = 66
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333340000
      317.500000000000000000
      317.500000000000000000
      218.281250000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'QRLMyName'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLName: TQRLabel
    Left = 106
    Top = 179
    Width = 184
    Height = 26
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      85.989583333333300000
      350.572916666667000000
      592.005208333333000000
      608.541666666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLName'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRDBText3: TQRDBText
    Left = 48
    Top = 324
    Width = 561
    Height = 34
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      112.447916666667000000
      158.750000000000000000
      1071.562500000000000000
      1855.390625000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Color = clWhite
    DataSet = quPlatR
    DataField = 'Spravka'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLAddrBank: TQRLabel
    Left = 202
    Top = 244
    Width = 90
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333300000
      668.072916666667000000
      806.979166666667000000
      297.656250000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLAddrBank'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRLMyAddrBank: TQRLabel
    Left = 202
    Top = 154
    Width = 90
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333300000
      668.072916666667000000
      509.322916666667000000
      297.656250000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMyAddrBank'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRLabel23: TQRLabel
    Left = 444
    Top = 376
    Width = 115
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1468.437500000000000000
      1243.541666666670000000
      380.338541666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = '"___"_____________200__'#1088'.'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel24: TQRLabel
    Left = 468
    Top = 68
    Width = 74
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1547.812500000000000000
      224.895833333333000000
      244.739583333333000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1054#1076#1077#1088#1078#1072#1085#1086' '#1073#1072#1085#1082#1086#1084
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel25: TQRLabel
    Left = 452
    Top = 92
    Width = 115
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1494.895833333330000000
      304.270833333333000000
      380.338541666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = '"___"_____________200__'#1088'.'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel26: TQRLabel
    Left = 520
    Top = 30
    Width = 89
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333300000
      1719.791666666670000000
      99.218750000000000000
      294.348958333333000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1087#1077#1088#1096#1080#1081' '#1087#1088#1080#1084#1110#1088#1085#1080#1082
    Color = clWhite
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLabel15: TQRLabel
    Left = 120
    Top = 464
    Width = 122
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.994791666666700000
      396.875000000000000000
      1534.583333333330000000
      403.489583333333000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1055#1051#1040#1058#1030#1046#1053#1045' '#1044#1054#1056#1059#1063#1045#1053#1053#1071' '#8470
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRLabel16: TQRLabel
    Left = 96
    Top = 488
    Width = 13
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      317.500000000000000000
      1613.958333333330000000
      42.994791666666700000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1042#1110#1076
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel30: TQRLabel
    Left = 48
    Top = 520
    Width = 34
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      1719.791666666670000000
      112.447916666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1055#1083#1072#1090#1085#1080#1082
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel31: TQRLabel
    Left = 48
    Top = 628
    Width = 46
    Height = 26
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      85.989583333333300000
      158.750000000000000000
      2076.979166666670000000
      152.135416666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = #1050#1086#1076
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel32: TQRLabel
    Left = 48
    Top = 564
    Width = 60
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      1865.312500000000000000
      198.437500000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1041#1072#1085#1082' '#1087#1083#1072#1090#1085#1080#1082#1072
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRShape12: TQRShape
    Left = 98
    Top = 538
    Width = 72
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      66.145833333333300000
      324.114583333333000000
      1779.322916666670000000
      238.125000000000000000)
    Shape = qrsRectangle
  end
  object QRShape13: TQRShape
    Left = 296
    Top = 576
    Width = 64
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      79.375000000000000000
      978.958333333334000000
      1905.000000000000000000
      211.666666666667000000)
    Shape = qrsRectangle
  end
  object QRShape14: TQRShape
    Left = 393
    Top = 576
    Width = 104
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      79.375000000000000000
      1299.765625000000000000
      1905.000000000000000000
      343.958333333333000000)
    Shape = qrsRectangle
  end
  object QRShape15: TQRShape
    Left = 496
    Top = 576
    Width = 96
    Height = 104
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      343.958333333333000000
      1640.416666666670000000
      1905.000000000000000000
      317.500000000000000000)
    Shape = qrsRectangle
  end
  object QRShape16: TQRShape
    Left = 296
    Top = 656
    Width = 64
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      79.375000000000000000
      978.958333333334000000
      2169.583333333330000000
      211.666666666667000000)
    Shape = qrsRectangle
  end
  object QRShape17: TQRShape
    Left = 393
    Top = 656
    Width = 104
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      79.375000000000000000
      1299.765625000000000000
      2169.583333333330000000
      343.958333333333000000)
    Shape = qrsRectangle
  end
  object QRShape18: TQRShape
    Left = 393
    Top = 634
    Width = 104
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      79.375000000000000000
      1299.765625000000000000
      2096.822916666670000000
      343.958333333333000000)
    Shape = qrsRectangle
  end
  object QRShape19: TQRShape
    Left = 98
    Top = 630
    Width = 72
    Height = 20
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      66.145833333333300000
      324.114583333333000000
      2083.593750000000000000
      238.125000000000000000)
    Shape = qrsRectangle
  end
  object QRLabel33: TQRLabel
    Left = 48
    Top = 603
    Width = 48
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      1994.296875000000000000
      158.750000000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1054#1076#1077#1088#1078#1091#1074#1072#1095
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel34: TQRLabel
    Left = 48
    Top = 538
    Width = 46
    Height = 26
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      85.989583333333300000
      158.750000000000000000
      1779.322916666670000000
      152.135416666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = #1050#1086#1076
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel35: TQRLabel
    Left = 48
    Top = 655
    Width = 73
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      2166.276041666670000000
      241.432291666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1041#1072#1085#1082' '#1086#1076#1077#1088#1078#1091#1074#1072#1095#1072
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel36: TQRLabel
    Left = 48
    Top = 695
    Width = 61
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      2298.567708333330000000
      201.744791666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1057#1091#1084#1072' '#1089#1083#1086#1074#1072#1084#1080
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel37: TQRLabel
    Left = 48
    Top = 728
    Width = 91
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      158.750000000000000000
      2407.708333333330000000
      300.963541666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1055#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103' '#1087#1083#1072#1090#1077#1078#1091
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel38: TQRLabel
    Left = 63
    Top = 796
    Width = 27
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      49.609375000000000000
      208.359375000000000000
      2632.604166666670000000
      89.296875000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = #1052'.'#1055'.'
    Color = clWhite
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLabel39: TQRLabel
    Left = 112
    Top = 804
    Width = 27
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      370.416666666667000000
      2659.062500000000000000
      89.296875000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1055#1110#1076#1087#1080#1089
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel40: TQRLabel
    Left = 464
    Top = 784
    Width = 78
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1534.583333333330000000
      2592.916666666670000000
      257.968750000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1055#1088#1086#1074#1077#1076#1077#1085#1086' '#1073#1072#1085#1082#1086#1084
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel41: TQRLabel
    Left = 480
    Top = 824
    Width = 52
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1587.500000000000000000
      2725.208333333330000000
      171.979166666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1087#1110#1076#1087#1080#1089' '#1073#1072#1085#1082#1091
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel44: TQRLabel
    Left = 412
    Top = 561
    Width = 62
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.994791666666700000
      1362.604166666670000000
      1855.390625000000000000
      205.052083333333000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1044#1045#1041#1045#1058' '#1088#1072#1093'.'#8470
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRLabel45: TQRLabel
    Left = 412
    Top = 619
    Width = 76
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333300000
      1362.604166666670000000
      2047.213541666670000000
      251.354166666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1050#1056#1045#1044#1048#1058' '#1088#1072#1093'.'#8470
    Color = clWhite
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLabel46: TQRLabel
    Left = 524
    Top = 561
    Width = 27
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.994791666666700000
      1733.020833333330000000
      1855.390625000000000000
      89.296875000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1057#1059#1052#1040
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRShape21: TQRShape
    Left = 528
    Top = 454
    Width = 57
    Height = 17
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      56.223958333333300000
      1746.250000000000000000
      1501.510416666670000000
      188.515625000000000000)
    Shape = qrsRectangle
  end
  object QRLabel47: TQRLabel
    Left = 540
    Top = 456
    Width = 34
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1785.937500000000000000
      1508.125000000000000000
      112.447916666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = '0410001'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRDBText2: TQRDBText
    Left = 248
    Top = 464
    Width = 22
    Height = 13
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      42.994791666666700000
      820.208333333334000000
      1534.583333333330000000
      72.760416666666700000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Color = clWhite
    DataSet = quPlatR
    DataField = 'Nom'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRLSumma2: TQRLabel
    Left = 497
    Top = 589
    Width = 91
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      49.609375000000000000
      1643.723958333330000000
      1947.994791666670000000
      300.963541666667000000)
    Alignment = taCenter
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLSumma'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLDate2: TQRLabel
    Left = 120
    Top = 488
    Width = 46
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333300000
      396.875000000000000000
      1613.958333333330000000
      152.135416666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'QRLDate'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLSummaStr2: TQRLabel
    Left = 48
    Top = 709
    Width = 441
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      49.609375000000000000
      158.750000000000000000
      2344.869791666670000000
      1458.515625000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLSummaStr'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMyKod2: TQRLabel
    Left = 101
    Top = 540
    Width = 65
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      48.506944444444400000
      335.138888888889000000
      1785.937500000000000000
      216.076388888889000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMyKod'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLKod2: TQRLabel
    Left = 101
    Top = 633
    Width = 65
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      48.506944444444400000
      335.138888888889000000
      2094.618055555560000000
      216.076388888889000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLKod'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMyMFO2: TQRLabel
    Left = 312
    Top = 579
    Width = 37
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      48.506944444444400000
      1031.875000000000000000
      1913.819444444440000000
      123.472222222222000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMyMFO'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMFO2: TQRLabel
    Left = 312
    Top = 662
    Width = 37
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      49.609375000000000000
      1031.875000000000000000
      2189.427083333330000000
      122.369791666667000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMFO'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLBank2: TQRLabel
    Left = 48
    Top = 668
    Width = 153
    Height = 26
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      85.989583333333300000
      158.750000000000000000
      2209.270833333330000000
      506.015625000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLBank'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMyBank2: TQRLabel
    Left = 48
    Top = 576
    Width = 153
    Height = 26
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      85.989583333333300000
      158.750000000000000000
      1905.000000000000000000
      506.015625000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMyBank'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMyRs2: TQRLabel
    Left = 395
    Top = 579
    Width = 99
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      49.609375000000000000
      1306.380208333330000000
      1914.921875000000000000
      327.421875000000000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMyRs'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLRS2: TQRLabel
    Left = 395
    Top = 638
    Width = 99
    Height = 15
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      49.609375000000000000
      1306.380208333330000000
      2110.052083333330000000
      327.421875000000000000)
    Alignment = taRightJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLRS'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLMyName2: TQRLabel
    Left = 96
    Top = 520
    Width = 66
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333300000
      317.500000000000000000
      1719.791666666670000000
      218.281250000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'QRLMyName'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLName2: TQRLabel
    Left = 106
    Top = 603
    Width = 184
    Height = 26
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      85.989583333333300000
      350.572916666667000000
      1994.296875000000000000
      608.541666666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLName'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRDBText4: TQRDBText
    Left = 48
    Top = 747
    Width = 561
    Height = 34
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      112.447916666667000000
      158.750000000000000000
      2470.546875000000000000
      1855.390625000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Color = clWhite
    DataSet = quPlatR
    DataField = 'Spravka'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLAddrBank2: TQRLabel
    Left = 202
    Top = 668
    Width = 90
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333300000
      668.072916666667000000
      2209.270833333330000000
      297.656250000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLAddrBank'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRLMyAddrBank2: TQRLabel
    Left = 202
    Top = 578
    Width = 90
    Height = 14
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      46.302083333333300000
      668.072916666667000000
      1911.614583333330000000
      297.656250000000000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = False
    AutoStretch = False
    Caption = 'QRLMyAddrBank'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 9
  end
  object QRLabel63: TQRLabel
    Left = 444
    Top = 800
    Width = 115
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1468.437500000000000000
      2645.833333333330000000
      380.338541666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = '"___"_____________200__'#1088'.'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel64: TQRLabel
    Left = 464
    Top = 484
    Width = 74
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1534.583333333330000000
      1600.729166666670000000
      244.739583333333000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = #1054#1076#1077#1088#1078#1072#1085#1086' '#1073#1072#1085#1082#1086#1084
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRLabel65: TQRLabel
    Left = 448
    Top = 516
    Width = 115
    Height = 12
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      39.687500000000000000
      1481.666666666670000000
      1706.562500000000000000
      380.338541666667000000)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = '"___"_____________200__'#1088'.'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 8
  end
  object QRShape23: TQRShape
    Left = 56
    Top = 440
    Width = 556
    Height = 8
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      26.458333333333300000
      185.208333333333000000
      1455.208333333330000000
      1838.854166666670000000)
    Shape = qrsHorLine
  end
  object QRShape9: TQRShape
    Left = 496
    Top = 723
    Width = 96
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      79.375000000000000000
      1640.416666666670000000
      2391.171875000000000000
      317.500000000000000000)
    Shape = qrsRectangle
  end
  object QRShape11: TQRShape
    Left = 496
    Top = 299
    Width = 96
    Height = 24
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      79.375000000000000000
      1640.416666666670000000
      988.880208333334000000
      317.500000000000000000)
    Shape = qrsRectangle
  end
  object QRShape20: TQRShape
    Left = 160
    Top = 808
    Width = 113
    Height = 25
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      82.682291666666700000
      529.166666666667000000
      2672.291666666670000000
      373.723958333333000000)
    Shape = qrsTopAndBottom
  end
  object QRShape22: TQRShape
    Left = 160
    Top = 384
    Width = 113
    Height = 25
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      82.682291666666700000
      529.166666666667000000
      1270.000000000000000000
      373.723958333333000000)
    Shape = qrsTopAndBottom
  end
  object quPlatR: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select PlatR.Nom,PlatR.DatePlat,PlatR.Summa,PlatR.PostNo,'
      '       PlatR.Spravka'
      'from PlatR'
      'where PlatR.is_econom=0 and PlatNo=:PlatNo')
    Left = 24
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PlatNo'
      end>
    object quPlatRNom: TIntegerField
      FieldName = 'Nom'
      Origin = 'PlatR.Nom'
    end
    object quPlatRDatePlat: TDateTimeField
      FieldName = 'DatePlat'
      Origin = 'PlatR.DatePlat'
    end
    object quPlatRSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'PlatR.Summa'
    end
    object quPlatRPostNo: TSmallintField
      FieldName = 'PostNo'
      Origin = 'PlatR.PostNo'
    end
    object quPlatRSpravka: TStringField
      FieldName = 'Spravka'
      Origin = 'PlatR.Spravka'
      Size = 55
    end
  end
  object quPost: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from Post'
      'where PostNo=:PostNo')
    Left = 80
    Top = 8
    ParamData = <
      item
        DataType = ftSmallint
        Name = 'PostNo'
      end>
  end
  object quWork: TMSQuery
    Connection = dmDataModule.DB
    Left = 168
    Top = 8
  end
end
