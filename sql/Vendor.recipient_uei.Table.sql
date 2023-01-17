SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[recipient_uei](
	[recipient_uei] [varchar](12) NOT NULL,
	[Recipient_Parent_UEI] [varchar](12) NULL,
	[Recipient_Parent_UEIFirstDate] [date] NULL,
	[Dunsnumber] [varchar](13) NULL,
	[ParentDUNSnumber] [varchar](13) NULL,
	[ParentDUNSnumberFirstDate] [date] NULL,
	[HeadquarterCode] [varchar](13) NULL,
	[HeadquarterCodeFirstDate] [date] NULL,
	[Cage] [varchar](5) NULL,
	[topISO3countrycode] [nvarchar](3) NULL,
	[topISO3countrytotalamount] [decimal](19, 4) NULL,
	[totalamount] [decimal](19, 4) NULL,
 CONSTRAINT [pk_vendor_recipient_uei] PRIMARY KEY CLUSTERED 
(
	[recipient_uei] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Vendor].[recipient_uei]  WITH CHECK ADD FOREIGN KEY([Dunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[recipient_uei]  WITH CHECK ADD FOREIGN KEY([HeadquarterCode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[recipient_uei]  WITH CHECK ADD FOREIGN KEY([ParentDUNSnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[recipient_uei]  WITH CHECK ADD FOREIGN KEY([Recipient_Parent_UEI])
REFERENCES [Vendor].[recipient_uei] ([recipient_uei])
GO
ALTER TABLE [Vendor].[recipient_uei]  WITH CHECK ADD FOREIGN KEY([topISO3countrycode])
REFERENCES [Location].[CountryCodes] ([alpha-3])
GO
