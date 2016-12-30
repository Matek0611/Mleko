inherited fmCrossReturnePost: TfmCrossReturnePost
  Left = 202
  Top = 147
  Width = 499
  Height = 352
  Caption = #1055#1072#1088#1090#1085#1077#1088#1099
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object paTop: TPanel [0]
    Left = 0
    Top = 0
    Width = 491
    Height = 284
    Align = alClient
    TabOrder = 0
    object RxDBGrid1: TRxDBGrid
      Left = 1
      Top = 1
      Width = 489
      Height = 282
      Align = alClient
      DataSource = fmCrossReturne.dsPostR
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = RxDBGrid1KeyDown
      OnKeyPress = RxDBGrid1KeyPress
      ClearSelection = False
      MultiSelect = True
      TitleButtons = True
      OnTitleBtnClick = RxDBGrid1TitleBtnClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 209
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Address'
          Title.Caption = #1040#1076#1088#1077#1089
          Width = 247
          Visible = True
        end>
    end
  end
  object Panel3: TPanel [1]
    Left = 0
    Top = 284
    Width = 491
    Height = 41
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1050
      TabOrder = 0
      Kind = bkOK
    end
    object bbCancel: TBitBtn
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
    object BitBtn1: TBitBtn
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Caption = #1042#1089#1077
      ModalResult = 1
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
  end
end
