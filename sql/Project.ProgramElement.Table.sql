SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProgramElement](
	[ProgramElement] [varchar](10) NOT NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[DefenseServiceIdentifier] [varchar](3) NULL,
	[ProgramElementNumber] [int] NULL,
	[DBAcategory] [varchar](31) NULL,
	[DBAsubCategory] [varchar](50) NULL,
 CONSTRAINT [pk_PrimaryElement] PRIMARY KEY CLUSTERED 
(
	[ProgramElement] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[ProgramElement]  WITH NOCHECK ADD  CONSTRAINT [fk_ProgramElement_DefenseServiceIdentifier] FOREIGN KEY([DefenseServiceIdentifier])
REFERENCES [agency].[DefenseServiceIdentifier] ([DefenseServiceIdentifier])
GO
ALTER TABLE [Project].[ProgramElement] CHECK CONSTRAINT [fk_ProgramElement_DefenseServiceIdentifier]
GO
ALTER TABLE [Project].[ProgramElement]  WITH NOCHECK ADD  CONSTRAINT [fk_ProgramElement_ProgramElementNumber] FOREIGN KEY([ProgramElementNumber])
REFERENCES [Project].[ProgramElementNumber] ([ProgramElementNumber])
GO
ALTER TABLE [Project].[ProgramElement] CHECK CONSTRAINT [fk_ProgramElement_ProgramElementNumber]
GO
