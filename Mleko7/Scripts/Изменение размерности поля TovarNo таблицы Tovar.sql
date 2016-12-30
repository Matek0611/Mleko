-- Проверяем наличие временной таблицы товара. Если присудствует, уничтожаем и Создаем временную таблицу товара
print 'Проверяем наличие временной таблицы товара. Если присудствует, уничтожаем и Создаем временную таблицу товара'

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[work].[dbo].[TovarTmp]') AND type in (N'U'))
DROP TABLE [work].[dbo].[TovarTmp]

USE [work]
GO

/****** Object:  Table [dbo].[TovarTemp]    Script Date: 03.08.2015 12:27:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TovarTmp](
	[TovarNo] [smallint] NOT NULL,
	[NameTovar] [varchar](128) NULL,
	[NameTovarShort] [varchar](64) NULL,
	[EdIzm] [varchar](5) NULL,
	[VidNo] [smallint] NULL,
	[Company] [varchar](10) NULL,
	[CompanyNo] [smallint] NULL,
	[KolPerPak] [smallint] NULL,
	[SrokReal] [smallint] NULL,
	[Weight] [decimal](10, 3) NULL,
	[TipNo] [smallint] NULL,
	[CodReport] [varchar](20) NULL,
	[Export1C] [bit] NULL,
	[Change1C] [bit] NULL,
	[Cod1C] [varchar](6) NULL,
	[ID1C] [varchar](6) NULL,
	[OtdelNo] [smallint] NULL,
	[TaraNo] [smallint] NULL,
	[Visible] [bit] NULL,
	[weight_packed] [bit] NULL,
	[barCode] [bigint] NULL,
	[is_weight] [bit] NULL,
	[pkey] [dbo].[DtPkey] NOT NULL,
	[IsInternal] [bit] NULL,
 CONSTRAINT [PK_TovarTmp] PRIMARY KEY CLUSTERED 
(
	[TovarNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


-- Вставляем значения во временную таблицу товара
print 'Вставляем значения во временную таблицу товара'
insert into work.dbo.TovarTmp
select * from work.dbo.Tovar



-- Проверяем наличие временной таблицы соответствия товара. Если присудствует, уничтожаем и Создаем временную таблицу соответствия товара (нашартикул/артикул контрагента)
print 'Проверяем наличие временной таблицы товара. Если присудствует, уничтожаем и Создаем временную таблицу товара'

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[work].[dbo].[TovarPostTemp]') AND type in (N'U'))
DROP TABLE [work].[dbo].[TovarPostTemp]

USE [work]
GO

/****** Object:  Table [dbo].[TovarPostTemp]    Script Date: 04.08.2015 15:47:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TovarPostTemp](
	[id] [int] NOT NULL,
	[PostNo] [smallint] NOT NULL,
	[TovarNo] [smallint] NOT NULL,
	[TovarNoPost] [int] NULL,
	[NameTovar] [varchar](128) NULL,
	[NameTovarShort] [varchar](64) NULL,
	[BarCode] [bigint] NULL,
	[NameTovarPost] [varchar](128) NULL,
 CONSTRAINT [PK__TovarPosTemp] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


-- Вставляем значения во временную таблицу соответствия товара
print 'Вставляем значения во временную таблицу соответствия товара'
insert into work.dbo.TovarPostTemp
select * from work.dbo.TovarPost



-- Проверяем наличие временной таблицы социальный ли товар. Если присудствует, уничтожаем и Создаем временную таблицу социальный ли товар
print 'Проверяем наличие временной таблицы социальный ли товар. Если присудствует, уничтожаем и Создаем временную таблицу социальный ли товар'

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[work].[dbo].[Social_TovarTemp]') AND type in (N'U'))
DROP TABLE [work].[dbo].[Social_TovarTemp]

USE [work]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Social_TovarTemp](
	[ID] [int] NOT NULL,
	[TovarNo] [smallint] NOT NULL,
	[Social] [bit] NULL,
 CONSTRAINT [PK_Social_TovarTemp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


-- Вставляем значения во временную таблицу признака социальный ли товар
print 'Вставляем значения во временную таблицу признака социальный ли товар'
insert into work.dbo.Social_TovarTemp
select * from work.dbo.Social_Tovar




-- Проверяем наличие временной таблицы наш ли товар. Если присудствует, уничтожаем и Создаем временную таблицу наш ли товар

print 'Проверяем наличие временной таблицы наш ли товар. Если присудствует, уничтожаем и Создаем временную таблицу наш ли товар'

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[work].[dbo].[Our_TovarTemp]') AND type in (N'U'))
DROP TABLE [work].[dbo].[Our_TovarTemp]

USE [work]
GO

/****** Object:  Table [dbo].[Our_TovarTemp]    Script Date: 04.08.2015 15:59:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Our_TovarTemp](
	[ID] [int] NOT NULL,
	[TovarNo] [smallint] NOT NULL,
	[NotOur] [bit] NULL,
 CONSTRAINT [PK_Our_TovarTemp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


-- Вставляем значения во временную таблицу наш ли товар
print 'Вставляем значения во временную таблицу наш ли товар'
insert into work.dbo.Our_TovarTemp
select * from work.dbo.Our_Tovar



-- Проверяем наличие временной таблицы товар без НДС. Если присудствует, уничтожаем и Создаем временную таблицу товар без НДС
print 'Проверяем наличие временной таблицы товар без НДС. Если присудствует, уничтожаем и Создаем временную таблицу товар без НДС'

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[work].[dbo].[TovarWithNoNDSTemp]') AND type in (N'U'))
DROP TABLE [work].[dbo].[TovarWithNoNDSTemp]

USE [work]
GO

/****** Object:  Table [dbo].[TovarWithNoNDSTemp]    Script Date: 04.08.2015 16:03:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TovarWithNoNDSTemp](
	[ID] [int] NOT NULL,
	[TovarNo] [smallint] NOT NULL,
	[WithNoNDS] [bit] NULL,
 CONSTRAINT [PK_TovarWithNoNDSTemp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


-- Вставляем значения во временную таблицу товар без НДС
print 'Вставляем значения во временную таблицу товар без НДС'
insert into work.dbo.TovarWithNoNDSTemp
select * from work.dbo.TovarWithNoNDS



-- Проверяем наличие временной таблицы признака сервиса. Если присудствует, уничтожаем и Создаем временную таблицу признака сервиса
print 'Проверяем наличие временной таблицы признака сервиса. Если присудствует, уничтожаем и Создаем временную таблицу признака сервиса'

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[work].[dbo].[ServiceTemp]') AND type in (N'U'))
DROP TABLE [work].[dbo].[ServiceTemp]

USE [work]
GO

/****** Object:  Table [dbo].[ServiceTemp]    Script Date: 04.08.2015 16:09:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ServiceTemp](
	[ID] [int] NOT NULL,
	[TovarNo] [smallint] NOT NULL,
	[Is_Service] [bit] NULL,
 CONSTRAINT [PK_ServiceTemp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


-- Вставляем значения во временную таблицу признака сервиса
print 'Вставляем значения во временную таблицу признака сервиса'
insert into work.dbo.ServiceTemp
select * from work.dbo.Service



-- уничтожаем связные таблицы с таблицей Tovar
print 'уничтожаем связные таблицы с таблицей Tovar'
print 'Уничтодаем таблицу Service'
drop table work.dbo.Service
print 'Уничтодаем таблицу TovarWithNoNDS'
drop table work.dbo.TovarWithNoNDS
print 'Уничтодаем таблицу Our_Tovar'
drop table work.dbo.Our_Tovar
print 'Уничтодаем таблицу Social_Tovar'
drop table work.dbo.Social_Tovar
print 'Уничтодаем таблицу TovarPost'
drop table work.dbo.TovarPost


-- уничтожаем таблицу Tovar и создаем ее с новой размерностью
print 'Уничтодаем таблицу Tovar и создаем ее с новой размерностью'
 
USE [work]
GO

ALTER TABLE [dbo].[Tovar] DROP CONSTRAINT [FK_Tovar_VidTov]
GO

ALTER TABLE [dbo].[Tovar] DROP CONSTRAINT [FK_Tovar_Company]
GO

ALTER TABLE [dbo].[Tovar] DROP CONSTRAINT [DF_Tovar_weight_packed]
GO

ALTER TABLE [dbo].[Tovar] DROP CONSTRAINT [DF_Tovar_Visible]
GO

ALTER TABLE [dbo].[Tovar] DROP CONSTRAINT [DF_Tovar_TaraNo]
GO

/****** Object:  Table [dbo].[Tovar]    Script Date: 04.08.2015 16:23:20 ******/
DROP TABLE [dbo].[Tovar]
GO

