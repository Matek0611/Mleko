inherited fmMain: TfmMain
  Left = 431
  Top = 214
  VertScrollBar.Range = 0
  Anchors = [akLeft, akTop, akRight, akBottom]
  AutoScroll = False
  Caption = #1057#1082#1083#1072#1076
  ClientHeight = 562
  ClientWidth = 1008
  KeyPreview = True
  Menu = mmMenu
  Position = poDefault
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 0
    Top = 0
    Width = 324
    Height = 56
    Alignment = taCenter
    Caption = #1050#1086#1084#1087#1072#1085'i'#1103' '#1052#1051#1050
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -49
    Font.Name = 'Arial'
    Font.Style = [fsItalic]
    ParentFont = False
    Layout = tlCenter
  end
  object Label2: TLabel [1]
    Left = 0
    Top = 72
    Width = 312
    Height = 24
    Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' (6.2.75)  21.03.2017'
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentColor = False
    ParentFont = False
  end
  inherited StatusBar: TStatusBar
    Top = 543
    Width = 1008
    Panels = <
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' :'
        Width = 85
      end
      item
        Width = 100
      end
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = #1044#1072#1090#1072' :'
        Width = 40
      end
      item
        Bevel = pbRaised
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' :'
        Width = 100
      end
      item
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Width = 50
      end>
  end
  inherited ActionList: TActionList
    Left = 88
    Top = 265
    object ActionServerInfo1: TAction
      Caption = 'ActionServerInfo1'
      ShortCut = 24659
      OnExecute = ActionServerInfo1Execute
    end
    object ActionBlockMainForm: TAction
      Caption = 'ActionBlockMainForm'
      ShortCut = 49218
      OnExecute = ActionBlockMainFormExecute
    end
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 8
    Top = 265
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarMainMenu: TdxBar
      Visible = False
    end
  end
  inherited ApplicationEvents: TApplicationEvents
    Left = 48
    Top = 265
  end
  object mmMenu: TMainMenu
    Left = 120
    Top = 272
    object N1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N3: TMenuItem
        Caption = #1055#1072#1088#1090#1085#1077#1088#1099
        OnClick = N3Click
      end
      object NTovar: TMenuItem
        Caption = #1058#1086#1074#1072#1088
        object N4: TMenuItem
          Caption = #1058#1086#1074#1072#1088
          OnClick = N4Click
        end
        object N106: TMenuItem
          Caption = #1058#1072#1088#1072
          OnClick = N106Click
        end
        object TypeReturn: TMenuItem
          Caption = #1058#1080#1087#1099' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
          OnClick = TypeReturnClick
        end
        object N77: TMenuItem
          Caption = #1058#1080#1087#1099' '#1090#1086#1074#1072#1088#1072
          OnClick = N77Click
        end
        object N24: TMenuItem
          Caption = #1042#1080#1076#1099' '#1090#1086#1074#1072#1088#1072
          OnClick = N24Click
        end
        object StandartsOfGoods: TMenuItem
          Caption = #1057#1090#1072#1085#1076#1072#1088#1090#1099' '#1090#1086#1074#1072#1088#1086#1074
          OnClick = StandartsOfGoodsClick
        end
        object TmDeliveryOfGoods: TMenuItem
          Caption = #1055#1086#1089#1090#1072#1074#1082#1072' '#1090#1086#1074#1072#1088#1072
          OnClick = TmDeliveryOfGoodsClick
        end
      end
      object NAuto: TMenuItem
        Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1080
        object N83: TMenuItem
          Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1080
          OnClick = N83Click
        end
        object N84: TMenuItem
          Caption = #1069#1082#1089#1087#1077#1076#1080#1090#1086#1088#1099
          OnClick = N84Click
        end
        object route: TMenuItem
          Caption = #1052#1072#1088#1096#1088#1091#1090#1099
          OnClick = routeClick
        end
      end
      object NUnlocking: TMenuItem
        Caption = #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
        object N198: TMenuItem
          Caption = #1058#1086#1088#1075#1086#1074#1099#1077' '#1090#1086#1095#1082#1080
          OnClick = N198Click
        end
        object ListAdrInfoNew: TMenuItem
          Caption = #1058#1086#1075#1088#1086#1074#1099#1077' '#1090#1086#1095#1082#1080' ('#1053#1086#1074#1086#1077')'
          OnClick = ListAdrInfoNewClick
        end
        object N132: TMenuItem
          Caption = #1058#1086#1088#1075#1086#1074#1099#1077' '#1090#1086#1095#1082#1080' ('#1087#1086' '#1083#1080#1084#1080#1090#1072#1084#1084')'
          OnClick = N132Click
        end
      end
      object NFinance: TMenuItem
        Caption = #1060#1080#1085#1072#1085#1089#1099
        object N37: TMenuItem
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1092#1080#1085#1072#1085#1089#1086#1074#1086#1081' '#1086#1090#1074#1077#1090#1089#1074#1077#1085#1085#1086#1089#1090#1080
          OnClick = N37Click
        end
        object N43: TMenuItem
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100#1089#1082#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074
          OnClick = N43Click
        end
        object N45: TMenuItem
          Caption = #1053#1072#1073#1086#1088#1099' '#1075#1088#1091#1087#1087' '#1090#1086#1074#1072#1088#1086#1074
          OnClick = N45Click
        end
        object N53: TMenuItem
          Caption = #1054#1090#1089#1088#1086#1095#1082#1080' '#1080' '#1090#1080#1087#1099' '#1094#1077#1085' '#1087#1086' '#1087#1072#1088#1090#1085#1077#1088#1072#1084
          OnClick = N53Click
        end
        object N76: TMenuItem
          Caption = #1042#1080#1076' '#1088#1072#1089#1093#1086#1076#1072
          OnClick = N76Click
        end
        object VidRashGroup: TMenuItem
          Caption = #1043#1088#1091#1087#1087#1072' '#1088#1072#1089#1093#1086#1076#1072
          OnClick = VidRashGroupClick
        end
        object NKassa: TMenuItem
          Caption = #1050#1072#1089#1089#1072
          OnClick = NKassaClick
        end
        object NBanks: TMenuItem
          Caption = #1041#1072#1085#1082#1080
          OnClick = NBanksClick
        end
        object NReasonForUnlocking: TMenuItem
          Caption = #1055#1088#1080#1095#1080#1085#1099' '#1088#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
          OnClick = NReasonForUnlockingClick
        end
        object N33: TMenuItem
          Caption = #1042#1080#1076#1099' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
          OnClick = N33Click
        end
        object NOtdel: TMenuItem
          Caption = #1054#1090#1076#1077#1083#1099
          OnClick = NOtdelClick
        end
        object GroupCutting: TMenuItem
          Caption = #1043#1088#1091#1087#1087#1099' '#1087#1086#1088#1077#1079#1082#1080' '#1079#1072#1082#1072#1079#1086#1074
          OnClick = GroupCuttingClick
        end
        object PostFromGroupCutting: TMenuItem
          Caption = #1055#1072#1088#1090#1085#1077#1088#1099' '#1089' '#1075#1088#1091#1087#1087#1072#1084#1080' '#1087#1086#1088#1077#1079#1082#1080' '#1079#1072#1082#1072#1079#1086#1074
          OnClick = PostFromGroupCuttingClick
        end
        object Currency: TMenuItem
          Caption = #1042#1072#1083#1102#1090#1072
          OnClick = CurrencyClick
        end
        object ExchangeRates: TMenuItem
          Caption = #1050#1091#1088#1089#1099' '#1074#1072#1083#1102#1090
          OnClick = ExchangeRatesClick
        end
      end
      object NOutlets: TMenuItem
        Caption = #1058#1086#1088#1075#1086#1074#1099#1077' '#1090#1086#1095#1082#1080
        object CategoryTT: TMenuItem
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1058#1086#1088#1075'. '#1058#1086#1095#1077#1082
          OnClick = CategoryTTClick
        end
        object NSalesChannelsPepsi: TMenuItem
          Caption = #1050#1072#1085#1072#1083#1099' '#1089#1073#1099#1090#1072' '#1087#1086' Pepsico'
          OnClick = NSalesChannelsPepsiClick
        end
        object N41: TMenuItem
          Caption = #1056#1072#1081#1086#1085#1099
          OnClick = N41Click
        end
        object NKOATUU: TMenuItem
          Caption = #1058#1077#1088#1088#1080#1090#1086#1088#1080#1080
          OnClick = NKOATUUClick
        end
        object NCommerceNetwork: TMenuItem
          Caption = #1058#1086#1088#1075#1086#1074#1099#1077' '#1089#1077#1090#1080' '#1074' Pepsico'
          OnClick = NCommerceNetworkClick
        end
        object ABCDZ1: TMenuItem
          Caption = 'ABCDZ '#1082#1083#1072#1089#1089#1080#1092#1080#1082#1072#1090#1086#1088
          OnClick = ABCDZ1Click
        end
      end
      object N20: TMenuItem
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
        OnClick = N20Click
      end
      object N48: TMenuItem
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1080
        OnClick = N48Click
      end
      object MarijaGroupTax: TMenuItem
        Caption = #1053#1072#1083#1086#1075#1086#1074#1099#1077' '#1075#1088#1091#1087#1087#1099' '#1052#1072#1088#1080#1103'-301 '#1084#1090#1084
        OnClick = MarijaGroupTaxClick
      end
      object NPepsico: TMenuItem
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1080
        OnClick = NPepsicoClick
      end
    end
    object N80: TMenuItem
      Caption = #1061#1086#1076#1082#1080
      object N85: TMenuItem
        Caption = #1053#1072' '#1079#1072#1074#1090#1088#1072
        OnClick = N85Click
      end
      object N81: TMenuItem
        Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
        OnClick = N81Click
      end
      object ExpeditionCur1: TMenuItem
        Caption = 'ExpeditionCur'
        OnClick = ExpeditionCur1Click
      end
      object ExpeditionPrev1: TMenuItem
        Caption = 'ExpeditionPrev'
        OnClick = ExpeditionPrev1Click
      end
      object N82: TMenuItem
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        OnClick = N82Click
      end
      object N131: TMenuItem
        Caption = #1051#1086#1075#1080#1089#1090#1080#1082#1072
        OnClick = N131Click
      end
      object N152: TMenuItem
        Caption = #1043#1088#1072#1092#1080#1082' '#1074#1086#1076#1080#1090#1077#1083#1077#1081
        OnClick = N152Click
      end
    end
    object N133: TMenuItem
      Caption = #1057#1074#1077#1076#1077#1085#1080#1077
      object N134: TMenuItem
        Caption = #1061#1086#1076#1082#1080' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100
        OnClick = N134Click
      end
      object N150: TMenuItem
        Caption = #1061#1086#1076#1082#1080' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        OnClick = N150Click
      end
      object N135: TMenuItem
        Caption = #1053#1072#1082#1083#1072#1076#1085#1099#1077' '#1085#1077' '#1074#1086#1096#1077#1076#1096#1080#1077' '#1074' '#1093#1086#1076#1082#1080
        OnClick = N135Click
      end
      object N156: TMenuItem
        Caption = '-'
      end
      object N136: TMenuItem
        Caption = #1048#1089#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
        OnClick = N136Click
      end
      object N137: TMenuItem
        Caption = #1048#1089#1087#1088#1072#1074#1083#1077#1085#1085#1099#1081' '#1090#1086#1074#1072#1088
        OnClick = N137Click
      end
      object N138: TMenuItem
        Caption = #1053#1077' '#1089#1074#1077#1076#1077#1085#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
        OnClick = N138Click
      end
    end
    object N2: TMenuItem
      Caption = #1058#1086#1074#1072#1088
      object N5: TMenuItem
        Caption = #1055#1088#1080#1093#1086#1076
        OnClick = N5Click
      end
      object N10: TMenuItem
        Caption = #1056#1072#1089#1093#1086#1076
        OnClick = N10Click
      end
      object N126: TMenuItem
        Caption = #1042#1086#1079#1074#1088#1072#1090
        OnClick = N126Click
      end
      object ReceiptOrder: TMenuItem
        Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1081' '#1079#1072#1082#1072#1079
        OnClick = ReceiptOrderClick
      end
      object N200: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1088#1072#1089#1093#1086#1076#1086#1074' '#1080' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
        OnClick = N200Click
      end
      object N124: TMenuItem
        Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1088#1072#1089#1093#1086#1076#1085#1099#1093' '#1085#1072#1082#1083#1072#1076#1085#1099#1093
        OnClick = N124Click
      end
      object NExportFromSandora: TMenuItem
        Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1092#1072#1081#1083#1086#1074' '#1076#1083#1103' '#1057#1072#1085#1076#1086#1088#1099
        object NExportSotrud: TMenuItem
          Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1090#1086#1088#1075#1086#1074#1099#1093' '#1087#1088#1077#1076#1089#1090#1072#1074#1080#1090#1077#1083#1077#1081
          OnClick = NExportSotrudClick
        end
        object NExportAdrPost: TMenuItem
          Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1090#1086#1095#1077#1082' '#1076#1086#1089#1090#1072#1074#1082#1080
          OnClick = NExportAdrPostClick
        end
        object NExportSales: TMenuItem
          Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1087#1088#1086#1076#1072#1078
          OnClick = NExportSalesClick
        end
        object NExportRestSand: TMenuItem
          Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074
          OnClick = NExportRestSandClick
        end
        object NExportOtchetSand: TMenuItem
          Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1077#1078#1077#1084#1077#1089#1103#1095#1085#1086#1075#1086' '#1086#1090#1095#1077#1090#1072
          OnClick = NExportOtchetSandClick
        end
      end
      object N111: TMenuItem
        Caption = '-'
      end
      object N36: TMenuItem
        Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
        object N49: TMenuItem
          Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
          OnClick = N49Click
        end
        object NaklPCur: TMenuItem
          Caption = 'NaklPCur'
          OnClick = NaklPCurClick
        end
        object NaklPPrev: TMenuItem
          Caption = 'NaklPPrev'
          OnClick = NaklPPrevClick
        end
        object N50: TMenuItem
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          OnClick = N50Click
        end
        object CreatWithExel: TMenuItem
          Caption = #1057#1086#1079#1076#1072#1090#1100' '#1080#1079' '#1045#1082#1089#1077#1083#1100' '#1092#1072#1081#1083#1072
          OnClick = CreatWithExelClick
        end
      end
      object N51: TMenuItem
        Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
        object N54: TMenuItem
          Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
          OnClick = N54Click
        end
        object NaklRCur: TMenuItem
          Caption = 'NaklRCur'
          OnClick = NaklRCurClick
        end
        object NaklRPrev: TMenuItem
          Caption = 'NaklRPrev'
          OnClick = NaklRPrevClick
        end
        object N52: TMenuItem
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          OnClick = N52Click
        end
      end
      object N127: TMenuItem
        Caption = #1042#1086#1079#1074#1088#1072#1090#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
        object N128: TMenuItem
          Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
          OnClick = N128Click
        end
        object NaklRetCur: TMenuItem
          Caption = 'NaklRetCur'
          OnClick = NaklRetCurClick
        end
        object NaklRetPrev: TMenuItem
          Caption = 'NaklRetPrev'
          OnClick = NaklRetPrevClick
        end
        object N129: TMenuItem
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          OnClick = N129Click
        end
      end
      object ReceiptOrders: TMenuItem
        Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
        object ReceiptOrdersTodey: TMenuItem
          Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
          OnClick = ReceiptOrdersTodeyClick
        end
        object ReceiptOrdersCur: TMenuItem
          OnClick = ReceiptOrdersCurClick
        end
        object ReceiptOrdersPrev: TMenuItem
          OnClick = ReceiptOrdersPrevClick
        end
        object ReceiptOrdersDop: TMenuItem
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          OnClick = ReceiptOrdersDopClick
        end
      end
      object NRequestForSupply: TMenuItem
        Caption = #1047#1072#1087#1088#1086#1089' '#1085#1072' '#1087#1086#1089#1090#1072#1074#1082#1091
        OnClick = NRequestForSupplyClick
      end
      object N110: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Caption = #1054#1089#1090#1072#1090#1086#1082
        OnClick = N9Click
      end
      object NRest1: TMenuItem
        Caption = #1054#1089#1090#1072#1090#1086#1082'-1'
        OnClick = NRest1Click
      end
      object RestOfDateManuf: TMenuItem
        Caption = #1054#1089#1090#1072#1090#1086#1082' '#1087#1086' '#1076#1072#1090#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
        OnClick = RestOfDateManufClick
      end
      object N210: TMenuItem
        Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1089' '#1086#1089#1090#1072#1090#1082#1086#1084
        OnClick = N210Click
      end
      object RestContainer: TMenuItem
        Caption = #1054#1089#1090#1072#1090#1086#1082' '#1090#1072#1088#1099
        OnClick = RestContainerClick
      end
      object N158: TMenuItem
        Caption = '-'
      end
      object N87: TMenuItem
        Caption = #1058#1072#1088#1072
        object N107: TMenuItem
          Caption = #1055#1088#1080#1093#1086#1076
          OnClick = N107Click
        end
        object N108: TMenuItem
          Caption = #1056#1072#1089#1093#1086#1076
          OnClick = N108Click
        end
        object N162: TMenuItem
          Caption = '-'
        end
        object N109: TMenuItem
          Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
          object N118: TMenuItem
            Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
            OnClick = N118Click
          end
          object NaklPCur1: TMenuItem
            Caption = 'NaklPCur'
            OnClick = NaklPCur1Click
          end
          object NaklPPrev1: TMenuItem
            Caption = 'NaklPPrev'
            OnClick = NaklPPrev1Click
          end
          object N119: TMenuItem
            Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
            OnClick = N119Click
          end
        end
        object N114: TMenuItem
          Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1077' '#1085#1072#1082#1083#1072#1076#1085#1099#1077
          object N120: TMenuItem
            Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
            OnClick = N120Click
          end
          object NaklRCur1: TMenuItem
            Caption = 'NaklRCur'
            OnClick = NaklRCur1Click
          end
          object NaklRPrev1: TMenuItem
            Caption = 'NaklRPrev'
            OnClick = NaklRPrev1Click
          end
          object N121: TMenuItem
            Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
            OnClick = N121Click
          end
        end
        object N163: TMenuItem
          Caption = '-'
        end
        object N115: TMenuItem
          Caption = #1054#1089#1090#1072#1090#1086#1082
          OnClick = N115Click
        end
        object N116: TMenuItem
          Caption = #1050#1072#1088#1090#1086#1095#1082#1072
        end
        object N117: TMenuItem
          Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1089' '#1086#1089#1090#1072#1090#1082#1086#1084
        end
        object N164: TMenuItem
          Caption = '-'
        end
        object Exell1: TMenuItem
          Caption = #1054#1090#1095#1077#1090' '#1074' Excel'
          OnClick = Exell1Click
        end
      end
      object N201: TMenuItem
        Caption = '-'
      end
      object N47: TMenuItem
        Caption = #1050' '#1079#1072#1082#1091#1087#1082#1077
        OnClick = N47Click
      end
      object N159: TMenuItem
        Caption = '-'
      end
      object N182: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1079#1072#1082#1072#1079#1086#1074
        OnClick = N182Click
      end
      object N141: TMenuItem
        Caption = #1042#1085#1077#1096#1085#1080#1077' '#1079#1072#1082#1072#1079#1099
        OnClick = N141Click
      end
      object BlankListLight: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1079#1072#1082#1072#1079#1086#1074' '#1076#1083#1103' '#1072#1075#1077#1085#1090#1086#1074
        OnClick = BlankListLightClick
      end
      object AnalisCuttingMesh: TMenuItem
        Caption = #1040#1085#1072#1083#1080#1079' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1081' '#1087#1086#1088#1077#1079#1082#1080' '#1089#1077#1090#1082#1080
        OnClick = AnalisCuttingMeshClick
      end
      object InfarmAnalysis: TMenuItem
        Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1086#1085#1085#1099#1081' '#1079#1072#1082#1072#1079
        OnClick = InfarmAnalysisClick
      end
      object IndentOrders: TMenuItem
        Caption = #1055#1088#1077#1085#1091#1076#1080#1090#1077#1083#1100#1085#1072#1103' '#1074#1090#1103#1078#1082#1072' '#1074#1085#1077#1096#1085#1080#1093' '#1079#1072#1082#1072#1079#1086#1074
        OnClick = IndentOrdersClick
      end
      object MlekoBlankListWisKPK: TMenuItem
        Caption = #1047#1072#1082#1072#1079#1099' '#1089' '#1050#1055#1050
        OnClick = MlekoBlankListWisKPKClick
      end
      object InputOrderExcel: TMenuItem
        Caption = #1042#1090#1103#1078#1082#1072' '#1079#1072#1082#1072#1079#1086#1074' '#1080#1079' Excel'
        OnClick = InputOrderExcelClick
      end
      object InputOrderExcelNew: TMenuItem
        Caption = #1042#1090#1103#1078#1082#1072' '#1079#1072#1082#1072#1079#1086#1074' '#1080#1079' Excel '#1085#1086#1074#1086#1077
        OnClick = InputOrderExcelNewClick
      end
      object N69: TMenuItem
        Caption = #1054#1073#1097#1080#1081' '#1073#1083#1072#1085#1082' '#1079#1072#1082#1072#1079#1086#1074
        OnClick = N69Click
      end
      object N130: TMenuItem
        Caption = #1055#1088#1072#1081#1089' '#1083#1080#1089#1090
        OnClick = N130Click
      end
      object N153_CangePriceList: TMenuItem
        Caption = #1042#1099#1075#1088#1091#1079#1082#1072'/'#1079#1072#1075#1088#1091#1079#1082#1072' '#1094#1077#1085
        OnClick = N153_CangePriceListClick
      end
      object ExpotrTovForScales: TMenuItem
        Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1090#1086#1074#1072#1088#1086#1074' '#1076#1083#1103' '#1074#1077#1089#1086#1074
        OnClick = ExpotrTovForScalesClick
      end
      object N160: TMenuItem
        Caption = '-'
      end
      object N123: TMenuItem
        Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1090#1086#1074#1072#1088#1072' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074
        OnClick = N123Click
      end
      object N64: TMenuItem
        Caption = #1058#1086#1087' '#1072#1089#1089#1086#1088#1090#1080#1084#1077#1085#1090
        OnClick = N64Click
      end
      object N65: TMenuItem
        Caption = #1055#1088#1086#1089#1088#1086#1095#1077#1085#1085#1099#1081' '#1090#1086#1074#1072#1088
        OnClick = N65Click
      end
      object N189: TMenuItem
        Caption = #1042#1077#1089#1086#1074#1082#1072
        OnClick = N189Click
      end
      object N199: TMenuItem
        Caption = #1040#1091#1076#1080#1090
        OnClick = N199Click
      end
      object NCorrectRestOfVPrih: TMenuItem
        Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1086#1089#1090#1072#1090#1082#1086#1074' '#1087#1086' '#1074#1080#1088#1090'. '#1087#1088#1080#1093#1086#1076#1072#1084
        OnClick = NCorrectRestOfVPrihClick
      end
    end
    object N11: TMenuItem
      Caption = #1044#1086#1083#1075#1080
      object AnalyzeDebitDebt: TMenuItem
        Caption = #1040#1085#1072#1083#1080#1079' '#1076#1077#1073#1080#1090'. '#1079#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1080
        OnClick = AnalyzeDebitDebtClick
      end
      object N16: TMenuItem
        Caption = #1044#1077#1073#1077#1090#1086#1088#1099
        OnClick = N16Click
      end
      object N15: TMenuItem
        Caption = #1050#1088#1077#1076#1080#1090#1086#1088#1099
        OnClick = N15Click
      end
      object N168: TMenuItem
        Caption = '-'
      end
      object N66: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1080#1077' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
        OnClick = N66Click
      end
      object N178: TMenuItem
        Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1087#1086' '#1088#1072#1089#1095#1077#1090#1072#1084
        OnClick = N178Click
      end
    end
    object N17: TMenuItem
      Caption = #1044#1077#1085#1100#1075#1080
      object N19: TMenuItem
        Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1081' '#1086#1088#1076#1077#1088' '
        OnClick = N19Click
      end
      object N28: TMenuItem
        Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1081' '#1086#1088#1076#1077#1088' '#1041#1053
        OnClick = N28Click
      end
      object N165: TMenuItem
        Caption = '-'
      end
      object N31: TMenuItem
        Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1081' '#1086#1088#1076#1077#1088
        OnClick = N31Click
      end
      object N32: TMenuItem
        Caption = #1056#1072#1089#1093#1086#1076#1085#1099#1081' '#1086#1088#1076#1077#1088' '#1041#1053
        OnClick = N32Click
      end
      object N166: TMenuItem
        Caption = '-'
      end
      object N18: TMenuItem
        Caption = #1054#1088#1076#1077#1088#1072' '#1087#1088#1080#1093#1086#1076#1085#1099#1077
        object N13: TMenuItem
          Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
          OnClick = N13Click
        end
        object OrderPrihCur: TMenuItem
          Caption = 'OrderPrihCur'
          OnClick = OrderPrihCurClick
        end
        object OrderPrihPrev: TMenuItem
          Caption = 'OrderPrihPrev'
          OnClick = OrderPrihPrevClick
        end
        object N14: TMenuItem
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          OnClick = N14Click
        end
      end
      object N12: TMenuItem
        Caption = #1054#1088#1076#1077#1088#1072' '#1088#1072#1089#1093#1086#1076#1085#1099#1077
        object N55: TMenuItem
          Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
          OnClick = N55Click
        end
        object OrderRasCurr1: TMenuItem
          Caption = 'OrderRasCurr'
          OnClick = OrderRasCurr1Click
        end
        object OrderRasPrev1: TMenuItem
          Caption = 'OrderRasPrev'
          OnClick = OrderRasPrev1Click
        end
        object N56: TMenuItem
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          OnClick = N56Click
        end
      end
      object N167: TMenuItem
        Caption = '-'
      end
      object N74: TMenuItem
        Caption = #1056#1072#1089#1093#1086#1076' '#1074#1085#1091#1090#1088#1077#1085#1085#1080#1081
        OnClick = N74Click
      end
      object N96: TMenuItem
        Caption = #1055#1086#1076#1086#1090#1095#1077#1090
        OnClick = N96Click
      end
      object N90: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1076#1086#1090#1095#1077#1090#1086#1074
        object N92: TMenuItem
          Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
          OnClick = N92Click
        end
        object N93: TMenuItem
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          OnClick = N93Click
        end
      end
      object NWriteOffCosts: TMenuItem
        Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1086#1074
        OnClick = NWriteOffCostsClick
      end
    end
    object N21: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
      object N187: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1086#1090#1095#1077#1090#1086#1074
        OnClick = N187Click
      end
      object N39: TMenuItem
        Caption = '-'
      end
      object N63: TMenuItem
        Caption = #1054#1090#1095#1077#1090#1099' '#1074#1085#1077#1096#1085#1080#1093' '#1089#1080#1089#1090#1077#1084
        object N122: TMenuItem
          Caption = #1054#1090#1095#1077#1090#1085#1086#1089#1090#1100' '#1058#1072#1074#1088#1080#1103
          OnClick = N122Click
        end
        object N204: TMenuItem
          Caption = #1054#1090#1095#1077#1090#1085#1086#1089#1090#1100' '#1041#1080#1083#1083#1072
          OnClick = N204Click
        end
      end
      object J1: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1088#1077#1085#1090#1072#1073#1077#1083#1100#1085#1086#1089#1090#1080' "'#1058#1072#1081#1092#1091#1085'"'
        OnClick = J1Click
      end
      object NUP: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1088#1077#1085#1090#1072#1073#1077#1083#1100#1085#1086#1089#1090#1080' "'#1059#1055'"'
        OnClick = NUPClick
      end
      object N22: TMenuItem
        Caption = #1055#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1084
        OnClick = N22Click
      end
      object N169: TMenuItem
        Caption = '-'
      end
      object N88: TMenuItem
        Caption = #1041#1088#1101#1085#1076
        object N79: TMenuItem
          Caption = #1054#1090#1095#1077#1090' '#1044#1072#1085#1086#1085'  '#1074' Excel'
          OnClick = N79Click
        end
        object N86: TMenuItem
          Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1080#1076#1072#1084
          OnClick = N86Click
        end
        object N1111: TMenuItem
          Caption = '111'
          OnClick = N1111Click
        end
      end
      object N23: TMenuItem
        Caption = #1055#1086' '#1090#1086#1074#1072#1088#1091
        OnClick = N23Click
      end
      object N44: TMenuItem
        Caption = #1055#1086' '#1090#1086#1074#1072#1088#1091' '#1089' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1086#1081' '#1087#1086' '#1074#1080#1076#1072#1084
        OnClick = N44Click
      end
      object N170: TMenuItem
        Caption = '-'
      end
      object N26: TMenuItem
        Caption = #1055#1086' '#1082#1072#1089#1089#1077' 1'
        OnClick = N26Click
      end
      object N211: TMenuItem
        Caption = #1055#1086' '#1082#1072#1089#1089#1077' 2'
        OnClick = N211Click
      end
      object N38: TMenuItem
        Caption = #1055#1086' '#1073#1072#1085#1082#1091
        OnClick = N38Click
      end
      object N172: TMenuItem
        Caption = '-'
      end
      object N27: TMenuItem
        Caption = #1052#1077#1085#1077#1076#1078#1077#1088#1099
        object N34: TMenuItem
          Caption = #1055#1086' '#1085#1072#1082#1083#1072#1076#1085#1099#1084
          OnClick = N34Click
        end
        object N35: TMenuItem
          Caption = #1055#1086' '#1076#1077#1085#1100#1075#1072#1084
          OnClick = N35Click
        end
        object N60: TMenuItem
          Caption = #1044#1086#1083#1075#1080
          object N125: TMenuItem
            Caption = #1055#1077#1095#1072#1090#1100
            OnClick = N125Click
          end
          object Excel4: TMenuItem
            Caption = 'Excel'
            OnClick = Excel4Click
          end
        end
        object N310: TMenuItem
          Caption = #1047#1072#1088#1087#1083#1072#1090#1072' 3'
          OnClick = N310Click
        end
        object N42: TMenuItem
          Caption = #1055#1088#1086#1076#1072#1078#1080
          object N105: TMenuItem
            Caption = #1055#1077#1095#1072#1090#1100
            OnClick = N105Click
          end
          object Excel3: TMenuItem
            Caption = 'Excel'
            OnClick = Excel3Click
          end
        end
        object NS1: TMenuItem
          Caption = #1047#1072#1088#1087#1083#1072#1090#1072' NS'
          OnClick = NS1Click
        end
        object N29: TMenuItem
          Caption = #1055#1083#1072#1085
          OnClick = N29Click
        end
        object N78: TMenuItem
          Caption = #1055#1086' '#1074#1080#1076#1072#1084' '#1090#1086#1074#1072#1088#1072
          OnClick = N78Click
        end
        object N11111: TMenuItem
          Caption = #1044#1086#1083#1075#1080' '#1087#1086' '#1087#1086#1076#1086#1090#1095#1077#1090#1072#1084
          OnClick = N11111Click
        end
      end
      object N25: TMenuItem
        Caption = #1055#1088#1072#1081#1089
        OnClick = N25Click
      end
      object N174: TMenuItem
        Caption = '-'
      end
      object N46: TMenuItem
        Caption = #1054#1090#1087#1091#1089#1082' '#1087#1086' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103#1084' '#1087#1086' '#1087#1077#1088#1080#1086#1076#1072#1084
        object N112: TMenuItem
          Caption = #1055#1077#1095#1072#1090#1100
          OnClick = N112Click
        end
        object N212: TMenuItem
          Caption = 'Excel'
          OnClick = N212Click
        end
      end
      object N57: TMenuItem
        Caption = #1054#1090#1087#1091#1089#1082' '#1087#1086' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103#1084' '#1087#1086' '#1087#1077#1088#1080#1086#1076#1072#1084
        object N103: TMenuItem
          Caption = #1055#1077#1095#1072#1090#1100
          OnClick = N103Click
        end
        object Excel2: TMenuItem
          Caption = 'Excel'
          OnClick = Excel2Click
        end
      end
      object N62: TMenuItem
        Caption = #1055#1086' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103#1084' '#1080' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103#1084' '
        object N89: TMenuItem
          Caption = #1056#1072#1089#1093#1086#1076
          object N94: TMenuItem
            Caption = #1055#1077#1095#1072#1090#1100
            OnClick = N94Click
          end
          object Excel5: TMenuItem
            Caption = 'Excel'
            OnClick = Excel5Click
          end
        end
        object N91: TMenuItem
          Caption = #1042#1086#1079#1074#1088#1072#1090
          object N95: TMenuItem
            Caption = #1055#1077#1095#1072#1090#1100
            OnClick = N95Click
          end
          object Excel6: TMenuItem
            Caption = 'Excel'
            OnClick = Excel6Click
          end
        end
      end
      object N173: TMenuItem
        Caption = '-'
      end
      object N67: TMenuItem
        Caption = #1064#1072#1093#1084#1072#1090#1082#1072' '#1087#1086' '#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103#1084
        OnClick = N67Click
      end
      object N68: TMenuItem
        Caption = #1064#1072#1093#1084#1072#1090#1082#1072' '#1087#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084
        OnClick = N68Click
      end
      object N75: TMenuItem
        Caption = #1064#1072#1093#1084#1072#1090#1082#1072' '#1087#1086' '#1074#1086#1079#1074#1088#1072#1090#1091' '#1090#1086#1074#1072#1088#1072
        OnClick = N75Click
      end
      object N181: TMenuItem
        Caption = #1042#1086#1079#1074#1088#1072#1090#1099' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084
      end
      object UMC1: TMenuItem
        Caption = #1057#1095#1077#1090#1072' UMC'
      end
    end
    object N179: TMenuItem
      Caption = #1060#1080#1085#1072#1085#1089#1099
      object N190: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1088#1072#1089#1093#1086#1076#1086#1074
        OnClick = N190Click
      end
      object NCrosPaymentFromPost: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1086#1087#1083#1072#1090#1099' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084
        OnClick = NCrosPaymentFromPostClick
      end
      object NBDDS: TMenuItem
        Caption = #1041#1044#1044#1057
        OnClick = NBDDSClick
      end
      object NPlanningOrder: TMenuItem
        Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1088#1086#1076#1072#1078
        OnClick = NPlanningOrderClick
        object NNewPlanningOrder: TMenuItem
          Caption = #1053#1086#1074#1086#1077
          OnClick = NNewPlanningOrderClick
        end
        object NPlanningToday: TMenuItem
          Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
          OnClick = NPlanningTodayClick
        end
        object PlanningOrderCur: TMenuItem
          Caption = 'PlanningOrderCur'
          OnClick = PlanningOrderCurClick
        end
        object PlanningOrderPrev: TMenuItem
          Caption = 'PlanningOrderPrev'
          OnClick = PlanningOrderPrevClick
        end
        object PlanningOrderDop: TMenuItem
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
          OnClick = PlanningOrderDopClick
        end
      end
      object AnalisPlanProdag: TMenuItem
        Caption = #1040#1085#1072#1083#1080#1079' '#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1080#1103' '#1087#1088#1086#1076#1072#1078
        OnClick = AnalisPlanProdagClick
      end
      object AnalizReturnOrder: TMenuItem
        Caption = #1040#1085#1072#1083#1080#1079' '#1074#1086#1079#1074#1088#1072#1090#1086#1074
        OnClick = AnalizReturnOrderClick
      end
      object PricingList: TMenuItem
        Caption = #1062#1077#1085#1086#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
        OnClick = PricingListClick
      end
      object CheckPriceInInst: TMenuItem
        Caption = #1057#1074#1077#1088#1082#1072' '#1087#1088#1080#1093#1086#1076#1086#1074' '#1089' '#1091#1089#1090'.'#1074#1093'. '#1094#1077#1085#1086#1081
        OnClick = CheckPriceInInstClick
      end
      object LightOfGornalRash: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1087#1083#1072#1090#1077#1078#1077#1081
        OnClick = LightOfGornalRashClick
      end
      object MoneyCompensation: TMenuItem
        Caption = #1050#1086#1084#1087#1077#1085#1089#1072#1094#1080#1103' '#1044#1057
        OnClick = MoneyCompensationClick
      end
    end
    object N143: TMenuItem
      Caption = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1087#1088#1080#1085#1090#1077#1088
      object N146: TMenuItem
        Caption = #1053#1091#1083#1077#1074#1086#1081' '#1095#1077#1082
        OnClick = N146Click
      end
      object Z1: TMenuItem
        Caption = 'Z-'#1054#1090#1095#1077#1090
        OnClick = Z1Click
      end
      object X1: TMenuItem
        Caption = 'X-'#1054#1090#1095#1077#1090
        OnClick = X1Click
      end
      object N102: TMenuItem
        Caption = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1086#1090#1095#1077#1090' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        OnClick = N102Click
      end
      object N175: TMenuItem
        Caption = '-'
      end
      object N144: TMenuItem
        Caption = #1042#1085#1077#1089#1077#1085#1080#1077' '#1085#1072#1083#1080#1095#1085#1086#1089#1090#1080
        OnClick = N144Click
      end
      object N145: TMenuItem
        Caption = #1042#1099#1076#1072#1095#1091' '#1085#1072#1083#1080#1095#1085#1086#1089#1090#1080
        OnClick = N145Click
      end
      object N176: TMenuItem
        Caption = '-'
      end
      object N97: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1103#1097#1080#1082
        OnClick = N97Click
      end
      object N101: TMenuItem
        Caption = #1042#1086#1079#1074#1088#1072#1090' '#1087#1086' '#1095#1077#1082#1091
        OnClick = N101Click
      end
    end
    object N58: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
      object N70: TMenuItem
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
        OnClick = N70Click
      end
      object N140: TMenuItem
        Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1090#1077#1088#1084#1080#1085#1072#1083#1086#1074
        OnClick = N140Click
      end
      object N30: TMenuItem
        Caption = #1043#1086#1088#1103#1095#1080#1077' '#1082#1083#1072#1074#1080#1096#1080
        OnClick = N30Click
      end
      object N59: TMenuItem
        Caption = #1055#1088#1086#1095#1077#1077
        OnClick = N59Click
      end
      object N71: TMenuItem
        Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1088#1077#1078#1080#1084' '#1082#1072#1089#1089#1099
        object N72: TMenuItem
          Caption = #1056#1091#1095#1085#1086#1081
          OnClick = N72Click
        end
        object N73: TMenuItem
          Caption = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1087#1088#1080#1085#1090#1077#1088
          OnClick = N73Click
        end
      end
      object N61: TMenuItem
        Caption = #1058#1077#1089#1090' '#1082#1072#1089#1089#1099
        OnClick = N61Click
      end
      object N142: TMenuItem
        Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1087#1077#1088#1080#1086#1076#1072
        OnClick = N142Click
      end
      object N153: TMenuItem
        Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072' '#1087#1077#1088#1077#1080#1086#1076#1072' '#1076#1083#1103' '#1093#1086#1076#1086#1082
        OnClick = N153Click
      end
      object N139: TMenuItem
        Caption = #1042#1099#1073#1086#1088' '#1082#1072#1089#1089#1099
        object N147: TMenuItem
          Caption = #1050#1072#1089#1089#1086#1074#1099#1081' '#1072#1087#1087#1072#1088#1072#1090
          OnClick = N147Click
        end
        object N148: TMenuItem
          Caption = #1060#1080#1089#1082#1072#1083#1100#1085#1099#1081' '#1087#1088#1080#1085#1090#1077#1088
          OnClick = N148Click
        end
      end
      object N98: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1080#1077' '#1082#1072#1089#1089#1086#1074#1086#1075#1086' '#1103#1097#1080#1082#1072
        object N99: TMenuItem
          Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
        end
        object N100: TMenuItem
          Caption = #1055#1088#1080#1085#1091#1076#1080#1090#1077#1083#1100#1085#1086
        end
      end
      object N186: TMenuItem
        Caption = #1057#1084#1077#1085#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103' '#1080' '#1088#1072#1073#1086#1095#1077#1081' '#1076#1072#1090#1099
        OnClick = N186Click
      end
      object N149: TMenuItem
        Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1076#1086#1087#1091#1089#1090#1080#1084#1086#1075#1086' '#1076#1080#1072#1087#1072#1079#1086#1085#1072' '#1042#1093#1086#1076#1103#1097#1077#1081' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1086#1081' '#1094#1077#1085#1099
        OnClick = N149Click
      end
      object NMinusVidTovar: TMenuItem
        Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1041#1088#1077#1085#1076#1086#1074' '#1076#1083#1103' '#1088#1072#1089#1089#1099#1083#1082#1080' "0" '#1086#1089#1090#1072#1090#1082#1086#1074
        OnClick = NMinusVidTovarClick
      end
      object NOstatokZero: TMenuItem
        Caption = 
          #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072#1084' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1072' '#1087#1086' '#1072#1085#1072#1083#1080#1079#1091' '#1076#1077#1085#1077#1078#1085#1086#1075#1086' '#1086#1073#1086#1088 +
          #1086#1090#1072' '
        OnClick = NOstatokZeroClick
      end
      object NMinusVidRashod: TMenuItem
        Caption = 
          #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1087#1086' '#1089#1090#1072#1090#1100#1103#1084' '#1088#1072#1089#1093#1086#1076#1086#1074' '#1076#1083#1103' '#1086#1090#1095#1077#1090#1072' '#1087#1086' '#1072#1085#1072#1083#1080#1079#1091' '#1076#1077#1085#1077#1078#1085#1086#1075#1086' ' +
          #1086#1073#1086#1088#1086#1090#1072
        OnClick = NMinusVidRashodClick
      end
      object NClearBase: TMenuItem
        Caption = #1054#1095#1080#1089#1090#1082#1072' '#1073#1072#1079#1099
        OnClick = NClearBaseClick
      end
      object NPostMinusClearBase: TMenuItem
        Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072#1084' '#1076#1083#1103' '#1086#1095#1080#1089#1090#1082#1080' '#1073#1072#1079#1099
        OnClick = NPostMinusClearBaseClick
      end
      object NMinVidTovForClBase: TMenuItem
        Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103' '#1087#1086' '#1089#1090#1072#1090#1100#1103#1084' '#1088#1072#1089#1093#1086#1076#1072' '#1076#1083#1103' '#1086#1095#1080#1089#1090#1082#1080' '#1073#1072#1079#1099
        OnClick = NMinVidTovForClBaseClick
      end
      object ControlRestDOM: TMenuItem
        Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1086#1089#1090#1072#1090#1082#1072#1084#1080' '#1087#1086' '#1076#1072#1090#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1072
        OnClick = ControlRestDOMClick
      end
      object VidDoc: TMenuItem
        Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        OnClick = VidDocClick
      end
      object ContVidRashod: TMenuItem
        Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1074#1080#1076#1086#1084' '#1088#1072#1089#1093#1086#1076#1072' '#1076#1083#1103' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1076#1072#1085#1085#1099#1093' '#1085#1072' '#1089#1072#1081#1090
        OnClick = ContVidRashodClick
      end
      object ListVidTovForGrCut: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1074#1080#1076#1086#1074' '#1090#1086#1074#1072#1088#1072' '#1076#1083#1103' '#1087#1086#1088#1077#1079#1082#1080' '#1089#1077#1090#1082#1080
        OnClick = ListVidTovForGrCutClick
      end
      object CheckMeshCutting: TMenuItem
        Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1076#1085#1103' '#1087#1086#1088#1077#1079#1082#1080' '#1089#1077#1090#1082#1080
        OnClick = CheckMeshCuttingClick
      end
      object IsEconom: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1091#1095#1077#1090#1072
        OnClick = IsEconomClick
      end
      object AnalisPP: TMenuItem
        Caption = #1040#1055#1055
        OnClick = AnalisPPClick
      end
      object ClampingBDDS: TMenuItem
        Caption = #1041#1044#1044#1057
        OnClick = ClampingBDDSClick
      end
      object mnuDebtSettings: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1076#1083#1103' '#1072#1085#1072#1083#1080#1079#1072' '#1044#1090
        OnClick = mnuDebtSettingsClick
      end
    end
    object N104: TMenuItem
      Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1080#1103
      object N1C1: TMenuItem
        Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' "1'#1057'"'
        OnClick = N1C1Click
      end
      object N113: TMenuItem
        Caption = #1054#1090#1095#1077#1090' 1'
        OnClick = N113Click
      end
      object est1: TMenuItem
        Caption = '1cTest'
      end
      object N205: TMenuItem
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
      end
    end
    object N151: TMenuItem
      Caption = #1050#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1103
      object N183: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1076#1080#1072#1083#1086#1075#1086#1074#1099#1093' '#1092#1086#1088#1084
        OnClick = N183Click
      end
      object N188: TMenuItem
        Caption = #1053#1086#1074#1099#1081' '#1086#1090#1095#1077#1090
        OnClick = N188Click
      end
      object N203: TMenuItem
        Caption = #1053#1086#1074#1072#1103' '#1092#1086#1088#1084#1072' '#1089#1074#1086#1081#1089#1090#1074
        OnClick = N203Click
      end
      object N202: TMenuItem
        Caption = #1058#1077#1089#1090' '#1076#1080#1083#1086#1075#1086#1074#1086#1081' '#1092#1086#1088#1084#1099
        OnClick = N202Click
      end
      object MnTestForm: TMenuItem
        Caption = 'Test Form'
        OnClick = MnTestFormClick
      end
      object mniTreeClass: TMenuItem
        Caption = #1044#1077#1088#1077#1074#1086' '#1082#1083#1072#1089#1089#1086#1074
      end
      object N40: TMenuItem
        Caption = #1050#1086#1083#1086#1085#1082#1080' '#1089#1090#1086#1083#1073#1094#1086#1074
        OnClick = N40Click
      end
    end
    object N154: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      object NewClientCard: TMenuItem
        Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1082#1083#1080#1077#1085#1090#1072
        OnClick = NewClientCardClick
      end
      object CardsClients: TMenuItem
        Caption = #1050#1072#1088#1090#1086#1095#1082#1080' '#1082#1083#1080#1077#1085#1090#1086#1074
        object NotAppCardsClients: TMenuItem
          Caption = #1053#1077' '#1087#1088#1086#1074#1077#1076#1077#1085#1085#1099#1077
          OnClick = NotAppCardsClientsClick
        end
        object AppliedCardsClients: TMenuItem
          Caption = #1055#1088#1086#1074#1077#1076#1077#1085#1085#1099#1077
          OnClick = AppliedCardsClientsClick
        end
      end
      object NewDocPlat: TMenuItem
        Caption = #1055#1083#1072#1090#1077#1078
        OnClick = NewDocPlatClick
      end
      object DocPlat: TMenuItem
        Caption = #1055#1083#1072#1090#1077#1078#1080
        object NotAppDocPlat: TMenuItem
          Caption = #1053#1077' '#1087#1088#1086#1074#1077#1076#1077#1085#1085#1099#1077
          OnClick = NotAppDocPlatClick
        end
        object AppliedDocPlat: TMenuItem
          Caption = #1055#1088#1086#1074#1077#1076#1077#1085#1085#1099#1077
          OnClick = AppliedDocPlatClick
        end
      end
    end
    object N6: TMenuItem
      Caption = '&?'
      object N7: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        RadioItem = True
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N8Click
      end
    end
  end
  object sp_ClearBaseTrunc: TMSStoredProc
    StoredProcName = 'sp_ClearBaseTranc'
    Connection = dmDataModule.DB
    SQL.Strings = (
      '{:RETURN_VALUE = CALL sp_ClearBaseTranc (:FixDay)}')
    Left = 856
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'FixDay'
        ParamType = ptInput
      end>
  end
end
