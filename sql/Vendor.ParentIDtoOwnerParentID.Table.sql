SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[ParentIDtoOwnerParentID](
	[parentid] [nvarchar](255) NOT NULL,
	[Owners] [nvarchar](255) NULL,
	[OwnerParentID] [nvarchar](255) NULL,
 CONSTRAINT [UN_vendor_parentidtoownerparentid] UNIQUE NONCLUSTERED 
(
	[parentid] ASC,
	[OwnerParentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Vendor].[ParentIDtoOwnerParentID]  WITH NOCHECK ADD  CONSTRAINT [FK_ParentIDtoOwnerParentID_OwnerParentID] FOREIGN KEY([OwnerParentID])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Vendor].[ParentIDtoOwnerParentID] CHECK CONSTRAINT [FK_ParentIDtoOwnerParentID_OwnerParentID]
GO
ALTER TABLE [Vendor].[ParentIDtoOwnerParentID]  WITH NOCHECK ADD  CONSTRAINT [FK_ParentIDtoOwnerParentID_ParentID] FOREIGN KEY([parentid])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Vendor].[ParentIDtoOwnerParentID] CHECK CONSTRAINT [FK_ParentIDtoOwnerParentID_ParentID]
GO
