inherited MlekoSelectMarijaGroupTaxDlg: TMlekoSelectMarijaGroupTaxDlg
  Left = 480
  Width = 389
  Caption = 'MlekoSelectMarijaGroupTaxDlg'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 379
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 149
      end
      inherited PanelGrid: TPanel
        Width = 149
        inherited DBGrid: TcitDBGrid
          Width = 147
        end
        inherited ToolBar: TToolBar
          Width = 147
        end
      end
      inherited PanelSelect: TPanel
        Left = 152
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 306
  end
  inherited ButtonCancel: TButton
    Left = 306
  end
  inherited FilterPanel: TTargetFilter_Panel
    Width = 300
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'Id, NameGroup')
    From.Strings = (
      'MarijaGroupTax')
    Where.Strings = (
      'Active = 1')
  end
end
