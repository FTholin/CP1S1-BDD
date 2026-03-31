# Projet — Lydia entre potes : qui doit quoi à qui ?
Votre groupe de 10 potes utilise **Lydia** pour tout partager : restos, courses, soirées, Uber, cadeaux… À la fin du mois de janvier, c'est le chaos. Personne ne sait qui a payé quoi, qui a remboursé qui, et surtout combien chacun a mis au pot.
Heureusement, vous avez exporté l'historique des transactions dans une base de données SQL. La table `transactions` contient :
- **Le prénom** de la personne concernée
- **La date** de la transaction
- **La catégorie** (Resto, Courses, Soirée, Uber, Cadeau, Loyer, Ciné, McDo, Kebab, Bowling)
- **L'entrée** : montant que cette personne a **remboursé** (sa part d'une dépense de groupe, envoyée au payeur). `NULL` si c'est une avance.
- **La sortie** : montant que cette personne a **avancé** de sa poche (dépense payée pour le groupe ou dépense personnelle). `NULL` si c'est un remboursement.
- **Le motif** : description de la transaction (parfois non renseigné)
> Chaque ligne est soit une **entrée** (remboursement envoyé), soit une **sortie** (dépense avancée). L'autre colonne est toujours `NULL`. Certains motifs sont aussi `NULL`.
Utilisez les fonctions d'agrégation SQL pour démêler tout ça !
---
### À vous de jouer !
**0.** Importez le fichier `lydia.sql` dans votre éditeur PostgreSQL.
---
### Aperçu général
**1.** Commençons par explorer la table :

Quels sont les noms des colonnes ? Combien de transactions y a-t-il au total ?
> **Résultat attendu :** La table contient **7 colonnes** : `id`, `prenom`, `date_transaction`, `categorie`, `entree`, `sortie`, `motif`. Elle compte **95 transactions** au total.
---
**2.** Quelles sont les **catégories de dépenses** utilisées dans le groupe ? Affichez-les sans doublons.

> **Résultat attendu :** 10 catégories distinctes :
>
> | categorie |
> |-----------|
> | Bowling |
> | Cadeau |
> | Ciné |
> | Courses |
> | Kebab |
> | Loyer |
> | McDo |
> | Resto |
> | Soirée |
> | Uber |
---
### Entrées et sorties
**3.** La colonne `entree` enregistre les **remboursements envoyés** par chaque personne.
Quel est le **montant total** de la colonne `entree` ?

> **Résultat attendu :**
>
> | total_entrees |
> |---------------|
> | 799.61 |
---
**4.** La colonne `sortie` enregistre les **montants avancés** de sa poche.
Quel est le **montant total** de la colonne `sortie` ?

> **Résultat attendu :**
>
> | total_sorties |
> |---------------|
> | 4183.20 |
> Comparez les deux totaux. Pourquoi la somme des sorties est-elle bien plus élevée que celle des entrées ? (Pensez aux dépenses personnelles comme les loyers, qui ne sont jamais remboursées.)
---
**5.** Combien y a-t-il de transactions **entrée** (remboursements) dans la table ? Et combien de transactions **sortie** (avances) ?

> **Résultat attendu :**
>
> | nb_entrees | nb_sorties |
> |------------|------------|
> | 57 | 38 |
> `COUNT(colonne)` ne compte que les valeurs **non NULL**. C'est la clé ici.
---
### Records et extrêmes
**6.** Quelle est la **plus grosse avance** (sortie) du mois ? Qui l'a faite et dans quelle catégorie ?

> **Résultat attendu :**
>
> | prenom | categorie | sortie |
> |--------|-----------|--------|
> | Lucas | Loyer | 450.00 |
> | Lucas | Loyer | 450.00 |
>
> *(Lucas apparaît deux fois car il a payé 450 € de loyer à deux dates différentes : janvier et février en avance.)*
---
**7.** Quel est le **plus gros remboursement** (entrée) effectué par quelqu'un ?

> **Résultat attendu :**
>
> | prenom | entree |
> |--------|--------|
> | Chloé | 26.00 |
> | Léa | 26.00 |
>
> *(Chloé et Léa ont toutes les deux remboursé 26 € à Jade pour le brunch du 20 janvier.)*
---
### Moyennes
**8.** Quel est le montant moyen d'une **sortie** pour la catégorie `'Resto'` ?

> **Résultat attendu :**
>
> | moyenne_sortie_resto |
> |----------------------|
> | 82.25 |
---
**9.** Affichez pour chaque **date**, la moyenne des entrées et la moyenne des sorties. Arrondissez à 2 décimales et donnez des alias lisibles aux colonnes.

