SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductOrServiceCode].[inherently_governmental_functions](
	[inherently_governmental_functions] [varchar](10) NOT NULL,
	[inherently_governmental_functions_description] [varchar](40) NULL,
 CONSTRAINT [pk_ProductOrServiceCode_inherently_governmental_functions] PRIMARY KEY CLUSTERED 
(
	[inherently_governmental_functions] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
