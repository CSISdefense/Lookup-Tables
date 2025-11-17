SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[ParentIDHistory](
	[ParentID] [nvarchar](255) NULL,
	[Fiscal_Year] [smallint] NOT NULL,
	[EntitySizeCode] [varchar](1) NULL,
	[IsEntityAbove1990constantMTAthreshold] [bit] NULL,
	[IsEntityAbove2016constantMTAthreshold] [bit] NULL,
	[AnyEntityUSplaceOfPerformance] [bit] NULL,
	[IsEntityAbove2016constantArbitrary1000k] [bit] NULL,
	[AnyEntityForeignPlaceOfPerformance] [bit] NULL,
	[IsEntityAbove2018constantMTAthreshold] [bit] NULL,
	[IsEntityAbove2018constantSimplifedAcquisition250kThreshold] [bit] NULL,
	[IsEntityAbove2018constantCommercialItem7500k] [bit] NULL,
	[IsEntityAbove2018constantCostAccounting2000kThreshold] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Vendor].[ParentIDHistory]  WITH NOCHECK ADD  CONSTRAINT [FK__ParentIDH__Entit__48076225] FOREIGN KEY([EntitySizeCode])
REFERENCES [Vendor].[EntitySizeCode] ([EntitySizeCode])
GO
ALTER TABLE [Vendor].[ParentIDHistory] CHECK CONSTRAINT [FK__ParentIDH__Entit__48076225]
GO
