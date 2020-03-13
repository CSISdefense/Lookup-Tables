USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Location].[CCC_DUNS_to_StdTopContractor](
	[DUNSNumber] [varchar](13) NOT NULL,
	[Is_CCC_Vendor] [bit] NULL,
	[CCCCustomerID] [varchar](8) NULL,
	[StandardizedTopContractor] [varchar](150) NULL,
	[streetaddress] [varchar](255) NULL,
	[zipcode] [varchar](28) NULL,
	[City] [varchar](35) NULL,
	[vendorcountrycode] [varchar](50) NULL,
	[vendor_state_code] [varchar](20) NULL
) ON [PRIMARY]
GO
ALTER TABLE [Location].[CCC_DUNS_to_StdTopContractor]  WITH NOCHECK ADD  CONSTRAINT [fk_Location_CCC_DUNS_to_StdTopContractor] FOREIGN KEY([DUNSNumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Location].[CCC_DUNS_to_StdTopContractor] CHECK CONSTRAINT [fk_Location_CCC_DUNS_to_StdTopContractor]
GO
