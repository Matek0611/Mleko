inherited fmEditDolgNakl: TfmEditDolgNakl
  Left = 200
  Top = 108
  BorderStyle = bsSingle
  Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103
  ClientHeight = 221
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object grPlat: TRxDBGrid
    Left = 0
    Top = 0
    Width = 508
    Height = 221
    Align = alClient
    DataSource = fmDolgNam.dsRashod
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RasNo'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 46
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameTovar'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 264
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Kol'
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceOut'
        Title.Caption = #1062#1077#1085#1072
        Width = 80
        Visible = True
      end>
  end
end
