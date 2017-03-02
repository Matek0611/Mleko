object frmSelectDateItemsDlg: TfrmSelectDateItemsDlg
  Left = 555
  Top = 294
  BorderIcons = [biMinimize]
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1089#1087#1080#1089#1082#1072' '#1076#1072#1090
  ClientHeight = 262
  ClientWidth = 319
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 319
    Height = 81
    Align = alTop
    TabOrder = 0
    object dtPicker: TDateTimePicker
      Left = 26
      Top = 10
      Width = 186
      Height = 21
      Date = 42787.499015497680000000
      Format = 'dd.MM.yyyy'
      Time = 42787.499015497680000000
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnCloseUp = dtPickerCloseUp
      OnChange = dtPickerChange
    end
    object btnOk: TBitBtn
      Left = 232
      Top = 41
      Width = 75
      Height = 25
      Hint = #1055#1088#1080#1085#1103#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1080' '#1079#1072#1082#1088#1099#1090#1100' '#1076#1080#1072#1083#1086#1075
      Caption = #1042#1099#1073#1086#1088
      Default = True
      ModalResult = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnCancel: TBitBtn
      Left = 231
      Top = 8
      Width = 75
      Height = 25
      Hint = #1054#1090#1082#1072#1079#1072#1090#1100#1089#1103' '#1086#1090' '#1089#1087#1080#1089#1082#1072' '#1080' '#1079#1072#1082#1088#1099#1090#1100' '#1076#1080#1072#1083#1086#1075
      Cancel = True
      Caption = #1054#1090#1082#1072#1079
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object btnDelete: TBitBtn
      Left = 136
      Top = 40
      Width = 75
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1072#1090#1091' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnDeleteClick
    end
    object btnAdd: TBitBtn
      Left = 32
      Top = 40
      Width = 75
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1072#1090#1091' '#1074' '#1089#1087#1080#1089#1086#1082
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnAddClick
    end
  end
  object lvDates: TListView
    Left = 0
    Top = 81
    Width = 319
    Height = 181
    Align = alClient
    Columns = <
      item
        Caption = 'ID'
        Width = 70
      end
      item
        Caption = #1044#1072#1090#1072
        Width = 200
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ShowWorkAreas = True
    SortType = stText
    TabOrder = 1
    ViewStyle = vsReport
    OnClick = lvDatesClick
  end
end
