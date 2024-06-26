SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contractor].[Dunsnumber](
	[CEC] [float] NULL,
	[DUNSnumber] [varchar](13) NOT NULL,
	[CECtext9digit] [nvarchar](13) NULL,
	[CECnoleadingzero] [nvarchar](13) NULL,
	[ignorebeforeyear] [int] NULL,
	[CSISmodifiedDate] [datetime] NOT NULL,
	[CSIScreateddate] [datetime] NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[ignorebeforeyearURL] [nvarchar](255) NULL,
	[totalamount] [decimal](19, 4) NULL,
	[topISO3countrycode] [varchar](3) NULL,
	[topISO3countrytotalamount] [decimal](19, 4) NULL,
	[overrideISO3countrycode] [bit] NULL,
	[ParentDUNSnumber] [varchar](13) NULL,
	[HeadquarterCode] [varchar](13) NULL,
	[CAGE] [varchar](5) NULL,
	[ParentDUNSnumberFirstFiscalYear] [smallint] NULL,
	[HeadquarterCodeFirstFiscalYear] [smallint] NULL,
	[EntityID] [int] NULL,
	[recipient_uei] [varchar](12) NULL,
	[recipient_parent_uei] [varchar](12) NULL,
 CONSTRAINT [PK_Dunsnumber] PRIMARY KEY CLUSTERED 
(
	[DUNSnumber] ASC
)WITH (STATISTICS_NORECOMPUTE = ON, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Contractor_Dunsnumber_IgnoreBeforeYear_ParentDUNSnumber] ON [Contractor].[Dunsnumber]
(
	[ignorebeforeyear] ASC
)
INCLUDE([ParentDUNSnumber]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [ix_contractor_dunsnumber_ignorebeforeyear_parentdunsnumber] ON [Contractor].[Dunsnumber]
(
	[ignorebeforeyear] ASC,
	[ParentDUNSnumber] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Contractor].[Dunsnumber] ADD  CONSTRAINT [dunsnumber_CSISmodifiedDate_getdate]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Contractor].[Dunsnumber] ADD  CONSTRAINT [dunsnumber_CSIScreateddate_getdate]  DEFAULT (getdate()) FOR [CSIScreateddate]
GO
ALTER TABLE [Contractor].[Dunsnumber] ADD  CONSTRAINT [dunsnumbersystem_user]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Contractor].[Dunsnumber]  WITH NOCHECK ADD  CONSTRAINT [FK__Dunsnumbe__Entit__49EFAA97] FOREIGN KEY([EntityID])
REFERENCES [Vendor].[EntityID] ([EntityID])
GO
ALTER TABLE [Contractor].[Dunsnumber] CHECK CONSTRAINT [FK__Dunsnumbe__Entit__49EFAA97]
GO
ALTER TABLE [Contractor].[Dunsnumber]  WITH NOCHECK ADD  CONSTRAINT [FK__Dunsnumbe__Headq__79FDE515] FOREIGN KEY([HeadquarterCode])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contractor].[Dunsnumber] CHECK CONSTRAINT [FK__Dunsnumbe__Headq__79FDE515]
GO
ALTER TABLE [Contractor].[Dunsnumber]  WITH NOCHECK ADD  CONSTRAINT [FK__Dunsnumbe__Paren__7909C0DC] FOREIGN KEY([ParentDUNSnumber])
REFERENCES [Contractor].[Dunsnumber] ([DUNSnumber])
GO
ALTER TABLE [Contractor].[Dunsnumber] CHECK CONSTRAINT [FK__Dunsnumbe__Paren__7909C0DC]
GO
ALTER TABLE [Contractor].[Dunsnumber]  WITH CHECK ADD FOREIGN KEY([recipient_uei])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Contractor].[Dunsnumber]  WITH CHECK ADD FOREIGN KEY([recipient_parent_uei])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Contractor].[Dunsnumber]  WITH CHECK ADD FOREIGN KEY([recipient_uei])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Contractor].[Dunsnumber]  WITH CHECK ADD FOREIGN KEY([recipient_parent_uei])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Contractor].[Dunsnumber]  WITH CHECK ADD FOREIGN KEY([recipient_uei])
REFERENCES [Vendor].[UEI] ([UEI])
GO
ALTER TABLE [Contractor].[Dunsnumber]  WITH CHECK ADD FOREIGN KEY([recipient_parent_uei])
REFERENCES [Vendor].[UEI] ([UEI])
GO
