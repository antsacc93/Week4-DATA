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

INSERT INTO ATTORE 
values (3, 'Tom Hanks', 'Americana', 102323.00, '1970-06-04')
INSERT INTO ATTORE 
values (4, 'Daniel Radcliffe', 'Inglese', 12321.00, '1990-12-03')
INSERT INTO ATTORE 
values (5, 'Julia Roberts', 'Australiana', 15321.00, '1977-12-03')
INSERT INTO ATTORE 
values (6, 'Richard Gere', 'Americana', 12521.00, '1967-07-13')

INSERT INTO FILM (Genere, Titolo, Durata)
values ('Romantico', 'Pretty Woman', 125)
INSERT INTO FILM (Genere, Titolo, Durata)
values ('Fantasy', 'Harry Potter e la pietra filosofale', 180)
INSERT INTO FILM (Genere, Titolo, Durata)
values ('Commedia', 'Forrest Gump', 160)
INSERT INTO FILM (Genere, Titolo, Durata)
values ('Thriller', 'Documentario senza attori', 160)

INSERT INTO FilmAttore VALUES (9, 5)
INSERT INTO FilmAttore VALUES (9, 6)
INSERT INTO FilmAttore VALUES (10, 4)
INSERT INTO FilmAttore VALUES (11, 3)

select * from FILM

-- selezionare il titlo e il genere di tutti i film
SELECT Titolo, Genere
FROM FILM

--recuperare tutti i film con durata superiore a 120 minuti
SELECT *
FROM Film
WHERE Durata > 120

-- titolo e durata di tutti i film con durata superiore a 120 minuti e genere romantico
SELECT Titolo, Durata
FROM FILM
WHERE Durata > 120 AND GENERE = 'Romantico'

-- recuperare il nome degli attori di nazionalità italiana o con cachet superiore a 1000.00
SELECT Nome
from attore
where Nazionalita = 'Italiana' OR Cachet > 1000.00

-- recupera tutti gli attori di nazionalità italiana o australiana
SELECT *
FROM ATTORE
WHERE Nazionalita = 'Italiana' OR Nazionalita = 'Australiana'

-- con operatore IN

SELECT * 
FROM ATTORE
WHERE NAZIONALITA IN ('Italiana', 'Australiana')

INSERT INTO FILM (Genere, Titolo, Durata)
values ('Fantasy', 'Harry Potter e il calice di fuoco', 190)

INSERT INTO FILM (Genere, Titolo, Durata)
values ('Commedia', 'Signor Potter e le sue avventure', 190)

INSERT INTO FILM (Genere, Titolo, Durata)
values ('Fantasy', 'La saga di Harry Potter', 120)

-- recupera tutti i film su Harry Potter
SELECT *
FROM FILM
WHERE Titolo LIKE 'Harry Potter%'

--recupera tutti i film in cui compare le parole 'Harry Potter'
SELECT *
FROM FILM
WHERE Titolo LIKE '%Harry Potter%'

-- recupera tutti i film che hanno nel titolo 'Potter'
select *
FROM FILM
WHERE Titolo LIKE '%Potter%'

select * from Programmazione

-- recupera il titolo, genere e orario delle programmazioni dei film
SELECT f.Titolo, f.genere, p.orario
FROM Programmazione p
join Film f
ON p.CodiceFilm = f.CodiceFilm

SELECT f.Titolo, f.Genere, p.Orario
FROM Film f, Programmazione p
WHERE f.CodiceFilm = p.CodiceFilm

-- recupera il titolo, genere e orario sia dei film che hanno una programmazione sia di quelli che 
-- non ne hanno
SELECT f.Titolo, f.Genere, p.Orario
FROM Programmazione p
right join Film f
on p.CodiceFilm = f.CodiceFilm

SELECT FILM.TITOLO, FILM.Genere, PROGRAMMAZIONE.ORARIO
FROM PROGRAMMAZIONE
RIGHT JOIN FILM
ON PROGRAMMAZIONE.CodiceFilm = FILM.CodiceFilm 

SELECT * FROM PRENOTAZIONE

-- RECUPERO TUTTE LE PROGRAMMAZIONI CON PRENOTAZIONI E NON
SELECT *
FROM Programmazione prog
left join Prenotazione p
ON prog.codiceProgrammazione = p.codiceprogrammazione

--recupera il titolo, genere durata e orario dei film horror con una programmazione
SELECT f.Titolo, f.genere, f.Durata, p.orario
FROM FILM f
join Programmazione p
ON f.CodiceFilm = p.CodiceFilm
WHERE f.Genere = 'Horror'

--recupera titolo genere e durata dei film ordinati per durata e per titolo decrescente
SELECT TITOLO, GENERE, DURATA
FROM Film
order by durata desc, titolo DESC

