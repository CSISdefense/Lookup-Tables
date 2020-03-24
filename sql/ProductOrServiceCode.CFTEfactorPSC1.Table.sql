USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductOrServiceCode].[CFTEfactorPSC1](
	[PSC] [varchar](5) NOT NULL,
	[PSC_Description] [varchar](255) NULL,
	[Contract_Invoiced_Amount] [varchar](255) NULL,
	[Number_of_Contractor_FTEs] [varchar](255) NULL,
	[CFTE_Rate] [float] NULL,
	[CFTE_Factor] [float] NULL,
	[OCO_GF] [varchar](3) NOT NULL,
	[Fiscal_Year] [smallint] NOT NULL,
	[Direct_Non_Labor_Cost] [varchar](255) NULL,
	[Direct_Labor_Dollars] [varchar](255) NULL,
	[Location_Count] [varchar](255) NULL,
	[IsRnDdefenseSystem] [bit] NOT NULL,
 CONSTRAINT [pk_ProductOrServiceCode_CFTEfactorPSC1] PRIMARY KEY CLUSTERED 
(
	[Fiscal_Year] ASC,
	[OCO_GF] ASC,
	[PSC] ASC,
	[IsRnDdefenseSystem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
