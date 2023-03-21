SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[USAIDgreenbookSubAgencyID](
	[USAIDgreenbookAgencyID] [smallint] NOT NULL,
	[USAIDgreenbookSubAgencyID] [smallint] NOT NULL,
	[USAIDgreenbookSubAgencyAcronym] [varchar](10) NULL,
	[USAIDgreenbookSubAgencyName] [varchar](100) NOT NULL,
	[IsUSAIDregionalBureau] [bit] NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[FundingAgencyID] [varchar](4) NULL,
	[ImplementingAgencyID] [varchar](4) NULL,
 CONSTRAINT [PK_USAIDgreenbooksubagencyID_USAIDgreenbookAgencyID] PRIMARY KEY CLUSTERED 
(
	[USAIDgreenbookAgencyID] ASC,
	[USAIDgreenbookSubAgencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [agency].[USAIDgreenbookSubAgencyID] ADD  CONSTRAINT [DF__USAIDgree__CSISc__3DC8FF7D]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [agency].[USAIDgreenbookSubAgencyID] ADD  CONSTRAINT [DF__USAIDgree__CSISm__3EBD23B6]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [agency].[USAIDgreenbookSubAgencyID] ADD  CONSTRAINT [DF__USAIDgree__CSISm__3FB147EF]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [agency].[USAIDgreenbookSubAgencyID]  WITH NOCHECK ADD  CONSTRAINT [FK__USAIDgree__Fundi__40A56C28] FOREIGN KEY([FundingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [agency].[USAIDgreenbookSubAgencyID] CHECK CONSTRAINT [FK__USAIDgree__Fundi__40A56C28]
GO
ALTER TABLE [agency].[USAIDgreenbookSubAgencyID]  WITH NOCHECK ADD  CONSTRAINT [FK__USAIDgree__Imple__41999061] FOREIGN KEY([ImplementingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [agency].[USAIDgreenbookSubAgencyID] CHECK CONSTRAINT [FK__USAIDgree__Imple__41999061]
GO
ALTER TABLE [agency].[USAIDgreenbookSubAgencyID]  WITH NOCHECK ADD  CONSTRAINT [FK_agency_USAIDgreenbooksubagencyID_USAIDgreenbookAgencyID] FOREIGN KEY([USAIDgreenbookAgencyID])
REFERENCES [agency].[USAIDgreenbookAgencyID] ([USAIDgreenbookAgencyID])
GO
ALTER TABLE [agency].[USAIDgreenbookSubAgencyID] CHECK CONSTRAINT [FK_agency_USAIDgreenbooksubagencyID_USAIDgreenbookAgencyID]
GO
