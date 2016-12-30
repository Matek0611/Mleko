CREATE TABLE [dbo].[TTN_Record] (
  [ID] int NOT NULL,
  [PostNo] smallint NOT NULL,
  [Driver] varchar(64) COLLATE Cyrillic_General_CI_AS NULL,
  [Cars] varchar(64) COLLATE Cyrillic_General_CI_AS NULL,
  [Check1] bit NULL,
  CONSTRAINT [PK_TTN_Record] PRIMARY KEY CLUSTERED ([ID]),
  CONSTRAINT [TTN_Record_uq] UNIQUE ([PostNo]),
  CONSTRAINT [TTN_Record_fk] FOREIGN KEY ([PostNo]) 
  REFERENCES [dbo].[Post] ([PostNo]) 
  ON UPDATE CASCADE
  ON DELETE CASCADE
)
ON [PRIMARY]
GO