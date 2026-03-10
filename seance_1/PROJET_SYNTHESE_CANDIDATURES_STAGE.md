# 🎯 Projet de synthèse — Gérez vos candidatures de stage

Dans ce projet, vous allez créer votre propre tableau de suivi de candidatures de stage et y ajouter, modifier et supprimer des données.

Les instructions fournies sont des lignes directrices générales. N'hésitez pas à ajouter d'autres colonnes, à insérer d'autres données et à créer d'autres tableaux.

---

### À vous de jouer !

**1.** Créez une table nommée `candidatures` avec les colonnes suivantes :

- `id` qui stocke un `INTEGER`
- `entreprise` qui stocke du `TEXT`
- `poste` qui stocke du `TEXT`
- `date_envoi` qui stocke une `DATE`
- `statut` qui stocke du `TEXT`

---

**2.** Sous votre code actuel, ajoutez une première candidature :

Vous avez postulé chez **Dassault Systèmes** pour un **stage assistant ingénieur R&D**, le **10 janvier 2026**. Le statut est `'envoyée'`.

Son `id` est 1.

```sql
INSERT INTO candidatures (id, entreprise, poste, date_envoi, statut)
VALUES (1, 'Dassault Systèmes', 'Stage assistant ingénieur R&D', '2026-01-10', 'envoyée');
```

---

**3.** Assurons-nous que la candidature a bien été ajoutée à la base de données :

```sql
SELECT * FROM candidatures;
```

Vérifiez deux choses :

- La table `candidatures` est-elle créée ?
- La candidature chez Dassault Systèmes y a-t-elle été ajoutée ?

---

**4.** Passez à l'action ! Ajoutez **quatre autres candidatures** à la table.

Insérez un identifiant, une entreprise, un poste, une date d'envoi et un statut pour chacune d'elles :

```sql
INSERT INTO candidatures (id, entreprise, poste, date_envoi, statut)
VALUES (2, 'Schneider Electric', 'Stage bureau d''études électrique', '2026-01-15', 'envoyée');

INSERT INTO candidatures (id, entreprise, poste, date_envoi, statut)
VALUES (3, 'Sopra Steria', 'Stage développeur Java', '2026-01-18', 'envoyée');

INSERT INTO candidatures (id, entreprise, poste, date_envoi, statut)
VALUES (4, 'Renault', 'Stage méthodes industrialisation', '2026-02-01', 'envoyée');

INSERT INTO candidatures (id, entreprise, poste, date_envoi, statut)
VALUES (5, 'Vinci Construction', 'Stage conducteur de travaux', '2026-02-05', 'envoyée');
```

> 💡 Remarquez le `''` dans `d''études` : en SQL, pour insérer une apostrophe dans une chaîne de texte, on la double.

---

**5.** Vérifiez que les 5 candidatures sont bien dans la table :

```sql
SELECT * FROM candidatures;
```

<details>
<summary>Vérification 🔑</summary>
<p>La table doit contenir <b>5 lignes</b>, toutes avec le statut <code>'envoyée'</code>.</p>
</details>

---

**6.** Bonne nouvelle ! **Dassault Systèmes** vous a répondu et vous convoque à un entretien.

Mettez à jour le statut de cette candidature :

```sql
UPDATE candidatures
SET statut = 'entretien'
WHERE id = 1;
```

Vérifiez la modification :

```sql
SELECT * FROM candidatures;
```

<details>
<summary>Vérification 🔑</summary>
<p>La ligne avec <code>id = 1</code> (Dassault Systèmes) doit maintenant afficher le statut <code>'entretien'</code>. Les 4 autres sont toujours à <code>'envoyée'</code>.</p>
</details>

---

**7.** Mauvaise nouvelle : **Sopra Steria** vous envoie un refus.

Mettez à jour le statut de cette candidature en `'refusée'`.

<details>
<summary>Indice 🔑</summary>

```sql
UPDATE candidatures
SET statut = 'refusée'
WHERE id = 3;
```

</details>

---

**8.** Quand on n'a pas de réponse, il faut relancer ! Ajoutez une nouvelle colonne nommée `date_relance` de type `DATE`.

```sql
ALTER TABLE candidatures
ADD COLUMN date_relance DATE;

SELECT * FROM candidatures;
```

Que contient la colonne `date_relance` pour les candidatures existantes ?

<details>
<summary>Réponse 🔑</summary>
<p>La colonne <code>date_relance</code> contient <b>NULL</b> pour toutes les lignes. <code>NULL</code> signifie que la donnée est manquante ou inconnue : aucune relance n'a encore été planifiée.</p>
</details>

---

**9.** Planifiez vos relances. Vous décidez de relancer les entreprises qui n'ont pas encore répondu :

- **Schneider Electric** : relance le `'2026-02-01'`
- **Renault** : relance le `'2026-02-15'`
- **Vinci Construction** : relance le `'2026-02-20'`

Mettez à jour la colonne `date_relance` pour chacune de ces candidatures.

<details>
<summary>Indice 🔑</summary>

```sql
UPDATE candidatures
SET date_relance = '2026-02-01'
WHERE id = 2;

UPDATE candidatures
SET date_relance = '2026-02-15'
WHERE id = 4;

UPDATE candidatures
SET date_relance = '2026-02-20'
WHERE id = 5;
```

</details>

---

**10.** Vérifiez l'état de toutes vos candidatures :

```sql
SELECT * FROM candidatures;
```

À ce stade, votre table doit ressembler à ceci :

