SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Vendor].[UEI](
	[UEI] [varchar](12) NOT NULL,
	[Parent_UEI] [varchar](12) NULL,
	[Parent_UEIFirstDate] [date] NULL,
	[Dunsnumber] [varchar](13) NULL,
	[ParentDUNSnumber] [varchar](13) NULL,
	[ParentDUNSnumberFirstDate] [date] NULL,
	[HeadquarterCode] [varchar](13) NULL,
	[HeadquarterCodeFirstDate] [date] NULL,
	[Cage] [varchar](5) NULL,
	[topISO3countrycode] [nvarchar](3) NULL,
	[topISO3countrytotalamount] [decimal](19, 4) NULL,
	[totalamount] [decimal](19, 4) NULL,
	[TopDunsnumber] [varchar](13) NULL,
	[TopDunsnumberAmount] [decimal](19, 4) NULL,
	[TopDunsnumberCount] [int] NULL,
	[TotalCount] [int] NULL,
	[DunsnumberNullAmount] [decimal](19, 4) NULL,
	[DunsnumberNullCount] [int] NULL,
	[IgnoreBeforeYear] [smallint] NULL,
 CONSTRAINT [pk_vendor_recipient_uei] PRIMARY KEY CLUSTERED 
(
	[UEI] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Vendor].[UEI]  WITH CHECK ADD FOREIGN KEY([Dunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[UEI]  WITH CHECK ADD FOREIGN KEY([HeadquarterCode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[UEI]  WITH CHECK ADD FOREIGN KEY([ParentDUNSnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[UEI]  WITH CHECK ADD FOREIGN KEY([TopDunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[UEI]  WITH CHECK ADD FOREIGN KEY([topISO3countrycode])
REFERENCES [Location].[CountryCodes] ([alpha-3])
GO
ALTER TABLE [Vendor].[UEI]  WITH CHECK ADD FOREIGN KEY([Parent_UEI])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Vendor].[UEI]  WITH CHECK ADD FOREIGN KEY([Parent_UEI])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Vendor].[UEI]  WITH CHECK ADD FOREIGN KEY([Parent_UEI])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Vendor].[UEI]  WITH CHECK ADD  CONSTRAINT [fk_vendor_UEI_length] CHECK  ((len([UEI])=(12) OR len([UEI])=(0)))
GO
ALTER TABLE [Vendor].[UEI] CHECK CONSTRAINT [fk_vendor_UEI_length]
GO
