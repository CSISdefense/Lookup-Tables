SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Office].[OfficeIDofficeNameHistory](
	[AgencyID] [varchar](4) NOT NULL,
	[OfficeID] [varchar](6) NOT NULL,
	[OfficeName] [varchar](255) NOT NULL,
	[MinOfSignedDate] [datetime2](7) NULL,
	[MaxOfSignedDate] [datetime2](7) NULL,
 CONSTRAINT [pk_Office_AgencyIDOfficeCodeOfficeName] PRIMARY KEY CLUSTERED 
(
	[AgencyID] ASC,
	[OfficeID] ASC,
	[OfficeName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Office].[OfficeIDofficeNameHistory]  WITH CHECK ADD  CONSTRAINT [fk_Office_AgencyIDOfficeCodeOfficeName] FOREIGN KEY([AgencyID], [OfficeID])
REFERENCES [Office].[OfficeID] ([AgencyID], [OfficeID])
GO
ALTER TABLE [Office].[OfficeIDofficeNameHistory] CHECK CONSTRAINT [fk_Office_AgencyIDOfficeCodeOfficeName]
GO
