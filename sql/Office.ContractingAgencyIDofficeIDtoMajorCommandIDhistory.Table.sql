SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory](
	[ContractingOfficeID] [varchar](6) NOT NULL,
	[ContractingOfficeName] [varchar](50) NULL,
	[ContractingAgencyID] [varchar](4) NOT NULL,
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
	[ContractingAgencyID] ASC,
	[ContractingOfficeID] ASC,
	[Fiscal_Year] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory] ADD  CONSTRAINT [DF__Contracti__CSISm__153BEB36]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory] ADD  CONSTRAINT [DF__Contracti__CSISm__16300F6F]  DEFAULT (getdate()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__ContractiingAgencyIDofficetoMajorCommandID__Contr__76625E5B] FOREIGN KEY([ContractingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory] CHECK CONSTRAINT [FK__ContractiingAgencyIDofficetoMajorCommandID__Contr__76625E5B]
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__ContractiingAgencyIDofficetoMajorCommandID_ContractingOfficeCode] FOREIGN KEY([ContractingOfficeID])
REFERENCES [Office].[ContractingOfficeCode] ([ContractingOfficeCode])
GO
ALTER TABLE [Office].[ContractingAgencyIDofficeIDtoMajorCommandIDhistory] CHECK CONSTRAINT [FK__ContractiingAgencyIDofficetoMajorCommandID_ContractingOfficeCode]
GO
