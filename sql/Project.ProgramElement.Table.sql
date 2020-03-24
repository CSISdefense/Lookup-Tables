USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
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
