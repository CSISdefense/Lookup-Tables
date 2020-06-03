SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[ContractingOfficeCode](
	[DepartmentID] [varchar](4) NULL,
	[AgencyID] [varchar](4) NULL,
	[ContractingOfficeCode] [varchar](6) NOT NULL,
	[ContractingOfficeName] [nvarchar](255) NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[AddressLine1] [nvarchar](255) NULL,
	[AddressLine2] [nvarchar](255) NULL,
	[AddressLine3] [nvarchar](255) NULL,
	[AddressCity] [nvarchar](255) NULL,
	[AddressState] [nvarchar](255) NULL,
	[ZipCode] [nvarchar](255) NULL,
	[CountryCode] [nvarchar](255) NULL,
	[Depot] [bit] NULL,
	[FISC] [bit] NULL,
	[TFBSOrelated] [bit] NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifieddDate] [datetime2](7) NOT NULL,
	[OCOcrisisScore] [smallint] NULL,
	[OCOcrisisPercent] [decimal](19, 4) NULL,
	[CrisisPercent] [decimal](19, 4) NULL,
	[PlaceIntlPercent] [decimal](19, 4) NULL,
 CONSTRAINT [PK_office_ContractingOfficeCode] PRIMARY KEY CLUSTERED 
(
	[ContractingOfficeCode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Office].[ContractingOfficeCode] ADD  CONSTRAINT [DF__Contracti__CSISc__68143F04]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [Office].[ContractingOfficeCode] ADD  CONSTRAINT [DF__Contracti__CSISm__6908633D]  DEFAULT (getdate()) FOR [CSISmodifieddDate]
GO
ALTER TABLE [Office].[ContractingOfficeCode]  WITH NOCHECK ADD  CONSTRAINT [FK_office_ContractingOfficeCode_agencyid] FOREIGN KEY([AgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Office].[ContractingOfficeCode] CHECK CONSTRAINT [FK_office_ContractingOfficeCode_agencyid]
GO
ALTER TABLE [Office].[ContractingOfficeCode]  WITH NOCHECK ADD  CONSTRAINT [FK_office_ContractingOfficeCode_departmentid] FOREIGN KEY([DepartmentID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Office].[ContractingOfficeCode] CHECK CONSTRAINT [FK_office_ContractingOfficeCode_departmentid]
GO
ALTER TABLE [Office].[ContractingOfficeCode]  WITH CHECK ADD  CONSTRAINT [ck_Office_ContractingOfficeCode_newline] CHECK  ((NOT [AddressLine1] like ('%'+char((13)))+'%' AND NOT [AddressLine1] like ('%'+char((10)))+'%'))
GO
ALTER TABLE [Office].[ContractingOfficeCode] CHECK CONSTRAINT [ck_Office_ContractingOfficeCode_newline]
GO
