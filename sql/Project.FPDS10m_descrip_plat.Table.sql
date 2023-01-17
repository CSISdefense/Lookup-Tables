SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[FPDS10m_descrip_plat](
	[PlatformPortfolioRemote] [nvarchar](50) NOT NULL,
	[obligatedamount] [float] NOT NULL,
	[descrip_plat_row_number] [nvarchar](50) NOT NULL,
	[Remotely_Crewed] [nvarchar](25) NULL,
	[UAS] [nvarchar](5) NULL,
	[CUAS] [nvarchar](5) NULL,
	[Maritime] [nvarchar](5) NULL,
	[mq] [nvarchar](5) NULL,
	[rq] [nvarchar](5) NULL,
	[any_uas] [nvarchar](5) NULL,
	[descriptionofcontractrequirement] [nvarchar](4000) NOT NULL
) ON [PRIMARY]
GO
