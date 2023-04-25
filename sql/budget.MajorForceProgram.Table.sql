SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[MajorForceProgram](
	[MajorForceProgram] [tinyint] NOT NULL,
	[MajorForceProgramName] [varchar](40) NULL,
	[IsCombatForcesProgram] [bit] NULL,
 CONSTRAINT [pk_Budget_DoDprogram] PRIMARY KEY CLUSTERED 
(
	[MajorForceProgram] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[MajorForceProgram] ADD  DEFAULT ((0)) FOR [IsCombatForcesProgram]
GO
