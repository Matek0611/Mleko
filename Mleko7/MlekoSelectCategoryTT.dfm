inherited MlekoSelectCategoryTTDlg: TMlekoSelectCategoryTTDlg
  Caption = 'MlekoSelectCategoryTTDlg'
  PixelsPerInch = 96
  TextHeight = 13
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '  CategoryTTNo as Id'
      ', CategoryTTNo'
      ', CategoryTTName')
    From.Strings = (
      'D_CategoryTT')
  end
end
