CREATE TABLE [dbo].[Storekeeper_List] (
  [ID] int NOT NULL,
  [PostNo] smallint NOT NULL,
  [Storekeeper] varchar(64) COLLATE Cyrillic_General_CI_AS NULL,
  [Check1] bit NULL,
  CONSTRAINT [PK_Storekeeper_List] PRIMARY KEY CLUSTERED ([ID]),
  CONSTRAINT [Storekeeper_List_uq] UNIQUE ([PostNo]),
  CONSTRAINT [Storekeeper_List_fk] FOREIGN KEY ([PostNo]) 
  REFERENCES [dbo].[Post] ([PostNo]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
)
ON [PRIMARY]
GO