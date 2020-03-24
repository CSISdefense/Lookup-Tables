USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vendor].[SiliconValley](
	[VendorName] [nvarchar](150) NULL,
	[StandardizedVendorName] [nvarchar](150) NULL,
	[List] [varchar](255) NULL,
	[Sales] [varchar](255) NULL,
	[Profit] [varchar](255) NULL,
	[Capex] [varchar](255) NULL,
	[RnD] [varchar](255) NULL,
	[Employees] [varchar](255) NULL,
	[Cash] [varchar](255) NULL,
	[Debt] [varchar](255) NULL,
	[Dividends] [varchar](255) NULL,
	[Repurchase] [varchar](255) NULL,
	[Tax] [varchar](255) NULL,
	[Rank] [int] NULL,
	[ParentID] [nvarchar](255) NULL
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Vendor].[SiliconValley]  WITH NOCHECK ADD  CONSTRAINT [FK__SiliconVa__Paren__34B4968F] FOREIGN KEY([ParentID])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Vendor].[SiliconValley] CHECK CONSTRAINT [FK__SiliconVa__Paren__34B4968F]
GO
ALTER TABLE [Vendor].[SiliconValley]  WITH NOCHECK ADD  CONSTRAINT [fk_SiliconValley_StandardizedVendorName] FOREIGN KEY([StandardizedVendorName])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Vendor].[SiliconValley] CHECK CONSTRAINT [fk_SiliconValley_StandardizedVendorName]
GO
ALTER TABLE [Vendor].[SiliconValley]  WITH NOCHECK ADD  CONSTRAINT [fk_SiliconValley_VendorName] FOREIGN KEY([VendorName])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Vendor].[SiliconValley] CHECK CONSTRAINT [fk_SiliconValley_VendorName]
GO
