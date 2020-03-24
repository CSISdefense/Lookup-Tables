USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FPDSTypeTable].[TreasuryAgencyCode](
	[TreasuryAgencyCode] [varchar](2) NOT NULL,
	[agencyid] [varchar](4) NULL,
	[Notes] [varchar](255) NULL,
	[treasuryagencyname] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[TreasuryAgencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [FPDSTypeTable].[TreasuryAgencyCode]  WITH CHECK ADD FOREIGN KEY([agencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
