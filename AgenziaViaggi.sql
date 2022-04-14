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

INSERT INTO Responsabile VALUES (1, 'Mario', 'Rossi', '3356264357', 'mrossi@email.it')
INSERT INTO Responsabile VALUES (2, 'Maria', 'Rossi', '3356234357', 'mrarossi@email.it')
INSERT INTO Responsabile VALUES (3, 'Luisa', 'Verdi', '3526264357', 'lverdi@email.it')
INSERT INTO Responsabile VALUES (4, 'Enrica', 'Gialli', '3356264390', 'egialli@email.it')
INSERT INTO Responsabile VALUES (5, 'Luca', 'Bianchi', '33523255347', 'lbianchi@email.it')

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