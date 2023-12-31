USE [master]
GO
/****** Object:  Database [tgbot]    Script Date: 17.09.2023 19:24:06 ******/
CREATE DATABASE [tgbot]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tgbot', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\tgbot.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tgbot_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\tgbot_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [tgbot] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tgbot].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tgbot] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tgbot] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tgbot] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tgbot] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tgbot] SET ARITHABORT OFF 
GO
ALTER DATABASE [tgbot] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tgbot] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tgbot] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tgbot] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tgbot] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tgbot] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tgbot] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tgbot] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tgbot] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tgbot] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tgbot] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tgbot] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tgbot] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tgbot] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tgbot] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tgbot] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tgbot] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tgbot] SET RECOVERY FULL 
GO
ALTER DATABASE [tgbot] SET  MULTI_USER 
GO
ALTER DATABASE [tgbot] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tgbot] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tgbot] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tgbot] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tgbot] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tgbot] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'tgbot', N'ON'
GO
ALTER DATABASE [tgbot] SET QUERY_STORE = ON
GO
ALTER DATABASE [tgbot] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [tgbot]
GO
/****** Object:  Table [dbo].[Answers]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AnswerText] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnswerValidations]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerValidations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[CorrectAnswerId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_AnswerValidation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BotCommands]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BotCommands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommandName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[GroupId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BotCommands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BotErrorMessages]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BotErrorMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ErrorMessageText] [nvarchar](max) NOT NULL,
	[BotCommandId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_BotErrorMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BotInfoMessages]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BotInfoMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MessageText] [nvarchar](max) NOT NULL,
	[SurveyId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_BotInfoMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BotMessages]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BotMessages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MessageText] [nvarchar](max) NOT NULL,
	[BotCommandId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_BotMessages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[QuestionOrder] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions_Answers]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions_Answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AnswerValidationId] [int] NOT NULL,
	[AnswerId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[UserAnswerId] [int] NOT NULL,
 CONSTRAINT [PK_Questions_Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surveys]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surveys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Surveys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TelegramUsers]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelegramUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[GroupId] [int] NOT NULL,
	[TelegramBotUserId] [int] NOT NULL,
	[ChatId] [int] NOT NULL,
 CONSTRAINT [PK_TelegramUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TelegramUsers_Roles]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelegramUsers_Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[TelegramUserId] [int] NOT NULL,
 CONSTRAINT [PK_TelegramUsers_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAnswers]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAnswers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TelegramUserId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[AnswerId] [int] NOT NULL,
 CONSTRAINT [PK_UserAnswers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSessionStates]    Script Date: 17.09.2023 19:24:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSessionStates](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NOT NULL,
	[QuestionId] [int] NOT NULL,
	[CurrentQuestionId] [int] NOT NULL,
	[TotalAnswered] [int] NOT NULL,
	[TotalCorrectAnswers] [int] NOT NULL,
	[TelegramUserId] [int] NOT NULL,
 CONSTRAINT [PK_UserSessionState] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BotCommands] ON 

INSERT [dbo].[BotCommands] ([Id], [CommandName], [IsActive], [GroupId], [RoleId], [Description]) VALUES (2, N'/createform', 1, 1, 1, N'начать создавать анкету')
INSERT [dbo].[BotCommands] ([Id], [CommandName], [IsActive], [GroupId], [RoleId], [Description]) VALUES (3, N'/test', 1, 1, 1, N'тест')
INSERT [dbo].[BotCommands] ([Id], [CommandName], [IsActive], [GroupId], [RoleId], [Description]) VALUES (5, N'/finishform', 1, 1, 1, N'закончить создание анкеты')
INSERT [dbo].[BotCommands] ([Id], [CommandName], [IsActive], [GroupId], [RoleId], [Description]) VALUES (6, N'/createquestion', 1, 1, 1, N'начать создавать вопрос анкеты')
INSERT [dbo].[BotCommands] ([Id], [CommandName], [IsActive], [GroupId], [RoleId], [Description]) VALUES (9, N'/finishquestion', 1, 1, 1, N'закончить создание вопроса анкеты')
INSERT [dbo].[BotCommands] ([Id], [CommandName], [IsActive], [GroupId], [RoleId], [Description]) VALUES (10, N'/createoption', 1, 1, 1, N'добавить вариант ответа')
INSERT [dbo].[BotCommands] ([Id], [CommandName], [IsActive], [GroupId], [RoleId], [Description]) VALUES (11, N'/setcorrectoption', 1, 1, 1, N'добавить номер правильного ответа /setcorrectoption 1')
INSERT [dbo].[BotCommands] ([Id], [CommandName], [IsActive], [GroupId], [RoleId], [Description]) VALUES (12, N'/start', 1, 1, 1, N'запустить бота')
SET IDENTITY_INSERT [dbo].[BotCommands] OFF
GO
SET IDENTITY_INSERT [dbo].[BotMessages] ON 

INSERT [dbo].[BotMessages] ([Id], [MessageText], [BotCommandId], [IsActive]) VALUES (1, N'Бот запущен!', 12, 1)
SET IDENTITY_INSERT [dbo].[BotMessages] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([Id], [GroupName], [IsActive]) VALUES (1, N'Users', 1)
INSERT [dbo].[Groups] ([Id], [GroupName], [IsActive]) VALUES (2, N'Admins', 1)
INSERT [dbo].[Groups] ([Id], [GroupName], [IsActive]) VALUES (3, N'Editors', 1)
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([Id], [SurveyId], [QuestionText], [QuestionOrder], [IsActive]) VALUES (3, 1, N'barakuda', 10, 1)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [GroupId]) VALUES (1, N'DefaultUser', 1, 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Surveys] ON 

INSERT [dbo].[Surveys] ([Id], [Title], [Description], [IsActive]) VALUES (1, N'Somali', N'Fasdsadas', 0)
INSERT [dbo].[Surveys] ([Id], [Title], [Description], [IsActive]) VALUES (2, N'Somamas', N'Good test)', 1)
INSERT [dbo].[Surveys] ([Id], [Title], [Description], [IsActive]) VALUES (3, N'Somamas', N'Good test2)', 1)
SET IDENTITY_INSERT [dbo].[Surveys] OFF
GO
SET IDENTITY_INSERT [dbo].[TelegramUsers] ON 

INSERT [dbo].[TelegramUsers] ([Id], [Username], [FirstName], [LastName], [IsActive], [GroupId], [TelegramBotUserId], [ChatId]) VALUES (3, N'pyrrhula21', N'🦉', NULL, 1, 1, 797845333, 797845333)
SET IDENTITY_INSERT [dbo].[TelegramUsers] OFF
GO
ALTER TABLE [dbo].[BotCommands]  WITH CHECK ADD  CONSTRAINT [FK_BotCommands_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BotCommands] CHECK CONSTRAINT [FK_BotCommands_Groups]
GO
ALTER TABLE [dbo].[BotCommands]  WITH CHECK ADD  CONSTRAINT [FK_BotCommands_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[BotCommands] CHECK CONSTRAINT [FK_BotCommands_Roles]
GO
ALTER TABLE [dbo].[BotErrorMessages]  WITH CHECK ADD  CONSTRAINT [FK_BotErrorMessages_BotCommands] FOREIGN KEY([BotCommandId])
REFERENCES [dbo].[BotCommands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BotErrorMessages] CHECK CONSTRAINT [FK_BotErrorMessages_BotCommands]
GO
ALTER TABLE [dbo].[BotInfoMessages]  WITH CHECK ADD  CONSTRAINT [FK_BotInfoMessages_Surveys] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Surveys] ([Id])
GO
ALTER TABLE [dbo].[BotInfoMessages] CHECK CONSTRAINT [FK_BotInfoMessages_Surveys]
GO
ALTER TABLE [dbo].[BotMessages]  WITH CHECK ADD  CONSTRAINT [FK_BotMessages_BotCommands] FOREIGN KEY([BotCommandId])
REFERENCES [dbo].[BotCommands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BotMessages] CHECK CONSTRAINT [FK_BotMessages_BotCommands]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Surveys] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Surveys] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Surveys]
GO
ALTER TABLE [dbo].[Questions_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Answers_Answers] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[Answers] ([Id])
GO
ALTER TABLE [dbo].[Questions_Answers] CHECK CONSTRAINT [FK_Questions_Answers_Answers]
GO
ALTER TABLE [dbo].[Questions_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Answers_AnswerValidation] FOREIGN KEY([AnswerValidationId])
REFERENCES [dbo].[AnswerValidations] ([Id])
GO
ALTER TABLE [dbo].[Questions_Answers] CHECK CONSTRAINT [FK_Questions_Answers_AnswerValidation]
GO
ALTER TABLE [dbo].[Questions_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Answers_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[Questions_Answers] CHECK CONSTRAINT [FK_Questions_Answers_Questions]
GO
ALTER TABLE [dbo].[Questions_Answers]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Answers_UserAnswers] FOREIGN KEY([UserAnswerId])
REFERENCES [dbo].[UserAnswers] ([Id])
GO
ALTER TABLE [dbo].[Questions_Answers] CHECK CONSTRAINT [FK_Questions_Answers_UserAnswers]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Groups]
GO
ALTER TABLE [dbo].[TelegramUsers]  WITH CHECK ADD  CONSTRAINT [FK_TelegramUsers_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TelegramUsers] CHECK CONSTRAINT [FK_TelegramUsers_Groups]
GO
ALTER TABLE [dbo].[TelegramUsers_Roles]  WITH CHECK ADD  CONSTRAINT [FK_TelegramUsers_Roles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[TelegramUsers_Roles] CHECK CONSTRAINT [FK_TelegramUsers_Roles_Roles]
GO
ALTER TABLE [dbo].[TelegramUsers_Roles]  WITH CHECK ADD  CONSTRAINT [FK_TelegramUsers_Roles_TelegramUsers] FOREIGN KEY([TelegramUserId])
REFERENCES [dbo].[TelegramUsers] ([Id])
GO
ALTER TABLE [dbo].[TelegramUsers_Roles] CHECK CONSTRAINT [FK_TelegramUsers_Roles_TelegramUsers]
GO
ALTER TABLE [dbo].[UserAnswers]  WITH CHECK ADD  CONSTRAINT [FK_UserAnswers_TelegramUsers] FOREIGN KEY([TelegramUserId])
REFERENCES [dbo].[TelegramUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserAnswers] CHECK CONSTRAINT [FK_UserAnswers_TelegramUsers]
GO
ALTER TABLE [dbo].[UserSessionStates]  WITH CHECK ADD  CONSTRAINT [FK_UserSessionState_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[UserSessionStates] CHECK CONSTRAINT [FK_UserSessionState_Questions]
GO
ALTER TABLE [dbo].[UserSessionStates]  WITH CHECK ADD  CONSTRAINT [FK_UserSessionState_Surveys] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Surveys] ([Id])
GO
ALTER TABLE [dbo].[UserSessionStates] CHECK CONSTRAINT [FK_UserSessionState_Surveys]
GO
ALTER TABLE [dbo].[UserSessionStates]  WITH CHECK ADD  CONSTRAINT [FK_UserSessionState_TelegramUsers] FOREIGN KEY([TelegramUserId])
REFERENCES [dbo].[TelegramUsers] ([Id])
GO
ALTER TABLE [dbo].[UserSessionStates] CHECK CONSTRAINT [FK_UserSessionState_TelegramUsers]
GO
USE [master]
GO
ALTER DATABASE [tgbot] SET  READ_WRITE 
GO
