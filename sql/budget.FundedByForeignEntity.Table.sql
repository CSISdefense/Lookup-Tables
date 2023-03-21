SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [budget].[FundedByForeignEntity](
	[fundedbyforeignentity] [varchar](21) NOT NULL,
	[foreign_funding_description] [varchar](50) NULL,
	[IsFMS] [bit] NULL,
 CONSTRAINT [pk_FundedByForeignEntity] PRIMARY KEY CLUSTERED 
(
	[fundedbyforeignentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
