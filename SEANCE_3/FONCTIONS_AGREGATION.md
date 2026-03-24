# 🛵 Les fonctions d'agrégation — Analysez vos commandes de livraison

## Introduction

Nous avons appris à écrire des requêtes pour récupérer des informations dans une base de données. Nous allons maintenant apprendre à **effectuer des calculs** à l'aide de SQL.

Les calculs effectués sur plusieurs lignes d'une table sont appelés **agrégats**. Ils permettent de répondre à des questions comme *"Combien ai-je passé de commandes ?"*, *"Quel est le prix moyen d'une livraison ?"* ou *"Quelle catégorie de plat me coûte le plus cher ?"*.

Dans cette leçon, nous travaillons avec une table `commandes` qui contient l'historique d'un mois de commandes passées sur Uber Eats et Deliveroo.

Voici un aperçu des fonctions d'agrégation que nous allons découvrir :

| Fonction | Rôle |
|----------|------|
| `COUNT()` | Compter le nombre de lignes |
| `SUM()` | Additionner les valeurs d'une colonne |
| `MAX()` / `MIN()` | Trouver la valeur la plus grande / petite |
| `AVG()` | Calculer la moyenne d'une colonne |
| `ROUND()` | Arrondir les valeurs |
| `GROUP BY` | Regrouper les données par catégorie |
| `HAVING` | Filtrer les groupes |

---

## Mise en place

Copiez-collez et exécutez le code suivant dans votre éditeur SQL :

```sql
CREATE TABLE commandes (
   id INTEGER,
   restaurant TEXT,
   categorie TEXT,
   plateforme TEXT,
   prix REAL,
   temps_livraison INTEGER,
   note REAL,
   date_commande DATE
);

INSERT INTO commandes VALUES (1, 'Five Guys', 'Burger', 'Uber Eats', 15.90, 25, 4.2, '2026-01-06');
INSERT INTO commandes VALUES (2, 'Domino''s', 'Pizza', 'Deliveroo', 12.50, 30, 3.8, '2026-01-06');
INSERT INTO commandes VALUES (3, 'Planet Sushi', 'Sushi', 'Uber Eats', 22.00, 40, 4.5, '2026-01-08');
INSERT INTO commandes VALUES (4, 'O''Tacos', 'Tacos', 'Uber Eats', 9.90, 20, 3.5, '2026-01-10');
INSERT INTO commandes VALUES (5, 'Pitaya', 'Thaï', 'Deliveroo', 14.50, 35, 4.6, '2026-01-10');
INSERT INTO commandes VALUES (6, 'Burger King', 'Burger', 'Uber Eats', 11.20, 22, 3.9, '2026-01-12');
INSERT INTO commandes VALUES (7, 'Côté Sushi', 'Sushi', 'Deliveroo', 19.80, 45, 4.3, '2026-01-13');
INSERT INTO commandes VALUES (8, 'La Pataterie', 'Burger', 'Deliveroo', 13.50, 28, NULL, '2026-01-14');
INSERT INTO commandes VALUES (9, 'Domino''s', 'Pizza', 'Uber Eats', 10.90, 25, 4.0, '2026-01-15');
INSERT INTO commandes VALUES (10, 'Pokawa', 'Poke Bowl', 'Deliveroo', 13.90, 30, 4.7, '2026-01-17');
INSERT INTO commandes VALUES (11, 'Naan', 'Indien', 'Uber Eats', 16.50, 40, 4.4, '2026-01-18');
INSERT INTO commandes VALUES (12, 'Five Guys', 'Burger', 'Uber Eats', 17.90, 28, 4.0, '2026-01-19');
INSERT INTO commandes VALUES (13, 'Napoli Gang', 'Pizza', 'Deliveroo', 14.00, 32, 4.5, '2026-01-20');
INSERT INTO commandes VALUES (14, 'O''Tacos', 'Tacos', 'Deliveroo', 10.50, 18, 3.2, '2026-01-21');
INSERT INTO commandes VALUES (15, 'Basilic & Co', 'Pizza', 'Uber Eats', 15.50, 35, 4.8, '2026-01-22');
INSERT INTO commandes VALUES (16, 'Pitaya', 'Thaï', 'Uber Eats', 15.00, 30, 4.5, '2026-01-24');
INSERT INTO commandes VALUES (17, 'McDonald''s', 'Burger', 'Uber Eats', 8.90, 15, 3.6, '2026-01-25');
INSERT INTO commandes VALUES (18, 'Planet Sushi', 'Sushi', 'Deliveroo', 24.50, 50, NULL, '2026-01-26');
INSERT INTO commandes VALUES (19, 'Pokawa', 'Poke Bowl', 'Deliveroo', 14.50, 28, 4.5, '2026-01-27');
INSERT INTO commandes VALUES (20, 'Tandoori', 'Indien', 'Uber Eats', 18.00, 45, 4.1, '2026-01-28');
INSERT INTO commandes VALUES (21, 'Krispy Kreme', 'Dessert', 'Deliveroo', 7.50, 20, 4.3, '2026-01-29');
INSERT INTO commandes VALUES (22, 'Burger King', 'Burger', 'Deliveroo', 12.00, 25, 3.7, '2026-01-30');
INSERT INTO commandes VALUES (23, 'Sushi Shop', 'Sushi', 'Uber Eats', 21.00, 38, 4.6, '2026-01-31');
INSERT INTO commandes VALUES (24, 'Ben''s Cookies', 'Dessert', 'Uber Eats', 6.50, 22, 4.8, '2026-02-01');
INSERT INTO commandes VALUES (25, 'Naan', 'Indien', 'Deliveroo', 17.50, 42, NULL, '2026-02-02');
```

