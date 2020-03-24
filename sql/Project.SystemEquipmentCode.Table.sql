USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Project].[SystemEquipmentCode](
	[Unseperated] [varchar](255) NULL,
	[systemequipmentcode] [varchar](4) NOT NULL,
	[systemequipmentcodeText] [nvarchar](255) NULL,
	[IsIdentifiedSystemEquipment] [bit] NOT NULL,
 CONSTRAINT [PK_systemequipmentcode NO PK] PRIMARY KEY CLUSTERED 
(
	[systemequipmentcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Project].[SystemEquipmentCode] ADD  CONSTRAINT [DF__systemequ__IsIde__4E1F62D7]  DEFAULT ((1)) FOR [IsIdentifiedSystemEquipment]
GO
