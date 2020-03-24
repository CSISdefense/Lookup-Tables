USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FPDSTypeTable].[TypeofBusinessDD350](
	[TypeOfBusiness] [varchar](1) NOT NULL,
	[TypeofBusinessText] [nvarchar](255) NULL,
	[Contractingofficerbusinesssizedetermination] [varchar](1) NULL,
 CONSTRAINT [PK_TypeofBusinessDD350_TypeofBusiness] PRIMARY KEY CLUSTERED 
(
	[TypeOfBusiness] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [FPDSTypeTable].[TypeofBusinessDD350]  WITH NOCHECK ADD  CONSTRAINT [FK_TypeofBusinessDD350_Contractingofficerbusinesssizedetermination] FOREIGN KEY([Contractingofficerbusinesssizedetermination])
REFERENCES [FPDSTypeTable].[contractingofficerbusinesssizedetermination] ([contractingofficerbusinesssizedetermination])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [FPDSTypeTable].[TypeofBusinessDD350] CHECK CONSTRAINT [FK_TypeofBusinessDD350_Contractingofficerbusinesssizedetermination]
GO
