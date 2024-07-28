-- Exo 1: Nom et année de naissance des artistes nés avant 1950
SELECT nom, annéeNaiss
FROM artiste
WHERE annéeNaiss < 1950;

-- Exo 2: Titre de tous les drames
SELECT titre
FROM film
WHERE genre = 'Drame';

-- Exo 3: Quels rôles a joué Bruce Willis
SELECT role.nomRôle
FROM role
JOIN artiste ON role.idActeur = artiste.idArtiste
WHERE artiste.nom = 'Willis' AND artiste.prénom = 'Bruce';

-- Exo 4: Qui est le réalisateur de Memento
SELECT artiste.nom, artiste.prénom
FROM film
JOIN artiste ON film.idRéalisateur = artiste.idArtiste
WHERE film.titre = 'Memento';

-- Exo 5: Quelles sont les notes obtenues par le film Fargo
SELECT note
FROM notation
JOIN film ON notation.idFilm = film.idFilm
WHERE film.titre = 'Fargo';

-- Exo 6: Qui a joué le rôle de Chewbacca?
SELECT artiste.nom, artiste.prénom
FROM role
JOIN artiste ON role.idActeur = artiste.idArtiste
WHERE role.nomRôle = 'Chewbacca';

-- Exo 7: Dans quels films Bruce Willis a-t-il joué le rôle de John McClane?
SELECT film.titre
FROM role
JOIN film ON role.idFilm = film.idFilm
JOIN artiste ON role.idActeur = artiste.idArtiste
WHERE artiste.nom = 'Willis' AND artiste.prénom = 'Bruce' AND role.nomRôle = 'John McClane';

-- Exo 8: Nom des acteurs de 'Sueurs froides'
SELECT artiste.nom, artiste.prénom
FROM role
JOIN film ON role.idFilm = film.idFilm
JOIN artiste ON role.idActeur = artiste.idArtiste
WHERE film.titre = 'Sueurs froides';

-- Exo 9: Quelles sont les films notés par l'internaute Prénom 0 Nom0
SELECT film.titre
FROM notation
JOIN film ON notation.idFilm = film.idFilm
JOIN internaute ON notation.email = internaute.email
WHERE internaute.prénom = 'Prénom0' AND internaute.nom = 'Nom0';

-- Exo 10: Films dont le réalisateur est Tim Burton, et l’un des acteurs Johnny Depp
FROM film
JOIN artiste AS réalisateur ON film.idRéalisateur = réalisateur.idArtiste
JOIN role ON film.idFilm = role.idFilm
JOIN artiste AS acteur ON role.idActeur = acteur.idArtiste
WHERE réalisateur.nom = 'Burton' AND réalisateur.prénom = 'Tim'
  AND acteur.nom = 'Depp' AND acteur.prénom = 'Johnny';

-- Exo 11: Titre des films dans lesquels a joué Woody Allen. Donner aussi le rôle.
SELECT film.titre, role.nomRôle
FROM role
JOIN film ON role.idFilm = film.idFilm
JOIN artiste ON role.idActeur = artiste.idArtiste
WHERE artiste.nom = 'Allen' AND artiste.prénom = 'Woody';

-- Exo 12: Quel metteur en scène a tourné dans ses propres films ? Donner le nom, le rôle et le titre des films.
SELECT réalisateur.nom, réalisateur.prénom, role.nomRôle, film.titre
FROM film
JOIN artiste AS réalisateur ON film.idRéalisateur = réalisateur.idArtiste
JOIN role ON film.idFilm = role.idFilm
JOIN artiste AS acteur ON role.idActeur = acteur.idArtiste
WHERE réalisateur.idArtiste = acteur.idArtiste;

-- Exo 13: Titre des films de Quentin Tarantino dans lesquels il n’a pas joué
SELECT film.titre
FROM film
JOIN artiste AS réalisateur ON film.idRéalisateur = réalisateur.idArtiste
LEFT JOIN role ON film.idFilm = role.idFilm AND role.idActeur = réalisateur.idArtiste
WHERE réalisateur.nom = 'Tarantino' AND réalisateur.prénom = 'Quentin'
  AND role.idFilm IS NULL;

