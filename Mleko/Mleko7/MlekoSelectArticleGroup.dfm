inherited MlekoSelectArticleGroupDlg: TMlekoSelectArticleGroupDlg
  Caption = #1053#1072#1073#1086#1088' '#1090#1086#1074#1072#1088#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited TabSheet1: TTabSheet
      inherited PanelGrid: TPanel
        inherited DBGrid: TcitDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GroupName'
              Visible = True
            end>
        end
      end
    end
  end
  inherited DS: TDataSource
    Left = 132
    Top = 124
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'id as ID, rtrim(name) as GroupName')
    From.Strings = (
      'd_set_article_group a')
  end
  inherited Query: TMSQuery
    SQL.Strings = (
      'select id as ID, rtrim(name) as GroupName, 0 as is_select'
      ' from d_set_article_group a')
    Left = 135
    object QueryID: TLargeintField
      FieldName = 'ID'
    end
    object QueryGroupName: TStringField
      FieldName = 'GroupName'
      ReadOnly = True
      Size = 512
    end
    object Queryis_select: TIntegerField
      FieldName = 'is_select'
      ReadOnly = True
    end
  end
end
