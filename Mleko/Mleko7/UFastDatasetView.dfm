object frmFastDatasetView: TfrmFastDatasetView
  Left = 457
  Top = 212
  Width = 761
  Height = 540
  Caption = 'Fast Dataset View'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object sbStatus: TStatusBar
    Left = 0
    Top = 49
    Width = 745
    Height = 19
    Align = alTop
    Panels = <>
    SimplePanel = True
    OnDblClick = sbStatusDblClick
  end
  object pcView: TPageControl
    Left = 0
    Top = 68
    Width = 745
    Height = 433
    ActivePage = tsExecute
    Align = alClient
    TabOrder = 1
    object tsExecute: TTabSheet
      Caption = 'Execute'
      object dbgView: TDBGridEh
        Left = 0
        Top = 0
        Width = 737
        Height = 405
        Align = alClient
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = dbgViewTitleClick
      end
    end
    object tsCode: TTabSheet
      Caption = 'Code'
      ImageIndex = 1
      object meCode: TMemo
        Left = 0
        Top = 0
        Width = 737
        Height = 405
        Align = alClient
        Color = 12897193
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Fixedsys'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object gbxControls: TGroupBox
    Left = 0
    Top = 0
    Width = 745
    Height = 49
    Align = alTop
    Caption = 'Controls'
    TabOrder = 2
    Visible = False
    object btnExecute: TBitBtn
      Left = 176
      Top = 16
      Width = 75
      Height = 25
      Action = acExecute
      Caption = 'Execute'
      TabOrder = 0
    end
    object btnRefresh: TButton
      Left = 56
      Top = 16
      Width = 75
      Height = 25
      Action = acRefresh
      TabOrder = 1
    end
  end
  object dsView: TDataSource
    DataSet = MSQuery
    Left = 64
    Top = 152
  end
  object MSQuery: TMSQuery
    Left = 120
    Top = 160
  end
  object actlst1: TActionList
    Left = 188
    Top = 116
    object acRefresh: TAction
      Caption = 'Refresh'
      ShortCut = 113
      OnExecute = acRefreshExecute
    end
    object acExecute: TAction
      Caption = 'Execute'
      ShortCut = 116
      OnExecute = acExecuteExecute
    end
  end
end
