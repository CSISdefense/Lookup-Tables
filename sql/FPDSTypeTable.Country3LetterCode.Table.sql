USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[Country3LetterCode](
	[Unseperated] [varchar](255) NULL,
	[Country3LetterCode] [varchar](3) NOT NULL,
	[Country3LetterCodeText] [nvarchar](255) NULL,
	[GEC] [varchar](2) NULL,
	[Region] [varchar](50) NULL,
	[IsInternational] [bit] NULL,
	[ISOGIS] [varchar](2) NULL,
	[isoAlpha3] [nvarchar](3) NULL,
	[CombatantCommand] [varchar](10) NULL,
 CONSTRAINT [Country3LetterCode_key] PRIMARY KEY CLUSTERED 
(
	[Country3LetterCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FPDSTypeTable].[Country3LetterCode]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDStypeTable_Country3LetterCode_GEC] FOREIGN KEY([GEC])
REFERENCES [Location].[GEC] ([GEC])
GO
ALTER TABLE [FPDSTypeTable].[Country3LetterCode] CHECK CONSTRAINT [fk_FPDStypeTable_Country3LetterCode_GEC]
GO
ALTER TABLE [FPDSTypeTable].[Country3LetterCode]  WITH NOCHECK ADD  CONSTRAINT [fk_fpdstypetable_country3lettercode_isoAlpha3] FOREIGN KEY([isoAlpha3])
REFERENCES [Location].[CountryCodes] ([alpha-3])
GO
ALTER TABLE [FPDSTypeTable].[Country3LetterCode] CHECK CONSTRAINT [fk_fpdstypetable_country3lettercode_isoAlpha3]
GO
