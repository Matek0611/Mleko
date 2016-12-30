object SQLDlg: TSQLDlg
  Left = 430
  Top = 126
  Width = 368
  Height = 526
  BorderIcons = [biSystemMenu]
  Caption = 'SQL Query Editor'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 368
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  OnKeyPress = MemoSelectKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SplEditor: TSplitter
    Left = 262
    Top = 0
    Width = 6
    Height = 458
    Cursor = crHSplit
    Align = alRight
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 458
    Width = 360
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnEditorHide: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editor'
      TabOrder = 2
      Visible = False
      OnClick = btnEditorClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333FF3333333333333003333333333333F77F33333333333009033
        333333333F7737F333333333009990333333333F773337FFFFFF330099999000
        00003F773333377777770099999999999990773FF33333FFFFF7330099999000
        000033773FF33777777733330099903333333333773FF7F33333333333009033
        33333333337737F3333333333333003333333333333377333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btnCancel: TBitBtn
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      Visible = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnAbort: TBitBtn
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 3
      TabOrder = 5
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object btnOk: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object btnEditor: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editor'
      TabOrder = 4
      OnClick = btnEditorClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333FF3333333333333003333
        3333333333773FF3333333333309003333333333337F773FF333333333099900
        33333FFFFF7F33773FF30000000999990033777777733333773F099999999999
        99007FFFFFFF33333F7700000009999900337777777F333F7733333333099900
        33333333337F3F77333333333309003333333333337F77333333333333003333
        3333333333773333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btnClipboard: TBitBtn
      Left = 248
      Top = 8
      Width = 100
      Height = 25
      Caption = 'To Clipboard'
      TabOrder = 3
      OnClick = btnClipboardClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
  end
  object pnlSmallEditors: TPanel
    Left = 0
    Top = 0
    Width = 262
    Height = 458
    Align = alClient
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
    OnResize = pnlSmallEditorsResize
    object GBSelect: TGroupBox
      Left = 1
      Top = 1
      Width = 260
      Height = 156
      Align = alClient
      Caption = 'Select'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object MemoSelect: TMemo
        Left = 2
        Top = 15
        Width = 256
        Height = 139
        Align = alClient
        Color = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        OnChange = MemoSelectChange
        OnEnter = MemoSelectEnter
        OnKeyPress = MemoSelectKeyPress
      end
    end
    object GBFrom: TGroupBox
      Left = 1
      Top = 157
      Width = 260
      Height = 75
      Align = alBottom
      Caption = 'From'
      TabOrder = 1
      object MemoFrom: TMemo
        Left = 2
        Top = 15
        Width = 256
        Height = 58
        Align = alClient
        Color = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        OnChange = MemoSelectChange
        OnEnter = MemoSelectEnter
        OnKeyPress = MemoSelectKeyPress
      end
    end
    object GBOrderBy: TGroupBox
      Left = 1
      Top = 382
      Width = 260
      Height = 75
      Align = alBottom
      Caption = 'Order By'
      TabOrder = 4
      object MemoOrderBy: TMemo
        Left = 2
        Top = 15
        Width = 256
        Height = 58
        Align = alClient
        Color = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        OnChange = MemoSelectChange
        OnEnter = MemoSelectEnter
        OnKeyPress = MemoSelectKeyPress
      end
    end
    object GBGroupBy: TGroupBox
      Left = 1
      Top = 307
      Width = 260
      Height = 75
      Align = alBottom
      Caption = 'Group By'
      TabOrder = 3
      object MemoGroupBy: TMemo
        Left = 2
        Top = 15
        Width = 256
        Height = 58
        Align = alClient
        Color = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        OnChange = MemoSelectChange
        OnEnter = MemoSelectEnter
        OnKeyPress = MemoSelectKeyPress
      end
    end
    object GBWhere: TGroupBox
      Left = 1
      Top = 232
      Width = 260
      Height = 75
      Align = alBottom
      Caption = 'Where'
      TabOrder = 2
      object MemoWhere: TMemo
        Left = 2
        Top = 15
        Width = 256
        Height = 58
        Align = alClient
        Color = clNavy
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clYellow
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        OnChange = MemoSelectChange
        OnEnter = MemoSelectEnter
        OnKeyPress = MemoSelectKeyPress
      end
    end
  end
  object GBEditor: TGroupBox
    Left = 268
    Top = 0
    Width = 92
    Height = 458
    Align = alRight
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    Visible = False
    object MmEditor: TMemo
      Left = 2
      Top = 15
      Width = 88
      Height = 441
      Align = alClient
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clYellow
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
      OnChange = MmEditorChange
      OnKeyPress = MemoSelectKeyPress
    end
  end
end
