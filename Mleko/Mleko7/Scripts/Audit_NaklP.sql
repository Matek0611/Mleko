CREATE TABLE [dbo].[Audit_NaklP] (
  [id] int IDENTITY(1, 1) NOT NULL,
  [NaklNo] int NOT NULL,
  [Nom] int NULL,
  [PostNo] smallint NOT NULL,
  [DateNakl] smalldatetime NULL,
  [DatePrih] smalldatetime NULL,
  [Summa] decimal(18, 2) NULL,
  [SummaDolg] decimal(18, 2) NULL,
  [Buh] smallint NOT NULL,
  [UserNo] smallint NULL,
  [VidNaklNo] tinyint NOT NULL,
  [Change1C] bit NULL,
  [Export1C] bit NULL,
  [ID1C] varchar(6) COLLATE Cyrillic_General_CI_AS NULL,
  [OtdelNo] smallint NULL,
  [doc_type] int NULL,
  [parent_NaklNo] int NULL,
  [check_dolg] bit NOT NULL,
  [OurFirmNo] int NOT NULL,
  [Dept_id] int NULL,
  [num] varchar(128) COLLATE Cyrillic_General_CI_AS NULL,
  [sub_num] int NULL,
  [pkey] [DtPkey] NOT NULL,
  [edit_status_id] smallint NOT NULL,
  [Edit_date] datetime NOT NULL,
  [Edit_user] varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  [Edit_host_name] varchar(50) COLLATE Cyrillic_General_CI_AS NOT NULL,
  [Action_type] char(1) COLLATE Cyrillic_General_CI_AS NOT NULL
)
ON [PRIMARY]
GO

EXEC sp_bindefault '[dbo].[DefDtPkey]', '[Audit_NaklP].[pkey]'
GO
