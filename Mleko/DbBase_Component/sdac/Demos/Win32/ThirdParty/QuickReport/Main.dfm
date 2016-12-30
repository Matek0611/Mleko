object fmMain: TfmMain
  Left = 299
  Top = 138
  BorderStyle = bsSingle
  Caption = 'MS SQL Data Access Components demo - using SDAC with Quick Report'
  ClientHeight = 57
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object btPreview: TButton
    Left = 192
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Preview'
    TabOrder = 2
    OnClick = btPreviewClick
  end
  object Connect: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 0
    OnClick = ConnectClick
  end
  object Disconnect: TButton
    Left = 88
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Disconnect'
    TabOrder = 1
    OnClick = DisconnectClick
  end
  object MSConnection: TMSConnection
    Database = 'SDACDemos'
    Username = 'Sa'
    Left = 8
    Top = 16
  end
end
