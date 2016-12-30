inherited MlekoSelectWeightDlg: TMlekoSelectWeightDlg
  Left = 138
  Width = 678
  Height = 349
  Caption = #1042#1099#1073#1086#1088' '#1074#1077#1089#1086#1074#1086#1075#1086' '#1090#1086#1074#1072#1088#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Width = 666
    Height = 297
    inherited TabSheet1: TTabSheet
      inherited Splitter: TSplitter
        Left = 436
        Height = 269
      end
      inherited PanelGrid: TPanel
        Width = 436
        Height = 269
        inherited DBGrid: TcitDBGrid
          Width = 434
          Height = 245
          OnDrawDataCell = DBGridDrawDataCell
        end
        inherited ToolBar: TToolBar
          Width = 434
        end
      end
      inherited PanelSelect: TPanel
        Left = 439
        Height = 269
        inherited DBGridSelection: TcitDBGrid
          Height = 245
        end
      end
    end
  end
  inherited ButtonSelect: TButton
    Left = 592
    Top = 297
  end
  inherited ButtonCancel: TButton
    Left = 515
    Top = 297
  end
  inherited FilterPanel: TTargetFilter_Panel
    Top = 321
    Width = 495
    Height = 28
  end
  inherited ComponentProps: TcitComponentProps
    DefaultUser = 'MLEKOSELECTWEIGHTDLG'
  end
  inherited SQLBuilder: TTargetSQLBuilder
    Select.Strings = (
      '*')
    From.Strings = (
      'v_list_Tovar_weight a')
    OrderBy.Strings = (
      'order by box_num, item_num')
    Left = 363
    Top = 41
  end
  inherited spCopyProfile: TMSStoredProc
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_Copy_Profile (:p_owner_from, :p_owner_t' +
        'o, :p_section)}')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'p_owner_from'
        ParamType = ptInput
        Size = 32
      end
      item
        DataType = ftString
        Name = 'p_owner_to'
        ParamType = ptInput
        Size = 32
      end
      item
        DataType = ftString
        Name = 'p_section'
        ParamType = ptInput
        Size = 128
      end>
  end
  object spEditTovWeightPos: TMSStoredProc
    StoredProcName = 'sp_EditTovWeightPos;1'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_EditTovWeightPos;1(:p_id, :p_TovarNo, :' +
        'p_Prihod_NaklNo, :p_Rashod_id, :p_item_kol, :p_item_num, :p_pack' +
        '_num)}')
    Left = 472
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_id'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'p_TovarNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Prihod_NaklNo'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_Rashod_id'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'p_item_kol'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_item_num'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_pack_num'
        ParamType = ptInput
      end>
  end
  object quSelectedRashod: TMSQuery
    Connection = dmDataModule.DB
    SQL.Strings = (
      'select *'
      'from v_list_Tovar_weight w'
      'where w.TovarNo= :p_tovarNo'
      'and w.Rashod_id= :p_document_id')
    Left = 151
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'p_tovarNo'
      end
      item
        DataType = ftInteger
        Name = 'p_document_id'
      end>
  end
  object spClearWeightRash: TMSStoredProc
    StoredProcName = 'sp_ClearWeightRash'
    Connection = dmDataModule.DB
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL sp_ClearWeightRash (:p_rashod_id, :p_tovar' +
        'No)}')
    Left = 248
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'p_rashod_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'p_tovarNo'
        ParamType = ptInput
      end>
  end
end
