CREATE TABLE [dbo].[Post_Mail] (
  [id] int IDENTITY(1, 1) NOT NULL,
  [PostNo] smallint NOT NULL,
  [Topic] varchar(85) COLLATE Cyrillic_General_CI_AS NULL,
  [Message] varchar(256) COLLATE Cyrillic_General_CI_AS NULL,
  [Mail1] varchar(50) COLLATE Cyrillic_General_CI_AS NULL,
  [Mail2] varchar(50) COLLATE Cyrillic_General_CI_AS NULL,
  [Mail3] varchar(50) COLLATE Cyrillic_General_CI_AS NULL,
  CONSTRAINT [PK__Post_Mai__3213E83F25476A76] PRIMARY KEY CLUSTERED ([id]),
  CONSTRAINT [Post_Mail_uq] UNIQUE ([PostNo]),
  CONSTRAINT [Post_Mail_fk] FOREIGN KEY ([PostNo]) 
  REFERENCES [dbo].[Post] ([PostNo]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
)
ON [PRIMARY]
GO
