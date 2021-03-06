USE [master]
GO
/****** Object:  Database [RecommendationDB]    Script Date: 28-02-2022 23:48:52 ******/
CREATE DATABASE [RecommendationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RecommendationDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RecommendationDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RecommendationDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RecommendationDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RecommendationDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RecommendationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RecommendationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RecommendationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RecommendationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RecommendationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RecommendationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [RecommendationDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RecommendationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RecommendationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RecommendationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RecommendationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RecommendationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RecommendationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RecommendationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RecommendationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RecommendationDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RecommendationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RecommendationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RecommendationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RecommendationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RecommendationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RecommendationDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [RecommendationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RecommendationDB] SET RECOVERY FULL 
GO
ALTER DATABASE [RecommendationDB] SET  MULTI_USER 
GO
ALTER DATABASE [RecommendationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RecommendationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RecommendationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RecommendationDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RecommendationDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RecommendationDB', N'ON'
GO
ALTER DATABASE [RecommendationDB] SET QUERY_STORE = OFF
GO
USE [RecommendationDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 28-02-2022 23:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 28-02-2022 23:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[OptionId] [int] IDENTITY(1,1) NOT NULL,
	[OptionName] [nvarchar](max) NOT NULL,
	[QuestionId] [int] NOT NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 28-02-2022 23:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubOptions]    Script Date: 28-02-2022 23:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubOptions](
	[SubOptionId] [int] IDENTITY(1,1) NOT NULL,
	[SubOptionText] [nvarchar](max) NOT NULL,
	[OptionId] [int] NOT NULL,
 CONSTRAINT [PK_SubOptions] PRIMARY KEY CLUSTERED 
(
	[SubOptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220228051139_Initial_Migrations', N'5.0.0')
GO
SET IDENTITY_INSERT [dbo].[Options] ON 

INSERT [dbo].[Options] ([OptionId], [OptionName], [QuestionId]) VALUES (1, N'Mutual Fund Investments', 1)
INSERT [dbo].[Options] ([OptionId], [OptionName], [QuestionId]) VALUES (2, N'Payments', 1)
INSERT [dbo].[Options] ([OptionId], [OptionName], [QuestionId]) VALUES (3, N'Portfolio', 1)
INSERT [dbo].[Options] ([OptionId], [OptionName], [QuestionId]) VALUES (4, N'Link Bank Account', 1)
INSERT [dbo].[Options] ([OptionId], [OptionName], [QuestionId]) VALUES (5, N'KYC', 1)
INSERT [dbo].[Options] ([OptionId], [OptionName], [QuestionId]) VALUES (6, N'Investment Readiness', 1)
INSERT [dbo].[Options] ([OptionId], [OptionName], [QuestionId]) VALUES (7, N'Investment Options', 1)
INSERT [dbo].[Options] ([OptionId], [OptionName], [QuestionId]) VALUES (8, N'Account Statements', 1)
INSERT [dbo].[Options] ([OptionId], [OptionName], [QuestionId]) VALUES (9, N'User Profile', 1)
INSERT [dbo].[Options] ([OptionId], [OptionName], [QuestionId]) VALUES (10, N'Privacy & Security', 1)
SET IDENTITY_INSERT [dbo].[Options] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionId], [QuestionText]) VALUES (1, N'What can we help you with?')
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[SubOptions] ON 

INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (1, N'Did you Invested in Mutual Funds?', 1)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (2, N'Have you ever bought/Sold the Mutual Funds', 1)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (3, N'Do you want to look at you successfull Transactions?', 1)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (4, N'Do you need report for Failed Transactions?', 1)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (6, N'Have you ever contacted our Service Team?', 1)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (8, N'Do you know the risk of investing in Mutual Funds', 1)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (9, N'Are you looking for online Payment?', 2)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (10, N'Is it related to Failed Transaction?', 2)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (11, N'Do you have any transaction details for the payment?', 2)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (12, N'Do you need any offline help on you payment', 2)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (13, N'Do you want to know about Autopay', 2)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (14, N'Do you need information on Setting up Autopya', 2)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (15, N'Do you want to modify AutoPay', 2)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (16, N'Do you want to know about Mutual Funds Portfolio?', 3)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (17, N'Do you need any information on Instant Redemption Portfolio?', 3)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (18, N'Do you need information on portfolio returns?', 3)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (19, N'Do you want to change your bank account?', 3)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (20, N'Do you have any investment bank account?', 3)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (21, N'Would you like to have Mutual fund KYC', 4)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (22, N'Do you have aadhar card?', 4)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (23, N'Do you have Pan Card?', 4)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (24, N'You have photograph ready for KYC?', 4)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (25, N'Are you fine to share personal details', 4)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (26, N'Would you like to know about Instant KYC?', 4)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (27, N'You want to know about Investment Readiness?', 5)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (28, N'would you like to do Bank Account Verification?', 5)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (29, N'Would you like to file nominee?', 5)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (30, N'Can you share you Communication Details', 5)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (31, N'Please select below options', 6)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (32, N'Please select Below option', 7)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (33, N'Please select below option?', 8)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (34, N'Please select below option?', 9)
INSERT [dbo].[SubOptions] ([SubOptionId], [SubOptionText], [OptionId]) VALUES (35, N'Please select below option?', 10)
SET IDENTITY_INSERT [dbo].[SubOptions] OFF
GO
/****** Object:  Index [IX_Options_QuestionId]    Script Date: 28-02-2022 23:48:52 ******/
CREATE NONCLUSTERED INDEX [IX_Options_QuestionId] ON [dbo].[Options]
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubOptions_OptionId]    Script Date: 28-02-2022 23:48:52 ******/
CREATE NONCLUSTERED INDEX [IX_SubOptions_OptionId] ON [dbo].[SubOptions]
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Options]  WITH CHECK ADD  CONSTRAINT [FK_Options_Questions_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([QuestionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Options] CHECK CONSTRAINT [FK_Options_Questions_QuestionId]
GO
ALTER TABLE [dbo].[SubOptions]  WITH CHECK ADD  CONSTRAINT [FK_SubOptions_Options_OptionId] FOREIGN KEY([OptionId])
REFERENCES [dbo].[Options] ([OptionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubOptions] CHECK CONSTRAINT [FK_SubOptions_Options_OptionId]
GO
USE [master]
GO
ALTER DATABASE [RecommendationDB] SET  READ_WRITE 
GO
