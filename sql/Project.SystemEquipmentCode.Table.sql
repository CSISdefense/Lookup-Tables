SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[SystemEquipmentCode](
	[Unseperated] [varchar](255) NULL,
	[systemequipmentcode] [varchar](4) NOT NULL,
	[systemequipmentcodeText] [nvarchar](255) NULL,
	[IsIdentifiedSystemEquipment] [bit] NOT NULL,
 CONSTRAINT [PK_systemequipmentcode NO PK] PRIMARY KEY CLUSTERED 
(
	[systemequipmentcode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Project].[SystemEquipmentCode] ADD  CONSTRAINT [DF__systemequ__IsIde__4E1F62D7]  DEFAULT ((1)) FOR [IsIdentifiedSystemEquipment]
GO
