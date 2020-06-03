SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[CountryCodes](
	[USAID region] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[alpha-2] [nvarchar](255) NULL,
	[alpha-3] [nvarchar](3) NOT NULL,
	[country-code] [float] NULL,
	[iso_3166-2] [nvarchar](255) NULL,
	[region-code] [float] NULL,
	[sub-region-code] [float] NULL,
	[name1] [nvarchar](255) NULL,
	[isTerritory] [varchar](50) NULL,
	[isDisputed] [varchar](50) NULL,
	[isDependent] [varchar](50) NULL,
	[gbk_country_id] [float] NULL,
	[IsNotUSAIDforwardRecipient] [bit] NULL,
	[isforeign] [bit] NULL,
	[WarTheater] [varchar](20) NULL,
	[CombatantCommand] [varchar](10) NULL,
	[CrisisFundingTheater] [varchar](20) NULL,
	[OCOcrisisScore] [smallint] NULL,
	[IsOMBocoList] [bit] NULL,
	[GEC] [varchar](2) NULL,
	[STANAG] [varchar](3) NULL,
	[NATOyear] [smallint] NULL,
	[MajorNonNATOyear] [smallint] NULL,
	[OtherTreatyYear] [smallint] NULL,
	[OtherTreatyName] [varchar](40) NULL,
	[SEATO] [bit] NULL,
	[RioTreaty] [bit] NULL,
	[FiveEyes] [bit] NULL,
	[NTIByear] [smallint] NULL,
 CONSTRAINT [PK_ISOcountryCode3] PRIMARY KEY CLUSTERED 
(
	[alpha-3] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
