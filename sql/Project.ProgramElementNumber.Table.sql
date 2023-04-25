SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProgramElementNumber](
	[ProgramElementNumber] [int] NOT NULL,
	[ProgramElementTitle] [varchar](150) NULL,
	[DefenseServiceIdentifier] [varchar](3) NULL,
	[MajorForceProgram] [tinyint] NOT NULL,
 CONSTRAINT [pk_ProgramElementNumber] PRIMARY KEY CLUSTERED 
(
	[ProgramElementNumber] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[ProgramElementNumber]  WITH CHECK ADD FOREIGN KEY([MajorForceProgram])
REFERENCES [budget].[MajorForceProgram] ([MajorForceProgram])
GO
ALTER TABLE [Project].[ProgramElementNumber]  WITH NOCHECK ADD  CONSTRAINT [fk_ProgramElementNumber_DefenseServiceIdentifier] FOREIGN KEY([DefenseServiceIdentifier])
REFERENCES [agency].[DefenseServiceIdentifier] ([DefenseServiceIdentifier])
GO
ALTER TABLE [Project].[ProgramElementNumber] CHECK CONSTRAINT [fk_ProgramElementNumber_DefenseServiceIdentifier]
GO
