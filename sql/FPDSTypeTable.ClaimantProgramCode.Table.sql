SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[ClaimantProgramCode](
	[Unseperated] [varchar](255) NULL,
	[ClaimantProgramCode] [varchar](3) NOT NULL,
	[ClaimantProgramCodeText] [nvarchar](255) NULL,
	[PlatformPortfolio] [varchar](30) NULL,
	[CanadaSector] [nvarchar](75) NULL,
 CONSTRAINT [ClaimantProgramCode_key] PRIMARY KEY CLUSTERED 
(
	[ClaimantProgramCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FPDSTypeTable].[ClaimantProgramCode]  WITH NOCHECK ADD  CONSTRAINT [FK__ClaimantP__Canad__11E05B9E] FOREIGN KEY([CanadaSector])
REFERENCES [ProductOrServiceCode].[CanadaSector] ([CanadaSector])
GO
ALTER TABLE [FPDSTypeTable].[ClaimantProgramCode] CHECK CONSTRAINT [FK__ClaimantP__Canad__11E05B9E]
GO
ALTER TABLE [FPDSTypeTable].[ClaimantProgramCode]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDStypetable_ClaimaintProgramCode_PlatformPortfolio] FOREIGN KEY([PlatformPortfolio])
REFERENCES [ProductOrServiceCode].[PlatformPortfolio] ([PlatformPortfolio])
GO
ALTER TABLE [FPDSTypeTable].[ClaimantProgramCode] CHECK CONSTRAINT [fk_FPDStypetable_ClaimaintProgramCode_PlatformPortfolio]
GO
