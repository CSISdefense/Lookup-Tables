SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[Customer](
	[Customer] [nvarchar](50) NOT NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [agency].[Customer] ADD  CONSTRAINT [DF__Customer__CSIScr__32574CD1]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [agency].[Customer] ADD  CONSTRAINT [DF__Customer__CSISmo__334B710A]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
