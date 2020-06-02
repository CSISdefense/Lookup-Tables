SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[RDTEidToProjectIDmanyToMany](
	[RDTEid] [int] NOT NULL,
	[ProgramElementNumber] [int] NULL,
	[ProjectID] [int] NOT NULL,
	[CSISmodifiedDate] [datetime] NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [pk_RDTEidProjectID] PRIMARY KEY CLUSTERED 
(
	[RDTEid] ASC,
	[ProjectID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[RDTEidToProjectIDmanyToMany] ADD  CONSTRAINT [df_CSISmodifiedDate]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Project].[RDTEidToProjectIDmanyToMany] ADD  CONSTRAINT [df_CSISmodifiedBy]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Project].[RDTEidToProjectIDmanyToMany]  WITH NOCHECK ADD  CONSTRAINT [FK__ProgramEl__Progr__1BB3DE9B] FOREIGN KEY([ProgramElementNumber])
REFERENCES [Project].[ProgramElementNumber] ([ProgramElementNumber])
GO
ALTER TABLE [Project].[RDTEidToProjectIDmanyToMany] CHECK CONSTRAINT [FK__ProgramEl__Progr__1BB3DE9B]
GO
ALTER TABLE [Project].[RDTEidToProjectIDmanyToMany]  WITH NOCHECK ADD  CONSTRAINT [FK__ProgramEl__Proje__1CA802D4] FOREIGN KEY([ProjectID])
REFERENCES [Project].[ProjectID] ([ProjectID])
GO
ALTER TABLE [Project].[RDTEidToProjectIDmanyToMany] CHECK CONSTRAINT [FK__ProgramEl__Proje__1CA802D4]
GO
ALTER TABLE [Project].[RDTEidToProjectIDmanyToMany]  WITH NOCHECK ADD  CONSTRAINT [FK__ProgramEl__RDTEi__7B9C14C4] FOREIGN KEY([RDTEid])
REFERENCES [Project].[RDTEid] ([RDTEid])
GO
ALTER TABLE [Project].[RDTEidToProjectIDmanyToMany] CHECK CONSTRAINT [FK__ProgramEl__RDTEi__7B9C14C4]
GO
