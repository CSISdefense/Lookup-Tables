SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Economic].[hist10z1_fy22](
	[Fiscal_Year] [nvarchar](50) NOT NULL,
	[GDP_in_billions_of_dollars] [float] NOT NULL,
	[GDP_Chained_Price_Index] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[Total_Defense] [float] NOT NULL,
	[Total_Nondefense] [float] NOT NULL,
	[Payment_for_IndividualsTotal] [float] NOT NULL,
	[Payment_for_IndividualsDirect] [float] NOT NULL,
	[Payment_for_IndividualsGrants] [float] NOT NULL,
	[Other_Grants] [float] NOT NULL,
	[Net_Interest] [float] NOT NULL,
	[Undis_tributed_Offsetting_Receipts] [float] NOT NULL,
	[All_Other] [float] NOT NULL,
	[Addendum_Direct_CapitalTotal] [float] NOT NULL,
	[Addendum_Direct_CapitalDefense] [float] NOT NULL,
	[Addendum_Direct_CapitalNondefense] [float] NOT NULL,
	[Fiscal_Year_Smallint] [smallint] NULL
) ON [PRIMARY]
GO
