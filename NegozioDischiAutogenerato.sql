USE [master]
GO
/****** Object:  Database [NegozioDischi]    Script Date: 18/03/2022 14:43:16 ******/
CREATE DATABASE [NegozioDischi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NegozioDischi', FILENAME = N'C:\Users\39348\NegozioDischi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NegozioDischi_log', FILENAME = N'C:\Users\39348\NegozioDischi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NegozioDischi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NegozioDischi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ARITHABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NegozioDischi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NegozioDischi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NegozioDischi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NegozioDischi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NegozioDischi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NegozioDischi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET  MULTI_USER 
GO
ALTER DATABASE [NegozioDischi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NegozioDischi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NegozioDischi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NegozioDischi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NegozioDischi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NegozioDischi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NegozioDischi] SET QUERY_STORE = OFF
GO
USE [NegozioDischi]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 18/03/2022 14:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[IDAlbum] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [varchar](20) NOT NULL,
	[AnnoDiUscita] [int] NOT NULL,
	[CasaDiscografica] [varchar](20) NOT NULL,
	[Genere] [varchar](20) NOT NULL,
	[SupportoDiDistribuzione] [varchar](10) NOT NULL,
	[IDBand] [int] NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[IDAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumBrano]    Script Date: 18/03/2022 14:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumBrano](
	[IDAlbum] [int] NOT NULL,
	[IDBrano] [int] NOT NULL,
 CONSTRAINT [PK_AlbumBrano] PRIMARY KEY CLUSTERED 
(
	[IDAlbum] ASC,
	[IDBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 18/03/2022 14:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[IDBand] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](30) NOT NULL,
	[NumeroComponebti] [int] NOT NULL,
 CONSTRAINT [PK_Band] PRIMARY KEY CLUSTERED 
(
	[IDBand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 18/03/2022 14:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[IDBrano] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [varchar](30) NOT NULL,
	[Durata] [int] NOT NULL,
 CONSTRAINT [PK_Brano] PRIMARY KEY CLUSTERED 
(
	[IDBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([IDAlbum], [Titolo], [AnnoDiUscita], [CasaDiscografica], [Genere], [SupportoDiDistribuzione], [IDBand]) VALUES (1, N'Gli anni d''oro', 1996, N'Sony', N'Pop', N'CD', 1)
INSERT [dbo].[Album] ([IDAlbum], [Titolo], [AnnoDiUscita], [CasaDiscografica], [Genere], [SupportoDiDistribuzione], [IDBand]) VALUES (3, N'Come mai', 1998, N'Sony', N'Pop', N'vinile', 1)
INSERT [dbo].[Album] ([IDAlbum], [Titolo], [AnnoDiUscita], [CasaDiscografica], [Genere], [SupportoDiDistribuzione], [IDBand]) VALUES (6, N'Ciao', 2017, N'Music', N'Metal', N'Streaming', 3)
INSERT [dbo].[Album] ([IDAlbum], [Titolo], [AnnoDiUscita], [CasaDiscografica], [Genere], [SupportoDiDistribuzione], [IDBand]) VALUES (8, N'Brutti', 2018, N'Music', N'Jazz', N'Vinile', 3)
INSERT [dbo].[Album] ([IDAlbum], [Titolo], [AnnoDiUscita], [CasaDiscografica], [Genere], [SupportoDiDistribuzione], [IDBand]) VALUES (10, N'Torna', 2020, N'Sony', N'Pop', N'CD', 3)
INSERT [dbo].[Album] ([IDAlbum], [Titolo], [AnnoDiUscita], [CasaDiscografica], [Genere], [SupportoDiDistribuzione], [IDBand]) VALUES (11, N'World', 1980, N'WWW', N'Classico', N'Vinile', 5)
INSERT [dbo].[Album] ([IDAlbum], [Titolo], [AnnoDiUscita], [CasaDiscografica], [Genere], [SupportoDiDistribuzione], [IDBand]) VALUES (15, N'Felicita', 2021, N'Gita', N'pop', N'Vinile', 2)
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (1, 1)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (3, 3)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (6, 4)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (11, 5)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (15, 5)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (15, 6)
INSERT [dbo].[AlbumBrano] ([IDAlbum], [IDBrano]) VALUES (15, 8)
GO
SET IDENTITY_INSERT [dbo].[Band] ON 

INSERT [dbo].[Band] ([IDBand], [Nome], [NumeroComponebti]) VALUES (1, N'883', 4)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumeroComponebti]) VALUES (2, N'The giornalisti', 6)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumeroComponebti]) VALUES (3, N'Maneskin', 5)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumeroComponebti]) VALUES (4, N'the Beatles', 5)
INSERT [dbo].[Band] ([IDBand], [Nome], [NumeroComponebti]) VALUES (5, N'Queen', 6)
SET IDENTITY_INSERT [dbo].[Band] OFF
GO
SET IDENTITY_INSERT [dbo].[Brano] ON 

INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (1, N'la dura legge del gol', 190)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (2, N'Regina delle celebrità', 160)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (3, N'Come mai', 185)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (4, N'Zitti e buoni', 100)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (5, N'Imagine', 200)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (6, N'Riccione', 500)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (7, N'We are the Champions', 600)
INSERT [dbo].[Brano] ([IDBrano], [Titolo], [Durata]) VALUES (8, N'Vocale', 300)
SET IDENTITY_INSERT [dbo].[Brano] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SingoloAlbum]    Script Date: 18/03/2022 14:43:17 ******/
ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [SingoloAlbum] UNIQUE NONCLUSTERED 
(
	[Titolo] ASC,
	[AnnoDiUscita] ASC,
	[CasaDiscografica] ASC,
	[Genere] ASC,
	[SupportoDiDistribuzione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [Fk_Band] FOREIGN KEY([IDBand])
REFERENCES [dbo].[Band] ([IDBand])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [Fk_Band]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_Album] FOREIGN KEY([IDAlbum])
REFERENCES [dbo].[Album] ([IDAlbum])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_Album]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_Brano] FOREIGN KEY([IDBrano])
REFERENCES [dbo].[Brano] ([IDBrano])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_Brano]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [chk_Genere] CHECK  (([Genere]='Classico' OR [Genere]='Jazz' OR [Genere]='Pop' OR [Genere]='Metal'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [chk_Genere]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [chk_Supporto] CHECK  (([SupportoDiDistribuzione]='CD' OR [SupportoDiDistribuzione]='Vinile' OR [supportoDiDistribuzione]='Streaming'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [chk_Supporto]
GO
USE [master]
GO
ALTER DATABASE [NegozioDischi] SET  READ_WRITE 
GO
