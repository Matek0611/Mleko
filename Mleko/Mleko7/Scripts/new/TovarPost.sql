CREATE TABLE [dbo].[TovarPost] (
  [id] int IDENTITY(1, 1) NOT NULL,
  [PostNo] smallint NOT NULL,
  [TovarNo] smallint NOT NULL,
  [TovarNoPost] int NULL,
  [NameTovar] varchar(128) COLLATE Cyrillic_General_CI_AS NULL,
  [NameTovarShort] varchar(64) COLLATE Cyrillic_General_CI_AS NULL,
  [BarCode] bigint NULL,
  CONSTRAINT [PK__TovarPos__3213E83F32A16594] PRIMARY KEY CLUSTERED ([id]),
  CONSTRAINT [TovarPost_uq] UNIQUE ([PostNo], [TovarNo], [TovarNoPost]),
  CONSTRAINT [TovarPost_fk] FOREIGN KEY ([PostNo]) 
  REFERENCES [dbo].[Post] ([PostNo]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE,
  CONSTRAINT [TovarPost_fk2] FOREIGN KEY ([TovarNo]) 
  REFERENCES [dbo].[Tovar] ([TovarNo]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
)
ON [PRIMARY]
GO