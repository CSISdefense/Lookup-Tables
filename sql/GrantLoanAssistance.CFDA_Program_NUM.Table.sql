SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [GrantLoanAssistance].[CFDA_Program_NUM](
	[cfda_program_num] [varchar](6) NOT NULL,
	[cfda_program_title] [varchar](255) NULL,
	[GrantsPurposeCategory] [varchar](50) NULL,
	[FundingAgencyID] [varchar](4) NULL,
	[ImplementingAgencyID] [varchar](4) NULL,
 CONSTRAINT [PK_CFDA_Program_Num] PRIMARY KEY CLUSTERED 
(
	[cfda_program_num] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [GrantLoanAssistance].[CFDA_Program_NUM]  WITH NOCHECK ADD  CONSTRAINT [FK__CFDA_Prog__Fundi__75D84E76] FOREIGN KEY([FundingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [GrantLoanAssistance].[CFDA_Program_NUM] CHECK CONSTRAINT [FK__CFDA_Prog__Fundi__75D84E76]
GO
ALTER TABLE [GrantLoanAssistance].[CFDA_Program_NUM]  WITH NOCHECK ADD  CONSTRAINT [FK__CFDA_Prog__Imple__76CC72AF] FOREIGN KEY([ImplementingAgencyID])
REFERENCES [FPDSTypeTable].[AgencyID] ([AgencyID])
GO
ALTER TABLE [GrantLoanAssistance].[CFDA_Program_NUM] CHECK CONSTRAINT [FK__CFDA_Prog__Imple__76CC72AF]
GO
