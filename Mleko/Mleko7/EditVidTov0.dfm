inherited fmEditVidTov: TfmEditVidTov
  Left = 480
  Top = 259
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1042#1080#1076
  ClientHeight = 347
  ClientWidth = 382
  OldCreateOrder = True
  Position = poScreenCenter
  DesignSize = (
    382
    347)
  PixelsPerInch = 96
  TextHeight = 13
  object bbOk: TBitBtn [0]
    Left = 228
    Top = 324
    Width = 75
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object bbCancel: TBitBtn [1]
    Left = 305
    Top = 324
    Width = 75
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    Kind = bkCancel
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 0
    Width = 381
    Height = 322
    ActivePage = TabSheet1
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 262
        Height = 161
        BevelOuter = bvNone
        BorderWidth = 3
        TabOrder = 0
        object Label2: TLabel
          Left = 16
          Top = 8
          Width = 76
          Height = 13
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        end
        object deVidName: TDBEdit
          Left = 17
          Top = 24
          Width = 217
          Height = 21
          AutoSelect = False
          DataField = 'VidName'
          DataSource = dmDataModule.dsVidTov
          TabOrder = 0
        end
        object cbPriceWithNDS: TDBCheckBox
          Left = 16
          Top = 48
          Width = 97
          Height = 17
          Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
          DataField = 'PriceWithNDS'
          DataSource = dmDataModule.dsVidTov
          TabOrder = 1
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object cbPrintToPrice: TDBCheckBox
          Left = 16
          Top = 108
          Width = 113
          Height = 17
          Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1074' '#1087#1088#1072#1081#1089
          DataField = 'PrintToPrice'
          DataSource = dmDataModule.dsVidTov
          TabOrder = 2
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object cbPrintToPriceExpidition: TDBCheckBox
          Left = 16
          Top = 68
          Width = 89
          Height = 17
          Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1077
          DataField = 'PrintToExpedition'
          DataSource = dmDataModule.dsVidTov
          TabOrder = 3
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
      end
      object DBCheckBox1: TDBCheckBox
        Left = 16
        Top = 87
        Width = 89
        Height = 17
        Caption = #1057#1087#1088#1103#1090#1072#1090#1100
        DataField = 'Visible'
        DataSource = dmDataModule.dsVidTov
        TabOrder = 1
        ValueChecked = 'True'
        ValueUnchecked = 'False'
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1099
      ImageIndex = 1
      object ToolBar: TToolBar
        Left = 0
        Top = 0
        Width = 373
        Height = 24
        AutoSize = True
        Caption = 'ToolBar'
        Flat = True
        Images = dmDataModule.ImageListToolBar
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object ToolBtnAdd: TToolButton
          Left = 0
          Top = 0
          Action = ActionViewRefresh
        end
      end
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 24
        Width = 373
        Height = 270
        Align = alClient
        BorderStyle = bsNone
        DataSource = ds_Prop
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete]
        OptionsEh = [dghFixed3D, dghClearSelection]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        VertScrollBar.VisibleMode = sbAlwaysShowEh
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Name'
            Footers = <>
            Title.Caption = #1057#1074#1086#1081#1089#1090#1074#1086
            Width = 314
          end
          item
            Alignment = taCenter
            EditButtons = <>
            FieldName = 'is_prop'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'V'
            Width = 20
            OnUpdateData = DBGridEh2Columns1UpdateData
          end>
      end
    end
  end
  object ActionList1: TActionList
    Images = dmDataModule.ImageListToolBar
    Left = 28
    Top = 72
    object ActionViewRefresh: TAction
      Category = 'View'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1080#1079' '#1041#1044
      ImageIndex = 3
      ShortCut = 116
      OnExecute = ActionViewRefreshExecSQL
    end
  end
  object qu_Prop: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select '
      'p.Name'
      ',Case when l.id is null then cast(0 as bit)'
      ' else cast(1 as bit) end as is_prop'
      ',p.id'
      
        'from d_vidtov_group p left outer join l_vidtov_group l on l.VidT' +
        'ovGroupId=p.id and l.VidNo= :p_VidNo')
    Left = 32
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_VidNo'
      end>
    object qu_PropName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 50
    end
    object qu_Propis_prop: TBooleanField
      FieldName = 'is_prop'
    end
    object qu_Propid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
  end
  object ds_Prop: TDataSource
    DataSet = qu_Prop
    Left = 64
    Top = 104
  end
  object spSetVidTovGroup: TMSStoredProc
    StoredProcName = 'sp_SetVidTovGroup;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_SetVidTovGroup;1(:p_VidTovGroupId, :p_V' +
        'idNo, :p_Value)}')
    Left = 112
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_VidTovGroupId'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_VidNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Value'
        ParamType = ptInput
      end>
  end
end
