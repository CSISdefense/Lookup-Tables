USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FPDSTypeTable].[modificationcodeDD350](
	[modificationcode] [varchar](1) NOT NULL,
	[modificationcodeText] [nvarchar](255) NULL,
	[reasonformodification] [varchar](1) NULL,
 CONSTRAINT [PK_modificationcodeDD350_modificationcode] PRIMARY KEY CLUSTERED 
(
	[modificationcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [FPDSTypeTable].[modificationcodeDD350]  WITH NOCHECK ADD  CONSTRAINT [FK_modificationcodeDD350_reasonformodification] FOREIGN KEY([reasonformodification])
REFERENCES [FPDSTypeTable].[reasonformodification] ([reasonformodification])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [FPDSTypeTable].[modificationcodeDD350] CHECK CONSTRAINT [FK_modificationcodeDD350_reasonformodification]
GO