# Apprendre SQL et créez une base de données d'une plateforme de streaming 🎵

---

## 1. Pourquoi les bases de données relationnelles ?

Imaginez Spotify, Deezer ou Apple Music. Chaque jour, des millions d'utilisateurs écoutent des morceaux, créent des playlists et suivent des artistes. Toutes ces informations — titres, artistes, durées, nombre d'écoutes — doivent être stockées, organisées et accessibles en quelques millisecondes.

C'est exactement le rôle d'une **base de données relationnelle** : stocker des données dans des **tables** reliées entre elles, et les interroger grâce à un langage universel appelé **SQL** (*Structured Query Language*).

### Une table, c'est quoi concrètement ?

Une table ressemble à un tableur : elle a des **colonnes** (les catégories d'information) et des **lignes** (les enregistrements).

| id | titre               | artiste         | streams_millions | annee |
|----|---------------------|-----------------|------------------|-------|
| 1  | Blinding Lights     | The Weeknd      | 4300             | 2020  |
| 2  | Shape of You        | Ed Sheeran      | 3900             | 2017  |
| 3  | Someone Like You    | Adele           | 2900             | 2011  |
| 4  | Dernière danse      | Indila          | 1500             | 2013  |

Ici, chaque ligne représente un morceau. Chaque colonne a un **type de données** :

- `id` → `INTEGER` (nombre entier, sert d'identifiant unique)
- `titre` → `TEXT` (chaîne de caractères)
- `artiste` → `TEXT`
- `streams_millions` → `INTEGER` (nombre d'écoutes en millions)
- `annee` → `INTEGER` (année de sortie)

L'ensemble des colonnes et de leurs types s'appelle le **schéma** de la table.

---

## 2. SQL : le langage pour parler à une base de données

SQL est un langage **déclaratif** : vous décrivez *ce que* vous voulez obtenir, pas *comment* l'obtenir. Il est utilisé par la quasi-totalité des applications web, des banques aux réseaux sociaux.

### Les principaux SGBDR (Systèmes de Gestion de Bases de Données Relationnelles)

| SGBDR       | Particularité                                               |
|-------------|-------------------------------------------------------------|
| PostgreSQL  | Open source, riche en fonctionnalités, très utilisé en production |
| MySQL       | Open source, très répandu dans le web (WordPress, etc.)     |
| SQLite      | Léger, stocke tout dans un seul fichier, idéal pour le mobile |
| Oracle DB   | Propriétaire, utilisé dans la finance et les grandes entreprises |
| SQL Server  | Propriétaire (Microsoft), courant en entreprise             |

Dans cette activité, nous utilisons **SQLite**, le SGBDR le plus complet en open source.

---

## 3. Mise en place de l'environnement

Rendez-vous sur [sqliteonline.com](https://sqliteonline.com) et sélectionnez **SQLite** dans le menu de gauche.

**Prise en main rapide :**

1. Écrivez vos requêtes SQL dans la zone de texte centrale.
2. Cliquez sur **Run SQL** pour exécuter.
3. Les résultats s'affichent en bas de l'écran.
4. Vous pouvez exporter votre base via **Download DB** pour la sauvegarder.

---

## 4. Les instructions SQL — Comprendre la syntaxe

Une **instruction SQL** est une commande que la base de données reconnaît. Elle se termine toujours par un **point-virgule** `;`.

```sql
CREATE TABLE morceaux (
   id INTEGER,
   titre TEXT,
   artiste TEXT,
   streams_millions INTEGER,
   annee INTEGER
);
```

Décomposons cette instruction :

1. `CREATE TABLE` est une **clause** (une commande SQL). Par convention, on écrit les clauses en MAJUSCULES.
2. `morceaux` est le **nom de la table** que l'on crée.
3. Les parenthèses contiennent les **paramètres** : la liste des colonnes avec leurs types de données.

> 💡 **Bonne pratique** : une instruction peut s'écrire sur une seule ligne, mais la répartir sur plusieurs lignes la rend beaucoup plus lisible.

---

## 5. CREATE — Créer une table

L'instruction `CREATE TABLE` crée une nouvelle table dans la base de données.

### À vous de jouer ! 🤠

**Étape 1** — Vérifiez qu'aucune table `morceaux` n'existe déjà :

```sql
SELECT * FROM morceaux;
```

Vous devriez obtenir :

```
ERROR: relation "morceaux" does not exist
```

C'est normal ! La table n'existe pas encore.

**Étape 2** — Créez la table `morceaux` :

```sql
CREATE TABLE morceaux (
   id INTEGER,
   titre TEXT,
   artiste TEXT,
   streams_millions INTEGER,
   annee INTEGER
);
```

La table est créée mais elle est vide. Nous allons la remplir dans l'étape suivante.

---

## 6. INSERT — Ajouter des données

L'instruction `INSERT INTO` ajoute une nouvelle ligne (un enregistrement) dans une table.

```sql
INSERT INTO morceaux (id, titre, artiste, streams_millions, annee)
VALUES (1, 'Blinding Lights', 'The Weeknd', 4300, 2020);
```

Décomposons :

- `INSERT INTO morceaux` → on insère dans la table `morceaux`.
- `(id, titre, artiste, streams_millions, annee)` → les colonnes ciblées.
- `VALUES (...)` → les valeurs correspondantes, dans le même ordre.

> ⚠️ Les chaînes de texte sont toujours entre **guillemets simples** `' '` en SQL.

### À vous de jouer ! 🤠

Insérez les 4 morceaux suivants dans la table. Copiez et exécutez ce code :

```sql
INSERT INTO morceaux (id, titre, artiste, streams_millions, annee)
VALUES (1, 'Blinding Lights', 'The Weeknd', 4300, 2020);

INSERT INTO morceaux (id, titre, artiste, streams_millions, annee)
VALUES (2, 'Shape of You', 'Ed Sheeran', 3900, 2017);

INSERT INTO morceaux (id, titre, artiste, streams_millions, annee)
VALUES (3, 'Someone Like You', 'Adele', 2900, 2011);

INSERT INTO morceaux (id, titre, artiste, streams_millions, annee)
VALUES (4, 'Dernière danse', 'Indila', 1500, 2013);
```

**Question** : Combien de lignes contient maintenant la table `morceaux` ?

<details>
<summary>Réponse 🔑</summary>
<p>La table contient <b>4 lignes</b>, une pour chaque morceau inséré.</p>
</details>

---

## 7. SELECT — Lire les données

L'instruction `SELECT` permet d'extraire des données d'une table. C'est la requête que vous utiliserez le plus souvent.

**Sélectionner une colonne spécifique :**

```sql
SELECT titre FROM morceaux;
```

**Sélectionner toutes les colonnes avec `*` :**

```sql
SELECT * FROM morceaux;
```

Le caractère `*` est un **joker** : il sélectionne toutes les colonnes d'un coup. Le résultat renvoyé s'appelle un **jeu de résultats** (*result set*).

### À vous de jouer ! 🤠

1. Affichez uniquement les noms des artistes :

```sql
SELECT artiste FROM morceaux;
```

2. Affichez toutes les informations de la table :

```sql
SELECT * FROM morceaux;
```

3. Affichez uniquement les titres et le nombre de streams :

```sql
SELECT titre, streams_millions FROM morceaux;
```

**Question** : Quelles sont les deux clauses utilisées dans ces requêtes ?

<details>
<summary>Réponse 🔑</summary>
<p><b>SELECT</b> et <b>FROM</b> sont les deux clauses. <code>SELECT</code> indique quoi récupérer, <code>FROM</code> indique dans quelle table chercher.</p>
</details>

---

## 8. ALTER — Modifier la structure d'une table

L'instruction `ALTER TABLE` permet de modifier une table existante, par exemple pour y ajouter une colonne.

```sql
ALTER TABLE morceaux
ADD COLUMN genre TEXT;
```

Décomposons :

- `ALTER TABLE morceaux` → on modifie la table `morceaux`.
- `ADD COLUMN genre TEXT` → on ajoute une colonne `genre` de type texte.

Les lignes déjà existantes auront la valeur `NULL` (donnée manquante) pour cette nouvelle colonne.

### À vous de jouer ! 🤠

Ajoutez la colonne `genre` et vérifiez le résultat :

```sql
ALTER TABLE morceaux
ADD COLUMN genre TEXT;

SELECT * FROM morceaux;
```

**Question** : Que vaut la colonne `genre` pour les morceaux existants ?

<details>
<summary>Réponse 🔑</summary>
<p>La colonne <code>genre</code> vaut <b>NULL</b> pour toutes les lignes existantes, car aucune valeur n'a encore été définie.</p>
</details>

---

## 9. UPDATE — Modifier des données existantes

L'instruction `UPDATE` permet de modifier une ou plusieurs lignes.

```sql
UPDATE morceaux
SET genre = 'Pop'
WHERE id = 2;
```

Décomposons :

- `UPDATE morceaux` → on modifie des données dans la table `morceaux`.
- `SET genre = 'Pop'` → on définit la valeur de la colonne `genre` à `'Pop'`.
- `WHERE id = 2` → on cible uniquement la ligne dont l'`id` vaut 2 (Shape of You).

> ⚠️ **Attention** : sans clause `WHERE`, toutes les lignes de la table seront modifiées !

### À vous de jouer ! 🤠

Renseignez le genre de chaque morceau et vérifiez :

```sql
UPDATE morceaux SET genre = 'Synthwave' WHERE id = 1;
UPDATE morceaux SET genre = 'Pop' WHERE id = 2;
UPDATE morceaux SET genre = 'Soul' WHERE id = 3;
UPDATE morceaux SET genre = 'Pop française' WHERE id = 4;

SELECT * FROM morceaux;
```

Vous devriez voir les 4 morceaux avec leur genre renseigné.

---

## 10. DELETE — Supprimer des données

L'instruction `DELETE FROM` supprime une ou plusieurs lignes d'une table.

```sql
DELETE FROM morceaux
WHERE streams_millions < 2000;
```

Décomposons :

- `DELETE FROM morceaux` → on supprime des lignes de la table `morceaux`.
- `WHERE streams_millions < 2000` → on cible les morceaux avec moins de 2 000 millions de streams.

### À vous de jouer ! 🤠

Supprimez les morceaux ayant moins de 2 milliards de streams et vérifiez :

```sql
DELETE FROM morceaux
WHERE streams_millions < 2000;

SELECT * FROM morceaux;
```

**Question** : Combien de morceaux restent dans la table ? Lesquels ont été supprimés ?

<details>
<summary>Réponse 🔑</summary>
<p>Il reste <b>2 morceaux</b> : Blinding Lights (4300M) et Shape of You (3900M).</p>
<p>Someone Like You (2900M) et Dernière danse (1500M) ont été supprimés. Attention : 2900 est bien supérieur à 2000, donc seul Dernière danse est supprimé ! Il reste en réalité <b>3 morceaux</b>.</p>
<p>Relisez bien la condition : <code>< 2000</code> ne supprime que les lignes <b>strictement inférieures</b> à 2000.</p>
</details>

---

## 11. Récapitulatif — Les 6 commandes essentielles

| Commande       | Rôle                              | Exemple rapide                            |
|----------------|-----------------------------------|-------------------------------------------|
| `CREATE TABLE` | Créer une table                   | `CREATE TABLE morceaux (...);`            |
| `INSERT INTO`  | Ajouter des lignes                | `INSERT INTO morceaux VALUES (...);`      |
| `SELECT`       | Lire / interroger les données     | `SELECT * FROM morceaux;`                 |
| `ALTER TABLE`  | Modifier la structure d'une table | `ALTER TABLE morceaux ADD COLUMN ...;`    |
| `UPDATE`       | Modifier des données existantes   | `UPDATE morceaux SET genre = '...' WHERE ...;` |
| `DELETE FROM`  | Supprimer des lignes              | `DELETE FROM morceaux WHERE ...;`         |

---

## 12. Défi final — Construisez votre propre base ! 🏆

Maintenant que vous maîtrisez les bases, mettez-les en pratique. Réalisez les étapes suivantes **sans regarder les solutions** :

1. Créez une table `playlists` avec les colonnes suivantes :
   - `id` (INTEGER)
   - `nom` (TEXT)
   - `createur` (TEXT)
   - `nb_morceaux` (INTEGER)

2. Insérez 3 playlists de votre choix.

3. Affichez toutes les playlists.

4. Ajoutez une colonne `theme` de type TEXT.

5. Mettez à jour la colonne `theme` pour chaque playlist.

6. Supprimez les playlists qui contiennent moins de 10 morceaux.

7. Affichez le résultat final.

<details>
<summary>Solution complète 🔑</summary>

```sql
-- Étape 1 : Créer la table
CREATE TABLE playlists (
   id INTEGER,
   nom TEXT,
   createur TEXT,
   nb_morceaux INTEGER
);

-- Étape 2 : Insérer des données
INSERT INTO playlists (id, nom, createur, nb_morceaux)
VALUES (1, 'Chill Vibes', 'Léa', 45);

INSERT INTO playlists (id, nom, createur, nb_morceaux)
VALUES (2, 'Workout Mix', 'Karim', 8);

INSERT INTO playlists (id, nom, createur, nb_morceaux)
VALUES (3, 'Road Trip', 'Emma', 32);

-- Étape 3 : Afficher
SELECT * FROM playlists;

-- Étape 4 : Ajouter une colonne
ALTER TABLE playlists
ADD COLUMN theme TEXT;

-- Étape 5 : Mettre à jour
UPDATE playlists SET theme = 'Détente' WHERE id = 1;
UPDATE playlists SET theme = 'Sport' WHERE id = 2;
UPDATE playlists SET theme = 'Voyage' WHERE id = 3;

-- Étape 6 : Supprimer
DELETE FROM playlists
WHERE nb_morceaux < 10;

-- Étape 7 : Résultat final
SELECT * FROM playlists;
```

</details>

---

**Bravo !** 🎉 Vous savez maintenant créer une base de données, y insérer des données, les lire, les modifier et les supprimer. Ce sont les fondations de SQL — la suite vous permettra de filtrer, trier, regrouper et croiser des tables pour répondre à des questions bien plus complexes.