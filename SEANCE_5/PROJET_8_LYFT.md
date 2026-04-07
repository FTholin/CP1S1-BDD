# Analyser les données Lyft avec SQL

Mettons en pratique ce que nous avons appris sur les jointures en combinant des lignes provenant de différentes tables.

Vous êtes analyste de données chez **Lyft**, une plateforme de service de voitures de transport avec chauffeur (VTC). Pour ce projet, vous disposez de quatre tables :

- `courses` — informations sur chaque trajet effectué
- `chauffeurs` — profil des chauffeurs actifs
- `chauffeur2` — nouveaux chauffeurs enregistrés ce mois-ci
- `voitures` — parc de véhicules disponibles

---

## À vous de jouer !

### Partie 1 — Découverte du schéma

**1.** Chargez le fichier `DATABASE_PROJET_LYFT.sql` dans votre environnement SQL.

**2.** Affichez le contenu de chacune des quatre tables avec `SELECT * FROM <table>;` et observez leur structure.

**3.** Identifiez les clés primaires :
- Quelle est la clé primaire de la table `courses` ?
- Quelle est la clé primaire de la table `chauffeurs` ?
- Quelle est la clé primaire de la table `voitures` ?

---

### Partie 2 — Jointures

**4.** Tentez une jointure entre `chauffeurs` et `voitures` avec une `CROSS JOIN`.

> Ces deux tables ne partagent aucune colonne en commun. Que produit ce type de jointure ? Pourquoi le résultat est-il peu exploitable ?

**5.** Créez un **journal des trajets** en associant chaque course à son chauffeur.

- La colonne de jointure côté `courses` est `id_chauffeur` ; côté `chauffeurs` c'est `id`.
- Utilisez une `LEFT JOIN` en prenant `courses` comme table de gauche.
- Pourquoi choisir une `LEFT JOIN` plutôt qu'une `INNER JOIN` ici ?

> **Observation attendue :** La course `1004` retourne `NULL` pour le chauffeur car son `id_chauffeur` (105) n'existe que dans `chauffeur2`, pas encore dans `chauffeurs`. C'est précisément le cas que la `LEFT JOIN` permet de détecter.

**6.** Créez un lien entre les courses et les véhicules utilisés.

- La colonne de jointure côté `courses` est `id_voiture` ; côté `voitures` c'est `id`.
- Utilisez une `INNER JOIN`.

**7.** De nouveaux chauffeurs sont arrivés ce mois-ci, enregistrés dans la table `chauffeur2`.

- Empilez les tables `chauffeurs` et `chauffeur2` pour obtenir la liste complète de tous les chauffeurs.
- Utilisez `UNION ALL` pour conserver tous les enregistrements, y compris les éventuels doublons.

---

### Partie 3 — Requêtes & Agrégats

**8.** Quel est le **prix moyen** d'une course ?

**9.** Lyft souhaite lancer une campagne e-mail pour les chauffeurs peu actifs.

- Trouvez tous les chauffeurs qui ont effectué **moins de 500 trajets** au total.

**10.** Calculez le **nombre de voitures actuellement actives** (statut `'active'`).

**11.** C'est l'heure du rappel de sécurité pour les véhicules les plus sollicités.

- Trouvez les **2 voitures** ayant le plus grand nombre de `total_trajets_complets`.

**12.** Affichez tous les détails des courses effectuées **le 5 décembre 2017**.

**13.** Quel est le **nombre total de trajets complets** effectués par l'ensemble du parc de voitures ?

**14.** Quel est le **total des prix** de toutes les courses effectuées par **Laura Breiman** ?

> Conseil : joignez `courses` et `chauffeurs`, puis filtrez sur le prénom et le nom.

**15.** Quel est le **pseudo et la note** du chauffeur ayant réalisé la course **au prix le plus élevé** ?

**16.** Quel est le **nombre total de trajets** effectués par les chauffeurs ayant une note **supérieure à 4.5** ?

**17.** Quel est le **nombre total de trajets** effectués par les chauffeurs ayant été **référencés** (colonne `reference` non nulle) ?

**18.** Parmi les chauffeurs bien notés (note > 4.5), combien ont effectué **plus de 500 trajets** ? Affichez leur nombre total de trajets cumulés.

**19.** Quel est le **prix moyen** des courses effectuées le 5 décembre 2017 ?

**20.** Quel est le **modèle de voiture** ayant effectué le plus grand nombre de trajets complets ?

> Si plusieurs voitures partagent le même modèle, agrégez par `modele` et comparez les totaux.

**21.** Quel est le **total des prix** de toutes les courses effectuées avec la voiture ayant le plus grand nombre de `total_trajets_complets` ?

> Conseil : identifiez d'abord l'`id` de cette voiture, puis filtrez les courses correspondantes.
