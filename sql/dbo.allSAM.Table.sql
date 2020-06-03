SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[allSAM](
	["doingBusinessAsName"] [varchar](255) NULL,
	[registrationDate] [varchar](255) NULL,
	["pscCodes"] [varchar](255) NULL,
	["hasDelinquentFederalDebt"] [varchar](255) NULL,
	[duns] [varchar](255) NULL,
	["altElectronicBusinessPoc"] [varchar](255) NULL,
	["cage"] [varchar](255) NULL,
	["hasKnownExclusion"] [varchar](255) NULL,
	["publicDisplay"] [varchar](255) NULL,
	[expirationDate] [varchar](255) NULL,
	["correspondenceFlag"] [varchar](255) NULL,
	["altPastPerformancePoc"] [varchar](255) NULL,
	["status"] [varchar](255) NULL,
	["corporateStructureCode"] [varchar](255) NULL,
	["corporateStructureName"] [varchar](255) NULL,
	["stateOfIncorporation"] [varchar](255) NULL,
	["ncage"] [varchar](255) NULL,
	["legalBusinessName"] [varchar](255) NULL,
	["companyDivision"] [varchar](255) NULL,
	["congressionalDistrict"] [varchar](255) NULL,
	["bondingInformation constructionAggregate"] [varchar](255) NULL,
	["bondingInformation servicePerContract"] [varchar](255) NULL,
	["bondingInformation serviceAggregate"] [varchar](255) NULL,
	["bondingInformation constructionPerContract"] [varchar](255) NULL,
	["businessStartDate"] [varchar](255) NULL,
	["statusMessage"] [varchar](255) NULL,
	["lastUpdateDate"] [varchar](255) NULL,
	["submissionDate"] [varchar](255) NULL,
	["samAddress zipPlus4"] [varchar](255) NULL,
	["samAddress zip"] [varchar](255) NULL,
	["samAddress countryCode"] [varchar](255) NULL,
	["samAddress line1"] [varchar](255) NULL,
	["samAddress stateorProvince"] [varchar](255) NULL,
	["samAddress line2"] [varchar](255) NULL,
	["samAddress city"] [varchar](255) NULL,
	["naics"] [varchar](255) NULL
) ON [PRIMARY]
GO
