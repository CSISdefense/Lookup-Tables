USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[vendorcountrycode](
	[vendorcountrycode] [nvarchar](50) NOT NULL,
	[Country3LetterCode] [varchar](3) NULL,
 CONSTRAINT [pk_VendorCountryCode] PRIMARY KEY CLUSTERED 
(
	[vendorcountrycode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FPDSTypeTable].[vendorcountrycode]  WITH NOCHECK ADD  CONSTRAINT [fk_fpdstypetable_vendorcountrycode_Country3LetterCode] FOREIGN KEY([Country3LetterCode])
REFERENCES [FPDSTypeTable].[Country3LetterCode] ([Country3LetterCode])
GO
ALTER TABLE [FPDSTypeTable].[vendorcountrycode] CHECK CONSTRAINT [fk_fpdstypetable_vendorcountrycode_Country3LetterCode]
GO
