USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Assistance].[correction_late_ind](
	[Unseperated] [varchar](255) NULL,
	[correction_late_ind] [varchar](16) NOT NULL,
	[correction_late_ind_text] [varchar](220) NULL,
 CONSTRAINT [correction_late_ind_key] PRIMARY KEY CLUSTERED 
(
	[correction_late_ind] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
