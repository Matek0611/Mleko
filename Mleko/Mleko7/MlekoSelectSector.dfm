inherited MlekoSelectSectorDlg: TMlekoSelectSectorDlg
  Left = 249
  Width = 484
  Height = 354
  Caption = #1057#1077#1082#1090#1086#1088' '#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 472
    Height = 258
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 242
        Height = 230
      end
      inherited PanelGrid: TPanel
        Width = 242
        Height = 230
        inherited DBGrid: TcitDBGrid
          Width = 240
          Height = 206
        end
        inherited ToolBar: TToolBar
          Width = 240
        end
      end
      inherited PanelSelect: TPanel
        Left = 245
        Height = 230
        inherited DBGridSelection: TcitDBGrid
          Height = 206
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 393
    Top = 266
  end
  inherited ButtonCancel: TButton
    Left = 393
    Top = 298
  end
  inherited FilterPanel: TTargetFilter_Panel
    Top = 266
    Width = 376
  end
  inherited ActionList: TActionList
    Left = 116
  end
  inherited ComponentProps: TcitComponentProps
    Left = 32
  end
  inherited DS: TDataSource
    Left = 116
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'v_sector_response a')
    Left = 62
    Top = 41
  end
  inherited Query: TMSQuery
    Left = 87
  end
  inherited QueryProp: TMSQuery
    Left = 31
  end
  inherited DSSelection: TDataSource
    Left = 88
  end
  inherited QuSelectList: TMSQuery
    Left = 55
    Top = 196
  end
end
