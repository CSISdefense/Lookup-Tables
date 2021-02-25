SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[TreasuryAgencyCode](
	[TreasuryAgencyCode] [varchar](2) NOT NULL,
	[agencyid] [varchar](4) NULL,
	[Notes] [varchar](255) NULL,
	[treasuryagencyname] [varchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[TreasuryAgencyCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FPDSTypeTable].[TreasuryAgencyCode]  WITH CHECK ADD FOREIGN KEY([agencyid])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
