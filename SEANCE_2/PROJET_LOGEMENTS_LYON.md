# 🏠 Projet — Trouver un appart' à Lyon

C'est la rentrée qui approche et vous cherchez un logement à Lyon. Vous avez récupéré les annonces d'une plateforme de location sous forme de base de données SQL. Elle contient des détails sur :

- **Le titre** : Nom de l'annonce sur la plateforme.
- **Le quartier** : Localisation dans Lyon et ses alentours.
- **Le type de logement** : Studio, T1, T2, T3 ou Colocation.
- **La surface** : Superficie en m² (pour une chambre en colocation, la surface de la chambre uniquement).
- **Le loyer** : Loyer mensuel hors charges, en euros.
- **Les charges** : Charges mensuelles en euros.
- **Meublé** : `'Oui'` ou `'Non'`.
- **La note locataire** : Note attribuée par les anciens locataires (sur 5). Certains logements n'ont pas encore été notés.
- **La disponibilité** : Date à laquelle le logement est disponible.
- **Le propriétaire** : Nom de l'agence ou `'Particulier'`.

Utilisez les commandes SQL que vous avez apprises pour explorer ces annonces et trouver le logement idéal !

---

### À vous de jouer !

**0.** Importez les requêtes du fichier `logements.sql` dans votre éditeur PostgreSQL.

---

**1.** Commencez par vous familiariser avec la table `logements` :

```sql
SELECT * FROM logements;
```

Quels sont les noms des colonnes ? Combien d'annonces contient la table ?

---

**2.** Dans quels **quartiers** peut-on trouver un logement ?

Affichez les quartiers **sans doublons**.

---

**3.** Quels **types de logement** sont disponibles sur la plateforme ?

---

**4.** Vous avez un budget serré. Quels logements ont un loyer **inférieur ou égal à 400€** ?

---

**5.** Vous ne voulez que le meilleur. Quels logements ont une note locataire **supérieure ou égale à 4.5** ?

Combien en trouvez-vous ?

---

**6.** Vous arrivez à Lyon sans meubles. Vous cherchez un **studio** qui soit **meublé**.

Quelles sont vos options ?

> 💡 Vous avez besoin de deux conditions.

---

**7.** Vous voulez comparer les offres des **agences lyonnaises** (pas les particuliers ni le CROUS).

Trouvez tous les logements dont le nom du propriétaire **contient le mot** `'Lyon'`.

---

**8.** Un camarade de promo vous a parlé d'une coloc à Lyon, mais il ne se souvient plus du nom exact de l'annonce. Il sait juste que le titre contenait le mot `'Coloc'`.

Retrouvez les annonces correspondantes.

---

**9.** Vous hésitez entre vivre en centre-ville ou dans un quartier étudiant. Affichez tous les logements situés dans la **Presqu'île**, le **Vieux Lyon** ou à **Confluence**.

> 💡 `OR` peut être utilisé plus d'une fois.

---

**10.** Certains logements n'ont **pas encore été notés** par d'anciens locataires.

Trouvez-les. Affichez uniquement le `titre` et le `quartier`.

---

**11.** Vous cherchez un logement dans une fourchette de prix raisonnable.

Affichez tous les logements dont le loyer est **compris entre 400€ et 600€** (bornes incluses).

Combien en trouvez-vous ?

---

**12.** Vous cherchez spécifiquement un **T2 bien noté** (note supérieure à 4).

Affichez ces T2, **triés du moins cher au plus cher**.

---

**13.** Le budget est la priorité numéro 1 pour un étudiant.

Affichez les **5 logements les moins chers** de la base. Triez-les par loyer croissant.

---

**14.** Pour chaque logement, créez une nouvelle colonne `'budget'` qui classe le loyer en catégories :

- Loyer **supérieur à 800€** → `'Hors budget étudiant'`
- Loyer **supérieur à 500€** → `'Confortable'`
- Sinon → `'Abordable'`

Affichez le `titre`, le `loyer` et cette nouvelle colonne `'budget'`.

> ⚠️ Attention à l'ordre de vos conditions !

---

**15.** C'est l'heure du choix final ! Vous cherchez :

- Un **Studio** ou un **T1**
- **Meublé**
- Avec une note **supérieure ou égale à 4**
- Le tout trié par **loyer croissant**
- Et vous ne voulez voir que les **3 premiers résultats**

Écrivez **une seule requête** qui répond à tous ces critères.

> 💡 Quand vous mélangez `OR` et `AND` dans un même `WHERE`, pensez aux **parenthèses** pour regrouper les conditions qui vont ensemble.

---

Bon courage et bonne recherche d'appart' ! 🏠🔑
