USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Vendor].[GirthDunsnumber](
	[Dunsnumber] [varchar](13) NOT NULL,
	[SignedFY] [int] NOT NULL,
 CONSTRAINT [pk_Vendor_GirthDunsnumber_DunsnumberSignedFY] PRIMARY KEY CLUSTERED 
(
	[Dunsnumber] ASC,
	[SignedFY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Vendor].[GirthDunsnumber]  WITH CHECK ADD  CONSTRAINT [fk_Vendor_GirthDunsnumber_Dunsnumber] FOREIGN KEY([Dunsnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Vendor].[GirthDunsnumber] CHECK CONSTRAINT [fk_Vendor_GirthDunsnumber_Dunsnumber]
GO
