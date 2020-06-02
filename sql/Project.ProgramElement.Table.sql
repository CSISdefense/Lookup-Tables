SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProgramElement](
	[ProgramElement] [varchar](10) NOT NULL,
	[ProgramElementTitle] [varchar](80) NULL,
	[classified] [varchar](20) NULL,
	[DefenseServiceIdentifier] [varchar](3) NULL,
	[ProgramElementNumber] [int] NULL,
 CONSTRAINT [pk_PrimaryElement] PRIMARY KEY CLUSTERED 
(
	[ProgramElement] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
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
