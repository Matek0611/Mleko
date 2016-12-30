inherited MlekoListRestAuditForm: TMlekoListRestAuditForm
  Left = 222
  Top = 170
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1086#1088#1075#1086#1074#1099#1093' '#1090#1086#1095#1077#1082
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar: TToolBar
    inherited ToolBtnAdd: TToolButton
      Visible = False
    end
    inherited ToolBtnProp: TToolButton
      Visible = False
    end
    inherited ToolBtnDel: TToolButton
      Visible = False
    end
    object ToolButton6: TToolButton
      Left = 146
      Top = 0
      Action = ActionCopyToExcel
    end
  end
  inherited PageControlTop: TPageControl
    Height = 38
    TabHeight = 1
    TabWidth = 1
    inherited TabSheet1: TTabSheet
      inherited FilterPanel: TTargetFilter_Panel
        Height = 28
        object Label1: TLabel
          Left = 7
          Top = 8
          Width = 41
          Height = 13
          Caption = #1055#1077#1088#1080#1086#1076':'
        end
        object ed_date_beg: TDateTimePicker
          Left = 52
          Top = 4
          Width = 105
          Height = 21
          Date = 38876.000000000000000000
          Format = 'dd.MM.yyyy'
          Time = 38876.000000000000000000
          TabOrder = 0
        end
        object ed_date_end: TDateTimePicker
          Left = 159
          Top = 3
          Width = 105
          Height = 21
          Date = 38876.000000000000000000
          Format = 'dd.MM.yyyy'
          Time = 38876.000000000000000000
          TabOrder = 1
        end
      end
    end
  end
  inherited PanelGrid: TPanel
    Top = 62
    Height = 319
    inherited DBGrid: TcitDBGrid
      Height = 313
      OnGetKey = DBGridGetKey
      MarkShortCut = 115
      OnDblClick = ActionAuditPosExecute
      OnKeyDown = DBGridKeyDown
    end
  end
  inherited ActionList: TActionList
    object ActionCopyToExcel: TAction
      Category = 'View'
      Caption = 'ActionCopyToExcel'
      ImageIndex = 14
      OnExecute = ActionCopyToExcelExecute
    end
    object ActionAuditPos: TAction
      Category = 'Item'
      Caption = 'ActionAuditPos'
      ImageIndex = 26
      OnExecute = ActionAuditPosExecute
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'a.TovarNo as ID'
      ',a.TovarNo'
      ',a.NameTovar'
      ',a.VidName'
      ',o.kol as ostatok_kol'
      ',sum(kol_change) as kol_change'
      ',max(Date_Change) as last_date_change'
      ',min(DateNakl) as min_date_nakl')
    From.Strings = (
      'ostatok o, v_tovar_audit a')
    Where.Strings = (
      '(date_change between :p_date_beg and :p_date_end)'
      'and o.TovarNo=a.TovarNo')
    GroupBy.Strings = (
      'a.TovarNo,a.NameTovar,o.kol,a.vidName')
    OnGetParams = SQLBuilderGetParams
    KeyFields.Strings = (
      'ID')
  end
end
