CREATE TABLE [dbo].[Post_Ban_Return] (
  [id] int IDENTITY(1, 1) NOT NULL,
  [PostNo] smallint NOT NULL,
  [Description] varchar(85) COLLATE Cyrillic_General_CI_AS NULL,
  [Check1] bit NULL,
  CONSTRAINT [PK__Pos_Ban___3213E83F0E64051E] PRIMARY KEY CLUSTERED ([id]),
  CONSTRAINT [UQ__Pos_Ban___AA124BBA114071C9] UNIQUE ([PostNo]),
  CONSTRAINT [Post_Ban_Return_fk] FOREIGN KEY ([PostNo]) 
  REFERENCES [dbo].[Post] ([PostNo]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
)
ON [PRIMARY]
GO