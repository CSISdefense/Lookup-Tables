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
	[UEI] [varchar](12) NULL,
 CONSTRAINT [PK__EntityID__9C892FFDD6C95B52] PRIMARY KEY CLUSTERED 
(
	[EntityID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_vendor_entityID_Dunsnumber] ON [Vendor].[EntityID]
(
	[Dunsnumber] ASC
)
WHERE ([Dunsnumber] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_vendor_entityID_ParentID] ON [Vendor].[EntityID]
(
	[ParentID] ASC
)
WHERE ([ParentID] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UQ_vendor_entityID_VendorName] ON [Vendor].[EntityID]
(
	[VendorName] ASC
)
WHERE ([VendorName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
ALTER TABLE [Vendor].[EntityID]  WITH CHECK ADD FOREIGN KEY([UEI])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Vendor].[EntityID]  WITH NOCHECK ADD  CONSTRAINT [FK__EntityID__Vendor__4DC03B7B] FOREIGN KEY([VendorName])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Vendor].[EntityID] CHECK CONSTRAINT [FK__EntityID__Vendor__4DC03B7B]
GO
