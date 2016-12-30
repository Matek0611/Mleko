inherited MlekoAuditBlankPosForm: TMlekoAuditBlankPosForm
  Left = 293
  Top = 145
  Caption = 'MlekoAuditBlankPosForm'
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControlTop: TPageControl
    Height = 53
    Visible = False
    inherited TabSheet1: TTabSheet
      inherited FilterPanel: TTargetFilter_Panel
        Height = 43
      end
    end
  end
  inherited PanelGrid: TPanel
    Top = 77
    Height = 304
    inherited DBGrid: TcitDBGrid
      Height = 298
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
      'a.Action_id as ID,a.ActionDate,a.KolOrd,u.UserName,a.Boss_Price')
    From.Strings = (
      'audit_e_blanks a,Users u')
    Where.Strings = (
      'a.UserNo=u.UserNo'
      'and a.document_id= :p_document_id'
      'and a.TovarNo= :p_tovarNo')
    OrderBy.Strings = (
      'a.ActionDate Desc')
    OnGetParams = SQLBuilderGetParams
    Left = 329
  end
end
