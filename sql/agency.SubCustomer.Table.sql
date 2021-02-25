SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[SubCustomer](
	[SubCustomer] [nvarchar](50) NOT NULL,
	[Customer] [nvarchar](50) NOT NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Customer_Subcustomer] PRIMARY KEY CLUSTERED 
(
	[Customer] ASC,
	[SubCustomer] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [agency].[SubCustomer] ADD  CONSTRAINT [DF__SubCustom__CSISc__2F7AE026]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [agency].[SubCustomer] ADD  CONSTRAINT [DF__SubCustom__CSISm__306F045F]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [agency].[SubCustomer] ADD  CONSTRAINT [DF__SubCustom__CSISm__31632898]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [agency].[SubCustomer]  WITH NOCHECK ADD  CONSTRAINT [FK_agency_subcustomer_Customer] FOREIGN KEY([Customer])
REFERENCES [agency].[Customer] ([Customer])
GO
ALTER TABLE [agency].[SubCustomer] CHECK CONSTRAINT [FK_agency_subcustomer_Customer]
GO
