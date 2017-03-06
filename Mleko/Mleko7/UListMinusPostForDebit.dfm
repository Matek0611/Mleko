object frmListMinusPostForDebit: TfrmListMinusPostForDebit
  Left = 440
  Top = 298
  Width = 525
  Height = 411
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1072#1088#1090#1085#1077#1088#1086#1074', '#1085#1077' '#1091#1095#1080#1090#1099#1074#1072#1077#1084#1099#1093'  '#1074' '#1072#1085#1072#1083#1080#1079#1077' '#1044#1090
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pcSettings: TPageControl
    Left = 0
    Top = 0
    Width = 509
    Height = 352
    ActivePage = tsExclusions
    Align = alClient
    TabOrder = 0
    object tsExclusions: TTabSheet
      Caption = #1048#1089#1082#1083#1102#1095#1077#1085#1080#1103
      object dbgExclusions: TDBGridEh
        Left = 0
        Top = 41
        Width = 501
        Height = 239
        Align = alClient
        DataSource = dsListMinusPostForDebit
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        PopupMenu = pmExclusions
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyDown = dbgExclusionsKeyDown
        OnKeyPress = dbgExclusionsKeyPress
        OnTitleBtnClick = dbgExclusionsTitleBtnClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'PostNo'
            Footer.FieldName = 'PostNo'
            Footers = <>
            Title.Caption = 'ID'
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'PostName'
            Footer.FieldName = 'PostName'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1055#1072#1088#1090#1085#1077#1088
            Title.SortIndex = 1
            Title.SortMarker = smDownEh
            Title.TitleButton = True
            Width = 320
          end
          item
            EditButtons = <>
            FieldName = 'CheckMinus'
            Footer.FieldName = 'CheckMinus'
            Footers = <>
            Title.Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100
            Title.TitleButton = True
            Width = 74
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 280
        Width = 501
        Height = 44
        Align = alBottom
        BevelInner = bvLowered
        TabOrder = 1
        object btnOK: TButton
          Left = 317
          Top = 8
          Width = 75
          Height = 25
          Caption = 'OK'
          TabOrder = 0
          OnClick = btnOKClick
        end
        object btnCancel: TButton
          Left = 405
          Top = 8
          Width = 75
          Height = 25
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 1
          OnClick = btnCancelClick
        end
        object EdPostNo: TcitDBComboEdit
          Left = 127
          Top = 12
          Width = 151
          Height = 21
          Enabled = True
          OwnesLButton = True
          OwnesLLabel = True
          LBtnAlignment = baRight
          LBtnDown = False
          LBtnGroupIndex = 0
          LBtnAllowAllUp = False
          LBtnGlyphKind = gkDots
          LBtnShortCut1 = 115
          LBtnShortCut2 = 40
          LBtnWidth = 30
          LLblAlignment = laLeft
          LLblCaption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1088#1090#1085#1077#1088#1072'  :  '
          LLblWidth = 120
          LLblFont.Charset = DEFAULT_CHARSET
          LLblFont.Color = clWindowText
          LLblFont.Height = -11
          LLblFont.Name = 'MS Sans Serif'
          LLblFont.Style = []
          LLblRequiredFont.Charset = DEFAULT_CHARSET
          LLblRequiredFont.Color = clWindowText
          LLblRequiredFont.Height = -11
          LLblRequiredFont.Name = 'MS Sans Serif'
          LLblRequiredFont.Style = []
          Required = True
          TabOrder = 2
          Visible = True
          LocateKey = False
          KeyField = 'PostNo'
          Owner = 'ListMinusPostForDebit'
          EntityCode = 'Post'
          multiselect = True
          OnSelectOk = EdPostNoSelectOk
          EditStyle = edSelect
          AutoTabControl = True
        end
      end
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 501
        Height = 41
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 2
        Visible = False
        object cbxDisableAll: TCheckBox
          Left = 16
          Top = 16
          Width = 169
          Height = 17
          Caption = #1048#1089#1082#1083#1102#1095#1080#1090#1100'/'#1088#1072#1079#1088#1077#1096#1080#1090#1100' '#1074#1089#1077#1093
          TabOrder = 0
        end
        object btnClearList: TButton
          Left = 207
          Top = 9
          Width = 113
          Height = 25
          Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
          TabOrder = 1
        end
      end
    end
  end
  object sbStatus: TStatusBar
    Left = 0
    Top = 352
    Width = 509
    Height = 20
    Panels = <>
  end
  object dsListMinusPostForDebit: TMSDataSource
    DataSet = quListMinusPostForDebit
    Left = 304
    Top = 80
  end
  object quListMinusPostForDebit: TMSQuery
    SQLUpdate.Strings = (
      'update ListMinusPostForDebit'
      ' set CheckMinus = :CheckMinus'
      'where PostNo = :PostNo')
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select '
      'PostNo,'
      'PostName,'
      'CheckMinus '
      'from ( '
      'select lmp.PostNo      '
      '      ,p.Name as PostName'
      '      ,lmp.CheckMinus'
      ' from ListMinusPostForDebit lmp inner join'
      '      Post p on p.PostNo = lmp.PostNo'
      ') t'
      'order by &_order')
    Left = 232
    Top = 72
    MacroData = <
      item
        Name = '_order'
        Value = 'PostName'
      end>
    object quListMinusPostForDebitPostNo: TSmallintField
      FieldName = 'PostNo'
    end
    object quListMinusPostForDebitPostName: TStringField
      FieldName = 'PostName'
      Size = 30
    end
    object quListMinusPostForDebitCheckMinus: TBooleanField
      FieldName = 'CheckMinus'
    end
  end
  object spInsInListMinusPostForDebit: TMSStoredProc
    StoredProcName = 'InsInListMinusPostForDebit;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL InsInListMinusPostForDebit;1(:SPID, :UserN' +
        'o)}')
    Left = 424
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'SPID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'UserNo'
        ParamType = ptInput
      end>
  end
  object pmExclusions: TPopupMenu
    Left = 164
    Top = 160
    object mnuDeleteRecord: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      OnClick = mnuDeleteRecordClick
    end
  end
end
