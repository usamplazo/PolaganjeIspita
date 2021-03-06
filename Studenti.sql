USE [Studenti]
GO
/****** Object:  ForeignKey [FK_Student_Smer]    Script Date: 12/12/2012 22:03:26 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Smer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] DROP CONSTRAINT [FK_Student_Smer]
GO
/****** Object:  ForeignKey [FK_Prijava_Predmet]    Script Date: 12/12/2012 22:03:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prijava_Predmet]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prijava]'))
ALTER TABLE [dbo].[Prijava] DROP CONSTRAINT [FK_Prijava_Predmet]
GO
/****** Object:  ForeignKey [FK_Prijava_Student]    Script Date: 12/12/2012 22:03:28 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prijava_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prijava]'))
ALTER TABLE [dbo].[Prijava] DROP CONSTRAINT [FK_Prijava_Student]
GO
/****** Object:  StoredProcedure [dbo].[Ispiti]    Script Date: 12/12/2012 22:03:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ispiti]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Ispiti]
GO
/****** Object:  StoredProcedure [dbo].[spIspiti]    Script Date: 12/12/2012 22:03:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spIspiti]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spIspiti]
GO
/****** Object:  Table [dbo].[Prijava]    Script Date: 12/12/2012 22:03:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prijava]') AND type in (N'U'))
DROP TABLE [dbo].[Prijava]
GO
/****** Object:  StoredProcedure [dbo].[ProfQuery]    Script Date: 12/12/2012 22:03:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProfQuery]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ProfQuery]
GO
/****** Object:  StoredProcedure [dbo].[spJedanPredmet]    Script Date: 12/12/2012 22:03:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spJedanPredmet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spJedanPredmet]
GO
/****** Object:  StoredProcedure [dbo].[spSviPredmeti]    Script Date: 12/12/2012 22:03:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSviPredmeti]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spSviPredmeti]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/12/2012 22:03:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
DROP TABLE [dbo].[Student]
GO
/****** Object:  Table [dbo].[Smer]    Script Date: 12/12/2012 22:03:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Smer]') AND type in (N'U'))
DROP TABLE [dbo].[Smer]
GO
/****** Object:  Table [dbo].[Predmet]    Script Date: 12/12/2012 22:03:26 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Predmet]') AND type in (N'U'))
DROP TABLE [dbo].[Predmet]
GO
/****** Object:  Table [dbo].[Predmet]    Script Date: 12/12/2012 22:03:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Predmet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Predmet](
	[PredmetID] [int] NOT NULL,
	[Naziv] [nvarchar](40) NOT NULL,
	[Profesor] [nvarchar](30) NULL,
 CONSTRAINT [PK_Predmet] PRIMARY KEY CLUSTERED 
(
	[PredmetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (10101, N'Računarska matematika', N'Tomić')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (20101, N'Računarski sistemi', N'Pokorni')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (30101, N'Strukture podataka', N'Pokorni')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (40102, N'Osnovi programiranja', N'Urošević')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (50102, N'Engleski jezik I', N'Terzić')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (60102, N'Računarske mreže', N'Pokorni')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (70203, N'Programerski alati', N'Pajić')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (80203, N'Engleski jezik II', N'Terzić')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (90203, N'Objektno orjentisano programiranje', N'Urošević')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (100204, N'Projektovanje informacionih sistema', N'Marković')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (120204, N'Poslovni engleski za IT stručnjake', N'Terzić')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (130305, N'Elektronsko poslovanje', N'Stojanović')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (140305, N'Internet marketing', N'Kovačević')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (150305, N'Internet programiranje', N'Simić')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (160406, N'Praktikum primenjenog programiranja', N'Anđelić')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (170406, N'Zaštita računarskih mreža', N'Pokorni')
INSERT [dbo].[Predmet] ([PredmetID], [Naziv], [Profesor]) VALUES (180406, N'Stručna praksa', NULL)
/****** Object:  Table [dbo].[Smer]    Script Date: 12/12/2012 22:03:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Smer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Smer](
	[SmerID] [int] NOT NULL,
	[Naziv] [nchar](40) NOT NULL,
 CONSTRAINT [PK_Smer] PRIMARY KEY CLUSTERED 
(
	[SmerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Smer] ([SmerID], [Naziv]) VALUES (101, N'Aplikativno programiranje               ')
INSERT [dbo].[Smer] ([SmerID], [Naziv]) VALUES (201, N'Internet programiranje                  ')
INSERT [dbo].[Smer] ([SmerID], [Naziv]) VALUES (301, N'Projektovanje informacionih sistema     ')
INSERT [dbo].[Smer] ([SmerID], [Naziv]) VALUES (401, N'Menadžment u informacionim tehnologijama')
INSERT [dbo].[Smer] ([SmerID], [Naziv]) VALUES (502, N'Elektronska trgovina i bankarstvo       ')
INSERT [dbo].[Smer] ([SmerID], [Naziv]) VALUES (602, N'Internet marketing sa Web dizajnom      ')
/****** Object:  Table [dbo].[Student]    Script Date: 12/12/2012 22:03:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Student](
	[StudentID] [int] NOT NULL,
	[Ime] [nvarchar](15) NOT NULL,
	[Prezime] [nvarchar](20) NOT NULL,
	[GodinaUpisa] [smallint] NOT NULL,
	[DatumRodjenja] [nvarchar](10) NOT NULL,
	[Skolarina] [real] NOT NULL,
	[Prosek] [real] NULL,
	[SmerID] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Student] ([StudentID], [Ime], [Prezime], [GodinaUpisa], [DatumRodjenja], [Skolarina], [Prosek], [SmerID]) VALUES (10120081, N'Petar', N'Kostić', 2008, N'25.11.1998', 2000, 8.96, 101)
INSERT [dbo].[Student] ([StudentID], [Ime], [Prezime], [GodinaUpisa], [DatumRodjenja], [Skolarina], [Prosek], [SmerID]) VALUES (10120087, N'Sandra', N'Pajić', 2008, N'13.11.1999', 1600, 7.57, 602)
INSERT [dbo].[Student] ([StudentID], [Ime], [Prezime], [GodinaUpisa], [DatumRodjenja], [Skolarina], [Prosek], [SmerID]) VALUES (20120074, N'Marija', N'Martić', 2007, N'25.11.1990', 2000, 7.56, 201)
INSERT [dbo].[Student] ([StudentID], [Ime], [Prezime], [GodinaUpisa], [DatumRodjenja], [Skolarina], [Prosek], [SmerID]) VALUES (20120085, N'Katarina', N'Pajić', 2008, N'07.04.1986', 2500, 9.4, 201)
INSERT [dbo].[Student] ([StudentID], [Ime], [Prezime], [GodinaUpisa], [DatumRodjenja], [Skolarina], [Prosek], [SmerID]) VALUES (30120011, N'Ana', N'Vidić', 2011, N'27.12.1991', 1500, 8.75, 301)
INSERT [dbo].[Student] ([StudentID], [Ime], [Prezime], [GodinaUpisa], [DatumRodjenja], [Skolarina], [Prosek], [SmerID]) VALUES (40120074, N'Nikola', N'Vidić', 2007, N'06.06.1985', 2000, 7.85, 401)
INSERT [dbo].[Student] ([StudentID], [Ime], [Prezime], [GodinaUpisa], [DatumRodjenja], [Skolarina], [Prosek], [SmerID]) VALUES (50220095, N'Jasmina', N'Grujić', 2009, N'27.12.1988', 2000, 8.65, 502)
INSERT [dbo].[Student] ([StudentID], [Ime], [Prezime], [GodinaUpisa], [DatumRodjenja], [Skolarina], [Prosek], [SmerID]) VALUES (60220073, N'Milan', N'Marković', 2007, N'07.12.1989', 1500, 6.76, 602)
/****** Object:  StoredProcedure [dbo].[spSviPredmeti]    Script Date: 12/12/2012 22:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spSviPredmeti]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spSviPredmeti]
AS
BEGIN
	select *
	from Predmet
	order by Naziv
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spJedanPredmet]    Script Date: 12/12/2012 22:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spJedanPredmet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spJedanPredmet]
@predmetId char(10)
AS
BEGIN
	select *
	from Predmet
	where PredmetID=@predmetId
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[ProfQuery]    Script Date: 12/12/2012 22:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProfQuery]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ProfQuery]
(
	@Prof nvarchar(30)
)
AS
	SET NOCOUNT ON;
SELECT        PredmetID, Naziv, Profesor
FROM            Predmet
WHERE        (Profesor LIKE @Prof)
ORDER BY Naziv' 
END
GO
/****** Object:  Table [dbo].[Prijava]    Script Date: 12/12/2012 22:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prijava]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Prijava](
	[PredmetID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Ocena] [int] NOT NULL,
 CONSTRAINT [PK_Prijava] PRIMARY KEY CLUSTERED 
(
	[PredmetID] ASC,
	[StudentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (10101, 10120081, 9)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (10101, 10120087, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (10101, 20120074, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (10101, 20120085, 9)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (10101, 30120011, 10)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (10101, 40120074, 10)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (10101, 60220073, 9)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (30101, 10120081, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (30101, 10120087, 8)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (30101, 20120085, 10)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (30101, 40120074, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (40102, 10120081, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (40102, 10120087, 7)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (40102, 20120074, 8)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (40102, 20120085, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (50102, 10120081, 10)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (50102, 10120087, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (50102, 30120011, 9)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (50102, 60220073, 8)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (70203, 10120081, 7)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (70203, 10120087, 8)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (70203, 20120074, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (80203, 20120074, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (80203, 40120074, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (90203, 20120074, 8)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (100204, 10120081, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (100204, 20120074, 10)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (100204, 30120011, 6)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (120204, 10120081, 7)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (130305, 10120081, 8)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (130305, 50220095, 9)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (140305, 10120081, 7)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (140305, 20120085, 9)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (160406, 10120081, 8)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (170406, 10120081, 7)
INSERT [dbo].[Prijava] ([PredmetID], [StudentID], [Ocena]) VALUES (180406, 10120081, 8)
/****** Object:  StoredProcedure [dbo].[spIspiti]    Script Date: 12/12/2012 22:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spIspiti]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spIspiti]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Prijava.StudentID, Prijava.PredmetID, Predmet.Naziv, Prijava.Ocena
FROM            Predmet INNER JOIN
                         Prijava ON Predmet.PredmetID = Prijava.PredmetID 
                         where Predmet.PredmetID = Prijava.PredmetID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Ispiti]    Script Date: 12/12/2012 22:03:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ispiti]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ispiti]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT        Prijava.StudentID, Prijava.PredmetID, Predmet.Naziv, Prijava.Ocena
FROM            Predmet INNER JOIN
                         Prijava ON Predmet.PredmetID = Prijava.PredmetID 
                         where Predmet.PredmetID = Prijava.PredmetID
END
' 
END
GO
/****** Object:  ForeignKey [FK_Student_Smer]    Script Date: 12/12/2012 22:03:26 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Smer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Smer] FOREIGN KEY([SmerID])
REFERENCES [dbo].[Smer] ([SmerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Student_Smer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Student]'))
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Smer]
GO
/****** Object:  ForeignKey [FK_Prijava_Predmet]    Script Date: 12/12/2012 22:03:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prijava_Predmet]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prijava]'))
ALTER TABLE [dbo].[Prijava]  WITH CHECK ADD  CONSTRAINT [FK_Prijava_Predmet] FOREIGN KEY([PredmetID])
REFERENCES [dbo].[Predmet] ([PredmetID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prijava_Predmet]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prijava]'))
ALTER TABLE [dbo].[Prijava] CHECK CONSTRAINT [FK_Prijava_Predmet]
GO
/****** Object:  ForeignKey [FK_Prijava_Student]    Script Date: 12/12/2012 22:03:28 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prijava_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prijava]'))
ALTER TABLE [dbo].[Prijava]  WITH CHECK ADD  CONSTRAINT [FK_Prijava_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Prijava_Student]') AND parent_object_id = OBJECT_ID(N'[dbo].[Prijava]'))
ALTER TABLE [dbo].[Prijava] CHECK CONSTRAINT [FK_Prijava_Student]
GO
