SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].['Defense Major Command Codes ###$'](
	[Major Command ID] [nvarchar](255) NULL,
	[Major Command Code] [nvarchar](255) NULL,
	[Major Command Name] [nvarchar](255) NULL,
	[Contracting Office ID] [nvarchar](255) NULL,
	[Contracting Office Name] [nvarchar](255) NULL,
	[Contracting Agency ID] [nvarchar](255) NULL,
	[Contracting Department ID] [nvarchar](255) NULL,
	[Fiscal Year] [nvarchar](255) NULL,
	[Action Obligation] [money] NULL,
	[NoName] [float] NULL
) ON [PRIMARY]
GO
