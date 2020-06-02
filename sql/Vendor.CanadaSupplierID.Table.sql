SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[CanadaSupplierID](
	[CanadaSupplierID] [bigint] NULL,
	[Supplier] [nvarchar](255) NULL,
	[SuppAddress] [nvarchar](1000) NULL,
	[SuppCity] [nvarchar](255) NULL,
	[SuppProvince] [varchar](10) NULL,
	[SuppPostCode] [varchar](255) NULL,
	[SuppCountry] [varchar](10) NULL,
	[ParentID] [nvarchar](255) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Vendor].[CanadaSupplierID]  WITH NOCHECK ADD  CONSTRAINT [FK__CanadaSup__Paren__5749A5B5] FOREIGN KEY([ParentID])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Vendor].[CanadaSupplierID] CHECK CONSTRAINT [FK__CanadaSup__Paren__5749A5B5]
GO
