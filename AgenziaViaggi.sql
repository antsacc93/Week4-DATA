----CREATE DATABASE BrameaViaggi

--CREATE TABLE Itinerario(
--	ID INT PRIMARY KEY,
--	Descrizione VARCHAR(200) NOT NULL,
--	Durata INT NOT NULL,
--	Prezzo MONEY NOT NULL,
--	CONSTRAINT Durata_CHK CHECK (Durata > 0)
--)

--CREATE TABLE Responsabile(
--	ID INT PRIMARY KEY,
--	Nome VARCHAR(50) NOT NULL,
--	Cognome VARCHAR(50) NOT NULL,
--	Telefono VARCHAR(11) NULL UNIQUE,
--	Email VARCHAR(30) NULL UNIQUE
--)

--CREATE TABLE Partecipante(
--	ID INT PRIMARY KEY,
--	Nome VARCHAR(50) NOT NULL,
--	Cognome VARCHAR(50) NOT NULL,
--	DataNascita DATE NOT NULL,
--	LuogoNascita VARCHAR(30) NOT NULL,
--	Email VARCHAR(30)
--)

--CREATE TABLE Gita(
--	ID INT PRIMARY KEY,
--	DataPartenza Date NOT NULL,
--	ResponsabileID INT NOT NULL,
--	ItinerarioID int NOT NULL,
--	CONSTRAINT FK_Responsabile FOREIGN KEY (ResponsabileID) REFERENCES Responsabile(ID),
--	CONSTRAINT FK_Itinerario FOREIGN KEY (ItinerarioID) REFERENCES Itinerario(ID)
--)

--CREATE TABLE GitaPartecipante(
--	GitaID INT,
--	PartecipanteID INT,
--	CONSTRAINT PK_GitaPartecipante PRIMARY KEY (GitaID, PartecipanteID),
--	CONSTRAINT FK_Gita FOREIGN KEY (GitaID) REFERENCES Gita(ID),
--	Constraint FK_Partecipante FOREIGN KEY (PartecipanteId) REFERENCES Partecipante(ID)
--)



INSERT INTO Itinerario VALUES (1, 'Viaggio a Londra', 7, 1300)
INSERT INTO Itinerario VALUES (2, 'Viaggio alle Maldive', 14, 2300)
INSERT INTO Itinerario VALUES (3, 'Viaggio in Lapponia', 12, 1700)
INSERT INTO Itinerario VALUES (4, 'Estate a Rimini', 47, 4300)
INSERT INTO Itinerario VALUES (5, 'Alla scoperta delle Dolomiti', 8, 1300)
INSERT INTO Itinerario VALUES (6, 'Tour del Lazio', 14, 1700)

INSERT INTO Responsabile VALUES (1, 'Mario', 'Rossi', '3356264357', 'mrossi@email.it')
INSERT INTO Responsabile VALUES (2, 'Maria', 'Rossi', '3356234357', 'mrarossi@email.it')
INSERT INTO Responsabile VALUES (3, 'Luisa', 'Verdi', '3526264357', 'lverdi@email.it')
INSERT INTO Responsabile VALUES (4, 'Enrica', 'Gialli', '3356264390', 'egialli@email.it')
INSERT INTO Responsabile VALUES (5, 'Luca', 'Bianchi', '33523255347', 'lbianchi@email.it')
INSERT INTO Responsabile VALUES (6, 'Paolo', 'Rossini', NULL, 'lb@email.it')

INSERT INTO Partecipante VALUES (1, 'Daniele', 'Neri', '1976-05-09', 'Roma', NULL)
INSERT INTO Partecipante VALUES (2, 'Dante', 'Alighieri', '1955-12-09', 'Milano', NULL)
INSERT INTO Partecipante VALUES (3, 'Silvia', 'Rossi', '2000-12-09', 'Firenze', 'srossi@email.it')
INSERT INTO Partecipante VALUES (4, 'Renata', 'Verdi', '1987-02-19', 'Roma', 'rverdi@emai.it')
INSERT INTO Partecipante VALUES (5, 'Mirko', 'Bianchi', '1980-12-22', 'Lucca', NULL)
INSERT INTO Partecipante VALUES (6, 'Gabriele', 'Rocchi', '1999-12-09', 'Milano', NULL)
INSERT INTO Partecipante VALUES (7, 'Gianluca', 'Bianchi', '1950-12-09', 'Milano', NULL)


INSERT INTO Gita VALUES (1, '2022-04-30', 1, 1)
INSERT INTO Gita VALUES (2, '2022-05-30', 2, 2)
INSERT INTO Gita VALUES (3, '2022-07-15', 1, 3)
INSERT INTO Gita VALUES (4, '2022-04-30', 3, 1)
INSERT INTO Gita VALUES (5, '2022-04-15', 4, 4)
INSERT INTO Gita VALUES (6, '2022-04-30', 5, 2)
INSERT INTO Gita VALUES (7, '2022-04-15', 6, 5)