> **Résultat attendu :**
>
> | date_transaction | moy_entrees | moy_sorties |
> |------------------|-------------|-------------|
> | 2026-01-05 | 10.83 | 32.50 |
> | 2026-01-06 | 15.27 | 45.80 |
> | 2026-01-07 | 10.63 | 85.00 |
> | 2026-01-08 | 9.30 | 18.60 |
> | 2026-01-10 | 14.00 | 42.00 |
> | 2026-01-11 | 8.00 | 24.00 |
> | 2026-01-12 | NULL | 50.00 |
> | 2026-01-13 | NULL | 156.00 |
> | 2026-01-14 | NULL | 430.00 |
> | 2026-01-15 | 9.47 | 28.40 |
> | 2026-01-16 | 20.77 | 62.30 |
> | 2026-01-17 | 14.00 | 56.00 |
> | 2026-01-18 | 11.20 | 22.40 |
> | 2026-01-19 | 15.00 | 120.00 |
> | 2026-01-20 | 26.00 | 78.00 |
> | 2026-01-21 | 19.25 | 38.50 |
> | 2026-01-22 | 14.00 | 28.00 |
> | 2026-01-23 | 23.75 | 95.00 |
> | 2026-01-24 | 7.90 | 15.80 |
> | 2026-01-25 | 10.83 | 65.00 |
> | 2026-01-26 | NULL | 35.00 |
> | 2026-01-27 | 9.90 | 19.80 |
> | 2026-01-28 | 10.24 | 51.20 |
> | 2026-01-29 | NULL | 420.00 |
> | 2026-01-30 | 22.00 | 44.00 |
> | 2026-01-31 | 15.66 | 109.15 |
> Certains jours n'ont que des sorties (pas de remboursement ce jour-là). Que vaut la moyenne des entrées pour ces jours ? **→ NULL**, car `AVG()` ignore les `NULL` et renvoie `NULL` s'il n'y a aucune valeur non nulle.
---
### Qui fait quoi ?
**10.** Combien de transactions chaque personne a-t-elle effectuées ? Triez du plus actif au moins actif.

> **Résultat attendu :**
>
> | prenom | nb_transactions |
> |--------|-----------------|
> | Hugo | 13 |
> | Léa | 11 |
> | Nathan | 10 |
> | Lucas | 10 |
> | Emma | 9 |
> | Chloé | 9 |
> | Adam | 9 |
> | Théo | 8 |
> | Jade | 8 |
> | Inès | 8 |
---
**11.** Pour chaque personne, affichez le **total remboursé** (entrées) et le **total avancé** (sorties). Triez par total avancé décroissant.

> **Résultat attendu :**
>
> | prenom | total_rembourse | total_avance |
> |--------|-----------------|--------------|
> | Inès | 47.63 | 1030.80 |
> | Lucas | 65.53 | 954.50 |
> | Théo | 57.42 | 938.00 |
> | Emma | 91.80 | 290.00 |
> | Jade | 77.35 | 285.20 |
> | Hugo | 90.70 | 189.10 |
> | Adam | 73.34 | 177.00 |
> | Nathan | 75.13 | 120.50 |
> | Chloé | 94.51 | 113.10 |
> | Léa | 126.20 | 85.00 |
> Inès, Lucas et Théo avancent massivement à cause de leurs loyers. Léa rembourse le plus sa part.
---
### Analyse par catégorie
**12.** Quel est le **total avancé par catégorie** (somme des sorties) ? Triez du poste le plus coûteux au moins coûteux.

> **Résultat attendu :**
>
> | categorie | total_avance |
> |-----------|--------------|
> | Loyer | 2580.00 |
> | Resto | 493.50 |
> | Soirée | 310.00 |
> | Cadeau | 270.00 |
> | Courses | 227.70 |
> | Uber | 87.80 |
> | Ciné | 70.00 |
> | Bowling | 56.00 |
> | McDo | 48.20 |
> | Kebab | 40.00 |
---
**13.** Combien de transactions ont été effectuées **chaque jour** ? Quel jour a été le plus actif ?

