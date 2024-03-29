USE [master]
GO
/****** Object:  Database [BrameaViaggi]    Script Date: 14/04/2022 15:46:58 ******/
CREATE DATABASE [BrameaViaggi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BrameaViaggi', FILENAME = N'C:\Users\AntoniaSacchitella\BrameaViaggi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BrameaViaggi_log', FILENAME = N'C:\Users\AntoniaSacchitella\BrameaViaggi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BrameaViaggi] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BrameaViaggi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BrameaViaggi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BrameaViaggi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BrameaViaggi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BrameaViaggi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BrameaViaggi] SET ARITHABORT OFF 
GO
ALTER DATABASE [BrameaViaggi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BrameaViaggi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BrameaViaggi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BrameaViaggi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BrameaViaggi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BrameaViaggi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BrameaViaggi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BrameaViaggi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BrameaViaggi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BrameaViaggi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BrameaViaggi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BrameaViaggi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BrameaViaggi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BrameaViaggi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BrameaViaggi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BrameaViaggi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BrameaViaggi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BrameaViaggi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BrameaViaggi] SET  MULTI_USER 
GO
ALTER DATABASE [BrameaViaggi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BrameaViaggi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BrameaViaggi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BrameaViaggi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BrameaViaggi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BrameaViaggi] SET QUERY_STORE = OFF
GO
USE [BrameaViaggi]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BrameaViaggi]
GO
/****** Object:  Table [dbo].[Gita]    Script Date: 14/04/2022 15:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gita](
	[ID] [int] NOT NULL,
	[DataPartenza] [date] NOT NULL,
	[ResponsabileID] [int] NOT NULL,
	[ItinerarioID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GitaPartecipante]    Script Date: 14/04/2022 15:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GitaPartecipante](
	[GitaID] [int] NOT NULL,
	[PartecipanteID] [int] NOT NULL,
 CONSTRAINT [PK_GitaPartecipante] PRIMARY KEY CLUSTERED 
(
	[GitaID] ASC,
	[PartecipanteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Itinerario]    Script Date: 14/04/2022 15:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itinerario](
	[ID] [int] NOT NULL,
	[Descrizione] [varchar](200) NOT NULL,
	[Durata] [int] NOT NULL,
	[Prezzo] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partecipante]    Script Date: 14/04/2022 15:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partecipante](
	[ID] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Cognome] [varchar](50) NOT NULL,
	[DataNascita] [date] NOT NULL,
	[LuogoNascita] [varchar](30) NOT NULL,
	[Email] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Responsabile]    Script Date: 14/04/2022 15:46:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Responsabile](
	[ID] [int] NOT NULL,
	[Nome] [varchar](50) NOT NULL,
	[Cognome] [varchar](50) NOT NULL,
	[Telefono] [varchar](11) NULL,
	[Email] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Gita] ([ID], [DataPartenza], [ResponsabileID], [ItinerarioID]) VALUES (1, CAST(N'2022-04-30' AS Date), 1, 1)
INSERT [dbo].[Gita] ([ID], [DataPartenza], [ResponsabileID], [ItinerarioID]) VALUES (2, CAST(N'2022-05-30' AS Date), 2, 2)
INSERT [dbo].[Gita] ([ID], [DataPartenza], [ResponsabileID], [ItinerarioID]) VALUES (3, CAST(N'2022-07-15' AS Date), 1, 3)
INSERT [dbo].[Gita] ([ID], [DataPartenza], [ResponsabileID], [ItinerarioID]) VALUES (4, CAST(N'2022-04-30' AS Date), 3, 1)
INSERT [dbo].[Gita] ([ID], [DataPartenza], [ResponsabileID], [ItinerarioID]) VALUES (5, CAST(N'2022-04-15' AS Date), 4, 4)
INSERT [dbo].[Gita] ([ID], [DataPartenza], [ResponsabileID], [ItinerarioID]) VALUES (6, CAST(N'2022-04-30' AS Date), 5, 2)
INSERT [dbo].[Gita] ([ID], [DataPartenza], [ResponsabileID], [ItinerarioID]) VALUES (7, CAST(N'2022-04-15' AS Date), 6, 5)
GO
INSERT [dbo].[GitaPartecipante] ([GitaID], [PartecipanteID]) VALUES (1, 1)
INSERT [dbo].[GitaPartecipante] ([GitaID], [PartecipanteID]) VALUES (1, 2)
INSERT [dbo].[GitaPartecipante] ([GitaID], [PartecipanteID]) VALUES (1, 3)
INSERT [dbo].[GitaPartecipante] ([GitaID], [PartecipanteID]) VALUES (1, 4)
INSERT [dbo].[GitaPartecipante] ([GitaID], [PartecipanteID]) VALUES (1, 5)
INSERT [dbo].[GitaPartecipante] ([GitaID], [PartecipanteID]) VALUES (1, 6)
INSERT [dbo].[GitaPartecipante] ([GitaID], [PartecipanteID]) VALUES (2, 1)
INSERT [dbo].[GitaPartecipante] ([GitaID], [PartecipanteID]) VALUES (3, 1)
INSERT [dbo].[GitaPartecipante] ([GitaID], [PartecipanteID]) VALUES (4, 1)
INSERT [dbo].[GitaPartecipante] ([GitaID], [PartecipanteID]) VALUES (5, 1)
INSERT [dbo].[GitaPartecipante] ([GitaID], [PartecipanteID]) VALUES (6, 1)
GO
INSERT [dbo].[Itinerario] ([ID], [Descrizione], [Durata], [Prezzo]) VALUES (1, N'Viaggio a Londra', 7, 1300.0000)
INSERT [dbo].[Itinerario] ([ID], [Descrizione], [Durata], [Prezzo]) VALUES (2, N'Viaggio alle Maldive', 14, 2300.0000)
INSERT [dbo].[Itinerario] ([ID], [Descrizione], [Durata], [Prezzo]) VALUES (3, N'Viaggio in Lapponia', 12, 1700.0000)
INSERT [dbo].[Itinerario] ([ID], [Descrizione], [Durata], [Prezzo]) VALUES (4, N'Estate a Rimini', 47, 4300.0000)
INSERT [dbo].[Itinerario] ([ID], [Descrizione], [Durata], [Prezzo]) VALUES (5, N'Alla scoperta delle Dolomiti', 8, 1300.0000)
INSERT [dbo].[Itinerario] ([ID], [Descrizione], [Durata], [Prezzo]) VALUES (6, N'Tour del Lazio', 14, 1700.0000)
GO
INSERT [dbo].[Partecipante] ([ID], [Nome], [Cognome], [DataNascita], [LuogoNascita], [Email]) VALUES (1, N'Daniele', N'Neri', CAST(N'1976-05-09' AS Date), N'Roma', NULL)
INSERT [dbo].[Partecipante] ([ID], [Nome], [Cognome], [DataNascita], [LuogoNascita], [Email]) VALUES (2, N'Dante', N'Alighieri', CAST(N'1955-12-09' AS Date), N'Milano', NULL)
INSERT [dbo].[Partecipante] ([ID], [Nome], [Cognome], [DataNascita], [LuogoNascita], [Email]) VALUES (3, N'Silvia', N'Rossi', CAST(N'2000-12-09' AS Date), N'Firenze', N'srossi@email.it')
INSERT [dbo].[Partecipante] ([ID], [Nome], [Cognome], [DataNascita], [LuogoNascita], [Email]) VALUES (4, N'Renata', N'Verdi', CAST(N'1987-02-19' AS Date), N'Roma', N'rverdi@emai.it')
INSERT [dbo].[Partecipante] ([ID], [Nome], [Cognome], [DataNascita], [LuogoNascita], [Email]) VALUES (5, N'Mirko', N'Bianchi', CAST(N'1980-12-22' AS Date), N'Lucca', NULL)
INSERT [dbo].[Partecipante] ([ID], [Nome], [Cognome], [DataNascita], [LuogoNascita], [Email]) VALUES (6, N'Gabriele', N'Rocchi', CAST(N'1999-12-09' AS Date), N'Milano', NULL)
INSERT [dbo].[Partecipante] ([ID], [Nome], [Cognome], [DataNascita], [LuogoNascita], [Email]) VALUES (7, N'Gianluca', N'Bianchi', CAST(N'1950-12-09' AS Date), N'Milano', NULL)
GO
INSERT [dbo].[Responsabile] ([ID], [Nome], [Cognome], [Telefono], [Email]) VALUES (1, N'Mario', N'Rossi', N'3356264357', N'mrossi@email.it')
INSERT [dbo].[Responsabile] ([ID], [Nome], [Cognome], [Telefono], [Email]) VALUES (2, N'Maria', N'Rossi', N'3356234357', N'mrarossi@email.it')
INSERT [dbo].[Responsabile] ([ID], [Nome], [Cognome], [Telefono], [Email]) VALUES (3, N'Luisa', N'Verdi', N'3526264357', N'lverdi@email.it')
INSERT [dbo].[Responsabile] ([ID], [Nome], [Cognome], [Telefono], [Email]) VALUES (4, N'Enrica', N'Gialli', N'3356264390', N'egialli@email.it')
INSERT [dbo].[Responsabile] ([ID], [Nome], [Cognome], [Telefono], [Email]) VALUES (5, N'Luca', N'Bianchi', N'33523255347', N'lbianchi@email.it')
INSERT [dbo].[Responsabile] ([ID], [Nome], [Cognome], [Telefono], [Email]) VALUES (6, N'Paolo', N'Rossini', NULL, N'lb@email.it')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Responsa__4EC50480E2D6DA3A]    Script Date: 14/04/2022 15:46:58 ******/
ALTER TABLE [dbo].[Responsabile] ADD UNIQUE NONCLUSTERED 
(
	[Telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Responsa__A9D10534A32FB820]    Script Date: 14/04/2022 15:46:58 ******/
ALTER TABLE [dbo].[Responsabile] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Gita]  WITH CHECK ADD  CONSTRAINT [FK_Itinerario] FOREIGN KEY([ItinerarioID])
REFERENCES [dbo].[Itinerario] ([ID])
GO
ALTER TABLE [dbo].[Gita] CHECK CONSTRAINT [FK_Itinerario]
GO
ALTER TABLE [dbo].[Gita]  WITH CHECK ADD  CONSTRAINT [FK_Responsabile] FOREIGN KEY([ResponsabileID])
REFERENCES [dbo].[Responsabile] ([ID])
GO
ALTER TABLE [dbo].[Gita] CHECK CONSTRAINT [FK_Responsabile]
GO
ALTER TABLE [dbo].[GitaPartecipante]  WITH CHECK ADD  CONSTRAINT [FK_Gita] FOREIGN KEY([GitaID])
REFERENCES [dbo].[Gita] ([ID])
GO
ALTER TABLE [dbo].[GitaPartecipante] CHECK CONSTRAINT [FK_Gita]
GO
ALTER TABLE [dbo].[GitaPartecipante]  WITH CHECK ADD  CONSTRAINT [FK_Partecipante] FOREIGN KEY([PartecipanteID])
REFERENCES [dbo].[Partecipante] ([ID])
GO
ALTER TABLE [dbo].[GitaPartecipante] CHECK CONSTRAINT [FK_Partecipante]
GO
ALTER TABLE [dbo].[Itinerario]  WITH CHECK ADD  CONSTRAINT [Durata_CHK] CHECK  (([Durata]>(0)))
GO
ALTER TABLE [dbo].[Itinerario] CHECK CONSTRAINT [Durata_CHK]
GO
USE [master]
GO
ALTER DATABASE [BrameaViaggi] SET  READ_WRITE 
GO
