USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[implementing_partner_type](
	[implementing_partner_type] [float] NULL,
	[implementing_partner_type_name] [nvarchar](255) NULL,
	[ImplementingPartnerSummary] [varchar](100) NULL,
	[NonUSgovernment] [bit] NULL
) ON [PRIMARY]
GO
