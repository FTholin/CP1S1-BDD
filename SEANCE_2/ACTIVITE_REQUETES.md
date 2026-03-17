# 🎬 Les requêtes SQL — Interroger une base de données

## Introduction

L'un des principaux objectifs de SQL est de **récupérer des informations** stockées dans une base de données. C'est ce qu'on appelle une **requête** (*query*). Les requêtes permettent de poser des questions à la base de données et d'obtenir un ensemble de résultats pertinents.

Dans cette activité, nous allons interroger une table appelée `films` qui contient les plus grands succès du cinéma.

> 💡 Anecdote culture : IBM a lancé SQL sous le nom de SEQUEL (*Structured English QUEry Language*) dans les années 1970 pour interroger les bases de données.

---

## Mise en place

Copiez-collez et exécutez le code suivant dans votre éditeur SQL pour créer et remplir la table `films` :

```sql
CREATE TABLE films (
   id INTEGER,
   nom TEXT,
   annee INTEGER,
   genre TEXT,
   note_imdb REAL,
   recette_millions INTEGER
);

INSERT INTO films VALUES (1, 'Inception', 2010, 'science-fiction', 8.8, 836);
INSERT INTO films VALUES (2, 'Interstellar', 2014, 'science-fiction', 8.7, 677);
INSERT INTO films VALUES (3, 'The Dark Knight', 2008, 'action', 9.0, 1005);
INSERT INTO films VALUES (4, 'Parasite', 2019, 'thriller', 8.5, 263);
INSERT INTO films VALUES (5, 'Spider-Man: No Way Home', 2021, 'action', 8.2, 1916);
INSERT INTO films VALUES (6, 'Oppenheimer', 2023, 'drame', 8.3, 952);
INSERT INTO films VALUES (7, 'Dune', 2021, 'science-fiction', 8.0, 434);
INSERT INTO films VALUES (8, 'Dune: Part Two', 2024, 'science-fiction', 8.5, 711);
INSERT INTO films VALUES (9, 'Avengers: Endgame', 2019, 'action', 8.4, 2799);
INSERT INTO films VALUES (10, 'Joker', 2019, 'drame', 8.4, 1074);
INSERT INTO films VALUES (11, 'Top Gun: Maverick', 2022, 'action', 8.2, 1496);
INSERT INTO films VALUES (12, 'Everything Everywhere All at Once', 2022, 'comédie', 7.8, 141);
INSERT INTO films VALUES (13, 'Barbie', 2023, 'comédie', 6.8, 1442);
INSERT INTO films VALUES (14, 'The Batman', 2022, 'action', 7.8, 772);
INSERT INTO films VALUES (15, 'La La Land', 2016, 'romance', 8.0, 447);
INSERT INTO films VALUES (16, 'Get Out', 2017, 'horreur', 7.7, 255);
INSERT INTO films VALUES (17, 'Tenet', 2020, 'science-fiction', 7.3, 365);
INSERT INTO films VALUES (18, 'Nope', 2022, 'horreur', 6.8, 171);
INSERT INTO films VALUES (19, 'Le Loup de Wall Street', 2013, 'drame', 8.2, 392);
INSERT INTO films VALUES (20, 'Avatar: La Voie de l''eau', 2022, 'science-fiction', 7.5, 2320);
INSERT INTO films VALUES (21, 'Fast & Furious X', 2023, 'action', 5.6, 714);
INSERT INTO films VALUES (22, 'Don''t Look Up', 2021, 'comédie', 7.2, 0);
INSERT INTO films VALUES (23, 'The Whale', 2022, 'drame', 7.7, 55);
INSERT INTO films VALUES (24, '1917', 2019, 'drame', 8.2, 384);
INSERT INTO films VALUES (25, 'Gladiator II', 2024, 'action', NULL, 451);
```

---

## Select

### Rappel

`SELECT` est la commande utilisée chaque fois que vous voulez interroger des données. Le caractère `*` sélectionne **toutes les colonnes**.

Pour ne sélectionner que certaines colonnes, on les sépare par des virgules :

```sql
SELECT colonne1, colonne2
FROM nom_table;
```

Les sauts de ligne ne changent rien en SQL. On écrit `FROM` sur une nouvelle ligne uniquement pour faciliter la lecture.

### À vous de jouer ! 🤠

**1.** Familiarisez-vous avec la table. Dans l'éditeur, tapez :

```sql
SELECT * FROM films;
```

Quels sont les noms des colonnes ?

<details>
<summary>Vérification ✅</summary>
<p>Les colonnes sont : <code>id</code>, <code>nom</code>, <code>annee</code>, <code>genre</code>, <code>note_imdb</code>, <code>recette_millions</code>.</p>
</details>

**2.** Sélectionnez **uniquement** les colonnes `nom` et `genre`.

<details>
<summary>Rappel 🔑</summary>
<p>Les colonnes à sélectionner se placent après <code>SELECT</code>, séparées par des virgules.</p>
</details>