/****** Object:  Table [dbo].[Tovar]    Script Date: 04.08.2015 16:23:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Tovar](
	[TovarNo] [int] NOT NULL,
	[NameTovar] [varchar](128) NULL,
	[NameTovarShort] [varchar](64) NULL,
	[EdIzm] [varchar](5) NULL,
	[VidNo] [smallint] NULL,
	[Company] [varchar](10) NULL,
	[CompanyNo] [smallint] NULL,
	[KolPerPak] [smallint] NULL,
	[SrokReal] [smallint] NULL,
	[Weight] [decimal](10, 3) NULL,
	[TipNo] [smallint] NULL,
	[CodReport] [varchar](20) NULL,
	[Export1C] [bit] NULL,
	[Change1C] [bit] NULL,
	[Cod1C] [varchar](6) NULL,
	[ID1C] [varchar](6) NULL,
	[OtdelNo] [smallint] NULL,
	[TaraNo] [smallint] NULL,
	[Visible] [bit] NULL,
	[weight_packed] [bit] NULL,
	[barCode] [bigint] NULL,
	[is_weight] [bit] NULL,
	[pkey] [dbo].[DtPkey] NOT NULL,
	[IsInternal] [bit] NULL,
 CONSTRAINT [PK_Tovar] PRIMARY KEY CLUSTERED 
(
	[TovarNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Tovar] ADD  CONSTRAINT [DF_Tovar_TaraNo]  DEFAULT ((0)) FOR [TaraNo]
GO

ALTER TABLE [dbo].[Tovar] ADD  CONSTRAINT [DF_Tovar_Visible]  DEFAULT ((0)) FOR [Visible]
GO

ALTER TABLE [dbo].[Tovar] ADD  CONSTRAINT [DF_Tovar_weight_packed]  DEFAULT ((0)) FOR [weight_packed]
GO

ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_Company] FOREIGN KEY([CompanyNo])
REFERENCES [dbo].[Company] ([CompanyNo])
GO

ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_Company]
GO

ALTER TABLE [dbo].[Tovar]  WITH CHECK ADD  CONSTRAINT [FK_Tovar_VidTov] FOREIGN KEY([VidNo])
REFERENCES [dbo].[VidTov] ([VidNo])
GO

ALTER TABLE [dbo].[Tovar] CHECK CONSTRAINT [FK_Tovar_VidTov]
GO


-- восстанавливаем данные таблицы Tovar
print 'восстанавливаем данные таблицы Tova'
insert into work.dbo.Tovar
select * from work.dbo.TovarTmp


-- создаем таблицу Service с новой размерностью поля TovarNo
print 'создаем таблицу Service с новой размерностью поля TovarNo'

USE [work]
GO

/****** Object:  Table [dbo].[Service]    Script Date: 04.08.2015 16:09:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Service](
	[ID] [int] NOT NULL,
	[TovarNo] [int] NOT NULL,
	[Is_Service] [bit] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Service_uq] UNIQUE NONCLUSTERED 
(
	[TovarNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [Service_fk] FOREIGN KEY([TovarNo])
REFERENCES [dbo].[Tovar] ([TovarNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [Service_fk]
GO


-- восстанавливаем данные таблицы Service

print 'восстанавливаем данные таблицы Service'
insert into  work.dbo.Service
select * from work.dbo.ServiceTemp



-- создаем таблицу TovarWithNoNDS с новой размерностью поля TovarNo
print 'создаем таблицу TovarWithNoNDS с новой размерностью поля TovarNo'

USE [work]
GO

/****** Object:  Table [dbo].[TovarWithNoNDS]    Script Date: 04.08.2015 16:48:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TovarWithNoNDS](
	[ID] [int] NOT NULL,
	[TovarNo] [int] NOT NULL,
	[WithNoNDS] [bit] NULL,
 CONSTRAINT [PK_TovarWithNoNDS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [TovarWithNoNDS_uq] UNIQUE NONCLUSTERED 
(
	[TovarNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[TovarWithNoNDS]  WITH CHECK ADD  CONSTRAINT [TovarWithNoNDS_fk] FOREIGN KEY([TovarNo])
REFERENCES [dbo].[Tovar] ([TovarNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[TovarWithNoNDS] CHECK CONSTRAINT [TovarWithNoNDS_fk]
GO


-- восстанавливаем данные таблицы TovarWithNoNDS
print 'восстанавливаем данные таблицы TovarWithNoNDS'

insert into work.dbo.TovarWithNoNDS
select * from work.dbo.TovarWithNoNDSTemp


-- создаем таблицу Our_Tovar с новой размерностью поля TovarNo
print 'создаем таблицу Our_Tovar с новой размерностью поля TovarNo'

USE [work]
GO

/****** Object:  Table [dbo].[Our_Tovar]    Script Date: 04.08.2015 16:53:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Our_Tovar](
	[ID] [int] NOT NULL,
	[TovarNo] [int] NOT NULL,
	[NotOur] [bit] NULL,
 CONSTRAINT [PK_Our_Tovar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Our_Tovar_uq] UNIQUE NONCLUSTERED 
(
	[TovarNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Our_Tovar]  WITH CHECK ADD  CONSTRAINT [Our_Tovar_fk] FOREIGN KEY([TovarNo])
REFERENCES [dbo].[Tovar] ([TovarNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Our_Tovar] CHECK CONSTRAINT [Our_Tovar_fk]
GO



-- восстанавливаем данные таблицы Our_Tovar
print 'восстанавливаем данные таблицы Our_Tovar'

insert into work.dbo.Our_Tovar
select * from work.dbo.Our_TovarTemp



-- создаем таблицу Social_Tovar с новой размерностью поля TovarNo
print 'создаем таблицу Social_Tovar с новой размерностью поля TovarNo'

USE [work]
GO

/****** Object:  Table [dbo].[Social_Tovar]    Script Date: 04.08.2015 16:56:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Social_Tovar](
	[ID] [int] NOT NULL,
	[TovarNo] [int] NOT NULL,
	[Social] [bit] NULL,
 CONSTRAINT [PK_Social_Tovar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Social_Tovar_uq] UNIQUE NONCLUSTERED 
(
	[TovarNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Social_Tovar]  WITH CHECK ADD  CONSTRAINT [Social_Tovar_fk] FOREIGN KEY([TovarNo])
REFERENCES [dbo].[Tovar] ([TovarNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Social_Tovar] CHECK CONSTRAINT [Social_Tovar_fk]
GO


-- восстанавливаем данные таблицы Social_Tovar
print 'восстанавливаем данные таблицы Social_Tovar'

insert into work.dbo.Social_Tovar
select * from work.dbo.Social_TovarTemp


-- создаем таблицу TovarPost с новой размерностью поля TovarNo
print 'создаем таблицу TovarPost с новой размерностью поля TovarNo'

USE [work]
GO

/****** Object:  Table [dbo].[TovarPost]    Script Date: 04.08.2015 16:59:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TovarPost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PostNo] [smallint] NOT NULL,
	[TovarNo] [int] NOT NULL,
	[TovarNoPost] [int] NULL,
	[NameTovar] [varchar](128) NULL,
	[NameTovarShort] [varchar](64) NULL,
	[BarCode] [bigint] NULL,
	[NameTovarPost] [varchar](128) NULL,
 CONSTRAINT [PK__TovarPos__3213E83F32A16594] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [TovarPost_uq] UNIQUE NONCLUSTERED 
(
	[PostNo] ASC,
	[TovarNo] ASC,
	[TovarNoPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[TovarPost]  WITH CHECK ADD  CONSTRAINT [TovarPost_fk] FOREIGN KEY([PostNo])
REFERENCES [dbo].[Post] ([PostNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[TovarPost] CHECK CONSTRAINT [TovarPost_fk]
GO

ALTER TABLE [dbo].[TovarPost]  WITH CHECK ADD  CONSTRAINT [TovarPost_fk2] FOREIGN KEY([TovarNo])
REFERENCES [dbo].[Tovar] ([TovarNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[TovarPost] CHECK CONSTRAINT [TovarPost_fk2]
GO


-- восстанавливаем данные таблицы TovarPost
print 'восстанавливаем данные таблицы TovarPost'

insert into work.dbo.TovarPost (PostNo,TovarNo,TovarNoPost,NameTovar,NameTovarShort,BarCode,NameTovarPost)
select PostNo,TovarNo,TovarNoPost,NameTovar,NameTovarShort,BarCode,NameTovarPost from work.dbo.TovarPostTemp

print 'Проверяем наличие временной таблицы остатков. Если присудствует, уничтожаем и Создаем временную таблицу остатков'

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[work].[dbo].[OstatokTmp]') AND type in (N'U'))
DROP TABLE [work].[dbo].[OstatokTmp]

USE [work]
GO

/****** Object:  Table [dbo].[Ostatok]    Script Date: 06.08.2015 11:51:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OstatokTmp](
	[TovarNo] [int] NOT NULL,
	[Kol] [decimal](18, 3) NULL,
	[Price] [decimal](18, 6) NULL,
	[Price1] [decimal](18, 6) NULL,
	[Percent1] [decimal](18, 6) NULL,
	[Price2] [decimal](18, 6) NULL,
	[Percent2] [decimal](18, 6) NULL,
	[Price3] [decimal](18, 6) NULL,
	[Price4] [decimal](10, 3) NULL,
	[Price5] [decimal](18, 4) NULL,
	[Price6] [decimal](18, 4) NULL,
	[Price7] [decimal](18, 4) NULL,
	[Price8] [decimal](18, 4) NULL,
	[Price9] [decimal](18, 4) NULL,
	[Price10] [decimal](18, 4) NULL,
	[Price13] [decimal](18, 4) NULL,
	[Price14] [decimal](18, 4) NULL,
	[Price15] [decimal](18, 4) NULL,
	[KolHold] [decimal](18, 3) NULL,
	[LastPriceIn] [decimal](18, 6) NULL,
	[AvgPriceIn] [decimal](18, 6) NULL,
	[EnableSkidka] [bit] NOT NULL,
	[Dept_id] [int] NULL,
 CONSTRAINT [PK_OstatokTmp] PRIMARY KEY CLUSTERED 
(
	[TovarNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

print 'Вставляем значения во временную таблицу остатков'
insert into work.dbo.OstatokTmp
select * from work.dbo.Ostatok

print 'Уничтожаем таблицу Ostatok и создаем с новой размерностью столбца TovarNo'

USE [work]
GO

ALTER TABLE [dbo].[Ostatok] DROP CONSTRAINT [DF_Ostatok_EnableSkidka]
GO

/****** Object:  Table [dbo].[Ostatok]    Script Date: 06.08.2015 11:58:10 ******/
DROP TABLE [dbo].[Ostatok]
GO

