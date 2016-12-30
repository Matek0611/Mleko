inherited fmEditOrdersPrih: TfmEditOrdersPrih
  Left = 966
  Top = 260
  ActiveControl = deNom
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1081' '#1086#1088#1076#1077#1088
  ClientHeight = 201
  ClientWidth = 434
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 181
    Top = 128
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 434
    Height = 160
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 5
    TabOrder = 0
    OnExit = Panel1Exit
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 11
      Height = 13
      Caption = #8470
    end
    object Label3: TLabel
      Left = 88
      Top = 8
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object Label4: TLabel
      Left = 168
      Top = 8
      Width = 64
      Height = 13
      Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082
    end
    object Label5: TLabel
      Left = 16
      Top = 56
      Width = 34
      Height = 13
      Caption = #1057#1091#1084#1084#1072
    end
    object Label8: TLabel
      Left = 16
      Top = 104
      Width = 43
      Height = 13
      Caption = #1057#1087#1088#1072#1074#1082#1072
    end
    object Label6: TLabel
      Left = 152
      Top = 56
      Width = 19
      Height = 13
      Caption = #1058#1080#1087
    end
    object deNom: TDBEdit
      Left = 16
      Top = 24
      Width = 57
      Height = 21
      DataField = 'Nom'
      DataSource = fmOrdersPrih.dsPlat
      TabOrder = 0
    end
    object deNamePost: TDBEdit
      Left = 168
      Top = 24
      Width = 249
      Height = 21
      DataField = 'Name'
      DataSource = fmOrdersPrih.dsPlat
      ReadOnly = True
      TabOrder = 2
      OnDblClick = deNamePostDblClick
      OnEnter = deNamePostEnter
      OnKeyDown = deNamePostKeyDown
    end
    object deDatePlat: TDBEdit
      Left = 88
      Top = 24
      Width = 65
      Height = 21
      DataField = 'DatePlat'
      DataSource = fmOrdersPrih.dsPlat
      TabOrder = 1
    end
    object deSumma: TDBEdit
      Left = 16
      Top = 72
      Width = 113
      Height = 21
      DataField = 'Summa'
      DataSource = fmOrdersPrih.dsPlat
      TabOrder = 3
    end
    object deSpravka: TDBEdit
      Left = 16
      Top = 120
      Width = 401
      Height = 21
      DataField = 'Spravka'
      DataSource = fmOrdersPrih.dsPlat
      TabOrder = 5
    end
    object lcBuhName: TDBLookupComboBox
      Left = 152
      Top = 72
      Width = 145
      Height = 21
      DataField = 'BuhName'
      DataSource = fmOrdersPrih.dsPlat
      TabOrder = 4
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 160
    Width = 434
    Height = 41
    Align = alBottom
    TabOrder = 1
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
      Left = 128
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
end
