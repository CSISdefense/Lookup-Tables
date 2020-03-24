USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FPDSTypeTable].[award_type_code](
	[award_type_code] [varchar](1) NOT NULL,
	[award_type_name] [varchar](255) NULL,
	[award_type_abbreviation] [varchar](3) NULL,
	[IsDeliveryOrder] [bit] NULL,
	[UseExtentCompeted] [bit] NULL,
 CONSTRAINT [pk_award_type_code] PRIMARY KEY CLUSTERED 
(
	[award_type_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
