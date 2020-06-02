SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[ParentIDHistory](
	[ParentID] [nvarchar](255) NULL,
	[FiscalYear] [smallint] NOT NULL,
	[EntitySizeCode] [varchar](1) NULL,
	[IsEntityAbove1990constantReportingThreshold] [bit] NULL,
	[IsEntityAbove2016constantReportingThreshold] [bit] NULL,
	[AnyEntityUSplaceOfPerformance] [bit] NULL,
	[IsEntityAbove2016constantOneMillionThreshold] [bit] NULL,
	[AnyEntityForeignPlaceOfPerformance] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Vendor].[ParentIDHistory]  WITH NOCHECK ADD  CONSTRAINT [FK__ParentIDH__Entit__48076225] FOREIGN KEY([EntitySizeCode])
REFERENCES [Vendor].[EntitySizeCode] ([EntitySizeCode])
GO
ALTER TABLE [Vendor].[ParentIDHistory] CHECK CONSTRAINT [FK__ParentIDH__Entit__48076225]
GO
