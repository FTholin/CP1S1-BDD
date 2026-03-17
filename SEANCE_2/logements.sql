CREATE TABLE logements (
    id INTEGER,
    titre TEXT,
    quartier TEXT,
    type_logement TEXT,
    surface INTEGER,
    loyer INTEGER,
    charges INTEGER,
    meuble TEXT,
    note_locataire REAL,
    disponibilite DATE,
    proprietaire TEXT
);

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (1, 'Studio lumineux Presqu''île', 'Presqu''île', 'Studio', 20, 450, 50, 'Oui', 4.5, '2026-09-01', 'Dupont Immo');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (2, 'T2 rénové Part-Dieu', 'Part-Dieu', 'T2', 42, 720, 80, 'Non', 4.2, '2026-09-01', 'Lyon Habitat');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (3, 'Coloc sympa Guillotière', 'Guillotière', 'Colocation', 15, 380, 40, 'Oui', 3.8, '2026-07-01', 'Particulier');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (4, 'Grand T3 Monplaisir', 'Monplaisir', 'T3', 65, 950, 100, 'Non', 4.7, '2026-10-01', 'Lyon Habitat');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (5, 'Studio étudiant Villeurbanne', 'Villeurbanne', 'Studio', 18, 390, 30, 'Oui', 3.5, '2026-09-01', 'CROUS');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (6, 'T1 cosy Vieux Lyon', 'Vieux Lyon', 'T1', 28, 550, 60, 'Oui', 4.0, '2026-08-01', 'Dupont Immo');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (7, 'Coloc étudiante Jean Macé', 'Jean Macé', 'Colocation', 14, 350, 35, 'Non', NULL, '2026-09-01', 'Particulier');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (8, 'T2 vue Rhône', 'Presqu''île', 'T2', 45, 850, 90, 'Oui', 4.8, '2026-09-15', 'Orpi Lyon');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (9, 'Studio meublé Saxe-Gambetta', 'Saxe-Gambetta', 'Studio', 22, 480, 45, 'Oui', 4.1, '2026-07-15', 'Particulier');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (10, 'T1 calme Croix-Rousse', 'Croix-Rousse', 'T1', 30, 520, 55, 'Non', 3.9, '2026-09-01', 'Foncia Lyon');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (11, 'Grande Coloc Brotteaux', 'Brotteaux', 'Colocation', 16, 420, 50, 'Oui', 4.3, '2026-08-15', 'Orpi Lyon');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (12, 'Studio terrasse Gerland', 'Gerland', 'Studio', 25, 430, 40, 'Non', NULL, '2026-10-01', 'Lyon Habitat');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (13, 'T3 familial Montchat', 'Montchat', 'T3', 70, 1050, 120, 'Non', 4.6, '2026-09-01', 'Foncia Lyon');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (14, 'T1 neuf Confluence', 'Confluence', 'T1', 32, 620, 70, 'Oui', 4.4, '2026-09-01', 'Nexity Lyon');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (15, 'Coloc artiste Guillotière', 'Guillotière', 'Colocation', 13, 330, 30, 'Non', 3.2, '2026-07-01', 'Particulier');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (16, 'T2 standing Tête d''Or', 'Tête d''Or', 'T2', 50, 980, 110, 'Oui', 4.9, '2026-11-01', 'Nexity Lyon');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (17, 'Studio Bellecour', 'Presqu''île', 'Studio', 19, 500, 55, 'Oui', 4.0, '2026-09-01', 'Dupont Immo');

INSERT INTO logements (id, titre, quartier, type_logement, surface, loyer, charges, meuble, note_locataire, disponibilite, proprietaire)
VALUES (18, 'T2 lumineux Part-Dieu', 'Part-Dieu', 'T2', 40, 690, 75, 'Oui', 3.6, '2026-08-01', 'Particulier');
