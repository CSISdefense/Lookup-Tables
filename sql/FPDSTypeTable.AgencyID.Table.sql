USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[AgencyID](
	[Unseperated] [varchar](255) NULL,
	[AgencyID] [varchar](4) NOT NULL,
	[AgencyIDtext] [nvarchar](255) NULL,
	[DepartmentID] [nvarchar](255) NULL,
	[CSISName] [nvarchar](255) NULL,
	[Customer] [nvarchar](50) NULL,
	[SubCustomer] [nvarchar](50) NULL,
	[InternationalAssistancePrograms] [bit] NULL,
	[IsDiscrepency] [bit] NULL,
	[MinOfStartDate] [date] NULL,
	[MaxOfEndDate] [date] NULL,
	[IsUnknownAgencyID] [bit] NOT NULL,
	[IsExceptionToContradictionTest] [bit] NOT NULL,
	[SubCustomerSum] [varchar](50) NULL,
	[IsDefense] [bit] NULL,
	[PlatformPortfolio] [varchar](30) NULL,
 CONSTRAINT [PK_agencyid] PRIMARY KEY CLUSTERED 
(
	[AgencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FPDSTypeTable].[AgencyID] ADD  CONSTRAINT [DF__AgencyID__IsUnkn__0B087586]  DEFAULT ((0)) FOR [IsUnknownAgencyID]
GO
ALTER TABLE [FPDSTypeTable].[AgencyID] ADD  CONSTRAINT [DF__AgencyID__IsExce__4EBE8155]  DEFAULT ((0)) FOR [IsExceptionToContradictionTest]
GO
ALTER TABLE [FPDSTypeTable].[AgencyID]  WITH NOCHECK ADD  CONSTRAINT [FK_Agencyid_Customer] FOREIGN KEY([Customer])
REFERENCES [agency].[Customer] ([Customer])
GO
ALTER TABLE [FPDSTypeTable].[AgencyID] CHECK CONSTRAINT [FK_Agencyid_Customer]
GO
ALTER TABLE [FPDSTypeTable].[AgencyID]  WITH NOCHECK ADD  CONSTRAINT [fk_agencyID_subcustomercustomer] FOREIGN KEY([Customer], [SubCustomer])
REFERENCES [agency].[SubCustomer] ([Customer], [SubCustomer])
GO
ALTER TABLE [FPDSTypeTable].[AgencyID] CHECK CONSTRAINT [fk_agencyID_subcustomercustomer]
GO
ALTER TABLE [FPDSTypeTable].[AgencyID]  WITH NOCHECK ADD  CONSTRAINT [fk_FPDStypetable_AgencyID_PlatformPortfolio] FOREIGN KEY([PlatformPortfolio])
REFERENCES [ProductOrServiceCode].[PlatformPortfolio] ([PlatformPortfolio])
GO
ALTER TABLE [FPDSTypeTable].[AgencyID] CHECK CONSTRAINT [fk_FPDStypetable_AgencyID_PlatformPortfolio]
GO
ALTER TABLE [FPDSTypeTable].[AgencyID]  WITH NOCHECK ADD  CONSTRAINT [fk_subcustomercustomer] FOREIGN KEY([Customer], [SubCustomer])
REFERENCES [agency].[SubCustomer] ([Customer], [SubCustomer])
GO
ALTER TABLE [FPDSTypeTable].[AgencyID] CHECK CONSTRAINT [fk_subcustomercustomer]
GO
