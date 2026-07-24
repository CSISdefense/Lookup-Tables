/****** Object:  Table [dbo].[COUNTY_TL_EDITS]    Script Date: 7/24/2026 12:35:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[COUNTY_TL_EDITS](
	[fid] [smallint] NOT NULL,
	[StateFIPS] [tinyint] NOT NULL,
	[CountyFIPS] [smallint] NOT NULL,
	[StateAbbr] [nvarchar](50) NOT NULL,
	[COUNTYNS] [int] NOT NULL,
	[GEOID] [int] NOT NULL,
	[CountyName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO

