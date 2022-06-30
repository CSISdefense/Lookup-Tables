SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[OfficeIDhistory](
	[OfficeID] [varchar](6) NOT NULL,
	[fiscal_year] [smallint] NOT NULL,
	[AgencyID] [varchar](4) NOT NULL,
	[OfficeName] [varchar](255) NULL,
	[MinOfSignedDate] [datetime2](7) NULL,
	[MaxOfSignedDate] [datetime2](7) NULL,
	[MajorCommandCode] [varchar](24) NULL,
	[MajorCommandName] [varchar](100) NULL,
	[MajorCommandID] [varchar](8) NULL,
	[isJCCIA] [bit] NULL,
	[CSISofficeName] [varchar](50) NULL,
	[CSIScreatedDate] [datetime] NULL,
	[CSISmodifiedDate] [datetime] NULL,
	[CSISmodifiedBy] [nvarchar](128) NULL,
 CONSTRAINT [pk_Office_OfficeIDhistory] PRIMARY KEY CLUSTERED 
(
	[fiscal_year] ASC,
	[AgencyID] ASC,
	[OfficeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Office].[OfficeIDhistory] ADD  CONSTRAINT [DF__oih__CSIScreateddate]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [Office].[OfficeIDhistory] ADD  CONSTRAINT [DF__oih__CSISmodifieddate]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Office].[OfficeIDhistory] ADD  CONSTRAINT [DF__oif__CSISmodifiedby]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Office].[OfficeIDhistory]  WITH CHECK ADD FOREIGN KEY([AgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Office].[OfficeIDhistory]  WITH CHECK ADD  CONSTRAINT [fk_Office_OfficeIDhistory] FOREIGN KEY([AgencyID], [OfficeID])
REFERENCES [Office].[OfficeID] ([AgencyID], [OfficeID])
GO
ALTER TABLE [Office].[OfficeIDhistory] CHECK CONSTRAINT [fk_Office_OfficeIDhistory]
GO
