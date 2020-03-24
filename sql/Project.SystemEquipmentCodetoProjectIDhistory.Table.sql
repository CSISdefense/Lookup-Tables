USE [CSIS360]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Project].[SystemEquipmentCodetoProjectIDhistory](
	[systemequipmentcode] [varchar](4) NOT NULL,
	[systemequipmentcodeText] [nvarchar](255) NULL,
	[Unseperated] [varchar](255) NULL,
	[StartFiscalYear] [smallint] NULL,
	[EndFiscalYear] [smallint] NULL,
	[ProjectID] [int] NULL,
	[CSISmodifiedDate] [datetime2](7) NOT NULL,
	[CSISmodifiedBy] [varchar](150) NOT NULL
)

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] ADD  CONSTRAINT [DF__SystemEqu__CSISm__1FD9753A]  DEFAULT (getdate()) FOR [CSISmodifiedDate]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] ADD  CONSTRAINT [DF__SystemEqu__CSISm__20CD9973]  DEFAULT (suser_sname()) FOR [CSISmodifiedBy]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__Proje__6557CDEA] FOREIGN KEY([ProjectID])
REFERENCES [Project].[ProjectID] ([ProjectID])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__Proje__6557CDEA]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__Proje__71BDA4CF] FOREIGN KEY([ProjectID])
REFERENCES [Project].[ProjectID] ([ProjectID])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__Proje__71BDA4CF]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__Proje__749A117A] FOREIGN KEY([ProjectID])
REFERENCES [Project].[ProjectID] ([ProjectID])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__Proje__749A117A]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__Proje__758E35B3] FOREIGN KEY([ProjectID])
REFERENCES [Project].[ProjectID] ([ProjectID])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__Proje__758E35B3]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__Proje__795EC697] FOREIGN KEY([ProjectID])
REFERENCES [Project].[ProjectID] ([ProjectID])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__Proje__795EC697]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__Proje__7A52EAD0] FOREIGN KEY([ProjectID])
REFERENCES [Project].[ProjectID] ([ProjectID])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__Proje__7A52EAD0]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__syste__5DB6AC22] FOREIGN KEY([systemequipmentcode])
REFERENCES [Project].[SystemEquipmentCode] ([systemequipmentcode])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__syste__5DB6AC22]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__syste__72B1C908] FOREIGN KEY([systemequipmentcode])
REFERENCES [Project].[SystemEquipmentCode] ([systemequipmentcode])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__syste__72B1C908]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__syste__768259EC] FOREIGN KEY([systemequipmentcode])
REFERENCES [Project].[SystemEquipmentCode] ([systemequipmentcode])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__syste__768259EC]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__syste__77767E25] FOREIGN KEY([systemequipmentcode])
REFERENCES [Project].[SystemEquipmentCode] ([systemequipmentcode])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__syste__77767E25]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__syste__7B470F09] FOREIGN KEY([systemequipmentcode])
REFERENCES [Project].[SystemEquipmentCode] ([systemequipmentcode])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__syste__7B470F09]
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory]  WITH NOCHECK ADD  CONSTRAINT [FK__SystemEqu__syste__7C3B3342] FOREIGN KEY([systemequipmentcode])
REFERENCES [Project].[SystemEquipmentCode] ([systemequipmentcode])
GO
ALTER TABLE [Project].[SystemEquipmentCodetoProjectIDhistory] CHECK CONSTRAINT [FK__SystemEqu__syste__7C3B3342]
GO
