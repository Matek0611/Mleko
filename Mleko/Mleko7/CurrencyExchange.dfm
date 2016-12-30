inherited CurrencyExchangeForm: TCurrencyExchangeForm
  Left = 522
  Top = 210
  Width = 486
  Height = 322
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 470
    Height = 283
    Align = alClient
    Caption = #1050#1091#1088#1089#1099' '#1074#1072#1083#1102#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object ToolBar: TToolBar
      Left = 2
      Top = 15
      Width = 466
      Height = 24
      AutoSize = True
      Caption = 'ToolBar'
      Flat = True
      Images = dmDataModule.ImageListToolBar
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Caption = 'ToolButton1'
        ImageIndex = 0
        OnClick = ToolButton1Click
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Caption = 'ToolButton2'
        ImageIndex = 1
        OnClick = ToolButton2Click
      end
      object ToolButton3: TToolButton
        Left = 46
        Top = 0
        Caption = 'ToolButton3'
        ImageIndex = 2
        OnClick = ToolButton3Click
      end
      object ToolButton5: TToolButton
        Left = 69
        Top = 0
        Width = 9
        Caption = 'ToolButton5'
        ImageIndex = 31
        Style = tbsSeparator
      end
      object ToolBtnRefresh: TToolButton
        Left = 78
        Top = 0
        ImageIndex = 3
        OnClick = ToolBtnRefreshClick
      end
    end
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 39
      Width = 466
      Height = 242
      Align = alClient
      DataSource = dmDataModule.dsCurrencyExchange
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          EditButtons = <>
          FieldName = 'CyrrencyName'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'CyrrencyAbv'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'DateExchange'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'Rate'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'IsActive'
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
  end
end
