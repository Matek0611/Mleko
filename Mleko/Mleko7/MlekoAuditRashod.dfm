inherited MlekoAuditRashodForm: TMlekoAuditRashodForm
  Left = 615
  Top = 254
  Caption = #1056#1072#1089#1093#1086#1076' '#1072#1091#1076#1080#1090' '#1087#1086#1079#1080#1094#1080#1080
  FormStyle = fsNormal
  Position = poMainFormCenter
  Visible = False
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
      OnGetKey = DBGridGetKey
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
      'v_audit_dspec a')
    Where.Strings = (
      '(tovarNo= :TovarNo or :is_all_tovar =1)'
      'and NaklNo= :NaklNo'
      '')
    OrderBy.Strings = (
      'ActionDate')
    OnGetOrderBy = nil
    OnGetParams = SQLBuilderGetParams
    Left = 288
    Top = 131
  end
end
