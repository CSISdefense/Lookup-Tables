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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FPDSTypeTable].[vendorcountrycode]  WITH NOCHECK ADD  CONSTRAINT [fk_fpdstypetable_vendorcountrycode_Country3LetterCode] FOREIGN KEY([Country3LetterCode])
REFERENCES [FPDSTypeTable].[Country3LetterCode] ([Country3LetterCode])
GO
ALTER TABLE [FPDSTypeTable].[vendorcountrycode] CHECK CONSTRAINT [fk_fpdstypetable_vendorcountrycode_Country3LetterCode]
GO
