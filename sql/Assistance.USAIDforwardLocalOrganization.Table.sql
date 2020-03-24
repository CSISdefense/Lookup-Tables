USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Assistance].[USAIDforwardLocalOrganization](
	[Country] [varchar](255) NULL,
	[VendorCategory] [varchar](255) NULL,
	[VendorName] [varchar](255) NULL,
	[Sector] [varchar](255) NULL,
	[Subsector] [varchar](255) NULL,
	[FY2012 Obligated Amount] [real] NULL,
	[standardizedvendorname] [varchar](100) NULL,
	[parentid] [nvarchar](255) NULL,
	[isexactregionalmatch] [bit] NULL
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Assistance].[USAIDforwardLocalOrganization]  WITH NOCHECK ADD  CONSTRAINT [fk_USAIDforwardLocalOrganization_ParentID] FOREIGN KEY([parentid])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Assistance].[USAIDforwardLocalOrganization] CHECK CONSTRAINT [fk_USAIDforwardLocalOrganization_ParentID]
GO
