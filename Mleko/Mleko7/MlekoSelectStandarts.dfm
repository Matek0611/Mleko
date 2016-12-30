inherited MlekoSelectStandartsDlg: TMlekoSelectStandartsDlg
  Caption = 'MlekoSelectStandartsDlg'
  PixelsPerInch = 96
  TextHeight = 13
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'StandartNo, StandartName')
    From.Strings = (
      'GoodStandarts')
    Where.Strings = (
      'Active = 1')
  end
end