**3.** Modifiez votre requête pour qu'elle renvoie les colonnes `nom`, `genre` **et** `annee`.

---

## As

Observez le code ci-dessous :

```sql
SELECT nom AS 'Titre'
FROM films;
```

Pouvez-vous deviner ce que fait `AS` ?

`AS` est un mot-clé qui permet de **renommer une colonne** dans le résultat en utilisant un **alias**. Le nouveau nom se place entre guillemets simples.

Quelques points importants :

- La meilleure pratique est d'entourer vos alias de **guillemets simples**.
- `AS` ne renomme **pas** la colonne dans la table. L'alias apparaît **uniquement dans le résultat**.

### À vous de jouer ! 🤠

**1.** Sélectionnez la colonne `nom` et renommez-la avec un alias de votre choix :

```sql
SELECT nom AS '______'
FROM films;
```

Observez dans le résultat : le nom de la colonne est maintenant votre alias.

**2.** Modifiez la requête pour sélectionner la colonne `note_imdb` et la renommer en `'Note IMDb'`.

<details>
<summary>Rappel 🔑</summary>
<p>Remplacez le nom de la colonne après <code>SELECT</code> et changez l'alias entre guillemets simples après <code>AS</code>.</p>
</details>

---

## Distinct

Quand on examine les données d'une table, il est souvent utile de connaître les **valeurs uniques** qui existent dans une colonne.

`DISTINCT` renvoie les valeurs uniques en filtrant tous les doublons.

Exemple :

```sql
SELECT DISTINCT genre
FROM films;
```

Cette requête renvoie la liste des genres **sans doublon**.

### À vous de jouer ! 🤠

**1.** Testez la requête ci-dessus. Combien de genres différents sont présents dans la table ?

<details>
<summary>Vérification ✅</summary>
<p><b>7 genres</b> : science-fiction, action, thriller, drame, comédie, romance, horreur.</p>
</details>

**2.** Modifiez la requête pour afficher les valeurs uniques de la colonne `annee`.

En quelle année y a-t-il le plus de films dans la table ?

<details>
<summary>Indice 🔑</summary>
<p><code>DISTINCT</code> vous montre les années présentes, mais pas combien de films par année. Pour répondre, revenez à votre <code>SELECT * FROM films;</code> et comptez manuellement.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>L'année <b>2022</b> domine avec <b>6 films</b> (Top Gun: Maverick, Everything Everywhere All at Once, The Batman, Nope, Avatar: La Voie de l'eau, The Whale).</p>
</details>

---

## Where

La clause `WHERE` permet de **filtrer** les résultats pour n'obtenir que les données qui nous intéressent.

```sql
SELECT *
FROM films
WHERE note_imdb > 8;
```

`WHERE` filtre le jeu de résultats pour n'inclure que les lignes où la **condition est vraie**.

Les **opérateurs de comparaison** utilisables avec `WHERE` sont :

| Opérateur | Signification         |
|-----------|-----------------------|
| `=`       | égal à                |
| `!=`      | différent de          |
| `>`       | supérieur à           |
| `<`       | inférieur à           |
| `>=`      | supérieur ou égal à   |
| `<=`      | inférieur ou égal à   |

### À vous de jouer ! 🤠

**1.** Affichez tous les films qui ont une note IMDb **inférieure à 7**.

```sql
SELECT *
FROM films
WHERE note_imdb < 7;
```

Combien de films obtiennent cette mauvaise note ?

<details>
<summary>Vérification ✅</summary>
<p><b>3 films</b> : Barbie (6.8), Nope (6.8) et Fast &amp; Furious X (5.6). Gladiator II n'apparaît pas car sa note est <code>NULL</code> (une comparaison avec <code>NULL</code> ne renvoie jamais vrai).</p>
</details>

