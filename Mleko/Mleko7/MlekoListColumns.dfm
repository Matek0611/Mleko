inherited MlekoListColumnsForm: TMlekoListColumnsForm
  Width = 885
  Caption = 'MlekoListColumnsForm'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Width = 877
  end
  inherited ToolBar: TToolBar
    Width = 877
  end
  inherited DBGrid: TcxGrid
    Width = 877
    inherited DBGridDBTableView1: TcxGridDBTableView
      inherited DBGridDBTableView1ID: TcxGridDBColumn
        Width = 126
      end
      inherited DBGridDBTableView1NAME: TcxGridDBColumn
        Width = 87
      end
      object DBGridDBTableView1TYPE_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'TYPE_NAME'
        Width = 106
      end
      object DBGridDBTableView1PRECISION: TcxGridDBColumn
        DataBinding.FieldName = 'PRECISION'
        Width = 50
      end
      object DBGridDBTableView1SCALE: TcxGridDBColumn
        DataBinding.FieldName = 'SCALE'
        Width = 47
      end
      object DBGridDBTableView1colorder: TcxGridDBColumn
        DataBinding.FieldName = 'colorder'
        Width = 44
      end
      object DBGridDBTableView1table_id: TcxGridDBColumn
        DataBinding.FieldName = 'table_id'
        Width = 139
      end
      object DBGridDBTableView1IS_PKEY: TcxGridDBColumn
        DataBinding.FieldName = 'IS_PKEY'
        Width = 65
      end
      object DBGridDBTableView1IS_LOCAL_LOG: TcxGridDBColumn
        DataBinding.FieldName = 'IS_LOCAL_LOG'
        Width = 62
      end
      object DBGridDBTableView1IS_REMOTE_LOG_IN: TcxGridDBColumn
        DataBinding.FieldName = 'IS_REMOTE_LOG_IN'
        Width = 57
      end
      object DBGridDBTableView1IS_REMOTE_LOG_OUT: TcxGridDBColumn
        DataBinding.FieldName = 'IS_REMOTE_LOG_OUT'
        Width = 85
      end
      object DBGridDBTableView1META_DATA_TYPE: TcxGridDBColumn
        DataBinding.FieldName = 'META_DATA_TYPE'
        Width = 76
      end
      object DBGridDBTableView1display_name: TcxGridDBColumn
        DataBinding.FieldName = 'display_name'
        Width = 219
      end
      object DBGridDBTableView1script_display_value: TcxGridDBColumn
        DataBinding.FieldName = 'script_display_value'
        Width = 219
      end
    end
  end
  inherited Query: TMSQuery
    SQLInsert.Strings = ()
    SQLDelete.Strings = ()
    SQLUpdate.Strings = ()
    SQLRefresh.Strings = ()
    SQL.Strings = (
      'select * from rdata.dbo.d_column'
      'order by table_id,colorder')
    MasterFields = ''
    MacroData = <>
  end
end
