SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contract].[PBLlistOSDdetails](
	[ContractNumber] [nvarchar](255) NULL,
	[PSEcode] [nvarchar](255) NULL,
	[PSEtext] [nvarchar](255) NULL,
	[NumberOfActions] [float] NULL,
	[ObligatedAmount] [money] NULL,
	[Done] [float] NULL,
	[IsTotal] [bit] NOT NULL,
	[CSIScontractID] [int] NULL,
	[CSISidvpiidID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Contract].[PBLlistOSDdetails] ADD  CONSTRAINT [DF__PBLlistOS__IsTot__54624C12]  DEFAULT ((0)) FOR [IsTotal]
GO
ALTER TABLE [Contract].[PBLlistOSDdetails]  WITH NOCHECK ADD  CONSTRAINT [FK__PBLlistOS__CSISc__5556704B] FOREIGN KEY([CSIScontractID])
REFERENCES [Contract].[CSIScontractID] ([CSIScontractID])
GO
ALTER TABLE [Contract].[PBLlistOSDdetails] CHECK CONSTRAINT [FK__PBLlistOS__CSISc__5556704B]
GO
ALTER TABLE [Contract].[PBLlistOSDdetails]  WITH NOCHECK ADD  CONSTRAINT [FK__PBLlistOS__CSISi__564A9484] FOREIGN KEY([CSISidvpiidID])
REFERENCES [Contract].[CSISidvpiidID] ([CSISidvpiidID])
GO
ALTER TABLE [Contract].[PBLlistOSDdetails] CHECK CONSTRAINT [FK__PBLlistOS__CSISi__564A9484]
GO
