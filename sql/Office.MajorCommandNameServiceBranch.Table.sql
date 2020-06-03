SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[MajorCommandNameServiceBranch](
	[FullName] [nvarchar](255) NULL,
	[MajorCommandName] [nvarchar](255) NULL,
	[ServiceBranch] [nvarchar](255) NULL,
	[ActionObligated] [decimal](19, 4) NULL,
	[Actions] [nvarchar](255) NULL
) ON [PRIMARY]
GO