**2.** Modifiez la requête pour récupérer tous les films sortis **après 2020** (c'est-à-dire à partir de 2021). Sélectionnez toutes les colonnes.

<details>
<summary>Indice 🔑</summary>
<p>Quel opérateur permet de dire "supérieur à" ? Sur quelle colonne devez-vous filtrer ?</p>
</details>

---

## Like I — Le joker `_`

`LIKE` est un opérateur utilisé avec `WHERE` pour rechercher un **motif** dans une colonne de texte.

Le caractère `_` remplace **exactement un caractère** dans le motif :

```sql
SELECT *
FROM films
WHERE nom LIKE 'Dune_';
```

Cette requête renvoie tous les films dont le nom est "Dune" suivi d'**un seul caractère**. Cela correspondrait par exemple à "DuneX", mais pas à "Dune" (trop court) ni à "Dune: Part Two" (trop long).

### À vous de jouer ! 🤠

**1.** Essayez la requête suivante :

```sql
SELECT *
FROM films
WHERE nom LIKE 'Get ___';
```

Combien de caractères génériques `_` voyez-vous ? Quel(s) film(s) correspondent ?

<details>
<summary>Vérification ✅</summary>
<p>Il y a <b>3 underscores</b>, donc le motif cherche "Get " suivi de 3 caractères exactement. <b>Get Out</b> correspond.</p>
</details>

**2.** Écrivez une requête qui utilise `LIKE` et `_` pour trouver tous les films dont le nom correspond au motif `'1_1_'`.

<details>
<summary>Indice 🔑</summary>
<p>La structure reste la même : <code>SELECT * FROM films WHERE nom LIKE '...';</code>. Remplacez <code>...</code> par le motif demandé. Quel film de 4 caractères commence et contient des chiffres ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Le film <b>1917</b> correspond au motif <code>'1_1_'</code>.</p>
</details>

---

## Like II — Le joker `%`

Le signe `%` est un autre caractère générique. Il correspond à **zéro ou plusieurs caractères** :

- `'A%'` → commence par la lettre A
- `'%man%'` → contient le mot "man" n'importe où
- `'%II'` → se termine par "II"

> 💡 `LIKE` n'est **pas sensible** à la casse dans certains SGBDR. En PostgreSQL, utilisez `ILIKE` pour une recherche insensible à la casse.

### À vous de jouer ! 🤠

**1.** Trouvez tous les films dont le nom contient le mot `'Dune'`.

<details>
<summary>Indice 1 🔑</summary>
<p>Si le mot peut apparaître n'importe où dans le nom, de quel côté faut-il placer les <code>%</code> ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Il faut des <code>%</code> <b>des deux côtés</b> du mot recherché.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><b>2 films</b> : Dune (2021) et Dune: Part Two (2024).</p>
</details>

**2.** Écrivez une requête qui sélectionne tous les films dont le titre **commence par** `'The'`.

<details>
<summary>Indice 🔑</summary>
<p>Si le mot est au début, le <code>%</code> se place uniquement à un seul endroit. Lequel ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><b>3 films</b> : The Dark Knight, The Batman, The Whale.</p>
</details>

**3.** Écrivez une requête qui sélectionne tous les films dont le titre **se termine par** `'II'`.

<details>
<summary>Indice 🔑</summary>
<p>Même logique que la question précédente, mais inversée.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><b>1 film</b> : Gladiator II.</p>
</details>

---

## Is Null

Vous avez peut-être remarqué qu'un film de la table n'a **pas de note IMDb**. Les valeurs manquantes sont représentées par `NULL`.

On **ne peut pas** tester `NULL` avec `=` ou `!=`. Il faut utiliser :

- `IS NULL` → la valeur **est** manquante
- `IS NOT NULL` → la valeur **n'est pas** manquante

### À vous de jouer ! 🤠

**1.** Écrivez une requête qui affiche le `nom` des films **sans note IMDb**.

<details>
<summary>Indice 1 🔑</summary>
<p>Vous devez sélectionner une colonne précise et filtrer avec <code>WHERE</code> sur une autre. Lesquelles ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>L'opérateur à utiliser n'est ni <code>=</code> ni <code>!=</code>. Relisez le début de cette section.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Un seul film n'a pas de note : <b>Gladiator II</b>.</p>
</details>

**2.** Écrivez la requête inverse : affichez tous les films **qui ont** une note IMDb.

<details>
<summary>Indice 🔑</summary>
<p>Quel est l'inverse de <code>IS NULL</code> ?</p>
</details>

---

## Between

L'opérateur `BETWEEN` filtre les résultats **dans une plage** de valeurs. Il fonctionne avec des nombres, du texte et des dates.

```sql
SELECT *
FROM films
WHERE annee BETWEEN 2015 AND 2020;
```

Cette requête renvoie tous les films sortis **de 2015 à 2020 inclus**.

`BETWEEN` fonctionne aussi avec du texte (plage alphabétique) :

```sql
SELECT *
FROM films
WHERE nom BETWEEN 'A' AND 'D';
```

Cela renvoie les films dont le nom commence par A, B ou C. Les noms commençant exactement par 'D' (une seule lettre) seraient inclus, mais pas "Dune" car il dépasse 'D' alphabétiquement.

### À vous de jouer ! 🤠

**1.** Écrivez une requête qui sélectionne tous les films dont le nom commence par les lettres **G, H, I, J, K ou L**.

<details>
<summary>Indice 1 🔑</summary>
<p>Quelle est la première lettre de la plage ? Et la borne supérieure doit être la lettre <b>juste après</b> la dernière lettre souhaitée (car <code>BETWEEN</code> inclut les bornes).</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>La plage va de <code>'G'</code> à <code>'M'</code>. Pourquoi 'M' ? Parce qu'un nom qui serait juste la lettre "L" serait inclus, mais "La La Land" dépasse "L" alphabétiquement et reste inclus car il est inférieur à "M".</p>
</details>

**2.** Écrivez une requête qui sélectionne tous les films sortis **entre 2019 et 2022** (bornes incluses).

<details>
<summary>Indice 🔑</summary>
<p>Utilisez <code>BETWEEN ... AND ...</code> sur la colonne <code>annee</code>. Les deux bornes sont incluses.</p>
</details>

Combien de films obtenez-vous ?

<details>
<summary>Vérification ✅</summary>
<p><b>14 films</b> sont sortis entre 2019 et 2022 : 4 en 2019 (Parasite, Avengers, Joker, 1917), 1 en 2020 (Tenet), 3 en 2021 (Spider-Man, Dune, Don't Look Up), 6 en 2022 (Top Gun, Everything Everywhere, The Batman, Nope, Avatar, The Whale).</p>
</details>

---

## And

Parfois, on veut combiner **plusieurs conditions** dans un `WHERE` pour affiner les résultats.

L'opérateur `AND` impose que **toutes les conditions soient vraies** :

```sql
SELECT *
FROM films
WHERE annee BETWEEN 2019 AND 2022
   AND genre = 'action';
```

Cette requête renvoie uniquement les films **d'action** sortis **entre 2019 et 2022**.

### À vous de jouer ! 🤠

**1.** Récupérez tous les films sortis entre 2019 et 2022 qui ont **en plus** une note IMDb **supérieure à 8** :

```sql
SELECT *
FROM films
WHERE annee BETWEEN 2019 AND 2022
  AND note_imdb > 8;
```

Combien de résultats obtenez-vous ?

<details>
<summary>Vérification ✅</summary>
<p><b>6 films</b> : Parasite (8.5), Avengers: Endgame (8.4), Joker (8.4), 1917 (8.2), Spider-Man: No Way Home (8.2) et Top Gun: Maverick (8.2).</p>
</details>

**2.** Un ami ne veut regarder que des **films de science-fiction récents** (sortis après 2020). Écrivez cette requête.

<details>
<summary>Indice 🔑</summary>
<p>Vous avez besoin de deux conditions reliées par <code>AND</code> : une sur le <code>genre</code> et une sur l'<code>annee</code>. Quels opérateurs utiliser pour chacune ?</p>
</details>

**3.** Écrivez une requête qui affiche les films d'**action** ayant rapporté **plus de 1 milliard** (`recette_millions > 1000`).

<details>
<summary>Indice 🔑</summary>
<p>Même structure : deux conditions avec <code>AND</code>. Sur quelles colonnes portent-elles ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><b>4 films</b> : The Dark Knight (1005M), Spider-Man: No Way Home (1916M), Avengers: Endgame (2799M) et Top Gun: Maverick (1496M).</p>
</details>

---

## Or

L'opérateur `OR` fonctionne comme `AND`, mais avec une différence fondamentale :

- `AND` → **toutes** les conditions doivent être vraies
- `OR` → **au moins une** condition doit être vraie

```sql
SELECT *
FROM films
WHERE genre = 'horreur'
   OR genre = 'thriller';
```

Cette requête renvoie les films qui sont **soit** des films d'horreur, **soit** des thrillers.

### À vous de jouer ! 🤠

**1.** Écrivez une requête qui renvoie tous les films qui sont **soit une comédie, soit une romance**.

<details>
<summary>Indice 🔑</summary>
<p>Deux conditions sur la même colonne, reliées par quel opérateur ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><b>4 films</b> : Everything Everywhere All at Once (comédie), Barbie (comédie), La La Land (romance), Don't Look Up (comédie).</p>
</details>

**2.** Écrivez une requête qui renvoie les films sortis **avant 2015** ou ayant une note IMDb **supérieure ou égale à 8.5**.

<details>
<summary>Indice 🔑</summary>
<p>La première condition porte sur <code>annee</code>, la deuxième sur <code>note_imdb</code>. Quel opérateur les relie ?</p>
</details>

Combien de résultats obtenez-vous ? Certains films remplissent-ils **les deux** conditions à la fois ?

<details>
<summary>Vérification ✅</summary>
<p><b>6 films</b>. Avant 2015 : Inception (2010), The Dark Knight (2008), Interstellar (2014), Le Loup de Wall Street (2013). Note ≥ 8.5 : The Dark Knight (9.0), Inception (8.8), Interstellar (8.7), Parasite (8.5), Dune: Part Two (8.5). Trois films (Inception, The Dark Knight, Interstellar) remplissent <b>les deux</b> conditions, mais ils n'apparaissent qu'une seule fois dans le résultat.</p>
</details>

---

## Order By

`ORDER BY` permet de **trier** les résultats par ordre alphabétique ou numérique.

```sql
SELECT *
FROM films
ORDER BY nom;
```

Par défaut, le tri est **croissant** (A→Z, petit→grand). On peut préciser :

- `ASC` → ordre croissant (par défaut)
- `DESC` → ordre décroissant

```sql
SELECT *
FROM films
WHERE note_imdb > 8
ORDER BY annee DESC;
```

> ⚠️ `ORDER BY` se place **toujours après** `WHERE` (si `WHERE` est présent).

### À vous de jouer ! 🤠

**1.** Affichez les colonnes `nom` et `annee` de tous les films, triés par **nom alphabétique** :

```sql
SELECT nom, annee
FROM films
ORDER BY nom;
```

**2.** Écrivez une requête qui affiche `nom`, `annee` et `note_imdb`, triés par **note de la plus haute à la plus basse**.

<details>
<summary>Indice 🔑</summary>
<p>Pour trier du plus grand au plus petit, quel mot-clé devez-vous ajouter après le nom de la colonne dans <code>ORDER BY</code> ?</p>
</details>

**3.** Écrivez une requête qui affiche **tous les films d'action**, triés par **recette décroissante**.

<details>
<summary>Indice 1 🔑</summary>
<p>Cette requête nécessite à la fois un <code>WHERE</code> et un <code>ORDER BY</code>. Dans quel ordre se placent-ils ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p><code>WHERE</code> vient toujours <b>avant</b> <code>ORDER BY</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>7 films d'action. Le premier doit être Avengers: Endgame (2799M) et le dernier Gladiator II (451M).</p>
</details>

---

## Limit

La plupart des tables réelles contiennent des milliers voire des millions de lignes. `LIMIT` permet de **restreindre le nombre de résultats** affichés.

```sql
SELECT *
FROM films
LIMIT 10;
```

> ⚠️ `LIMIT` se place **toujours à la toute fin** de la requête.

### À vous de jouer ! 🤠

**1.** En combinant `ORDER BY` et `LIMIT`, écrivez une requête qui renvoie les **3 films les mieux notés** (toutes colonnes).

<details>
<summary>Indice 1 🔑</summary>
<p>Commencez par réfléchir : dans quel ordre devez-vous trier pour que les meilleurs films soient en premier ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Une fois triés par note décroissante, quelle clause ajouter <b>à la fin</b> pour n'en garder que 3 ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Le podium : <b>The Dark Knight</b> (9.0), <b>Inception</b> (8.8), <b>Interstellar</b> (8.7).</p>
</details>

**2.** Écrivez une requête qui renvoie les **5 plus gros succès au box-office** (triés par recette décroissante).

<details>
<summary>Indice 🔑</summary>
<p>Même logique, mais sur quelle colonne devez-vous trier cette fois ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Le top 5 : Avengers: Endgame (2799M), Avatar: La Voie de l'eau (2320M), Spider-Man: No Way Home (1916M), Top Gun: Maverick (1496M), Barbie (1442M).</p>
</details>

---

## Case

L'instruction `CASE` permet de créer **différentes sorties** selon des conditions. C'est la façon dont SQL gère la logique **si… alors…**.

```sql
SELECT nom,
  CASE
    WHEN note_imdb > 8 THEN 'Excellent'
    WHEN note_imdb > 6 THEN 'Correct'
    ELSE 'À éviter'
  END
FROM films;
```

- Chaque `WHEN` teste une condition, et le `THEN` qui suit donne la valeur si la condition est vraie.
- `ELSE` donne la valeur si **aucune** condition précédente n'est vraie.
- L'instruction se termine obligatoirement par `END`.

### À vous de jouer ! 🤠

**1.** Sélectionnez la colonne `nom` et utilisez une instruction `CASE` pour créer une deuxième colonne basée sur le **genre** :

- `'Détente'` si le genre est `'comédie'`
- `'Frisson'` si le genre est `'horreur'`
- `'Aventure'` si le genre est `'action'`
- `'Réflexion'` dans tous les autres cas

<details>
<summary>Indice 1 🔑</summary>
<p>Combien de <code>WHEN ... THEN ...</code> devez-vous écrire ? Et que représente le <code>ELSE</code> ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Chaque condition compare la colonne <code>genre</code> à une valeur avec <code>=</code>. N'oubliez pas de fermer l'instruction avec <code>END</code>.</p>
</details>

**2.** **Bonus** : Renommez la colonne créée par le `CASE` en `'ambiance'`.

<details>
<summary>Indice 🔑</summary>
<p>Quel mot-clé, vu plus tôt dans ce cours, permet de renommer une colonne dans le résultat ? Où le placer par rapport à <code>END</code> ?</p>
</details>

**3.** Écrivez une requête qui affiche `nom`, `recette_millions`, et une colonne `'performance'` qui vaut :

- `'Blockbuster'` si la recette dépasse 1000 millions
- `'Succès'` si la recette dépasse 500 millions
- `'Modeste'` dans les autres cas

<details>
<summary>Indice 🔑</summary>
<p>Attention à l'<b>ordre</b> des <code>WHEN</code> : SQL teste les conditions de haut en bas et s'arrête à la première qui est vraie. Si vous testez <code>> 500</code> avant <code>> 1000</code>, que se passe-t-il pour un film à 2000M de recette ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Avengers: Endgame (2799M) → "Blockbuster". Oppenheimer (952M) → "Succès". The Whale (55M) → "Modeste".</p>
</details>

---

## 🏆 Exercice de synthèse — À vous de tout combiner !

Vous avez vu chaque concept séparément. Le vrai pouvoir de SQL, c'est de les **combiner** dans une même requête. Essayez de résoudre chaque défi **sans regarder les indices**.

---

**Défi 1** — Affichez le **titre** et la **note** des **5 films les mieux notés**.

Renommez la colonne `nom` en `'Titre'` et la colonne `note_imdb` en `'Note'`.

> 💡 Concepts mobilisés : `SELECT`, `AS`, `ORDER BY`, `LIMIT`

<details>
<summary>Indice 1 🔑</summary>
<p>Quelles colonnes sélectionner ? Comment les renommer dans le résultat ? Relisez la section <b>As</b>.</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Pour avoir les meilleures notes en premier, dans quel sens devez-vous trier ? Et quelle clause empêche d'afficher plus de 5 résultats ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Le top 5 : <b>The Dark Knight</b> (9.0), <b>Inception</b> (8.8), <b>Interstellar</b> (8.7), <b>Parasite</b> (8.5), <b>Dune: Part Two</b> (8.5).</p>
</details>

---

**Défi 2** — Affichez tous les films de **science-fiction** sortis **entre 2020 et 2024**, triés par **année croissante**.

> 💡 Concepts mobilisés : `WHERE`, `AND`, `BETWEEN`, `ORDER BY`

<details>
<summary>Indice 1 🔑</summary>
<p>Vous avez besoin de deux conditions : une sur le <code>genre</code>, une sur l'<code>annee</code>. Quel opérateur les relie ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Pour filtrer une plage d'années, quel opérateur est plus lisible que deux comparaisons ? Et quel est l'ordre par défaut de <code>ORDER BY</code> ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><b>4 films</b> : Tenet (2020, 7.3), Dune (2021, 8.0), Avatar: La Voie de l'eau (2022, 7.5), Dune: Part Two (2024, 8.5).</p>
</details>

---

**Défi 3** — Affichez tous les films dont le titre **commence par la lettre D**, triés par **recette décroissante**.

> 💡 Concepts mobilisés : `WHERE`, `LIKE`, `ORDER BY`

<details>
<summary>Indice 1 🔑</summary>
<p>Quel caractère générique remplace "zéro ou plusieurs caractères" ? Où le placer si le titre doit <b>commencer</b> par D ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Pensez à enchaîner <code>WHERE ... LIKE ...</code> puis <code>ORDER BY ... DESC</code>. Dans quel ordre se placent ces clauses ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><b>3 films</b> : Dune: Part Two (711M), Dune (434M), Don't Look Up (0M).</p>
</details>

---

**Défi 4** — Vous cherchez un film **léger** pour ce soir. Affichez les **3 meilleures comédies ou romances**, triées par **note décroissante**.

> 💡 Concepts mobilisés : `WHERE`, `OR`, `ORDER BY`, `LIMIT`

<details>
<summary>Indice 1 🔑</summary>
<p>Vous devez filtrer sur deux valeurs possibles pour la colonne <code>genre</code>. Quel opérateur permet de dire "l'un ou l'autre" ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Quel est l'ordre des clauses dans la requête ? Pensez : <code>SELECT</code> → <code>FROM</code> → <code>WHERE</code> → <code>ORDER BY</code> → <code>LIMIT</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><b>3 films</b> : La La Land (romance, 8.0), Everything Everywhere All at Once (comédie, 7.8), Don't Look Up (comédie, 7.2).</p>
</details>

---

**Défi 5** — Affichez le `nom`, la `note_imdb` et la `recette_millions` de tous les films **qui ont une note** (excluez ceux sans note). Ajoutez une colonne `'verdict'` qui affiche :

- `'Chef-d''œuvre'` si la note est supérieure à 8.5
- `'Très bon'` si la note est supérieure à 7.5
- `'Passable'` dans les autres cas

Triez le résultat par **note décroissante**.

> 💡 Concepts mobilisés : `SELECT`, `WHERE`, `IS NOT NULL`, `CASE`, `AS`, `ORDER BY`

<details>
<summary>Indice 1 🔑</summary>
<p>Comment exclure les films sans note ? Quel opérateur teste qu'une valeur n'est <b>pas</b> manquante ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Pour le <code>CASE</code> : attention à l'ordre des <code>WHEN</code>. Si vous testez <code>> 7.5</code> avant <code>> 8.5</code>, un film noté 9.0 sera classé "Très bon" au lieu de "Chef-d'œuvre".</p>
</details>

<details>
<summary>Indice 3 🔑</summary>
<p>N'oubliez pas de fermer le <code>CASE</code> avec <code>END</code>, puis d'ajouter <code>AS 'verdict'</code> pour renommer la colonne.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>24 films (Gladiator II est exclu car sa note est <code>NULL</code>). Les premiers résultats : The Dark Knight (9.0, "Chef-d'œuvre"), Inception (8.8, "Chef-d'œuvre"), Interstellar (8.7, "Chef-d'œuvre"). Les derniers : Barbie (6.8, "Passable"), Nope (6.8, "Passable"), Fast &amp; Furious X (5.6, "Passable").</p>
</details>

---

**Défi 6** — Écrivez **une seule requête** qui répond à la question suivante :

> *Quels sont les 3 films d'action ou de science-fiction, sortis entre 2019 et 2024, ayant rapporté plus de 500 millions, classés du plus rentable au moins rentable ?*

Affichez uniquement le `nom`, le `genre` et la `recette_millions`.

> 💡 C'est le défi le plus complet. Prenez le temps de réfléchir à l'ordre des clauses avant d'écrire.

<details>
<summary>Indice 1 🔑</summary>
<p>Listez les conditions de filtrage : une sur le genre (deux valeurs possibles), une sur l'année (plage), une sur la recette (seuil). Comment combiner "deux valeurs possibles" avec d'autres conditions obligatoires ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Attention à la priorité des opérateurs : <code>AND</code> est évalué <b>avant</b> <code>OR</code>. Pour regrouper les deux genres, il faut les entourer de <b>parenthèses</b> : <code>(genre = '...' OR genre = '...')</code>.</p>
</details>

<details>
<summary>Indice 3 🔑</summary>
<p>L'ordre des clauses est toujours le même : <code>SELECT</code> → <code>FROM</code> → <code>WHERE</code> → <code>ORDER BY</code> → <code>LIMIT</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Films qui remplissent toutes les conditions (action ou SF, 2019–2024, recette > 500M) :</p>
<ul>
<li>Avengers: Endgame (action, 2019, 2799M)</li>
<li>Avatar: La Voie de l'eau (science-fiction, 2022, 2320M)</li>
<li>Spider-Man: No Way Home (action, 2021, 1916M)</li>
<li>Top Gun: Maverick (action, 2022, 1496M)</li>
<li>The Batman (action, 2022, 772M)</li>
<li>Fast &amp; Furious X (action, 2023, 714M)</li>
<li>Dune: Part Two (science-fiction, 2024, 711M)</li>
</ul>
<p>Top 3 par recette décroissante : <b>Avengers: Endgame</b> (2799M), <b>Avatar: La Voie de l'eau</b> (2320M), <b>Spider-Man: No Way Home</b> (1916M).</p>
</details>

---

**Défi 7** — Quels **genres** de films comptent au moins un représentant noté **au-dessus de 8** ? Affichez la liste sans doublons.

> 💡 Concepts mobilisés : `DISTINCT`, `WHERE`

<details>
<summary>Indice 1 🔑</summary>
<p>Comment afficher les valeurs uniques d'une colonne ? Et comment ne garder que les lignes qui dépassent une certaine note ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Combinez <code>SELECT DISTINCT</code> sur la colonne <code>genre</code> avec un <code>WHERE</code> sur <code>note_imdb</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><b>4 genres</b> : action, drame, science-fiction, thriller. Ni la comédie, ni l'horreur, ni la romance n'ont de film noté au-dessus de 8 dans la table.</p>
</details>

---

**Défi 8** — Affichez tous les films dont le titre **contient le caractère `:`** (deux-points) et qui ont une note **supérieure à 8**. Triez-les par note décroissante.

> 💡 Concepts mobilisés : `WHERE`, `LIKE`, `AND`, `ORDER BY`

<details>
<summary>Indice 1 🔑</summary>
<p>Le caractère <code>:</code> peut apparaître n'importe où dans le titre. Quel motif <code>LIKE</code> permet de chercher un caractère au milieu d'un texte ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Vous avez besoin de deux conditions (motif + note) reliées par <code>AND</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><b>4 films</b> : Dune: Part Two (8.5), Avengers: Endgame (8.4), Spider-Man: No Way Home (8.2), Top Gun: Maverick (8.2). Avatar: La Voie de l'eau contient bien un <code>:</code> mais sa note (7.5) ne dépasse pas 8.</p>
</details>

---

**Défi 9** — Affichez les **3 films les plus rentables** parmi ceux dont la note se situe **entre 7.5 et 8.0** (bornes incluses). Affichez le `nom`, la `note_imdb` et la `recette_millions`.

> 💡 Concepts mobilisés : `SELECT`, `WHERE`, `BETWEEN`, `ORDER BY`, `LIMIT`

<details>
<summary>Indice 1 🔑</summary>
<p>Quel opérateur filtre dans une plage de valeurs ? Sur quelle colonne l'appliquer ici ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Une fois filtrés, comment trier par recette et n'en garder que 3 ? Quel est l'ordre obligatoire des clauses ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>7 films ont une note entre 7.5 et 8.0. Le top 3 par recette : <b>Avatar: La Voie de l'eau</b> (7.5, 2320M), <b>The Batman</b> (7.8, 772M), <b>La La Land</b> (8.0, 447M).</p>
</details>

---

**Défi 10** — Affichez le `nom` de chaque film et une colonne `'évaluation'` qui affiche :

- `'Non noté'` si la note est `NULL`
- `'Excellent'` si la note est supérieure à 8
- `'Correct'` si la note est supérieure à 6
- `'Faible'` dans tous les autres cas

> 💡 Concepts mobilisés : `CASE`, `IS NULL`, `AS`

<details>
<summary>Indice 1 🔑</summary>
<p>Combien de <code>WHEN</code> devez-vous écrire ? Dans quel ordre tester les conditions pour que <code>NULL</code> soit détecté en premier ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Si vous testez <code>WHEN note_imdb > 8</code> avant <code>WHEN note_imdb IS NULL</code>, que se passe-t-il pour Gladiator II ? Rappel : toute comparaison avec <code>NULL</code> renvoie faux, donc il tomberait dans <code>ELSE</code> ("Faible") au lieu de "Non noté".</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Gladiator II → "Non noté". Fast &amp; Furious X (5.6) → "Faible". Barbie (6.8) → "Correct". The Dark Knight (9.0) → "Excellent". Vérifiez que seuls ces deux films sont classés "Non noté" et "Faible" respectivement.</p>
</details>

---

**Défi 11** — Votre ami cinéphile cherche des **drames ou des thrillers** de qualité (**note ≥ 8**) qui ont **rapporté plus de 300 millions**. Affichez le résultat trié par note décroissante.

> 💡 Concepts mobilisés : `WHERE`, `OR`, `AND`, parenthèses, `ORDER BY`

<details>
<summary>Indice 1 🔑</summary>
<p>Vous avez trois conditions : genre (deux valeurs possibles), note et recette. Comment combiner un <code>OR</code> avec des <code>AND</code> sans que SQL mélange tout ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Les <b>parenthèses</b> sont indispensables autour du <code>OR</code> : <code>(genre = '...' OR genre = '...')</code>. Sans elles, <code>AND</code> est évalué en priorité et le résultat sera faux.</p>
</details>

Combien de films obtenez-vous ? Le film **Parasite** en fait-il partie ?

<details>
<summary>Vérification ✅</summary>
<p><b>4 films</b>, tous des drames : Joker (8.4, 1074M), Oppenheimer (8.3, 952M), Le Loup de Wall Street (8.2, 392M), 1917 (8.2, 384M). <b>Parasite</b> est un thriller noté 8.5 mais n'a rapporté que 263M, ce qui est inférieur à 300M : il est donc exclu.</p>
</details>

---

**Défi 12** — Écrivez **une seule requête** qui répond à la question suivante :

> *Parmi les films qui ne sont pas des films d'action, sortis après 2017, et qui possèdent une note IMDb, quels sont les 5 plus gros succès au box-office ?*

Affichez le `nom` renommé en `'Film'`, le `genre`, l'`annee` renommée en `'Sortie'` et la `recette_millions` renommée en `'Recette (M$)'`.

> 💡 C'est le boss final. Concepts mobilisés : `SELECT`, `AS`, `WHERE`, `!=`, `AND`, `IS NOT NULL`, `ORDER BY`, `LIMIT`

<details>
<summary>Indice 1 🔑</summary>
<p>Listez vos trois conditions de filtrage. Quel opérateur signifie "différent de" ? Comment exclure les films sans note ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Les trois conditions sont reliées par <code>AND</code> (toutes doivent être vraies). Pensez ensuite au tri et à la limite.</p>
</details>

<details>
<summary>Indice 3 🔑</summary>
<p>Les alias <code>AS</code> se placent juste après chaque colonne dans le <code>SELECT</code>. N'oubliez pas les guillemets simples autour des alias qui contiennent des espaces ou des caractères spéciaux.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><b>5 films</b> :</p>
<ol>
<li>Avatar: La Voie de l'eau (science-fiction, 2022, 2320M)</li>
<li>Barbie (comédie, 2023, 1442M)</li>
<li>Joker (drame, 2019, 1074M)</li>
<li>Oppenheimer (drame, 2023, 952M)</li>
<li>Dune: Part Two (science-fiction, 2024, 711M)</li>
</ol>
</details>

---

## Récapitulatif

| Clause / Opérateur        | Rôle                                           |
|---------------------------|-------------------------------------------------|
| `SELECT`                  | Choisir les colonnes à afficher                 |
| `AS`                      | Renommer une colonne dans le résultat           |
| `DISTINCT`                | Éliminer les doublons                           |
| `WHERE`                   | Filtrer les lignes selon une condition           |
| `LIKE` (`_` et `%`)       | Rechercher un motif dans du texte               |
| `IS NULL` / `IS NOT NULL` | Tester les valeurs manquantes                   |
| `BETWEEN`                 | Filtrer dans une plage de valeurs               |
| `AND`                     | Combiner des conditions (toutes vraies)         |
| `OR`                      | Combiner des conditions (au moins une vraie)    |
| `ORDER BY`                | Trier les résultats (`ASC` / `DESC`)            |
| `LIMIT`                   | Limiter le nombre de résultats                  |
| `CASE`                    | Créer des sorties conditionnelles (si… alors…)  |

---

**Bravo !** 🎉 Vous maîtrisez maintenant les principales requêtes SQL pour interroger une base de données. Vous pouvez filtrer, trier, combiner des conditions et créer des colonnes calculées — tout ce qu'il faut pour extraire des informations pertinentes à partir de données brutes.
