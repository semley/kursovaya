USE [master]
GO
/****** Object:  Database [Semenova_UniversityKursach]    Script Date: 08.11.2024 21:52:18 ******/
CREATE DATABASE [Semenova_UniversityKursach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\University2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'University2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\University2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Semenova_UniversityKursach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Semenova_UniversityKursach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET ARITHABORT OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET  MULTI_USER 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Semenova_UniversityKursach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Semenova_UniversityKursach] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Semenova_UniversityKursach]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 08.11.2024 21:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[Faculty_ID] [int] IDENTITY(1,1) NOT NULL,
	[Faculty_name] [varchar](max) NOT NULL,
	[FIO_decan] [varchar](max) NOT NULL,
	[Num_room] [varchar](50) NOT NULL,
	[Num_korpus] [int] NOT NULL,
	[Phone] [varchar](11) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK__Faculty__4EFCEA4A5697E019] PRIMARY KEY CLUSTERED 
(
	[Faculty_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Load]    Script Date: 08.11.2024 21:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Load](
	[Load_ID] [int] IDENTITY(1,1) NOT NULL,
	[Teacher_ID] [int] NOT NULL,
	[Subject_ID] [int] NOT NULL,
	[Academic_Year] [int] NOT NULL,
	[Semestr] [int] NOT NULL,
	[Grupa] [varchar](50) NOT NULL,
	[Kol_students] [int] NOT NULL,
	[Final_control] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Load__D98F54D63BBAC978] PRIMARY KEY CLUSTERED 
(
	[Load_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pulpit]    Script Date: 08.11.2024 21:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pulpit](
	[Pulpit_ID] [int] IDENTITY(1,1) NOT NULL,
	[Faculty_ID] [int] NOT NULL,
	[Pulpit_name] [nvarchar](50) NOT NULL,
	[FIO_manager] [nvarchar](max) NOT NULL,
	[Num_room] [nvarchar](50) NOT NULL,
	[Num_korpus] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[Kol_teacher] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK__Pulpit__5A5E5F58ECC2096C] PRIMARY KEY CLUSTERED 
(
	[Pulpit_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 08.11.2024 21:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Subject_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pulpit_ID] [int] NOT NULL,
	[Subject_name] [nvarchar](max) NOT NULL,
	[Kol_hour] [nchar](10) NOT NULL,
	[Cycle] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__Subject__D98F54D697D1F286] PRIMARY KEY CLUSTERED 
(
	[Subject_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 08.11.2024 21:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Teacher_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pulpit_ID] [int] NOT NULL,
	[Famil] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Patronymic] [nvarchar](max) NULL,
	[Birthday] [date] NOT NULL,
	[Year_work] [int] NOT NULL,
	[Experience]  AS ((2024)-[Year_work]),
	[Job_title] [nvarchar](max) NOT NULL,
	[Gender] [nvarchar](1) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Teacher__92FF4C8B7D273A13] PRIMARY KEY CLUSTERED 
