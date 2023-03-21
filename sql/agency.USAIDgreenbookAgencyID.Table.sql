SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [agency].[USAIDgreenbookAgencyID](
	[USAIDgreenbookAgencyID] [smallint] NOT NULL,
	[USAIDgreenbookAgencyName] [varchar](50) NOT NULL,
	[CSIScreatedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [nvarchar](128) NOT NULL,
	[AgencyID] [varchar](4) NULL,
 CONSTRAINT [PK_USAIDgreenbookagencyid] PRIMARY KEY CLUSTERED 
(
	[USAIDgreenbookAgencyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [agency].[USAIDgreenbookAgencyID] ADD  CONSTRAINT [DF__USAIDgree__CSISc__39F86E99]  DEFAULT (getdate()) FOR [CSIScreatedDate]
GO
ALTER TABLE [agency].[USAIDgreenbookAgencyID] ADD  CONSTRAINT [DF__USAIDgree__CSISm__3AEC92D2]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [agency].[USAIDgreenbookAgencyID] ADD  CONSTRAINT [DF__USAIDgree__CSISm__3BE0B70B]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [agency].[USAIDgreenbookAgencyID]  WITH NOCHECK ADD  CONSTRAINT [FK__USAIDgree__Agenc__3CD4DB44] FOREIGN KEY([AgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [agency].[USAIDgreenbookAgencyID] CHECK CONSTRAINT [FK__USAIDgree__Agenc__3CD4DB44]
GO
