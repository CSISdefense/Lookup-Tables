SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[MajorCommandID](
	[MajorCommandCode] [varchar](24) NOT NULL,
	[OfficeID] [varchar](6) NULL,
	[AgencyID] [varchar](4) NULL,
	[MajorCommandName] [varchar](100) NULL,
	[StartFiscal_Year] [smallint] NULL,
	[EndFiscal_Year] [smallint] NULL,
	[ContractingOfficeName] [varchar](100) NULL,
	[DepartmentID] [varchar](4) NULL,
	[MajorCommandID] [varchar](8) NOT NULL,
 CONSTRAINT [pk_MajorCommandID] PRIMARY KEY CLUSTERED 
(
	[MajorCommandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Office].[MajorCommandID]  WITH NOCHECK ADD  CONSTRAINT [FK__MajorComm__Agenc__7291CD77] FOREIGN KEY([AgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Office].[MajorCommandID] CHECK CONSTRAINT [FK__MajorComm__Agenc__7291CD77]
GO
ALTER TABLE [Office].[MajorCommandID]  WITH NOCHECK ADD  CONSTRAINT [FK__MajorComm__Depar__7385F1B0] FOREIGN KEY([DepartmentID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Office].[MajorCommandID] CHECK CONSTRAINT [FK__MajorComm__Depar__7385F1B0]
GO
ALTER TABLE [Office].[MajorCommandID]  WITH NOCHECK ADD  CONSTRAINT [FK__MajorComm__OfficeID] FOREIGN KEY([AgencyID], [OfficeID])
REFERENCES [Office].[OfficeID] ([AgencyID], [OfficeID])
GO
ALTER TABLE [Office].[MajorCommandID] CHECK CONSTRAINT [FK__MajorComm__OfficeID]
GO