(
	[Teacher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([Faculty_ID], [Faculty_name], [FIO_decan], [Num_room], [Num_korpus], [Phone], [Description], [Image]) VALUES (1, N'Факультет авионики, энергетики и инфокоммуникаций', N'Козлова Ольга Александровна', N'123-1', 1, N'89270253699', N'Направления подготовки являются самыми современными и актуальными в промышленности на текущий момент и относятся к приоритетным направлениям инновационного развития экономики РФ.', N'image/aviet.png')
INSERT [dbo].[Faculty] ([Faculty_ID], [Faculty_name], [FIO_decan], [Num_room], [Num_korpus], [Phone], [Description], [Image]) VALUES (2, N'Факультет авиационных двигателей, энергетики и транспорта', N'Михайлова Елена Сергеевна', N'301-1', 1, N'89355155247', N'Ориентирован на подготовку специалистов для авиа- и ракетостроения, авиадвигателестроения, энергетики, энергомашиностроения и транспорта', N'image/fadet.png')
INSERT [dbo].[Faculty] ([Faculty_ID], [Faculty_name], [FIO_decan], [Num_room], [Num_korpus], [Phone], [Description], [Image]) VALUES (3, N'Факультет башкирской филологии, востоковедения и журналистики', N'Николаева Анна Ивановна', N'101-2', 2, N'89369875155', N'Тесное сотрудничество с вузами дальнего и ближнего зарубежья позволяет студентам и аспирантам факультета продолжать учебу в университетах Турции, Ирана, Китая, Казахстана и других стран.', N'image/fbf.png')
INSERT [dbo].[Faculty] ([Faculty_ID], [Faculty_name], [FIO_decan], [Num_room], [Num_korpus], [Phone], [Description], [Image]) VALUES (4, N'Биологический факультет', N'Григорьев Владимир Павлович', N'302-2', 2, N'89456584255', N'Обучение гуманитарным, естественнонаучным, общепрофессиональным и специальным дисциплинам', N'image/bio.png')
INSERT [dbo].[Faculty] ([Faculty_ID], [Faculty_name], [FIO_decan], [Num_room], [Num_korpus], [Phone], [Description], [Image]) VALUES (5, N'Факультет защиты в чрезвычайных ситуациях', N'Кузнецов Алексей Дмитриевич', N'501-2', 2, N'89325121545', N'Ориентирован на обеспечение комплексной безопасности жизнедеятельности населения как одного из ведущих элементов Национальной безопасности страны.', N'image/fzchs.png')
SET IDENTITY_INSERT [dbo].[Faculty] OFF
GO
SET IDENTITY_INSERT [dbo].[Load] ON 

INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (1, 1, 1, 2024, 2, N'БСИТ-11, БСИТ-12, БСИТ-13', 75, N'зачёт')
INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (2, 2, 2, 2024, 3, N'ИТИС-21, ИТИС-22, ИТИС-23', 73, N'зачёт')
INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (3, 3, 3, 2024, 4, N'РИТ-21, РИТ-22, РИТ-23', 72, N'зачёт')
INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (4, 4, 4, 2024, 5, N'БСИТ-31, БСИТ-32, БСИТ-33', 65, N'диффзачёт')
INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (5, 5, 5, 2024, 6, N'РИТ-31, РИТ-32, РИТ-33', 75, N'зачёт')
INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (6, 6, 6, 2024, 7, N'ИТИС-41, ИТИС-42', 69, N'экзамен')
INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (7, 7, 7, 2024, 5, N'БПО-31, БПО-32, БПО-33', 59, N'диффзачёт')
INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (8, 8, 8, 2024, 1, N'РИТ-11, РИТ-12, РИТ-13', 65, N'зачёт')
INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (9, 9, 9, 2024, 4, N'РИТ-21, РИТ-22, РИТ-23', 74, N'зачёт')
INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (10, 10, 10, 2024, 2, N'РИТ-11, РИТ-12, РИТ-13', 74, N'диффзачёт')
INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (11, 11, 11, 2024, 5, N'БСИТ-31, БСИТ-32, БСИТ-33', 69, N'экзамен')
INSERT [dbo].[Load] ([Load_ID], [Teacher_ID], [Subject_ID], [Academic_Year], [Semestr], [Grupa], [Kol_students], [Final_control]) VALUES (12, 12, 12, 2024, 6, N'БСИТ-31, БСИТ-32, БСИТ-33', 71, N'зачёт')
SET IDENTITY_INSERT [dbo].[Load] OFF
GO
SET IDENTITY_INSERT [dbo].[Pulpit] ON 

INSERT [dbo].[Pulpit] ([Pulpit_ID], [Faculty_ID], [Pulpit_name], [FIO_manager], [Num_room], [Num_korpus], [Phone], [Kol_teacher], [Description], [Image]) VALUES (1, 1, N'Биотехнические системы и технологии', N'Богданов Анатолий Степанович', N'104-1', N'1', N'89454549768', 3, N'Получаемая квалификация и уровень подготовки позволяют выпускникам  уверенно работать в медицинских клиниках и на предприятиях, занимающихся производством, ремонтом и обслуживанием медицинской техники в качестве инженеров по ремонту и обслуживанию медицинской техники', NULL)
INSERT [dbo].[Pulpit] ([Pulpit_ID], [Faculty_ID], [Pulpit_name], [FIO_manager], [Num_room], [Num_korpus], [Phone], [Kol_teacher], [Description], [Image]) VALUES (2, 2, N'Авиастроение', N'Мартынов Александр Васильевич', N'412-1', N'1', N'89146515915', 3, N'Выпускник умеет проектировать, рассчитывать, конструировать, испытывать и ремонтировать вертолёты; имеет знания по общетехническим, естественно-научным, гуманитарным дисциплинам, а также обладает навыками работы с профессиональным программным обеспечением.', NULL)
INSERT [dbo].[Pulpit] ([Pulpit_ID], [Faculty_ID], [Pulpit_name], [FIO_manager], [Num_room], [Num_korpus], [Phone], [Kol_teacher], [Description], [Image]) VALUES (3, 3, N'Востоковедение и африканистика', N'Шестаков Денис Владимирович', N'106-2', N'2', N'89021616451', 2, N'позволяет не просто освоить языки, а стать специалистом в области международных отношений в широком смысле этого слова – разбираться в культурных традициях и этических нормах Востока, что крайне важно в проведении переговорных процессов.', NULL)
INSERT [dbo].[Pulpit] ([Pulpit_ID], [Faculty_ID], [Pulpit_name], [FIO_manager], [Num_room], [Num_korpus], [Phone], [Kol_teacher], [Description], [Image]) VALUES (4, 4, N'Биоинженерия и биоинформатика', N'Орлов Петр Иванович', N'305-2', N'2', N'89421505415', 2, N'Программа специалитета направлена на подготовку высококвалифицированных специалистов, владеющих последними достижениями фундаментальной биологической науки и способные целенаправленно изменять биологические объекты в соответствии с поставленными задачами в области молекулярной биоинженерии и биоинформатики.', NULL)
INSERT [dbo].[Pulpit] ([Pulpit_ID], [Faculty_ID], [Pulpit_name], [FIO_manager], [Num_room], [Num_korpus], [Phone], [Kol_teacher], [Description], [Image]) VALUES (5, 5, N'Техносферная безопасность', N'Горбунов Вячеслав Максимович', N'203-2', N'2', N'89426521612', 2, N'комплексное направление подготовки специалистов в области обеспечения промышленной, пожарной и экологической безопасности технологических процессов и опасных производственных объектов как в штатном режиме, так и в условиях чрезвычайной ситуации, а также области гражданской обороны и охраны труда. ', NULL)
SET IDENTITY_INSERT [dbo].[Pulpit] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (1, 1, N'Экология', N'64        ', N'Базовые дисциплины')
INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (2, 1, N'Биофизические основы живых систем', N'56        ', N'Общепрофессиональный цикл')
INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (3, 1, N'Биохимия', N'62        ', N'Общепрофессиональный цикл')
INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (4, 2, N'Основы БЖД в медицине', N'32        ', N'Базовые дисциплины')
INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (5, 2, N'Применение ультразвука в медицине', N'64        ', N'Профессиональный цикл')
INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (6, 2, N'Инженерная математика', N'42        ', N'Профессиональный цикл')
INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (7, 3, N'Программируемая электроника', N'50        ', N'Профессиональный цикл')
INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (8, 3, N'Электротехника', N'42        ', N'Профессиональный цикл')
INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (9, 4, N'Основы теории автоматического управления', N'44        ', N'Общепрофессиональный цикл')
INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (10, 4, N'Прикладная механика', N'60        ', N'Общепрофессиональный цикл')
INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (11, 5, N'Основы автоматического у правления', N'26        ', N'Общепрофессиональный цикл')
INSERT [dbo].[Subject] ([Subject_ID], [Pulpit_ID], [Subject_name], [Kol_hour], [Cycle]) VALUES (12, 5, N'Материаловедение', N'60        ', N'Профессиональный цикл')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (1, 1, N'Куликов', N'Георгий', N'Михайлович', CAST(N'2002-10-05' AS Date), 2014, N'преподаватель', N'м', N'Уфа')
INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (2, 1, N'Шестакова', N'Ирина', N'Денисовна', CAST(N'1981-03-09' AS Date), 2015, N'доцент', N'ж', N'Уфа')
INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (3, 1, N'Поляков', N'Станислав', N'Владимирович', CAST(N'1989-02-27' AS Date), 2008, N'профессор', N'м', N'Уфа')
INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (4, 2, N'Лебедева', N'Нина', N'Ивановна', CAST(N'1975-09-17' AS Date), 2005, N'преподаватель', N'ж', N'Уфа')
INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (5, 2, N'Медведев', N'Арсений', N'Олегович', CAST(N'1994-01-05' AS Date), 2004, N'ассистент', N'м', N'Уфа')
INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (6, 2, N'Петухова', N'Милана', N'Викторовна', CAST(N'1985-07-04' AS Date), 2011, N'доцент', N'ж', N'Уфа')
INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (7, 3, N'Афанасьев', N'Игнатий', N'Львович', CAST(N'1997-12-16' AS Date), 2013, N'профессор', N'м', N'Иглино')
INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (8, 3, N'Новиков', N'Сергей', N'Михайлович', CAST(N'1993-11-17' AS Date), 2014, N'преподаватель', N'м', N'Уфа')
INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (9, 4, N'Закалюжный', N'Василий', N'Васильевич', CAST(N'2000-08-10' AS Date), 2001, N'доцент', N'м', N'Иглино')
INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (10, 4, N'Кириллов', N'Кирилл', N'Кириллович', CAST(N'1972-07-26' AS Date), 2004, N'преподаватель', N'м', N'Иглино')
INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (11, 5, N'Васильев', N'Олег', N'Валерьевич', CAST(N'1972-10-04' AS Date), 2005, N'доцент', N'м', N'Дёма')
INSERT [dbo].[Teacher] ([Teacher_ID], [Pulpit_ID], [Famil], [Name], [Patronymic], [Birthday], [Year_work], [Job_title], [Gender], [City]) VALUES (12, 5, N'Галаева', N'Ксения', N'Игоревна', CAST(N'1978-03-06' AS Date), 2006, N'преподаватель', N'ж', N'Дёма')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
GO
ALTER TABLE [dbo].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_Subject] FOREIGN KEY([Subject_ID])
REFERENCES [dbo].[Subject] ([Subject_ID])
GO
ALTER TABLE [dbo].[Load] CHECK CONSTRAINT [FK_Load_Subject]
GO
ALTER TABLE [dbo].[Load]  WITH CHECK ADD  CONSTRAINT [FK_Load_Teacher] FOREIGN KEY([Teacher_ID])
REFERENCES [dbo].[Teacher] ([Teacher_ID])
GO
ALTER TABLE [dbo].[Load] CHECK CONSTRAINT [FK_Load_Teacher]
GO
ALTER TABLE [dbo].[Pulpit]  WITH CHECK ADD  CONSTRAINT [FK_Pulpit_FACULTY] FOREIGN KEY([Faculty_ID])
REFERENCES [dbo].[Faculty] ([Faculty_ID])
GO
ALTER TABLE [dbo].[Pulpit] CHECK CONSTRAINT [FK_Pulpit_FACULTY]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Pulpit] FOREIGN KEY([Pulpit_ID])
REFERENCES [dbo].[Pulpit] ([Pulpit_ID])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Pulpit]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Pulpit] FOREIGN KEY([Pulpit_ID])
REFERENCES [dbo].[Pulpit] ([Pulpit_ID])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Pulpit]
GO
ALTER TABLE [dbo].[Faculty]  WITH CHECK ADD  CONSTRAINT [Num_korpus] CHECK  (([Num_korpus]='9' OR [Num_korpus]='8' OR [Num_korpus]='7' OR [Num_korpus]='6' OR [Num_korpus]='5' OR [Num_korpus]='4' OR [Num_korpus]='3' OR [Num_korpus]='2' OR [Num_korpus]='1'))
GO
ALTER TABLE [dbo].[Faculty] CHECK CONSTRAINT [Num_korpus]
GO
ALTER TABLE [dbo].[Load]  WITH CHECK ADD  CONSTRAINT [Final_control] CHECK  (([Final_control]='экзамен' OR [Final_control]='диффзачёт' OR [Final_control]='зачёт'))
GO
ALTER TABLE [dbo].[Load] CHECK CONSTRAINT [Final_control]
GO
/****** Object:  StoredProcedure [dbo].[checkname]    Script Date: 08.11.2024 21:52:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[checkname] @param char(20) AS
IF (SELECT Famil FROM Teacher)  = @param
RETURN 'Есть преподаватель с такой фамилией'
ELSE
RETURN 'Нет преподавателя с такой фамилией'
GO
USE [master]
GO
ALTER DATABASE [Semenova_UniversityKursach] SET  READ_WRITE 
GO