-- Exo 14: Quel metteur en scène a tourné en tant qu’acteur ? Donner le nom, le rôle et le titre des films dans lesquels cet artiste a joué.
SELECT réalisateur.nom, réalisateur.prénom, role.nomRôle, film.titre
FROM film
JOIN artiste AS réalisateur ON film.idRéalisateur = réalisateur.idArtiste
JOIN role ON film.idFilm = role.idFilm
JOIN artiste AS acteur ON role.idActeur = acteur.idArtiste
WHERE réalisateur.idArtiste != acteur.idArtiste;

-- Exo 15: Donnez les films de Hitchcock sans James Stewart
SELECT film.titre
FROM film
JOIN artiste AS réalisateur ON film.idRéalisateur = réalisateur.idArtiste
LEFT JOIN role ON film.idFilm = role.idFilm
LEFT JOIN artiste AS acteur ON role.idActeur = acteur.idArtiste
WHERE réalisateur.nom = 'Hitchcock' AND acteur.nom != 'Stewart' AND acteur.prénom != 'James';

-- Exo 16: Dans quels films le réalisateur a-t-il le même prénom que l’un des interprètes ?
SELECT film.titre, réalisateur.nom AS réalisateur_nom, réalisateur.prénom AS réalisateur_prénom, acteur.nom AS acteur_nom, acteur.prénom AS acteur_prénom
FROM film
JOIN artiste AS réalisateur ON film.idRéalisateur = réalisateur.idArtiste
JOIN role ON film.idFilm = role.idFilm
JOIN artiste AS acteur ON role.idActeur = acteur.idArtiste
WHERE réalisateur.prénom = acteur.prénom AND réalisateur.idArtiste != acteur.idArtiste;

-- Exo 17: Les films sans rôle
SELECT film.titre
FROM film
LEFT JOIN role ON film.idFilm = role.idFilm
WHERE role.idFilm IS NULL;

-- Exo 18: Quelles sont les films non notés par l'internaute Prénom1 Nom1SELECT film.titre
FROM film
LEFT JOIN notation ON film.idFilm = notation.idFilm
LEFT JOIN internaute ON notation.email = internaute.email
WHERE internaute.prénom = 'Prénom1' AND internaute.nom = 'Nom1' AND notation.note IS NULL

-- Exo 19: Quels acteurs n’ont jamais réalisé de film ?
SELECT DISTINCT acteur.nom, acteur.prénom
FROM artiste AS acteur
LEFT JOIN film ON acteur.idArtiste = film.idRéalisateur
WHERE film.idFilm IS NULL
AND EXISTS (
    SELECT 1 FROM role WHERE role.idActeur = acteur.idArtiste
);

-- Exo 20: Quelle est la moyenne des notes de Memento
SELECT AVG(notation.note) AS moyenne
FROM notation
JOIN film ON notation.idFilm = film.idFilm
WHERE film.titre = 'Memento';

-- Exo 21: id, nom et prénom des réalisateurs, et nombre de films qu’ils ont tournés.
SELECT artiste.idArtiste, artiste.nom, artiste.prénom, COUNT(film.idFilm) AS nombre_films
FROM artiste
JOIN film ON artiste.idArtiste = film.idRéalisateur
GROUP BY artiste.idArtiste, artiste.nom, artiste.prénom;

-- Exo 22: Nom et prénom des réalisateurs qui ont tourné au moins deux films.
SELECT artiste.nom, artiste.prénom
FROM artiste
JOIN film ON artiste.idArtiste = film.idRéalisateur
GROUP BY artiste.idArtiste, artiste.nom, artiste.prénom
HAVING COUNT(film.idFilm) >= 2;

-- Exo 23: Quels films ont une moyenne des notes supérieure à 7
SELECT film.titre
FROM film
JOIN notation ON film.idFilm = notation.idFilm
GROUP BY film.idFilm, film.titre
HAVING AVG(notation.note) > 7;