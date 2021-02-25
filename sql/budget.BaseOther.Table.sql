SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[BaseOther](
	[BaseOther] [varchar](14) NOT NULL,
	[BaseOtherSum] [varchar](14) NULL,
	[BaseOtherInclude] [bit] NULL,
	[IsOriginal] [bit] NULL,
 CONSTRAINT [pk_Budget_BaseOther] PRIMARY KEY CLUSTERED 
(
	[BaseOther] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[BaseOther]  WITH CHECK ADD FOREIGN KEY([BaseOtherSum])
REFERENCES [budget].[BaseOther] ([BaseOther])
GO
ALTER TABLE [budget].[BaseOther]  WITH CHECK ADD  CONSTRAINT [chk_Budget_BaseOther] CHECK  (([BaseOther]<>''))
GO
ALTER TABLE [budget].[BaseOther] CHECK CONSTRAINT [chk_Budget_BaseOther]
GO
