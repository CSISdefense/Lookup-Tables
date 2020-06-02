SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[ContractingOfficeCodeHistory](
	[ContractingOfficeCode] [varchar](6) NOT NULL,
	[fiscal_year] [smallint] NOT NULL,
 CONSTRAINT [pk_Office_ContractingOfficeCodeHistory] PRIMARY KEY CLUSTERED 
(
	[fiscal_year] ASC,
	[ContractingOfficeCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Office].[ContractingOfficeCodeHistory]  WITH CHECK ADD  CONSTRAINT [fk_Office_ContractingOfficeCodeHistory] FOREIGN KEY([ContractingOfficeCode])
REFERENCES [Office].[ContractingOfficeCode] ([ContractingOfficeCode])
GO
ALTER TABLE [Office].[ContractingOfficeCodeHistory] CHECK CONSTRAINT [fk_Office_ContractingOfficeCodeHistory]
GO
