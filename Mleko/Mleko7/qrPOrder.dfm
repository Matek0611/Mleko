object qrPrihOrder: TqrPrihOrder
  Left = 0
  Top = 0
  Width = 794
  Height = 1123
  Frame.Color = clBlack
  Frame.DrawTop = False
  Frame.DrawBottom = False
  Frame.DrawLeft = False
  Frame.DrawRight = False
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
    100.000000000000000000
    2970.000000000000000000
    50.000000000000000000
    2100.000000000000000000
    100.000000000000000000
    50.000000000000000000
    0.000000000000000000)
  PrinterSettings.Copies = 1
  PrinterSettings.Duplex = False
  PrinterSettings.FirstPage = 0
  PrinterSettings.LastPage = 0
  PrinterSettings.OutputBin = First
  PrintIfEmpty = True
  SnapToGrid = True
  Units = MM
  Zoom = 100
  object QRBand1: TQRBand
    Left = 38
    Top = 19
    Width = 737
    Height = 490
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
      1296.458333333333000000
      1949.979166666667000000)
    BandType = rbTitle
    object QRLabel7: TQRLabel
      Left = 0
      Top = 327
      Width = 345
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        0.000000000000000000
        865.187500000000000000
        912.812500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel7'
      Color = clWhite
      OnPrint = QRLabel7Print
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText4: TQRDBText
      Left = 309
      Top = 197
      Width = 108
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        817.562500000000000000
        521.229166666667000000
        285.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quPlatP
      DataField = 'Summa'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel36: TQRLabel
      Left = 530
      Top = 283
      Width = 193
      Height = 49
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        129.645833333333000000
        1402.291666666670000000
        748.770833333333000000
        510.645833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = True
      Caption = 'QRLabel36'
      Color = clWhite
      OnPrint = QRLabel36Print
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel37: TQRLabel
      Left = 530
      Top = 364
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1402.291666666670000000
        963.083333333333000000
        171.979166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLabel37'
      Color = clWhite
      OnPrint = QRLabel37Print
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel38: TQRLabel
      Left = 88
      Top = 238
      Width = 417
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        232.833333333333000000
        629.708333333333000000
        1103.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel38'
      Color = clWhite
      OnPrint = QRLabel38Print
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel39: TQRLabel
      Left = 530
      Top = 128
      Width = 200
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.312500000000000000
        1402.291666666670000000
        338.666666666667000000
        529.166666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel39'
      Color = clWhite
      OnPrint = QRLabel38Print
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel40: TQRLabel
      Left = 0
      Top = 262
      Width = 54
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        0.000000000000000000
        693.208333333333000000
        142.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel41: TQRLabel
      Left = 530
      Top = 181
      Width = 54
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1402.291666666670000000
        478.895833333333000000
        142.875000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1055#1110#1076#1089#1090#1072#1074#1072
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText1: TQRDBText
      Left = 4
      Top = 197
      Width = 41
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        10.583333333333300000
        521.229166666667000000
        108.479166666667000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Color = clWhite
      DataSet = quPlatP
      DataField = 'Nom'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText5: TQRDBText
      Left = 615
      Top = 81
      Width = 28
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1627.187500000000000000
        214.312500000000000000
        74.083333333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = quPlatP
      DataField = 'Nom'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText7: TQRDBText
      Left = 341
      Top = 98
      Width = 28
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        902.229166666666800000
        259.291666666666700000
        74.083333333333340000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = quPlatP
      DataField = 'Nom'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel1: TQRLabel
      Left = 0
      Top = 35
      Width = 89
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        97.895833333333300000
        0.000000000000000000
        92.604166666666700000
        235.479166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076' '#1028#1044#1056#1055#1054#1059
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
      Left = 0
      Top = 192
      Width = 517
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666670000
        0.000000000000000000
        508.000000000000000000
        1367.895833333330000000)
      Shape = qrsHorLine
    end
    object QRShape2: TQRShape
      Left = 2
      Top = 216
      Width = 517
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666670000
        5.291666666666670000
        571.500000000000000000
        1367.895833333330000000)
      Shape = qrsHorLine
    end
    object QRShape3: TQRShape
      Left = 0
      Top = 144
      Width = 517
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        5.291666666666670000
        0.000000000000000000
        381.000000000000000000
        1367.895833333330000000)
      Shape = qrsHorLine
    end
    object QRLabel9: TQRLabel
      Left = 2
      Top = 147
      Width = 41
      Height = 46
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        121.708333333333000000
        5.291666666666670000
        388.937500000000000000
        108.479166666667000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091'- '#1084#1077#1085#1090#1072
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
      Left = 50
      Top = 147
      Width = 73
      Height = 46
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        121.708333333333000000
        132.291666666667000000
        388.937500000000000000
        193.145833333333000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1044#1072#1090#1072' '#1089#1082#1083#1072#1076#1072#1085#1085#1103
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
      Left = 138
      Top = 147
      Width = 73
      Height = 46
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        121.708333333333000000
        365.125000000000000000
        388.937500000000000000
        193.145833333333000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1050#1086#1088#1077#1089#1087#1086#1085'- '#1076#1091#1102#1095#1080#1081' '#1088#1072#1093#1091#1085#1086#1082
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
    object QRLabel12: TQRLabel
      Left = 226
      Top = 147
      Width = 73
      Height = 46
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        121.708333333333000000
        597.958333333333000000
        388.937500000000000000
        193.145833333333000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1064#1080#1092#1088' '#1072#1085#1072#1083#1110'- '#1090#1080#1095#1085#1086#1075#1086' '#1086#1073#1083#1110#1082#1091
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
      Left = 354
      Top = 160
      Width = 36
      Height = 15
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        39.687500000000000000
        936.625000000000000000
        423.333333333333300000
        95.250000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1057#1091#1084#1084#1072
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
      Left = 434
      Top = 147
      Width = 73
      Height = 46
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        121.708333333333000000
        1148.291666666670000000
        388.937500000000000000
        193.145833333333000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1050#1086#1076' '#1094#1110#1083#1100#1086'- '#1074#1086#1075#1086' '#1087#1088#1080#1079'- '#1085#1072#1095#1077#1085#1085#1103
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
    object QRLabel15: TQRLabel
      Left = 0
      Top = 238
      Width = 79
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        0.000000000000000000
        629.708333333333400000
        209.020833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1055#1088#1080#1081#1085#1103#1090#1086' '#1074#1110#1076
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText3: TQRDBText
      Left = 52
      Top = 197
      Width = 51
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        137.583333333333300000
        521.229166666666800000
        134.937500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataSet = quPlatP
      DataField = 'DatePlat'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape4: TQRShape
      Left = 424
      Top = 145
      Width = 2
      Height = 72
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        190.500000000000000000
        1121.833333333330000000
        383.645833333333000000
        5.291666666666670000)
      Shape = qrsVertLine
    end
    object QRShape5: TQRShape
      Left = 304
      Top = 145
      Width = 2
      Height = 72
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        190.500000000000000000
        804.333333333333000000
        383.645833333333000000
        5.291666666666670000)
      Shape = qrsVertLine
    end
    object QRShape6: TQRShape
      Left = 216
      Top = 145
      Width = 2
      Height = 72
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        190.500000000000000000
        571.500000000000000000
        383.645833333333000000
        5.291666666666670000)
      Shape = qrsVertLine
    end
    object QRShape7: TQRShape
      Left = 128
      Top = 145
      Width = 2
      Height = 72
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        190.500000000000000000
        338.666666666667000000
        383.645833333333000000
        5.291666666666670000)
      Shape = qrsVertLine
    end
    object QRShape8: TQRShape
      Left = 48
      Top = 145
      Width = 2
      Height = 72
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        190.500000000000000000
        127.000000000000000000
        383.645833333333000000
        5.291666666666670000)
      Shape = qrsVertLine
    end
    object QRLabel2: TQRLabel
      Left = 72
      Top = 96
      Width = 262
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        190.500000000000000000
        254.000000000000000000
        693.208333333333400000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1055#1088#1080#1073#1091#1090#1082#1086#1074#1080#1081' '#1082#1072#1089#1089#1086#1074#1080#1081' '#1086#1088#1076#1077#1088' '#8470
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLabel3: TQRLabel
      Left = 0
      Top = 358
      Width = 50
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        0.000000000000000000
        947.208333333333000000
        132.291666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1044#1086#1076#1072#1090#1086#1082
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel4: TQRLabel
      Left = 48
      Top = 420
      Width = 120
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        127.000000000000000000
        1111.250000000000000000
        317.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel16: TQRLabel
      Left = 48
      Top = 468
      Width = 94
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        127.000000000000000000
        1238.250000000000000000
        248.708333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1054#1076#1077#1088#1078#1072#1074' '#1082#1072#1089#1080#1088
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel17: TQRLabel
      Left = 0
      Top = 345
      Width = 401
      Height = 11
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        29.104166666666700000
        0.000000000000000000
        912.812500000000000000
        1060.979166666670000000)
      Alignment = taCenter
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = #1087#1088#1086#1087#1080#1089#1086#1084
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 6
    end
    object QRLabel18: TQRLabel
      Left = 312
      Top = 35
      Width = 129
      Height = 61
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        161.395833333333000000
        825.500000000000000000
        92.604166666666700000
        341.312500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 
        #1058#1080#1087#1086#1074#1072' '#1092#1086#1088#1084#1072' '#8470' '#1050#1054'-1 '#1047#1072#1090#1074#1077#1088#1076#1078#1077#1085#1072' '#1085#1072#1082#1072#1079#1086#1084' '#1052#1110#1085#1089#1090#1072#1090#1091' '#1059#1082#1088#1072#1111#1085#1080' '#1074#1110#1076' 15.' +
        '02.1996 '#1088'. '#8470'51'
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
      Left = 570
      Top = 32
      Width = 96
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666700000
        1508.125000000000000000
        84.666666666666700000
        254.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1050#1042#1048#1058#1040#1053#1062#1030#1071
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLabel6: TQRLabel
      Left = 530
      Top = 56
      Width = 190
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666700000
        1402.291666666670000000
        148.166666666667000000
        502.708333333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1087#1088#1080#1073#1091#1090#1082#1086#1074#1086#1075#1086' '#1082#1072#1089#1086#1074#1086#1075#1086
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLabel19: TQRLabel
      Left = 546
      Top = 80
      Width = 59
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666700000
        1444.625000000000000000
        211.666666666667000000
        156.104166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1086#1088#1076#1077#1088#1091
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRLabel20: TQRLabel
      Left = 530
      Top = 468
      Width = 37
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1402.291666666670000000
        1238.250000000000000000
        97.895833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1050#1072#1089#1080#1088
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel21: TQRLabel
      Left = 530
      Top = 436
      Width = 120
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1402.291666666670000000
        1153.583333333330000000
        317.500000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1043#1086#1083#1086#1074#1085#1080#1081' '#1073#1091#1093#1075#1072#1083#1090#1077#1088
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel22: TQRLabel
      Left = 530
      Top = 396
      Width = 29
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        1402.291666666670000000
        1047.750000000000000000
        76.729166666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #1052'.'#1055'.'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRShape9: TQRShape
      Left = 522
      Top = 0
      Width = 2
      Height = 485
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1283.229166666670000000
        1381.125000000000000000
        0.000000000000000000
        5.291666666666670000)
      Shape = qrsVertLine
    end
    object QRLabel23: TQRLabel
      Left = 64
      Top = 262
      Width = 65
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666700000
        169.333333333333000000
        693.208333333333000000
        171.979166666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'QRLabel23'
      Color = clWhite
      OnPrint = QRLabel23Print
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRLabel24: TQRLabel
      Left = 530
      Top = 202
      Width = 193
      Height = 76
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        201.083333333333000000
        1402.291666666670000000
        534.458333333333000000
        510.645833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'QRLabel24'
      Color = clWhite
      OnPrint = QRLabel23Print
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText2: TQRDBText
      Left = 14
      Top = 0
      Width = 85
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666660000
        37.041666666666670000
        0.000000000000000000
        224.895833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataField = 'NameLong'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
    object QRDBText6: TQRDBText
      Left = 94
      Top = 43
      Width = 39
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        248.708333333333300000
        113.770833333333300000
        103.187500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataField = 'OKPO'
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRDBText8: TQRDBText
      Left = 527
      Top = 0
      Width = 85
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        52.916666666666700000
        1394.354166666670000000
        0.000000000000000000
        224.895833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataField = 'NameLong'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 12
    end
  end
  object quPlatP: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select PlatP.Nom,PlatP.DatePlat,PlatP.Summa,PlatP.Spravka,'
      '       PlatP.TipPlat,Post.NameLong'
      'from PlatP join Post on (PlatP.PostNo=Post.PostNo)'
      'where PlatNo=:PlatNo')
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PlatNo'
      end>
    object quPlatPNom: TIntegerField
      FieldName = 'Nom'
      Origin = 'PlatP.Nom'
    end
    object quPlatPDatePlat: TDateTimeField
      FieldName = 'DatePlat'
      Origin = 'PlatP.DatePlat'
    end
    object quPlatPTipPlat: TSmallintField
      FieldName = 'TipPlat'
      Origin = 'PlatP.TipPlat'
    end
    object quPlatPSumma: TFloatField
      FieldName = 'Summa'
      Origin = 'PlatP.Summa'
      DisplayFormat = '0.00'
    end
    object quPlatPSpravka: TStringField
      FieldName = 'Spravka'
      Origin = 'PlatP.Spravka'
      Size = 55
    end
    object quPlatPNameLong: TStringField
      FieldName = 'NameLong'
      Origin = 'Post.NameLong'
      Size = 80
    end
  end
end
