USE [master]
GO

/****** Object:  Database [GreenSlateDB]    Script Date: 1/12/2019 12:37:18 AM ******/
CREATE DATABASE [GreenSlateDB]

GO




USE [GreenSlateDB]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 1/12/2019 12:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Credits] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProjects]    Script Date: 1/12/2019 12:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AssignedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.UserProjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/12/2019 12:24:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

GO
INSERT [dbo].[Projects] ([Id], [StartDate], [EndDate], [Credits]) VALUES (2, CAST(N'2019-01-15 00:00:00.000' AS DateTime), CAST(N'2019-01-20 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Projects] ([Id], [StartDate], [EndDate], [Credits]) VALUES (3, CAST(N'2019-01-01 00:00:00.000' AS DateTime), CAST(N'2019-02-02 00:00:00.000' AS DateTime), 3)
GO
INSERT [dbo].[Projects] ([Id], [StartDate], [EndDate], [Credits]) VALUES (5, CAST(N'2019-02-03 00:00:00.000' AS DateTime), CAST(N'2019-02-06 00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[Projects] ([Id], [StartDate], [EndDate], [Credits]) VALUES (6, CAST(N'2019-01-30 00:00:00.000' AS DateTime), CAST(N'2019-04-30 00:00:00.000' AS DateTime), 5)
GO
INSERT [dbo].[Projects] ([Id], [StartDate], [EndDate], [Credits]) VALUES (8, CAST(N'2019-01-20 00:00:00.000' AS DateTime), CAST(N'2019-02-20 00:00:00.000' AS DateTime), 5)
GO
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProjects] ON 

GO
INSERT [dbo].[UserProjects] ([Id], [ProjectId], [UserId], [IsActive], [AssignedDate]) VALUES (1, 2, 1, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserProjects] ([Id], [ProjectId], [UserId], [IsActive], [AssignedDate]) VALUES (2, 3, 2, 1, CAST(N'2019-12-12 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserProjects] ([Id], [ProjectId], [UserId], [IsActive], [AssignedDate]) VALUES (3, 5, 3, 1, CAST(N'2019-02-04 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserProjects] ([Id], [ProjectId], [UserId], [IsActive], [AssignedDate]) VALUES (4, 6, 1, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[UserProjects] ([Id], [ProjectId], [UserId], [IsActive], [AssignedDate]) VALUES (5, 8, 3, 1, CAST(N'2019-01-01 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserProjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName]) VALUES (1, N'name1', N'lastname1')
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName]) VALUES (2, N'name2', N'lastname2')
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName]) VALUES (3, N'name3', N'lastname3')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[UserProjects]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserProjects_dbo.Projects_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProjects] CHECK CONSTRAINT [FK_dbo.UserProjects_dbo.Projects_ProjectId]
GO
ALTER TABLE [dbo].[UserProjects]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserProjects_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProjects] CHECK CONSTRAINT [FK_dbo.UserProjects_dbo.Users_UserId]
GO
