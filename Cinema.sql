-- CREATE DATABASE Cinema

--CREATE TABLE FILM(
--	CodiceFilm INT IDENTITY(1, 1) PRIMARY KEY,
--	Titolo VARCHAR,
--	Durata INT,
--	Genere VARCHAR(20),
--	CONSTRAINT ENUM_GENERE CHECK(
--		Genere IN ('Horror', 'Commedia', 'Romantico', 'Thriller', 'Fantasy')
--	)
--)

CREATE TABLE ATTORE(
	CodiceAttore INT PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	Nazionalita VARCHAR(20) NOT NULL,
	Cachet DECIMAL(9,2),
	DataNascita DATE NOT NULL
)


CREATE TABLE FilmAttore(
	CodiceFilm INT NOT NULL,
	CodiceAttore INT NOT NULL,
	CONSTRAINT PK_CastFilm PRIMARY KEY (CodiceFilm, CodiceAttore),
	CONSTRAINT FK_FILM FOREIGN KEY (CODICEFILM) REFERENCES Film(CodiceFilm),
	CONSTRAINT FK_ATTORE FOREIGN KEY (CODICEATTORE) REFERENCES Attore(CodiceAttore)
)

CREATE TABLE Sala(
	NumeroSala INT PRIMARY KEY,
	Nome VARCHAR(20) NOT NULL UNIQUE,
	Posti INT,
	CONSTRAINT Posti_GT0 CHECK (Posti > 0)
)

CREATE TABLE PRENOTAZIONE(
	CodicePrenotazione INT IDENTITY(1,1) PRIMARY KEY,
	PostiDaPrenotare INT NOT NULL,
	Email VARCHAR(25) NOT NULL,
	CONSTRAINT PostiDaPrenotare_GT0 CHECK (PostiDaPrenotare > 0)
)

create table Programmazione(
	CodiceProgrammazione INT,
	PostiDisponibili INT not null,
	Orario DATETIME not null,
	CodiceFilm INT,
	NumeroSala INT,
	constraint PK_Programmazione PRIMARY KEY (CodiceProgrammazione),
	CONSTRAINT FK_FILMProgrammazione FOREIGN KEY (CodiceFilm) REFERENCES Film(CodiceFilm),
	CONSTRAINT FK_SALA FOREIGN KEY (NumeroSala) REFERENCES Sala(NumeroSala),
	CONSTRAINT PostiDisponibili_gt0 CHECK (PostiDisponibili > 0)
)

ALTER TABLE Prenotazione ADD CodiceProgrammazione INT NOT NULL

ALTER TABLE Prenotazione ADD constraint FK_Programmazione  
FOREIGN KEY (CodiceProgrammazione) 
REFERENCES Programmazione(CodiceProgrammazione)

ALTER TABLE FILM ALTER COLUMN Titolo VARCHAR(255)

INSERT INTO FILM(Titolo, Durata, Genere) 
VALUES ('Titanic', 200, 'Romantico')

INSERT INTO FILM (Genere, Titolo, Durata)
values ('Horror', 'IT', 120)

SELECT * FROM FILM

SELECT Titolo FROM FILM

INSERT INTO ATTORE 
values (2, 'Leondardo Di Caprio', 'Americana', 10000.23, '1980-05-04')

INSERT INTO ATTORE 
values (1, 'Miriam Leone', 'Italiana', 1000.00, '1986-05-04')

UPDATE ATTORE SET Nome = 'Leonardo DiCaprio' WHERE CodiceAttore = 2

SELECT * FROM fILM

INSERT INTO FilmAttore VALUES (5, 2)

SELECT * FROM FilmAttore WHERE CodiceAttore = 10

INSERT INTO SALA VALUES (23, 'Sala Normale', 50)

SELECT * FROM SALA

INSERT INTO Programmazione VALUES
(2, 20, '2022-04-12 17:00:00', 5, 23)

INSERT INTO Programmazione VALUES
(3, 20, '2022-04-12 20:00:00', 8, 1)

SELECT * FROM PROGRAMMAZIONE

INSERT INTO Prenotazione VALUES 
(2, 'antonias@gmail.com', 2)

SELECT * FROM PRENOTAZIONE

