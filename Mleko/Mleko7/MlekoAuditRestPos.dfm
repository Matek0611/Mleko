inherited MlekoAuditRestPosForm: TMlekoAuditRestPosForm
  Left = 293
  Top = 145
  Caption = 'MlekoAuditRestPosForm'
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControlTop: TPageControl
    Height = 53
    Visible = False
    inherited TabSheet1: TTabSheet
      inherited FilterPanel: TTargetFilter_Panel
        Height = 25
      end
    end
  end
  inherited PanelGrid: TPanel
    Top = 77
    Height = 285
    inherited DBGrid: TcitDBGrid
      Height = 279
    end
  end
  inherited ActionList: TActionList
    object ActionExitForm: TAction
      Caption = 'ActionExitForm'
      ShortCut = 27
      OnExecute = ActionExitFormExecute
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'v_tovar_audit a')
    Where.Strings = (
      '(Date_Change between :p_date_beg and :p_date_end )'
      'and TovarNo= :p_tovarNo')
    OrderBy.Strings = (
      'a.DateChange Desc')
    OnGetParams = SQLBuilderGetParams
    Left = 331
  end
end
