USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ProductOrServiceCode].[ProductServiceOrRnDarea](
	[ProductServiceOrRnDarea] [varchar](49) NOT NULL,
	[RnD_BudgetActivity] [varchar](100) NULL,
 CONSTRAINT [pk_ProductServiceOrRnDarea] PRIMARY KEY CLUSTERED 
(
	[ProductServiceOrRnDarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO