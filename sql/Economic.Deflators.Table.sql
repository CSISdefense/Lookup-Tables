SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Economic].[Deflators](
	[Fiscal_Year] [smallint] NOT NULL,
	[GDPdeflator] [float] NULL,
	[GDPdeflatorName] [nvarchar](50) NULL,
	[GDPdeflator2015] [float] NULL,
	[GDPdeflator2016] [float] NULL,
	[GDPdeflator1990] [float] NULL,
	[GDPdeflator2005] [float] NULL,
	[GDPdeflator2011] [float] NULL,
	[GDPdeflator2012] [float] NULL,
	[GDPdeflator2013] [float] NULL,
	[GDPdeflator2017] [float] NULL,
	[Unknown2017] [float] NULL,
	[OMB19_19] [float] NULL,
	[GDPdeflator2014] [float] NULL,
	[OMB20_GDP12] [float] NULL,
	[OMB20_GDP18] [float] NULL,
	[OMB20_GDP20] [float] NULL,
	[OMB22_GDP12] [float] NULL,
	[OMB22_GDP20] [float] NULL,
	[OMB22_Def12] [float] NULL,
	[OMB22_Def20] [float] NULL,
	[OMB23_OUT12] [float] NULL,
	[OMB23_OUT21] [float] NULL,
	[OMB24_GDP12] [float] NULL,
	[OMB24_GDP22] [float] NULL,
	[GDPdeflator2018] [float] NULL,
	[OMB25_GDP17] [float] NULL,
	[OMB25_GDP23] [float] NULL
) ON [PRIMARY]
GO
