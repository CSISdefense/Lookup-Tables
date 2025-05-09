SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[SubFunctionCode](
	[SubfunctionCode] [smallint] NOT NULL,
	[agencyid] [varchar](4) NULL,
	[SubfunctionTitle] [varchar](100) NULL,
 CONSTRAINT [pk_SubFunctionCode] PRIMARY KEY CLUSTERED 
(
	[SubfunctionCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
