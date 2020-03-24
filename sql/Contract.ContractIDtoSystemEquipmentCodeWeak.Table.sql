USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[ContractIDtoSystemEquipmentCodeWeak](
	[PIID] [nvarchar](255) NULL,
	[IDVPIID] [nvarchar](255) NULL,
	[Comments] [nvarchar](255) NULL,
	[PrimaryProjectID] [int] NULL,
	[ContractLabelID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[ContractIDtoSystemEquipmentCodeWeak]  WITH NOCHECK ADD  CONSTRAINT [FK__ContractI__Contr__69285ECE] FOREIGN KEY([ContractLabelID])
REFERENCES [Contract].[ContractLabelID] ([ContractLabelID])
GO
ALTER TABLE [Contract].[ContractIDtoSystemEquipmentCodeWeak] CHECK CONSTRAINT [FK__ContractI__Contr__69285ECE]
GO
ALTER TABLE [Contract].[ContractIDtoSystemEquipmentCodeWeak]  WITH NOCHECK ADD  CONSTRAINT [FK__ContractI__Prima__68343A95] FOREIGN KEY([PrimaryProjectID])
REFERENCES [Project].[ProjectID] ([ProjectID])
GO
ALTER TABLE [Contract].[ContractIDtoSystemEquipmentCodeWeak] CHECK CONSTRAINT [FK__ContractI__Prima__68343A95]
GO