--QUERY DI RIEPILOGO
select *
FROM Film f 
full outer join Programmazione p on f.codiceFilm = p.codicefilm
full outer join Sala s on s.numeroSala = p.numeroSala
full outer join Prenotazione pre on pre.codiceProgrammazione = p.CodiceProgrammazione
full outer join FilmAttore fa on fa.codiceFilm = f.CodiceFilm
full outer join Attore a on a.codiceattore = fa.codiceAttore

-- Mostrare tutti gli attori del film Pretty Woman in ordine alfabetico crescente
SELECT a.*
FROM Attore a, Film f, FilmAttore fa
WHERE a.CodiceAttore = fa.CodiceAttore 
and fa.CodiceFilm = f.CodiceFilm
and f.Titolo = 'Pretty Woman'
ORDER BY a.Nome 

-- Versione alternativa con join
SELECT a.*
FROM Attore a 
JOIN FilmAttore fa
ON a.CodiceAttore = fa.CodiceAttore
JOIN Film f
ON f.CodiceFilm = fa.CodiceFilm
WHERE f.Titolo = 'Pretty Woman'
ORDER BY a.Nome


INSERT INTO Programmazione VALUES
(5, 50, '2022-04-13 10:00:00', 11, 1)

-- Mostrare nome e nazionalità degli attori che recitano in film programmati nella 'sala speciale'
SELECT a.Nome, a.Nazionalita
FROM Attore a
join FilmAttore fa ON a.CodiceAttore = fa.CodiceAttore
JOIN Film f on fa.CodiceFilm = f.CodiceFilm
JOIN Programmazione p ON p.CodiceFilm = f.CodiceFilm
JOIN Sala s ON p.NumeroSala = s.NumeroSala
WHERE s.Nome = 'Sala speciale'

-- versione alternativa con la where
SELECT a.Nome, a.Nazionalita
FROM Attore a, FilmAttore fa, Film f, Programmazione p, Sala s
WHERE s.Nome = 'Sala Speciale' AND 
a.CodiceAttore = fa.CodiceAttore AND fa.CodiceFilm = f.CodiceFilm AND
p.CodiceFilm = f.CodiceFilm AND p.NumeroSala = s.NumeroSala

--Mostrare gli attori che hanno partecipato a film proiettati alla data di oggi 
-- nella sala speciale solo se i posti disponibili sono superiori a 30 e se il cachet percepito
-- è superiore a 1500
SELECT a.*, f.Titolo, p.Orario
from Attore a 
JOIN FilmAttore fa on a.CodiceAttore = fa.CodiceAttore
JOIN Film f on fa.CodiceFilm = f.CodiceFilm
JOIN Programmazione p on p.CodiceFilm = f.CodiceFilm
JOIN Sala s ON s.NumeroSala = p.NumeroSala
WHERE s.Nome = 'Sala Speciale'
AND p.PostiDisponibili > 30 AND a.Cachet <> 1500
and DATEPART(DAYOFYEAR, SYSDATETIME()) = DATEPART(DAYOFYEAR, p.Orario)


-- le programmazioni che sono avvenute nel mese di GENNAIO
SELECT *
FROM Programmazione
WHERE Orario BETWEEN '2022-01-01' AND '2022-01-31'

SELECT *
FROM Programmazione
WHERE CAST(Orario AS DATE) BETWEEN '2022-01-01' AND '2022-01-31'

SELECT * 
FROM PROGRAMMAZIONE
WHERE Orario >= '2022-01-01' AND Orario <= '2022-01-31'

SELECT * FROM FILM

--group by
-- raggruppa tutti i film per genere specificando anche il numero di film per ciascun genere
SELECT GENERE as Gen, COUNT(GENERE) as 'Film per genere'
FROM Film
Group by Genere

select * from film
insert into film values ('IT', 130, 'Horror')

--mostra i titoli dei film che hanno un doppione (cioè con lo stesso titolo) nel db
Select Titolo, count(titolo)
FROM FILM
Group by Titolo
HAVING count(titolo) > 1

-- mostrare durata massima, minima e media dei film suddivisi per genere
select genere, max(durata) as 'Massima durata', min(durata) as 'Minima durata', 
avg(durata) as 'Durata media' 
FROM FILM
GROUP BY GENERE

--visualizzare le sale con il un numero di programmazioni 
-- che hanno una media di posti disponibili superiore a 30
SELECT s.Nome, count(p.PostiDisponibili)
FROM Sala s left join Programmazione p on s.NumeroSala = p.NumeroSala
group by s.Nome
having avg(p.postidisponibili) > 10

insert into sala values (3, 'Sala verde', 40)

select * from prenotazione
select * from Programmazione

insert into prenotazione values (4, 'mariorossi@gmail.com', 2)
insert into prenotazione values (5, 'lucabianchi@gmail.com', 3)

-- visualizza la somma dei posti prenotati per programmazione
select p.CodiceProgrammazione, sum(pre.PostiDaPrenotare)
from Programmazione p join Prenotazione pre 
on p.codiceprogrammazione = pre.codiceProgrammazione
group by p.codiceprogrammazione




			