> **Résultat attendu (extrait trié par activité décroissante) :**
>
> | date_transaction | nb_transactions |
> |------------------|-----------------|
> | 2026-01-31 | 13 |
> | 2026-01-19 | 8 |
> | 2026-01-07 | 8 |
> | 2026-01-25 | 6 |
> | 2026-01-28 | 5 |
> | 2026-01-23 | 4 |
> | 2026-01-17 | 4 |
> | 2026-01-12 | 4 |
> | 2026-01-20 | 3 |
> | 2026-01-16 | 3 |
> | 2026-01-15 | 3 |
> | 2026-01-14 | 3 |
> | 2026-01-11 | 3 |
> | 2026-01-10 | 3 |
> | 2026-01-06 | 3 |
> | 2026-01-05 | 3 |
> | 2026-01-30 | 2 |
> | 2026-01-29 | 2 |
> | 2026-01-27 | 2 |
> | 2026-01-26 | 2 |
> | 2026-01-24 | 2 |
> | 2026-01-22 | 2 |
> | 2026-01-21 | 2 |
> | 2026-01-18 | 2 |
> | 2026-01-08 | 2 |
> | 2026-01-13 | 1 |
>
> Le **31 janvier** est le jour le plus actif avec **13 transactions**.
---
**14.** Quelle est la **catégorie la plus fréquente** en nombre total de transactions (entrées + sorties confondues) ?

> **Résultat attendu :**
>
> | categorie | nb |
> |-----------|----|
> | Soirée | 23 |
>
> Les soirées remportent la palme avec 23 transactions !
---
### Filtrage des groupes
**15.** Quels membres du groupe ont effectué **plus de 10 transactions** sur le mois ?

> **Résultat attendu :**
>
> | prenom | nb |
> |--------|----|
> | Hugo | 13 |
> | Léa | 11 |
> Vous devez filtrer des **groupes**, pas des lignes. Quelle clause utiliser ? → **`HAVING`**
---
**16.** Certaines transactions n'ont **pas de motif renseigné**. Combien y en a-t-il ? Affichez le prénom, la catégorie et le montant pour ces transactions.

> **Résultat attendu :** **4 transactions** sans motif.
>
> | prenom | categorie | montant |
> |--------|-----------|---------|
> | Lucas | Loyer | 450.00 |
> | Nathan | Courses | 29.90 |
> | Emma | Courses | 14.95 |
> | Hugo | Soirée | 40.00 |
---
**17.** Qui a le plus **avancé** en **soirées** ? Affichez le total des sorties pour la catégorie `'Soirée'`, regroupé par prénom, trié du plus gros fêtard au plus raisonnable.

> **Résultat attendu :**
>
> | prenom | total_soiree |
> |--------|--------------|
> | Emma | 205.00 |
> | Adam | 65.00 |
> | Hugo | 40.00 |
>
> **Emma** est la grande organisatrice de soirées avec 205 € avancés !
> Filtrez d'abord les lignes (`WHERE`) puis regroupez (`GROUP BY`).
---
### Boss Final 
**18.** L'heure des comptes a sonné ! Écrivez **une seule requête** qui affiche pour chaque personne ayant **au moins 8 transactions** :
- Son prénom
- Son nombre total de transactions
- Le total remboursé (somme des entrées)
- Le total avancé (somme des sorties)
- Son **solde** : total remboursé − total avancé
Triez par solde croissant (le plus dans le rouge en premier).

> **Résultat attendu :**
>
> | prenom | nb_transactions | total_rembourse | total_avance | solde |
> |--------|-----------------|-----------------|--------------|-------|
> | Inès | 8 | 47.63 | 1030.80 | **-983.17** |
> | Lucas | 10 | 65.53 | 954.50 | **-888.97** |
> | Théo | 8 | 57.42 | 938.00 | **-880.58** |
> | Jade | 8 | 77.35 | 285.20 | -207.85 |
> | Emma | 9 | 91.80 | 290.00 | -198.20 |
> | Adam | 9 | 73.34 | 177.00 | -103.66 |
> | Hugo | 13 | 90.70 | 189.10 | -98.40 |
> | Nathan | 10 | 75.13 | 120.50 | -45.37 |
> | Chloé | 9 | 94.51 | 113.10 | -18.59 |
> | **Léa** | **11** | **126.20** | **85.00** | **+41.20** |
> Pour le solde, vous pouvez écrire une soustraction dans le `SELECT`. Attention aux `NULL` : `SUM()` les ignore, mais si quelqu'un n'a aucune entrée, `SUM(entree)` renverra `NULL`. Utilisez `COALESCE(SUM(entree), 0)` pour remplacer `NULL` par 0.
 **Léa** est la **seule personne avec un solde positif** (+41,20 €) : elle rembourse bien sa part et avance peu.
 **Inès** est la plus dans le rouge (-983,17 €), essentiellement à cause de ses loyers payés d'avance.
---
Bon courage pour les comptes du mois… et bonne chance pour récupérer l'argent !
