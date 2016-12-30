object COMPSQLBuilderDebugDlg: TCOMPSQLBuilderDebugDlg
  Left = 216
  Top = 148
  BorderStyle = bsDialog
  Caption = #1054#1090#1083#1072#1076#1082#1072
  ClientHeight = 354
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonClose: TButton
    Left = 428
    Top = 324
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object MemoSQL: TMemo
    Left = 4
    Top = 4
    Width = 497
    Height = 313
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'MemoSQL')
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
end
