USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FPDSTypeTable].[extentcompetedDD350](
	[extentcompetedDD350] [varchar](3) NOT NULL,
	[extentcompetedTextDD350] [nvarchar](255) NULL,
	[extentcompeted] [varchar](3) NULL,
 CONSTRAINT [PK_extentcompetedDD350_extentcompetedDD350] PRIMARY KEY CLUSTERED 
(
	[extentcompetedDD350] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [FPDSTypeTable].[extentcompetedDD350]  WITH NOCHECK ADD  CONSTRAINT [FK_extentcompetedDD350_extentcompeted] FOREIGN KEY([extentcompeted])
REFERENCES [FPDSTypeTable].[extentcompeted] ([extentcompeted])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [FPDSTypeTable].[extentcompetedDD350] CHECK CONSTRAINT [FK_extentcompetedDD350_extentcompeted]
GO
