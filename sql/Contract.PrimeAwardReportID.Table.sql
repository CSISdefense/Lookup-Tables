SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[PrimeAwardReportID](
	[PrimeAwardReportID] [varchar](38) NOT NULL,
	[IsInContractFPDS] [bit] NULL,
	[PrimeAwardReportID32] [varchar](32) NULL,
	[PIID] [varchar](50) NULL,
	[IDVPIID] [varchar](50) NULL,
	[CSIScontractID] [int] NULL,
	[PrimeAwardReportID36] [varchar](36) NULL,
 CONSTRAINT [pk_PrimeAwardReportID] PRIMARY KEY CLUSTERED 
(
	[PrimeAwardReportID] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[PrimeAwardReportID]  WITH NOCHECK ADD  CONSTRAINT [FK__UniqueTra__CSISc__179934F4] FOREIGN KEY([CSIScontractID])
REFERENCES [Contract].[CSIScontractID] ([CSIScontractID])
GO
ALTER TABLE [Contract].[PrimeAwardReportID] CHECK CONSTRAINT [FK__UniqueTra__CSISc__179934F4]
GO
