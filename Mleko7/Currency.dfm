inherited CurrencyForm: TCurrencyForm
  Left = 784
  Top = 241
  Width = 502
  Height = 327
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox [0]
    Left = 0
    Top = 0
    Width = 486
    Height = 288
    Align = alClient
    Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074#1072#1083#1102#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 39
      Width = 482
      Height = 247
      Align = alClient
      DataSource = dmDataModule.dsCurrency
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = [fsBold]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 3
      OnDrawColumnCell = DBGridEh1DrawColumnCell
      Columns = <
        item
          EditButtons = <>
          FieldName = 'ID'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          EditButtons = <>
          FieldName = 'L_CODE'
          Footers = <>
          Title.Alignment = taCenter
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'SHORT_NAME'
          Footers = <>
          Title.Alignment = taCenter
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'IsDefault'
          Footers = <>
          Title.Alignment = taCenter
        end>
    end
    object ToolBar: TToolBar
      Left = 2
      Top = 15
      Width = 482
      Height = 24
      AutoSize = True
      Caption = 'ToolBar'
      Flat = True
      Images = dmDataModule.ImageListToolBar
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
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
  end
  inherited ActionList: TActionList
    Left = 0
    Top = 56
  end
end
