USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Location].[RecipientStateCodeToParentID](
	[recipient_type] [smallint] NOT NULL,
	[recip_cat_type] [varchar](1) NULL,
	[recipient_country_code] [varchar](3) NULL,
	[recipient_state_code] [varchar](2) NULL,
	[parentid] [nvarchar](255) NULL
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Location].[RecipientStateCodeToParentID]  WITH NOCHECK ADD  CONSTRAINT [FK__Recipient__paren__5F29F348] FOREIGN KEY([parentid])
REFERENCES [Contractor].[ParentContractor] ([ParentID])
GO
ALTER TABLE [Location].[RecipientStateCodeToParentID] CHECK CONSTRAINT [FK__Recipient__paren__5F29F348]
GO
