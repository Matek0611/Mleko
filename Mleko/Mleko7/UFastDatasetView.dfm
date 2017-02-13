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
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgView: TDBGrid
    Left = 0
    Top = 0
    Width = 745
    Height = 482
    Align = alClient
    DataSource = dsView
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 482
    Width = 745
    Height = 19
    Panels = <>
  end
  object dsView: TDataSource
    Left = 64
    Top = 152
  end
end
