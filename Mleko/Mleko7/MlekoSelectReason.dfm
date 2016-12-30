inherited MlekoSelectReasonDlg: TMlekoSelectReasonDlg
  Left = 447
  Top = 226
  Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1079#1072#1082#1072#1079#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited TabSheet1: TTabSheet
      inherited PanelGrid: TPanel
        inherited DBGrid: TcitDBGrid
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ReasonName'
              Title.Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077' '#1079#1072#1082#1072#1079#1072
              Width = 282
              Visible = True
            end>
        end
      end
    end
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'd_blank_reason ')
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select * from d_blank_reason')
  end
end
