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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [budget].[MajorForceProgram] ADD  DEFAULT ((0)) FOR [IsCombatForcesProgram]
GO
