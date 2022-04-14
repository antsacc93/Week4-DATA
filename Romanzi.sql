-- 1) Romanzi del 19esimo secolo 
SELECT titolo
FROM Romanzo 
WHERE AnnoPubblicazione >= 1800 AND Annopubblicazione < 1900

-- versione con between
select titolo
from romanzo 
where AnnoPubblicazione between 1800 and 1899


-- 2 titolo, autore e anno di pubblicazione dei romanzi russi ordinati per autore
-- e per lo stesso autore ordinati per anno di pubblicazione
SELECT r.Titolo, a.Nome, r.AnnoPubblicazione
FROM Romanzo r
JOIN Autore a
ON r.IdAutore = a.ID
where a.nazionalita = 'Russa'
ORDER BY a.Nome, r.AnnoPubblicazione

-- 3 mostrare i personaggi del romanzo protagonisti dei romanzi
select p.*
FROM Personaggio p
JOIN RomanzoPersonaggio rp
ON rp.idPersonaggio = p.id
where p.ruolo = 'Protagonista'

-- 3bis mostrare i personaggi e il titolo del romanzo protagonisti dei romanzi
select p.*, r.titolo
FROM Personaggio p
JOIN RomanzoPersonaggio rp
ON rp.idPersonaggio = p.id
JOIN Romanzo r
ON rp.idRomanzo = r.id
where p.ruolo = 'Protagonista'

-- 4 per ogni autore italiano l'anno del suo primo e dell'ultimo romanzo
select a.Nome, Min(r.AnnoPubblicazione) as 'Primo Romanzo', 
Max(r.AnnoPubblicazione) as 'Ultimo Romanzo'
FROM Autore a
JOIN Romanzo r
ON a.Id = r.AutoreId 
WHERE a.Nazione = 'Italia'
GROUP BY a.Nome

--5
SELECT P.NOME, COUNT(*) AS 'Numero Romanzi'
from Personaggio p
join RomanzoPersonaggio rp
ON p.id = rp.PersonaggioId
GROUP BY p.Nome
HAVING COUNT(*) > 1

--6 visualizzare tutti i romanzi contemporanei distinti per titolo
select titolo
from romanzo
where annopubblicazione between 2000 and 2022
group by titolo


select distinct titolo
from romanzo
where annopubblicazione between 2000 and 2022