> 💡 Le `temps_livraison` est en **minutes**. La `note` est sur **5**. Certaines commandes n'ont **pas encore été notées** (valeur `NULL`).

---

### À vous de jouer ! 🤠

Avant de commencer, familiarisez-vous avec la table :

```sql
SELECT * FROM commandes;
```

Quels sont les noms des colonnes ? Combien de commandes contient la table ?

<details>
<summary>Vérification ✅</summary>
<p>Les colonnes sont : <code>id</code>, <code>restaurant</code>, <code>categorie</code>, <code>plateforme</code>, <code>prix</code>, <code>temps_livraison</code>, <code>note</code>, <code>date_commande</code>. La table contient <strong>25 commandes</strong>.</p>
</details>

---

## COUNT

Le moyen le plus rapide de compter le nombre de lignes d'une table est d'utiliser la fonction `COUNT()`.

`COUNT()` prend le nom d'une colonne comme argument et compte le nombre de valeurs **non vides** dans cette colonne. Pour compter **toutes les lignes**, on passe `*` comme argument :

```sql
SELECT COUNT(*)
FROM nom_table;
```

### À vous de jouer ! 🤠

**1.** Comptons le nombre total de commandes dans la table :

```sql
SELECT COUNT(*)
FROM commandes;
```

<details>
<summary>Vérification ✅</summary>
<p><strong>25</strong> commandes.</p>
</details>

**2.** Ajoutez une clause `WHERE` à la requête précédente pour compter uniquement les commandes passées sur **Uber Eats**.

<details>
<summary>Indice 🔑</summary>
<p>Quelle condition écrire après <code>WHERE</code> pour filtrer sur la plateforme ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><strong>13</strong> commandes sur Uber Eats et <strong>12</strong> sur Deliveroo.</p>
</details>

**3.** Combien de commandes ont **une note renseignée** ? Utilisez `COUNT()` sur la colonne `note` (pas sur `*`).

<details>
<summary>Indice 🔑</summary>
<p><code>COUNT(colonne)</code> ne compte que les valeurs <strong>non NULL</strong>. Quelle différence avec <code>COUNT(*)</code> ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><strong>22</strong> commandes ont une note. 3 commandes ont une note <code>NULL</code> (La Pataterie, Planet Sushi du 26/01 et Naan du 02/02).</p>
</details>

---

## SUM

`SUM()` additionne toutes les valeurs d'une colonne numérique.

Combien avez-vous dépensé au total sur le mois ?

```sql
SELECT SUM(prix)
FROM commandes;
```

### À vous de jouer ! 🤠

**1.** Exécutez la requête ci-dessus. Quel est le total ?

<details>
<summary>Vérification ✅</summary>
<p><strong>363.90 €</strong> dépensés en un mois de livraisons. Aïe le budget.</p>
</details>

**2.** Écrivez une requête qui calcule le total dépensé **uniquement en sushis**.

<details>
<summary>Indice 🔑</summary>
<p>Ajoutez un <code>WHERE</code> sur la catégorie avant de faire la somme.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><strong>87.30 €</strong> en sushis (4 commandes : 22.00 + 19.80 + 24.50 + 21.00).</p>
</details>

