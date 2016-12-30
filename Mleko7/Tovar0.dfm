inherited fmTovar: TfmTovar
  Left = 904
  Top = 208
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1086#1074#1072#1088#1086#1074
  ClientHeight = 325
  ClientWidth = 601
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TDBGridEh [0]
    Left = 0
    Top = 0
    Width = 601
    Height = 294
    Align = alClient
    DataSource = dmDataModule.dsTovar
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghClearSelection]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    VertScrollBar.VisibleMode = sbAlwaysShowEh
    OnDrawColumnCell = RxDBGrid1DrawColumnCell
    OnKeyPress = RxDBGrid1KeyPress
    OnTitleBtnClick = DBGridEh1TitleBtnClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'TovarNo'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #8470
        Width = 44
      end
      item
        EditButtons = <>
        FieldName = 'VidName'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1042#1080#1076
        Title.TitleButton = True
        Title.ToolTips = True
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'NameTovar'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        Width = 230
      end
      item
        EditButtons = <>
        FieldName = 'EdIzm'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1077#1076'.'#1080#1079#1084
        Title.TitleButton = True
        Title.ToolTips = True
        Width = 42
      end
      item
        EditButtons = <>
        FieldName = 'NameCompany'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        Title.TitleButton = True
        Title.ToolTips = True
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'KolPerPak'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1042' '#1103#1097#1080#1082#1077
        Title.TitleButton = True
        Title.ToolTips = True
        Width = 47
      end>
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 294
    Width = 601
    Height = 31
    Align = alBottom
    TabOrder = 1
    object bbCancel: TBitBtn
      Left = 514
      Top = 4
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 0
      Kind = bkCancel
    end
    object bbOk: TBitBtn
      Left = 434
      Top = 4
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
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
  end
end
