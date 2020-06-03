SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[EntityID](
	[EntityText] [nvarchar](255) NULL,
	[EntityID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [nvarchar](255) NULL,
	[Dunsnumber] [varchar](13) NULL,
	[VendorName] [nvarchar](150) NULL,
 CONSTRAINT [PK__EntityID__9C892FFDD6C95B52] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Vendor].[EntityID]  WITH NOCHECK ADD  CONSTRAINT [FK__EntityID__Dunsnu__4CCC1742] FOREIGN KEY([Dunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[EntityID] CHECK CONSTRAINT [FK__EntityID__Dunsnu__4CCC1742]
GO
ALTER TABLE [Vendor].[EntityID]  WITH NOCHECK ADD  CONSTRAINT [FK__EntityID__Parent__4BD7F309] FOREIGN KEY([ParentID])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Vendor].[EntityID] CHECK CONSTRAINT [FK__EntityID__Parent__4BD7F309]
GO
ALTER TABLE [Vendor].[EntityID]  WITH NOCHECK ADD  CONSTRAINT [FK__EntityID__Vendor__4DC03B7B] FOREIGN KEY([VendorName])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Vendor].[EntityID] CHECK CONSTRAINT [FK__EntityID__Vendor__4DC03B7B]
GO
