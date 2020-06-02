SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[correction_late_ind](
	[Unseperated] [varchar](255) NULL,
	[correction_late_ind] [varchar](16) NOT NULL,
	[correction_late_ind_text] [varchar](220) NULL,
 CONSTRAINT [correction_late_ind_key] PRIMARY KEY CLUSTERED 
(
	[correction_late_ind] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
