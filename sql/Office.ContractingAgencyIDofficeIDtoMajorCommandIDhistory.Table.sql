SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory](
	[OfficeID] [varchar](6) NOT NULL,
	[OfficeName] [varchar](50) NULL,
	[AgencyID] [varchar](4) NOT NULL,
	[Fiscal_Year] [smallint] NOT NULL,
	[MajorCommandCode] [varchar](24) NULL,
	[MajorCommandName] [varchar](100) NULL,
	[isJCCIA] [bit] NULL,
	[MajorCommandID] [varchar](8) NULL,
	[CSISofficeName] [varchar](50) NULL,
	[CSISmodifiedDate] [datetime] NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [pk_agencyID_OfficeID_fiscal_year] PRIMARY KEY CLUSTERED 
(
	[AgencyID] ASC,
	[OfficeID] ASC,
	[Fiscal_Year] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory] ADD  CONSTRAINT [DF__Contracti__CSISm__153BEB36]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory] ADD  CONSTRAINT [DF__Contracti__CSISm__16300F6F]  DEFAULT (getdate()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__ContractiingAgencyIDofficetoMajorCommandID__Contr__76625E5B] FOREIGN KEY([AgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory] CHECK CONSTRAINT [FK__ContractiingAgencyIDofficetoMajorCommandID__Contr__76625E5B]
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__ContractiingAgencyIDofficetoMajorCommandID_OfficeID] FOREIGN KEY([AgencyID], [OfficeID])
REFERENCES [Office].[OfficeID] ([AgencyID], [OfficeID])
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory] CHECK CONSTRAINT [FK__ContractiingAgencyIDofficetoMajorCommandID_OfficeID]
GO
