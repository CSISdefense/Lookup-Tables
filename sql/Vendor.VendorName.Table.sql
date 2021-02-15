SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[VendorName](
	[vendorname] [nvarchar](150) NOT NULL,
	[parentid] [nvarchar](255) NULL,
	[isUSAforwardLocalOrganization] [bit] NULL,
	[isunknownvendorname] [bit] NULL,
	[CSIScreateddate] [datetime2](7) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[standardizedvendorname] [nvarchar](150) NULL,
	[EntityID] [int] NULL,
 CONSTRAINT [PK_VendorName] PRIMARY KEY CLUSTERED 
(
	[vendorname] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Vendor].[VendorName] ADD  CONSTRAINT [DF__VendorNam__CSISc__52C41C63]  DEFAULT (getdate()) FOR [CSIScreateddate]
GO
ALTER TABLE [Vendor].[VendorName] ADD  CONSTRAINT [DF__VendorNam__CSISm__53B8409C]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Vendor].[VendorName] ADD  CONSTRAINT [DF__VendorNam__CSISm__54AC64D5]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Vendor].[VendorName]  WITH NOCHECK ADD  CONSTRAINT [FK__VendorNam__Entit__4AE3CED0] FOREIGN KEY([EntityID])
REFERENCES [Vendor].[EntityID] ([EntityID])
GO
ALTER TABLE [Vendor].[VendorName] CHECK CONSTRAINT [FK__VendorNam__Entit__4AE3CED0]
GO
ALTER TABLE [Vendor].[VendorName]  WITH NOCHECK ADD  CONSTRAINT [fk_vendorname_ParentID] FOREIGN KEY([parentid])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Vendor].[VendorName] CHECK CONSTRAINT [fk_vendorname_ParentID]
GO
ALTER TABLE [Vendor].[VendorName]  WITH NOCHECK ADD  CONSTRAINT [FK_vendorname_standardizedvendorname] FOREIGN KEY([standardizedvendorname])
REFERENCES [Vendor].[VendorName] ([vendorname])
GO
ALTER TABLE [Vendor].[VendorName] CHECK CONSTRAINT [FK_vendorname_standardizedvendorname]
GO
