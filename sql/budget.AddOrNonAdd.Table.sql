SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[AddOrNonAdd](
	[AddOrNonAdd] [varchar](7) NOT NULL,
 CONSTRAINT [pk_Budget_AddOrNonAdd] PRIMARY KEY CLUSTERED 
(
	[AddOrNonAdd] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[AddOrNonAdd]  WITH CHECK ADD  CONSTRAINT [chk_Budget_AddOrNonAdd] CHECK  (([AddOrNonAdd]<>''))
GO
ALTER TABLE [budget].[AddOrNonAdd] CHECK CONSTRAINT [chk_Budget_AddOrNonAdd]
GO