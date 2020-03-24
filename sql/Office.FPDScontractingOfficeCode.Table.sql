USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[FPDScontractingOfficeCode](
	[DepartmentID] [varchar](4) NULL,
	[DepartmentNAME] [nvarchar](255) NULL,
	[AgencyID] [varchar](4) NULL,
	[AgencyNAME] [nvarchar](255) NULL,
	[CONTRACTINGOFFICECODE] [varchar](6) NOT NULL,
	[CONTRACTINGOFFICENAME] [nvarchar](255) NULL,
	[STARTDATE] [date] NULL,
	[ENDDATE] [date] NULL,
	[ADDRESSLINE1] [nvarchar](255) NULL,
	[ADDRESSLINE2] [nvarchar](255) NULL,
	[ADDRESSLINE3] [nvarchar](255) NULL,
	[ADDRESSCITY] [nvarchar](255) NULL,
	[ADDRESSSTATE] [nvarchar](255) NULL,
	[ZIPCODE] [nvarchar](255) NULL,
	[COUNTRYCODE] [nvarchar](255) NULL,
	[progsourceagency] [varchar](2) NULL,
	[progsourceaccount] [varchar](4) NULL,
	[progsourcesubacct] [varchar](3) NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Office].[FPDScontractingOfficeCode] ADD  CONSTRAINT [DF__FPDScontr__CSISc__69FC8776]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [Office].[FPDScontractingOfficeCode]  WITH NOCHECK ADD  CONSTRAINT [FK_office_FPDScontractingOfficeCode_agencyid] FOREIGN KEY([AgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Office].[FPDScontractingOfficeCode] CHECK CONSTRAINT [FK_office_FPDScontractingOfficeCode_agencyid]
GO
ALTER TABLE [Office].[FPDScontractingOfficeCode]  WITH NOCHECK ADD  CONSTRAINT [FK_office_FPDScontractingOfficeCode_departmentid] FOREIGN KEY([DepartmentID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [Office].[FPDScontractingOfficeCode] CHECK CONSTRAINT [FK_office_FPDScontractingOfficeCode_departmentid]
GO
