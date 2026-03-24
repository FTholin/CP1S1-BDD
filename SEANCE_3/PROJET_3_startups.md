# 🚀 Projet — Panorama de la Tech : analysez les startups

Votre manager dans un fonds d'investissement vous envoie un fichier `startups.sql` contenant un portefeuille de **35 startups** parmi les plus connues de la tech mondiale. La table contient des informations sur :

- **Le nom** de la startup
- **Le pays** du siège social
- **Le secteur** d'activité (Fintech, IA, Cloud, Logistique…)
- **L'année de création**
- **Le nombre d'employés**
- **Le montant levé** en millions d'euros (`levee_fonds_millions`) — parfois non divulgué
- **La valorisation** en millions d'euros (`valorisation_millions`) — parfois inconnue
- **Le stade** de développement (Série B, C, D… ou IPO)
- **Le fondateur** — parfois non renseigné

> ⚠️ Comme dans la vraie vie, certaines données sont **manquantes** (`NULL`). Gardez cela en tête dans vos requêtes.

Utilisez les fonctions d'agrégation SQL pour explorer ce portefeuille et en tirer des analyses utiles.

---

### À vous de jouer !

**0.** Importez les requêtes du fichier `startups.sql` dans votre éditeur PostgreSQL.

---

### Aperçu général

**1.** Familiarisez-vous avec la table :

```sql
SELECT * FROM startups;
```

Quels sont les noms des colonnes ? Combien de startups contient la table ?

---

**2.** Certaines startups ont des données **manquantes**. Combien de startups ont une **valorisation connue** ? Comparez avec le nombre total de startups.

> 💡 Quelle différence entre `COUNT(*)` et `COUNT(valorisation_millions)` ?

---

**3.** Quelles startups n'ont **pas de valorisation connue** ? Affichez leur `nom` et leur `secteur`.

---

### Valorisation et financement

**4.** Quelle est la **somme totale** des valorisations pour l'ensemble du portefeuille ?

> 💡 Les fonctions d'agrégation comme `SUM()` ignorent automatiquement les `NULL`.

---

**5.** Quelle startup a levé le **plus de fonds** ? Quel est ce montant ?

---

**6.** Parmi les startups au stade `'Série B'`, quel est le **montant maximum** levé ?

---

**7.** En quelle année a été fondée la **plus ancienne** startup du portefeuille ?

---

### Analyse des valorisations

**8.** Quelle est la **valorisation moyenne** de toutes les startups ?

---

**9.** Le résultat est difficile à lire. Affichez la valorisation moyenne **arrondie à 2 décimales**.

---

**10.** Quelle est la valorisation moyenne **par secteur** ? Triez le résultat de la valorisation la **plus élevée à la plus basse**.

> 💡 Que se passe-t-il pour les secteurs où aucune startup n'a de valorisation connue ?

---

### Concurrence et diversité sectorielle

**11.** Combien de startups y a-t-il **dans chaque secteur** ? Triez du secteur le plus représenté au moins représenté.

---

**12.** Quels secteurs comptent **plus de 3 startups** ?

---

### Taille et localisation

**13.** Quelle est la **taille moyenne** (nombre d'employés) des startups **par pays** ? Triez du plus grand au plus petit.

---

**14.** Dans quels pays les startups ont-elles une taille moyenne **supérieure à 2 000 employés** ?

> 💡 `WHERE` filtre les lignes. Pour filtrer les groupes, quelle clause utiliser ?

---

### Stades de développement

**15.** Combien de startups y a-t-il **à chaque stade** de développement ? Triez du stade le plus fréquent au moins fréquent.

---

### Tendances récentes

**16.** Parmi les startups fondées **à partir de 2015**, affichez pour **chaque année de création** :
- Le nombre de startups
- La valorisation moyenne (arrondie à 0 décimale)
- Le total des levées de fonds

Triez par année croissante.

> 💡 Combinez `WHERE`, `GROUP BY` et `ORDER BY`. Dans quel ordre se placent-ils ?

---

### Secteurs et investissements

**17.** Dans quel secteur les startups ont-elles levé **en moyenne le plus de fonds** ?

Affichez le secteur, le nombre de startups et la moyenne des levées de fonds (arrondie), triés par moyenne décroissante.

> 💡 Que se passe-t-il pour les secteurs où une startup n'a pas divulgué sa levée de fonds ?

---

### Focus France 🇫🇷

**18.** Combien de startups **françaises** y a-t-il dans le portefeuille ?

---

**19.** Quel est le **total des fonds levés** par les startups françaises ?

> 💡 Attention : si une levée est `NULL`, elle n'est pas comptée dans la somme.

---

**20.** Quelle est la **valorisation moyenne par secteur** pour les startups **françaises uniquement** ? Triez par valorisation décroissante.

---

### Boss Final 👾

**21.** Écrivez **une seule requête** qui répond à la question suivante :

> *Parmi les startups françaises uniquement, quels secteurs comptent au moins 2 startups et ont une levée de fonds moyenne supérieure à 500 millions ? Affichez le secteur, le nombre de startups, la valorisation moyenne, la levée de fonds moyenne et le nombre moyen d'employés (le tout arrondi à 0 décimale). Triez par valorisation moyenne décroissante.*

> 💡 Il y a un filtre sur les **lignes** (`WHERE`) ET un filtre sur les **groupes** (`HAVING` avec deux conditions). Pensez à l'ordre des clauses.