| id | entreprise          | poste                               | date_envoi | statut    | date_relance |
|----|---------------------|-------------------------------------|------------|-----------|--------------|
| 1  | Dassault Systèmes   | Stage assistant ingénieur R&D       | 2026-01-10 | entretien | NULL         |
| 2  | Schneider Electric  | Stage bureau d'études électrique    | 2026-01-15 | envoyée   | 2026-02-01   |
| 3  | Sopra Steria        | Stage développeur Java              | 2026-01-18 | refusée   | NULL         |
| 4  | Renault             | Stage méthodes industrialisation    | 2026-02-01 | envoyée   | 2026-02-15   |
| 5  | Vinci Construction  | Stage conducteur de travaux         | 2026-02-05 | envoyée   | 2026-02-20   |

Si votre résultat correspond, vous êtes sur la bonne voie !

---

**11.** L'entretien chez Dassault Systèmes s'est très bien passé. Ils vous envoient une proposition de stage !

Mettez à jour le statut de cette candidature en `'acceptée'`.

<details>
<summary>Indice 🔑</summary>

```sql
UPDATE candidatures
SET statut = 'acceptée'
WHERE id = 1;
```

</details>

---

**12.** Vous avez trouvé votre stage, félicitations ! Il est temps de faire le ménage.

Commencez par supprimer la candidature qui a été **refusée** :

```sql
DELETE FROM candidatures
WHERE statut = 'refusée';
```

Combien de lignes restent dans la table ?

<details>
<summary>Réponse 🔑</summary>
<p><b>4 lignes</b> restent. Seule la candidature chez <b>Sopra Steria</b> (id 3, statut <code>'refusée'</code>) a été supprimée.</p>
</details>

---

**13.** Maintenant que votre stage est trouvé, les candidatures encore en attente ne sont plus utiles. Remarquez que ce sont aussi les seules qui ont une `date_relance` renseignée.

Supprimez toutes les candidatures dont la `date_relance` **n'est pas** `NULL` :

```sql
DELETE FROM candidatures
WHERE date_relance IS NOT NULL;
```

Combien de lignes restent dans la table ?

<details>
<summary>Réponse 🔑</summary>
<p><b>1 seule ligne</b> reste : la candidature <b>acceptée</b> chez Dassault Systèmes (id 1), dont la <code>date_relance</code> est <code>NULL</code> (pas besoin de relancer quand on a décroché le stage !).</p>
</details>

---

**14.** Bon travail ! Regardons le résultat une dernière fois :

```sql
SELECT * FROM candidatures;
```

Votre table finale doit contenir **une seule ligne** :

| id | entreprise          | poste                          | date_envoi | statut   | date_relance |
|----|---------------------|--------------------------------|------------|----------|--------------|
| 1  | Dassault Systèmes   | Stage assistant ingénieur R&D  | 2026-01-10 | acceptée | NULL         |

---

## 🚀 Pour aller plus loin

Ces étapes sont **optionnelles**, pour celles et ceux qui veulent approfondir.

**15.** Créez une nouvelle table nommée `entretiens` avec les colonnes suivantes :

- `id` qui stocke un `INTEGER`
- `entreprise` qui stocke du `TEXT`
- `date_entretien` qui stocke une `DATE`
- `type_entretien` qui stocke du `TEXT` (par exemple : `'téléphone'`, `'visio'`, `'présentiel'`)
- `ressenti` qui stocke du `TEXT`

---

**16.** Insérez trois entretiens dans la table (réels ou fictifs). Par exemple :

```sql
INSERT INTO entretiens (id, entreprise, date_entretien, type_entretien, ressenti)
VALUES (1, 'Dassault Systèmes', '2026-01-25', 'présentiel', 'confiant');

INSERT INTO entretiens (id, entreprise, date_entretien, type_entretien, ressenti)
VALUES (2, 'Schneider Electric', '2026-02-10', 'visio', 'moyen');

INSERT INTO entretiens (id, entreprise, date_entretien, type_entretien, ressenti)
VALUES (3, 'Renault', '2026-02-20', 'téléphone', NULL);
```

---

**17.** Vous n'avez pas encore renseigné votre ressenti pour l'entretien chez Renault. Mettez à jour cette ligne pour y inscrire `'difficile'`.

<details>
<summary>Indice 🔑</summary>

```sql
UPDATE entretiens
SET ressenti = 'difficile'
WHERE id = 3;
```

</details>

---

**18.** Supprimez les entretiens pour lesquels le ressenti est `NULL` (ceux que vous n'avez pas encore évalués).

```sql
DELETE FROM entretiens
WHERE ressenti IS NULL;
```

Combien d'entretiens restent ?

<details>
<summary>Réponse 🔑</summary>
<p><b>3 entretiens</b> restent, aucun n'a été supprimé ! En effet, à l'étape 17 vous avez mis à jour le ressenti de Renault en <code>'difficile'</code>, donc il n'est plus <code>NULL</code>. Aucune ligne ne correspond au critère <code>WHERE ressenti IS NULL</code>.</p>
</details>

---

**19.** Consultez la table finale :

```sql
SELECT * FROM entretiens;
```

---

## Récapitulatif des commandes utilisées

| Commande        | Ce qu'elle fait                    | Étape(s)               |
|-----------------|------------------------------------|------------------------|
| `CREATE TABLE`  | Créer une nouvelle table           | 1, 15                  |
| `INSERT INTO`   | Ajouter des lignes                 | 2, 4, 16               |
| `SELECT`        | Lire et afficher des données       | 3, 5, 6, 10, 14, 19    |
| `ALTER TABLE`   | Ajouter une colonne                | 8                      |
| `UPDATE`        | Modifier des données existantes    | 6, 7, 9, 11, 17        |
| `DELETE FROM`   | Supprimer des lignes               | 12, 13, 18             |

---

**Bravo !** 🎉 Vous avez construit un vrai outil de suivi de candidatures en SQL. Vous savez maintenant créer des tables, les remplir, les modifier et les nettoyer — les fondations de tout système de gestion de données.
