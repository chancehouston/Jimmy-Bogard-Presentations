/****** Object:  Database [CodeCampServerLite]    Script Date: 8/28/2012 1:53:54 PM ******/
/****** Object:  Table [dbo].[Attendee]    Script Date: 8/28/2012 1:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendee](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Conference_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Conference]    Script Date: 8/28/2012 1:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conference](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[SessionCount] [int] NULL,
	[AttendeeCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session]    Script Date: 8/28/2012 1:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Abstract] [nvarchar](max) NULL,
	[Speaker_id] [uniqueidentifier] NULL,
	[Conference_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Speaker]    Script Date: 8/28/2012 1:53:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speaker](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Bio] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--/****** Object:  Table [dbo].[usd_AppliedDatabaseScript]    Script Date: 8/28/2012 1:53:55 PM ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--CREATE TABLE [dbo].[usd_AppliedDatabaseScript](
--	[ScriptFile] [nvarchar](255) NOT NULL,
--	[DateApplied] [datetime] NOT NULL,
--	[Version] [int] NULL,
-- CONSTRAINT [PK_usd_AppliedDatabaseScript] PRIMARY KEY NONCLUSTERED 
--(
--	[ScriptFile] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--) ON [PRIMARY]

GO
/****** Object:  Index [IX_usd_DateApplied]    Script Date: 8/28/2012 1:53:55 PM ******/
--CREATE CLUSTERED INDEX [IX_usd_DateApplied] ON [dbo].[usd_AppliedDatabaseScript]
--(
--	[DateApplied] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--GO
ALTER TABLE [dbo].[Attendee]  WITH CHECK ADD  CONSTRAINT [FKCE6004EE5420122A] FOREIGN KEY([Conference_id])
REFERENCES [dbo].[Conference] ([Id])
GO
ALTER TABLE [dbo].[Attendee] CHECK CONSTRAINT [FKCE6004EE5420122A]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FKBF1D3E375420122A] FOREIGN KEY([Conference_id])
REFERENCES [dbo].[Conference] ([Id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FKBF1D3E375420122A]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FKBF1D3E375BD442EA] FOREIGN KEY([Speaker_id])
REFERENCES [dbo].[Speaker] ([Id])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FKBF1D3E375BD442EA]
GO
