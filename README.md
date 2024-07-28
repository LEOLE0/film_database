# film_database

EXPLICATION : 

Exo 1: Nom et année de naissance des artistes nés avant 1950

Explication: Cette requête sélectionne les noms et les années de naissance des artistes nés avant 1950. La condition annéeNaiss < 1950 filtre les artistes en fonction de leur année de naissance. L’utilisation de la colonne nom et annéeNaiss nous donne les informations demandées.

Exo 2: Titre de tous les drames

Explication: Cette requête extrait les titres des films dont le genre est “Drame”. La condition genre = 'Drame' est utilisée pour filtrer les films en fonction de leur genre, garantissant que seuls les titres des films dramatiques sont récupérés.

Exo 3: Quels rôles a joué Bruce Willis

Explication: La requête utilise une jointure pour associer les rôles avec les acteurs. En joignant les tables role et artiste sur idActeur, et en filtrant par le nom et prénom de Bruce Willis, nous obtenons la liste des rôles (nomRôle) qu’il a joués.

Exo 4: Qui est le réalisateur de Memento

Explication: Cette requête utilise une jointure entre les tables film et artiste pour identifier le réalisateur du film “Memento”. En filtrant par le titre du film, nous récupérons le nom et le prénom du réalisateur correspondant (nom, prénom).

Exo 5: Quelles sont les notes obtenues par le film Fargo

Explication: Ici, nous utilisons une jointure pour associer les tables notation et film via idFilm afin d’obtenir toutes les notes attribuées au film “Fargo”. Le filtre film.titre = 'Fargo' limite les résultats aux notes de ce film.

Exo 6: Qui a joué le rôle de Chewbacca?

Explication: Cette requête identifie l’acteur qui a joué le rôle de Chewbacca en joignant les tables role et artiste. Le filtre role.nomRôle = 'Chewbacca' permet de sélectionner le bon rôle, et les colonnes nom et prénom de artiste fournissent les informations de l’acteur.

Exo 7: Dans quels films Bruce Willis a-t-il joué le rôle de John McClane?

Explication: Cette requête utilise deux jointures pour lier les rôles aux films et aux acteurs. En spécifiant que l’acteur est Bruce Willis (nom = 'Willis' AND prénom = 'Bruce') et le rôle est “John McClane”, la requête extrait les titres des films correspondants.

Exo 8: Nom des acteurs de ‘Sueurs froides’

Explication: En joignant les tables role et film, cette requête identifie les acteurs ayant joué dans “Sueurs froides”. Le filtre par film.titre permet de récupérer les noms et prénoms des acteurs pour ce film spécifique.

Exo 9: Quelles sont les films notés par l’internaute Prénom 0 Nom0

Explication: En joignant notation et film, cette requête identifie les films notés par un internaute spécifique, identifié par Prénom0 et Nom0. L’association avec la table internaute via email assure que nous récupérons les bonnes évaluations.

Exo 10: Films dont le réalisateur est Tim Burton, et l’un des acteurs Johnny Depp

Explication: La requête sélectionne les films réalisés par Tim Burton et ayant Johnny Depp comme acteur. Les jointures multiples lient les films aux réalisateurs et aux acteurs, et les conditions sur réalisateur.nom et acteur.nom filtrent les résultats pour ces deux personnalités.

Exo 11: Titre des films dans lesquels a joué Woody Allen. Donner aussi le rôle.

Explication: Cette requête récupère les titres de films et les rôles joués par Woody Allen. En joignant les tables role, film, et artiste, et en filtrant sur artiste.nom et artiste.prénom, nous obtenons les informations pertinentes.

Exo 12: Quel metteur en scène a tourné dans ses propres films ? Donner le nom, le rôle et le titre des films.

Explication: Cette requête identifie les réalisateurs qui ont également joué un rôle dans leurs propres films. Les jointures multiples entre film, artiste et role permettent de relier les réalisateurs aux rôles, et la condition réalisateur.idArtiste = acteur.idArtiste vérifie qu’ils sont la même personne.

Exo 13: Titre des films de Quentin Tarantino dans lesquels il n’a pas joué

Explication: La requête cherche les films réalisés par Quentin Tarantino dans lesquels il n’a pas joué. En utilisant un LEFT JOIN et en vérifiant role.idFilm IS NULL, la requête filtre les films où Tarantino n’apparaît pas en tant qu’acteur.

Exo 14: Quel metteur en scène a tourné en tant qu’acteur ? Donner le nom, le rôle et le titre des films dans lesquels cet artiste a joué.

Explication: Similaire à la question 12, mais ici, nous cherchons les films où le réalisateur a également joué un rôle mais n’est pas la même personne que l’acteur (réalisateur.idArtiste != acteur.idArtiste).

Exo 15: Donnez les films de Hitchcock sans James Stewart

Explication: La requête récupère les films réalisés par Hitchcock qui n’incluent pas James Stewart. Les conditions sur réalisateur.nom et acteur.nom/acteur.prénom filtrent les films sans cet acteur spécifique.

Exo 16: Dans quels films le réalisateur a-t-il le même prénom que l’un des interprètes ?

Explication: En utilisant les jointures pour relier les réalisateurs et les acteurs via les films, cette requête vérifie si le prénom du réalisateur correspond à celui d’un acteur (réalisateur.prénom = acteur.prénom) tout en s’assurant qu’ils ne sont pas la même personne (réalisateur.idArtiste != acteur.idArtiste).

Exo 17: Les films sans rôle

Explication: La requête identifie les films sans rôle attribué en utilisant un LEFT JOIN entre film et role et en filtrant par role.idFilm IS NULL, indiquant que ces films n’ont pas d’entrées correspondantes dans la table role.

Exo 18: Quelles sont les films non notés par l’internaute Prénom1 Nom1

Explication: Cette requête trouve les films que l’internaute “Prénom1 Nom1” n’a pas notés. En utilisant un LEFT JOIN avec notation et internaute, et en vérifiant que notation.note IS NULL, nous isolons les films non notés par cet internaute.

Exo 19: Quels acteurs n’ont jamais réalisé de film ?

Explication: La requête identifie les acteurs n’ayant jamais réalisé de film en utilisant une LEFT JOIN entre artiste et film sur idRéalisateur, et en vérifiant que film.idFilm IS NULL. La sous-requête EXISTS assure que l’artiste a au moins un rôle.

Exo 20: Quelle est la moyenne des notes de Memento

Explication: Cette requête calcule la moyenne des notes du film “Memento” en joignant notation et film et en filtrant par le titre du film. La fonction AVG est utilisée pour obtenir la moyenne des notes.

Exo 21: id, nom et prénom des réalisateurs, et nombre de films qu’ils ont tournés.

Explication: En groupant par les identifiants des réalisateurs, cette requête compte le nombre de films qu’ils ont réalisés (COUNT(film.idFilm)) et retourne les informations pertinentes pour chaque réalisateur.

Exo 22: Nom et prénom des réalisateurs qui ont tourné au moins deux films.

Explication: Cette requête utilise la clause HAVING COUNT(film.idFilm) >= 2 après avoir groupé par les réalisateurs pour filtrer ceux ayant réalisé au moins deux films. La fonction COUNT est utilisée pour compter les films par réalisateur.

Exo 23: Quels films ont une moyenne des notes supérieure à 7

Explication: Cette requête calcule la moyenne des notes pour chaque film et filtre ceux dont la moyenne est supérieure à 7 (HAVING AVG(notation.note) > 7). Les jointures et groupements appropriés sont utilisés pour lier les films aux notes.