INSERT INTO GitaPartecipante VALUES(1, 1)
INSERT INTO GitaPartecipante VALUES(1, 2)
INSERT INTO GitaPartecipante VALUES(1, 3)
INSERT INTO GitaPartecipante VALUES(1, 4)
INSERT INTO GitaPartecipante VALUES(2, 1)
INSERT INTO GitaPartecipante VALUES(3, 1)
INSERT INTO GitaPartecipante VALUES(4, 1)
INSERT INTO GitaPartecipante VALUES(5, 1)
INSERT INTO GitaPartecipante VALUES(6, 1)
INSERT INTO GitaPartecipante VALUES(1, 5)
INSERT INTO GitaPartecipante VALUES(1, 6)


SELECT *
FROM Partecipante
where LuogoNascita = 'Roma'

SELECT *
FROM Itinerario 
WHERE Prezzo > 500 OR Durata > 7

-- con join
SELECT g.DataPartenza
FROM Gita g
JOIN Itinerario i
ON g.ItinerarioID = i.id
Where i.prezzo > 100

-- senza join
SELECT g.DataPartenza
FROM Gita g, Itinerario i
WHERE g.ItinerarioID = i.Id and i.prezzo > 100

SELECT r.Nome, r.Cognome, r.Telefono
FROM Responsabile r
join Gita g
on r.Id = g.ResponsabileID
where g.DataPartenza = '2022-04-15'

SELECT r.Nome, r.Cognome, r.Telefono
FROM Responsabile r, Gita g
WHERE r.ID = g.ResponsabileID AND g.DataPartenza = '2022-04-15'


SELECT *
from Itinerario i
order by i.Prezzo, i.Durata

SELECT *
FROM Gita g
WHERE g.DataPartenza BETWEEN '2022-01-01' AND '2022-12-31'

SELECT r.Nome, r.Cognome, r.Telefono
FROM Responsabile r
join Gita g
on r.Id = g.ResponsabileID
where g.DataPartenza = '2022-04-15'
AND R.Telefono IS NULL

select *
from Itinerario i
where i.durata = (
	select max(Durata)
	from Itinerario 
) or i.Durata = (
	select min(durata)
	from Itinerario
)

-- con l'operatore di unione
select *
from itinerario i
where i.durata = (
	select max(durata)
	from Itinerario
)
union 
select *
from itinerario i
where i.durata = (
	select min(durata)
	from itinerario
)

--partecipante che non ha partecipato a nessuna gita
select *
from partecipante p
where p.Id not IN (
	select partecipanteID
	FROM GitaPartecipante
)

--con operatore all

select * 
from partecipante p
where p.id <> ALL (
	select partecipanteID
	from GitaPartecipante
)


--lista dei partecipanti che hanno partecipato ad almeno una gita
SELECT *
FROM partecipante p
where p.id in (
	select partecipanteID
	from GitaPartecipante
)

-- con operatore any

select * from partecipante p
where p.id = any (
	select partecipanteID
	from GitaPartecipante
)

-- trova gli itinerari la cui durata è pari o superiore alla durata minima
select *
FROM itinerario i
where i.Durata > (
	select min(durata)
	from itinerario 
)

--recuperiamo i dati dei partecipanti che hanno partecipato alla gita
-- a londra ma non a quella alle maldive
select distinct p.*
from Partecipante p
JOIN gitaPartecipante gp
on p.id = gp.partecipanteid
join gita g
on gp.gitaid = g.id
join itinerario i
on g.itinerarioid = i.id
where i.descrizione like '%londra%'
and p.id not in (
	select pMaldive.id
	from partecipante pMaldive
	join GitaPartecipante gitap
	on pMaldive.ID = gitap.GitaID
	join gita gitaMaldive
	on gitaMaldive.id = gitap.gitaid
	join itinerario itinerarioMaldive
	on gitaMaldive.ItinerarioID = itinerarioMaldive.ID
	where itinerarioMaldive.Descrizione like '%maldive%'
)

-- se avessimo usato un'unica tabella per le persone (responsabile/partecipante)
CREATE TABLE Persona(
	ID INT PRIMARY KEY,
	Nome VARCHAR(50) NOT NULL,
	Cognome VARCHAR(50) NOT NULL,
	Telefono VARCHAR(11) NULL UNIQUE,
	Email VARCHAR(30) NULL UNIQUE,
	DataNascita DATE NOT NULL,
	LuogoNascita VARCHAR(30) NOT NULL,
	TipoPersona varchar(20),
	constraint chk_tipopersona check tipopersona in ('Responsabile', 'Partecipante', 'Amministrativo')
)