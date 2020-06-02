SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[DACPurposeCode](
	[dac_sector_code] [float] NULL,
	[dac_sector_name] [nvarchar](255) NULL,
	[dac_purpose_name] [nvarchar](255) NULL,
	[dac_purpose_code] [float] NULL
) ON [PRIMARY]
GO
