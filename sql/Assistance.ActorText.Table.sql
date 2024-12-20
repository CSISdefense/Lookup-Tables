SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Assistance].[ActorText](
	[ActorText] [nvarchar](255) NOT NULL,
	[UCDPactorID] [smallint] NULL,
	[GeographicISOalpha3] [nvarchar](3) NULL,
 CONSTRAINT [pk_ActorText] PRIMARY KEY CLUSTERED 
(
	[ActorText] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Assistance].[ActorText]  WITH CHECK ADD FOREIGN KEY([GeographicISOalpha3])
REFERENCES [Location].[CountryCodes] ([alpha-3])
GO
ALTER TABLE [Assistance].[ActorText]  WITH CHECK ADD FOREIGN KEY([UCDPactorID])
REFERENCES [Assistance].[UCDPactorID] ([UCDPactorID])
GO
