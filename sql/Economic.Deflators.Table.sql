SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Economic].[Deflators](
	[Fiscal_Year] [smallint] NOT NULL,
	[GDPdeflator] [decimal](19, 8) NULL,
	[GDPdeflatorName] [nvarchar](255) NOT NULL,
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
	[OMB20_GDP18] [decimal](19, 8) NULL,
 CONSTRAINT [pk_Economic_Deflators_Fiscal_Years] PRIMARY KEY CLUSTERED 
(
	[Fiscal_Year] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