/****** Object:  Table [dbo].[Ostatok]    Script Date: 06.08.2015 11:58:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ostatok](
	[TovarNo] [int] NOT NULL,
	[Kol] [decimal](18, 3) NULL,
	[Price] [decimal](18, 6) NULL,
	[Price1] [decimal](18, 6) NULL,
	[Percent1] [decimal](18, 6) NULL,
	[Price2] [decimal](18, 6) NULL,
	[Percent2] [decimal](18, 6) NULL,
	[Price3] [decimal](18, 6) NULL,
	[Price4] [decimal](10, 3) NULL,
	[Price5] [decimal](18, 4) NULL,
	[Price6] [decimal](18, 4) NULL,
	[Price7] [decimal](18, 4) NULL,
	[Price8] [decimal](18, 4) NULL,
	[Price9] [decimal](18, 4) NULL,
	[Price10] [decimal](18, 4) NULL,
	[Price13] [decimal](18, 4) NULL,
	[Price14] [decimal](18, 4) NULL,
	[Price15] [decimal](18, 4) NULL,
	[KolHold] [decimal](18, 3) NULL,
	[LastPriceIn] [decimal](18, 6) NULL,
	[AvgPriceIn] [decimal](18, 6) NULL,
	[EnableSkidka] [bit] NOT NULL,
	[Dept_id] [int] NULL,
 CONSTRAINT [PK_Ostatok] PRIMARY KEY CLUSTERED 
(
	[TovarNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Ostatok] ADD  CONSTRAINT [DF_Ostatok_EnableSkidka]  DEFAULT (1) FOR [EnableSkidka]
GO

print 'Восстанавливаем данные в таблице остатков'
insert into work.dbo.Ostatok
select * from work.dbo.OstatokTmp




