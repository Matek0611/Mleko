IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[Loaded1]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    DROP TABLE [Loaded1];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[Loaded2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    DROP TABLE [Loaded2];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[SDAC_Long_char]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    DROP TABLE [SDAC_Long_char];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[SDAC_Pictures]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    DROP TABLE [SDAC_Pictures];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SDAC_DeleteEmp]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[SDAC_DeleteEmp];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SDAC_InsertEmp]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[SDAC_InsertEmp];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[SDAC_UpdateEmp]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[SDAC_UpdateEmp];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[ThreadTable]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    DROP TABLE [ThreadTable];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[SDAC_Text]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    DROP TABLE [SDAC_Text];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[SDAC_Loaded]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    DROP TABLE [SDAC_Loaded];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Ten Most High-Paid Employees]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
    DROP PROCEDURE [dbo].[Ten Most High-Paid Employees];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[CRGRID_TEST]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    DROP TABLE [CRGRID_TEST];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[emp]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    DROP TABLE [emp];
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id(N'[dept]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
    DROP TABLE [dept];