**3.** Combien de temps avez-vous attendu **au total** vos livraisons ce mois-ci ?

<details>
<summary>Indice 🔑</summary>
<p>Appliquez <code>SUM()</code> sur la colonne <code>temps_livraison</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><strong>768 minutes</strong>, soit plus de 12 heures passées à attendre le livreur !</p>
</details>

---

## MAX / MIN

`MAX()` et `MIN()` renvoient respectivement la **plus grande** et la **plus petite** valeur d'une colonne.

Quelle a été la commande la plus chère ?

```sql
SELECT MAX(prix)
FROM commandes;
```

### À vous de jouer ! 🤠

**1.** Quelle a été la commande **la moins chère** ?

```sql
SELECT MIN(prix)
FROM commandes;
```

<details>
<summary>Vérification ✅</summary>
<p><strong>6.50 €</strong> (Ben's Cookies).</p>
</details>

**2.** Quel est le **temps de livraison le plus long** que vous avez subi ?

<details>
<summary>Indice 🔑</summary>
<p>Quelle fonction renvoie la plus grande valeur d'une colonne ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><strong>50 minutes</strong> (Planet Sushi, le 26 janvier).</p>
</details>

**3.** Quelle est la **meilleure note** parmi les commandes de burgers ?

<details>
<summary>Indice 🔑</summary>
<p>Combinez <code>MAX()</code> avec un <code>WHERE</code> sur la catégorie.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><strong>4.2</strong> (Five Guys, le 6 janvier).</p>
</details>

---

## AVG

`AVG()` calcule la **valeur moyenne** d'une colonne numérique :

```sql
SELECT AVG(prix)
FROM commandes;
```

> 💡 `AVG()` ignore automatiquement les valeurs `NULL`.

### À vous de jouer ! 🤠

**1.** Quel est le **prix moyen** d'une commande ?

<details>
<summary>Vérification ✅</summary>
<p>Environ <strong>14.556 €</strong> en moyenne par commande.</p>
</details>

**2.** Quel est le **temps de livraison moyen** ?

<details>
<summary>Indice 🔑</summary>
<p>Remplacez le nom de la colonne dans <code>AVG()</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Environ <strong>30.72 minutes</strong> en moyenne.</p>
</details>

**3.** Quelle est la **note moyenne** des commandes de pizzas ?

<details>
<summary>Indice 🔑</summary>
<p>Combinez <code>AVG()</code> sur la colonne <code>note</code> avec un <code>WHERE</code> sur la catégorie.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Environ <strong>4.275</strong> (moyenne de 3.8 + 4.0 + 4.5 + 4.8).</p>
</details>

---

## ROUND

Par défaut, SQL renvoie des résultats très précis (beaucoup de décimales). La fonction `ROUND()` permet d'**arrondir** pour rendre le résultat plus lisible.

`ROUND()` prend **deux arguments** :

1. Un nom de colonne (ou une expression)
2. Le nombre de décimales souhaité

```sql
SELECT ROUND(prix, 0)
FROM commandes;
```

Ici, SQL arrondit les prix à **0 décimale** (nombre entier).

### À vous de jouer ! 🤠

**1.** Affichez le `restaurant` et le `prix` arrondi à l'entier pour chaque commande :

```sql
SELECT restaurant, ROUND(prix, 0)
FROM commandes;
```

**2.** Nous avons obtenu un prix moyen d'environ 14.556 €. Modifiez la requête `AVG(prix)` pour que le résultat soit **arrondi à 2 décimales**.

<details>
<summary>Indice 1 🔑</summary>
<p><code>ROUND()</code> peut prendre une autre fonction comme premier argument. Comment imbriquer <code>AVG()</code> dans <code>ROUND()</code> ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>La structure est : <code>SELECT ROUND(AVG(colonne), nombre_decimales) FROM ...</code></p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><strong>14.56 €</strong>.</p>
</details>

**3.** Affichez la **note moyenne arrondie à 1 décimale** pour les commandes passées sur **Deliveroo**.

<details>
<summary>Indice 🔑</summary>
<p>Combinez <code>ROUND()</code>, <code>AVG()</code> et <code>WHERE</code>. Quel est le deuxième argument de <code>ROUND()</code> pour 1 décimale ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><strong>4.2</strong>.</p>
</details>

---

## GROUP BY I

Il arrive souvent que l'on veuille calculer un agrégat **par catégorie**. Par exemple : *combien ai-je commandé dans chaque catégorie de plat ?*

On pourrait écrire une série de requêtes avec différents `WHERE` :

```sql
SELECT COUNT(*) FROM commandes WHERE categorie = 'Burger';
SELECT COUNT(*) FROM commandes WHERE categorie = 'Pizza';
SELECT COUNT(*) FROM commandes WHERE categorie = 'Sushi';
-- etc... fastidieux !
```

`GROUP BY` permet de le faire **en une seule requête** :

```sql
SELECT categorie, COUNT(*)
FROM commandes
GROUP BY categorie;
```

`GROUP BY` organise les données identiques en **groupes** et applique la fonction d'agrégation à chaque groupe.

> ⚠️ `GROUP BY` vient **après** `WHERE`, mais **avant** `ORDER BY` et `LIMIT`.

### À vous de jouer ! 🤠

**1.** Exécutez la requête suivante :

```sql
SELECT categorie, COUNT(*)
FROM commandes
GROUP BY categorie;
```

Quelle catégorie avez-vous le plus commandée ?

<details>
<summary>Vérification ✅</summary>
<p>Les <strong>Burgers</strong> dominent avec <strong>6 commandes</strong>. Suivent les Pizzas (4) et Sushis (4), puis Indien (3), et enfin Tacos, Thaï, Poke Bowl et Dessert (2 chacun).</p>
</details>

**2.** Écrivez une requête qui calcule le **total dépensé** par catégorie de plat.

<details>
<summary>Indice 1 🔑</summary>
<p>Quelle fonction d'agrégation permet de faire une somme ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Sélectionnez <code>categorie</code> et <code>SUM(prix)</code>, puis regroupez par <code>categorie</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Sushi : 87.30 € | Burger : 79.40 € | Pizza : 52.90 € | Indien : 52.00 € | Thaï : 29.50 € | Poke Bowl : 28.40 € | Tacos : 20.40 € | Dessert : 14.00 €.</p>
</details>

**3.** Écrivez une requête qui affiche le **nombre de commandes par plateforme** (Uber Eats vs Deliveroo).

<details>
<summary>Indice 🔑</summary>
<p>Même logique : remplacez <code>categorie</code> par <code>plateforme</code> dans le <code>SELECT</code> et le <code>GROUP BY</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Uber Eats : <strong>13</strong> commandes | Deliveroo : <strong>12</strong> commandes.</p>
</details>

**4.** Ajoutez une clause `WHERE` à la requête du point 2 pour ne calculer le total dépensé par catégorie **que pour les commandes livrées en moins de 30 minutes**.

<details>
<summary>Indice 🔑</summary>
<p>Rappel de l'ordre des clauses : <code>SELECT</code> → <code>FROM</code> → <code>WHERE</code> → <code>GROUP BY</code>.</p>
</details>

---

## GROUP BY II

Parfois, on veut regrouper par le **résultat d'un calcul** plutôt que par une colonne brute.

Par exemple, on peut vouloir savoir combien de commandes ont une note arrondie à 3, 4 ou 5.

```sql
SELECT ROUND(note), COUNT(*)
FROM commandes
GROUP BY ROUND(note)
ORDER BY ROUND(note);
```

Cette requête est correcte mais répétitive. SQL permet d'utiliser des **numéros de référence de colonne** pour simplifier :

- `1` = la première colonne du `SELECT`
- `2` = la deuxième colonne du `SELECT`

La requête suivante est **équivalente** :

```sql
SELECT ROUND(note), COUNT(*)
FROM commandes
GROUP BY 1
ORDER BY 1;
```

Ici, le `1` fait référence à `ROUND(note)`, la première colonne sélectionnée.

### À vous de jouer ! 🤠

**1.** Exécutez la requête ci-dessus. Combien de commandes ont une note arrondie à 5 ?

<details>
<summary>Vérification ✅</summary>
<p><strong>4 groupes</strong> apparaissent : note arrondie à 3 (<strong>1</strong> commande : O'Tacos du 21/01, note 3.2), à 4 (<strong>12 commandes</strong>), à 5 (<strong>9 commandes</strong>), et <code>NULL</code> (<strong>3 commandes</strong> non notées).</p>
</details>

**2.** Observez la requête suivante :

```sql
SELECT categorie,
   plateforme,
   AVG(prix)
FROM commandes
GROUP BY categorie, plateforme;
```

Réécrivez-la en utilisant des **numéros de référence de colonne** au lieu des noms de colonne après `GROUP BY`.

<details>
<summary>Indice 🔑</summary>
<p><code>categorie</code> est la colonne n°1 du <code>SELECT</code>, <code>plateforme</code> est la colonne n°2. Par quoi remplacer <code>GROUP BY categorie, plateforme</code> ?</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><code>GROUP BY 1, 2</code> est la forme simplifiée.</p>
</details>

---

## HAVING

`GROUP BY` permet de regrouper les données, mais comment **filtrer ces groupes** une fois formés ?

On ne peut pas utiliser `WHERE` car `WHERE` filtre les **lignes** individuelles avant le regroupement. `HAVING` filtre les **groupes** après le regroupement.

Par exemple, pour n'afficher que les catégories dans lesquelles on a passé **au moins 3 commandes** :

```sql
SELECT categorie, COUNT(*)
FROM commandes
GROUP BY categorie
HAVING COUNT(*) >= 3;
```

À retenir :

- `WHERE` → filtre les **lignes** (avant le regroupement)
- `HAVING` → filtre les **groupes** (après le regroupement)

> ⚠️ L'ordre complet des clauses est :
>
> `SELECT` → `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `ORDER BY` → `LIMIT`

### À vous de jouer ! 🤠

**1.** Exécutez la requête suivante :

```sql
SELECT categorie,
   ROUND(AVG(prix), 2),
   COUNT(*)
FROM commandes
GROUP BY categorie;
```

Elle renvoie le prix moyen (arrondi) et le nombre de commandes par catégorie. Cependant, certaines catégories n'ont que 2 commandes — leurs moyennes sont moins fiables.

Ajoutez une clause `HAVING` pour ne garder que les catégories avec **au moins 3 commandes**.

<details>
<summary>Indice 1 🔑</summary>
<p><code>HAVING</code> se place juste après <code>GROUP BY</code>. La condition porte sur le résultat d'une fonction d'agrégation.</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>La condition est <code>HAVING COUNT(*) >= 3</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><strong>4 catégories</strong> restent : Burger (6 commandes, moy. 13.23 €), Pizza (4, moy. 13.23 €), Sushi (4, moy. 21.83 €), Indien (3, moy. 17.33 €). Les catégories à 2 commandes (Tacos, Thaï, Poke Bowl, Dessert) sont exclues.</p>
</details>

**2.** Écrivez une requête qui affiche les catégories dont le **prix moyen dépasse 15 €**, avec leur prix moyen arrondi à 2 décimales.

<details>
<summary>Indice 1 🔑</summary>
<p>Sélectionnez <code>categorie</code> et <code>ROUND(AVG(prix), 2)</code>, regroupez, puis filtrez avec <code>HAVING</code>.</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>Attention : dans <code>HAVING</code>, utilisez <code>AVG(prix) > 15</code>, pas la version arrondie. Le filtre porte sur la valeur exacte.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><strong>2 catégories</strong> : Sushi (moy. 21.83 €) et Indien (moy. 17.33 €).</p>
</details>

---

## 🏆 Exercice de synthèse — À vous de tout combiner !

Essayez de résoudre chaque défi **sans regarder les indices**.

---

**Défi 1** — Affichez le **nombre de commandes** et le **prix moyen arrondi à 2 décimales** pour chaque **plateforme** (Uber Eats vs Deliveroo).

> 💡 Concepts mobilisés : `COUNT`, `ROUND`, `AVG`, `GROUP BY`

<details>
<summary>Indice 🔑</summary>
<p>Sélectionnez <code>plateforme</code>, <code>COUNT(*)</code> et <code>ROUND(AVG(prix), 2)</code>, puis regroupez par <code>plateforme</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Uber Eats : 13 commandes, prix moyen 14.55 €. Deliveroo : 12 commandes, prix moyen 14.56 €. Quasi identiques !</p>
</details>

---

**Défi 2** — Affichez les **3 catégories dans lesquelles vous avez le plus dépensé**, triées du plus au moins cher. Affichez le nom de la catégorie et le total.

> 💡 Concepts mobilisés : `SUM`, `GROUP BY`, `ORDER BY`, `LIMIT`

<details>
<summary>Indice 🔑</summary>
<p>Regroupez par <code>categorie</code>, calculez <code>SUM(prix)</code>, triez en ordre décroissant, et limitez à 3.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>Top 3 : <strong>Sushi</strong> (87.30 €), <strong>Burger</strong> (79.40 €), <strong>Pizza</strong> (52.90 €).</p>
</details>

---

**Défi 3** — Pour chaque catégorie ayant **au moins 3 commandes**, affichez :

- Le nom de la catégorie
- Le nombre de commandes
- Le prix moyen arrondi à 2 décimales
- Le temps de livraison moyen arrondi à 0 décimale

Triez le résultat par **prix moyen décroissant**.

> 💡 Concepts mobilisés : `COUNT`, `ROUND`, `AVG`, `GROUP BY`, `HAVING`, `ORDER BY`

<details>
<summary>Indice 1 🔑</summary>
<p>Commencez par le <code>SELECT</code> avec les 4 colonnes demandées. Puis <code>GROUP BY</code>. Comment filtrer les groupes ayant au moins 3 commandes ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>L'ordre : <code>SELECT</code> → <code>FROM</code> → <code>GROUP BY</code> → <code>HAVING</code> → <code>ORDER BY</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p>4 catégories, triées par prix moyen décroissant : <strong>Sushi</strong> (4 cmd, 21.83 €, 43 min), <strong>Indien</strong> (3 cmd, 17.33 €, 42 min), <strong>Pizza</strong> (4 cmd, 13.23 €, 31 min), <strong>Burger</strong> (6 cmd, 13.23 €, 24 min).</p>
</details>

---

**Défi 4 — Boss Final** 👾 — Écrivez **une seule requête** qui répond à :

> *Parmi les commandes passées sur Uber Eats uniquement, quelles catégories comptent au moins 2 commandes ? Affichez le nom de la catégorie, le nombre de commandes, le total dépensé et la note moyenne arrondie à 1 décimale. Triez par total dépensé décroissant.*

<details>
<summary>Indice 1 🔑</summary>
<p>Il y a un filtre sur les <strong>lignes</strong> (Uber Eats → <code>WHERE</code>) ET un filtre sur les <strong>groupes</strong> (au moins 2 → <code>HAVING</code>). Lequel vient en premier ?</p>
</details>

<details>
<summary>Indice 2 🔑</summary>
<p>L'ordre complet : <code>SELECT</code> → <code>FROM</code> → <code>WHERE plateforme = 'Uber Eats'</code> → <code>GROUP BY categorie</code> → <code>HAVING COUNT(*) >= 2</code> → <code>ORDER BY ... DESC</code>.</p>
</details>

<details>
<summary>Vérification ✅</summary>
<p><strong>4 catégories</strong> :</p>
<ul>
<li>Burger : 4 commandes, 53.90 € au total, note moy. 3.9</li>
<li>Sushi : 2 commandes, 43.00 € au total, note moy. 4.6</li>
<li>Indien : 2 commandes, 34.50 € au total, note moy. 4.3</li>
<li>Pizza : 2 commandes, 26.40 € au total, note moy. 4.4</li>
</ul>
</details>

---

## Récapitulatif

| Fonction / Clause | Rôle | Exemple rapide |
|---|---|---|
| `COUNT()` | Compter les lignes | `SELECT COUNT(*) FROM commandes;` |
| `SUM()` | Additionner une colonne | `SELECT SUM(prix) FROM commandes;` |
| `MAX()` / `MIN()` | Plus grande / petite valeur | `SELECT MAX(prix) FROM commandes;` |
| `AVG()` | Calculer la moyenne | `SELECT AVG(note) FROM commandes;` |
| `ROUND()` | Arrondir un résultat | `SELECT ROUND(AVG(prix), 2) FROM commandes;` |
| `GROUP BY` | Regrouper par catégorie | `SELECT categorie, COUNT(*) FROM commandes GROUP BY categorie;` |
| `HAVING` | Filtrer les groupes | `... GROUP BY categorie HAVING COUNT(*) >= 3;` |

**Ordre des clauses** : `SELECT` → `FROM` → `WHERE` → `GROUP BY` → `HAVING` → `ORDER BY` → `LIMIT`

---

**Bravo !** 🎉 Vous savez maintenant compter, additionner, moyenner, regrouper et filtrer des agrégats en SQL. La prochaine fois que votre relevé bancaire affiche un montant suspect en livraisons, vous saurez écrire la requête pour trouver le coupable.
