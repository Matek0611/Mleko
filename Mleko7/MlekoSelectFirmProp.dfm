inherited MlekoSelectFirmPropDlg: TMlekoSelectFirmPropDlg
  Caption = 'MlekoSelectFirmPropDlg'
  PixelsPerInch = 96
  TextHeight = 13
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      'ID,Name as PropName,Code')
    From.Strings = (
      'd_firm_prop')
  end
end
