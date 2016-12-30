ALTER TABLE [dbo].[D_PROP_DLG] (
  [ID] int IDENTITY(1, 1) NOT NULL,
  [NAME] varchar(128) COLLATE Cyrillic_General_CI_AS NULL,
  [CREATE_DATE] smalldatetime NULL,
  [DESCRIPTION] varchar(1024) COLLATE Cyrillic_General_CI_AS NULL,
  [ACTIVE] bit NULL,
  [NUM] int NULL,
  [rowid] uniqueidentifier CONSTRAINT [DF__D_PROP_DL__rowid__08AB2BC8] DEFAULT newid() NOT NULL,
  [height] smallint NULL,
  [width] smallint NULL,
  [CodeAccess] smallint NULL,
  [type_id] int NOT NULL,
  [sql_cmd_insert] varchar(4000) COLLATE Cyrillic_General_CI_AS NULL,
  [sql_cmd_edit] varchar(4000) COLLATE Cyrillic_General_CI_AS NULL,
  [sql_cmd_delete] varchar(4000) COLLATE Cyrillic_General_CI_AS NULL,
  [sql_edit] varchar(8000) COLLATE Cyrillic_General_CI_AS NULL,
  [sql_insert] varchar(8000) COLLATE Cyrillic_General_CI_AS NULL,
  [class] varchar(128) COLLATE Cyrillic_General_CI_AS NOT NULL,
  [PARENT_ID] int NULL,
  [SERVER_TYPE] varchar(50) COLLATE Cyrillic_General_CI_AS NULL,
  CONSTRAINT [D_PROP_DLG_uq] UNIQUE ([rowid])
)
ON [PRIMARY]
GO