-- ═══════════════════════════════════════
-- ✈️ BASE DE DONNÉES — GLOBE-TROTTER
-- Agence de voyage étudiante
-- ═══════════════════════════════════════

-- ══ Tables principales (JOIN, clé primaire/étrangère) ══

CREATE TABLE voyageurs (
    id_voyageur INT PRIMARY KEY,
    prenom VARCHAR(256),
    nom VARCHAR(256),
    age INTEGER,
    email VARCHAR(256)
);

CREATE TABLE destinations (
    id_destination INT PRIMARY KEY,
    ville VARCHAR(256),
    pays VARCHAR(256),
    continent VARCHAR(100),
    prix_vol REAL
);

CREATE TABLE reservations (
    id_reservation INT PRIMARY KEY,
    id_voyageur INT,
    id_destination INT,
    date_depart DATE,
    date_retour DATE,
    type_hebergement VARCHAR(100),
    prix_total REAL
);

-- ══ Tables pour INNER JOIN / LEFT JOIN ══

CREATE TABLE inscrits_assurance (
    id INT PRIMARY KEY,
    prenom VARCHAR(256),
    nom VARCHAR(256),
    email VARCHAR(256),
    mois_debut INT,
    mois_fin INT
);

CREATE TABLE inscrits_carte_jeune (
    id INT PRIMARY KEY,
    prenom VARCHAR(256),
    nom VARCHAR(256),
    email VARCHAR(256),
    mois_debut INT,
    mois_fin INT
);

-- ══ Table pour CROSS JOIN ══

CREATE TABLE mois (
    mois INT PRIMARY KEY
);

-- ══ Tables pour clé primaire / clé étrangère ══

CREATE TABLE bureaux (
    id INT PRIMARY KEY,
    nom_bureau VARCHAR(256),
    ville VARCHAR(256),
    responsable VARCHAR(256)
);

CREATE TABLE agents (
    id INT PRIMARY KEY,
    prenom VARCHAR(256),
    nom VARCHAR(256),
    specialite VARCHAR(256),
    id_bureau INT
);


-- ═══════════════════════════════════════
-- DONNÉES
-- ═══════════════════════════════════════

-- Voyageurs
INSERT INTO voyageurs VALUES (1, 'Hugo', 'Martin', 20, 'hugo.martin@mail.com');
INSERT INTO voyageurs VALUES (2, 'Léa', 'Dupont', 19, 'lea.dupont@mail.com');
INSERT INTO voyageurs VALUES (3, 'Lucas', 'Bernard', 20, 'lucas.b@mail.com');
INSERT INTO voyageurs VALUES (4, 'Emma', 'Leroy', 21, 'emma.leroy@mail.com');
INSERT INTO voyageurs VALUES (5, 'Nathan', 'Moreau', 19, 'nathan.m@mail.com');
INSERT INTO voyageurs VALUES (6, 'Chloé', 'Petit', 20, 'chloe.p@mail.com');
INSERT INTO voyageurs VALUES (7, 'Adam', 'Roux', 21, 'adam.roux@mail.com');
INSERT INTO voyageurs VALUES (8, 'Jade', 'Simon', 19, 'jade.simon@mail.com');
INSERT INTO voyageurs VALUES (9, 'Théo', 'Laurent', 20, 'theo.l@mail.com');
INSERT INTO voyageurs VALUES (10, 'Inès', 'Garcia', 21, 'ines.g@mail.com');

-- Destinations
INSERT INTO destinations VALUES (1, 'Barcelone', 'Espagne', 'Europe', 89);
INSERT INTO destinations VALUES (2, 'Lisbonne', 'Portugal', 'Europe', 120);
INSERT INTO destinations VALUES (3, 'Rome', 'Italie', 'Europe', 95);
INSERT INTO destinations VALUES (4, 'Amsterdam', 'Pays-Bas', 'Europe', 110);
INSERT INTO destinations VALUES (5, 'Prague', 'Tchéquie', 'Europe', 75);
INSERT INTO destinations VALUES (6, 'Marrakech', 'Maroc', 'Afrique', 130);
INSERT INTO destinations VALUES (7, 'New York', 'États-Unis', 'Amérique', 450);
INSERT INTO destinations VALUES (8, 'Tokyo', 'Japon', 'Asie', 680);
INSERT INTO destinations VALUES (9, 'Bangkok', 'Thaïlande', 'Asie', 520);
INSERT INTO destinations VALUES (10, 'Montréal', 'Canada', 'Amérique', 380);

-- Réservations
INSERT INTO reservations VALUES (1, 1, 1, '2026-07-01', '2026-07-05', 'Auberge', 320);
INSERT INTO reservations VALUES (2, 1, 6, '2026-08-10', '2026-08-17', 'Riad', 580);
INSERT INTO reservations VALUES (3, 2, 3, '2026-07-15', '2026-07-19', 'Airbnb', 410);
INSERT INTO reservations VALUES (4, 2, 4, '2026-09-01', '2026-09-04', 'Auberge', 350);
INSERT INTO reservations VALUES (5, 3, 1, '2026-07-01', '2026-07-06', 'Auberge', 340);
INSERT INTO reservations VALUES (6, 3, 7, '2026-12-20', '2026-12-28', 'Airbnb', 1450);
INSERT INTO reservations VALUES (7, 4, 8, '2026-08-01', '2026-08-14', 'Auberge', 1890);
INSERT INTO reservations VALUES (8, 4, 9, '2026-08-15', '2026-08-25', 'Auberge', 980);
INSERT INTO reservations VALUES (9, 5, 2, '2026-07-10', '2026-07-14', 'Airbnb', 420);
INSERT INTO reservations VALUES (10, 5, 5, '2026-10-18', '2026-10-22', 'Auberge', 280);
INSERT INTO reservations VALUES (11, 6, 1, '2026-07-01', '2026-07-05', 'Airbnb', 380);
INSERT INTO reservations VALUES (12, 6, 3, '2026-09-10', '2026-09-14', 'Hôtel', 520);
INSERT INTO reservations VALUES (13, 7, 6, '2026-07-20', '2026-07-27', 'Riad', 610);
INSERT INTO reservations VALUES (14, 7, 10, '2026-11-01', '2026-11-08', 'Airbnb', 890);
INSERT INTO reservations VALUES (15, 8, 5, '2026-07-05', '2026-07-09', 'Auberge', 260);
INSERT INTO reservations VALUES (16, 8, 4, '2026-10-10', '2026-10-13', 'Airbnb', 380);
INSERT INTO reservations VALUES (17, 9, 2, '2026-07-10', '2026-07-15', 'Auberge', 440);
INSERT INTO reservations VALUES (18, 9, 1, '2026-08-20', '2026-08-24', 'Auberge', 310);
INSERT INTO reservations VALUES (19, 10, 7, '2026-12-22', '2026-12-30', 'Hôtel', 1850);
INSERT INTO reservations VALUES (20, 10, 3, '2026-09-05', '2026-09-09', 'Airbnb', 430);
-- Voyageur 11 : existe dans réservations mais PAS dans voyageurs
INSERT INTO reservations VALUES (21, 11, 9, '2026-08-01', '2026-08-10', 'Auberge', 870);
INSERT INTO reservations VALUES (22, 11, 6, '2026-07-15', '2026-07-22', 'Riad', 590);

-- Inscrits assurance voyage
INSERT INTO inscrits_assurance VALUES (1, 'Hugo', 'Martin', 'hugo.martin@mail.com', 6, 9);
INSERT INTO inscrits_assurance VALUES (2, 'Léa', 'Dupont', 'lea.dupont@mail.com', 7, 9);
INSERT INTO inscrits_assurance VALUES (3, 'Lucas', 'Bernard', 'lucas.b@mail.com', 6, 12);
INSERT INTO inscrits_assurance VALUES (4, 'Emma', 'Leroy', 'emma.leroy@mail.com', 7, 9);
INSERT INTO inscrits_assurance VALUES (5, 'Nathan', 'Moreau', 'nathan.m@mail.com', 7, 10);
INSERT INTO inscrits_assurance VALUES (7, 'Adam', 'Roux', 'adam.roux@mail.com', 7, 11);
INSERT INTO inscrits_assurance VALUES (9, 'Théo', 'Laurent', 'theo.l@mail.com', 7, 8);
INSERT INTO inscrits_assurance VALUES (10, 'Inès', 'Garcia', 'ines.g@mail.com', 9, 12);

-- Inscrits carte jeune voyage
INSERT INTO inscrits_carte_jeune VALUES (1, 'Hugo', 'Martin', 'hugo.martin@mail.com', 1, 12);
INSERT INTO inscrits_carte_jeune VALUES (3, 'Lucas', 'Bernard', 'lucas.b@mail.com', 1, 12);
INSERT INTO inscrits_carte_jeune VALUES (5, 'Nathan', 'Moreau', 'nathan.m@mail.com', 6, 12);
INSERT INTO inscrits_carte_jeune VALUES (6, 'Chloé', 'Petit', 'chloe.p@mail.com', 3, 10);
INSERT INTO inscrits_carte_jeune VALUES (8, 'Jade', 'Simon', 'jade.simon@mail.com', 5, 12);
INSERT INTO inscrits_carte_jeune VALUES (10, 'Inès', 'Garcia', 'ines.g@mail.com', 9, 12);

-- Mois
INSERT INTO mois VALUES (1);
INSERT INTO mois VALUES (2);
INSERT INTO mois VALUES (3);
INSERT INTO mois VALUES (4);
INSERT INTO mois VALUES (5);
INSERT INTO mois VALUES (6);
INSERT INTO mois VALUES (7);
INSERT INTO mois VALUES (8);
INSERT INTO mois VALUES (9);
INSERT INTO mois VALUES (10);
INSERT INTO mois VALUES (11);
INSERT INTO mois VALUES (12);

-- Bureaux de l'agence
INSERT INTO bureaux VALUES (1, 'Bureau Europe', 'Lyon', 'Marie Delcourt');
INSERT INTO bureaux VALUES (2, 'Bureau Asie', 'Lyon', 'Philippe Tran');
INSERT INTO bureaux VALUES (3, 'Bureau Amérique', 'Paris', 'Sophie Blanc');
INSERT INTO bureaux VALUES (4, 'Bureau Afrique', 'Marseille', 'Karim Bensaid');

-- Agents de voyage
INSERT INTO agents VALUES (1, 'Alice', 'Morel', 'Vols low-cost', 1);
INSERT INTO agents VALUES (2, 'Romain', 'Faure', 'Circuits organisés', 1);
INSERT INTO agents VALUES (3, 'Yuki', 'Tanaka', 'Séjours culturels', 2);
INSERT INTO agents VALUES (4, 'David', 'Chen', 'Treks & aventure', 2);
INSERT INTO agents VALUES (5, 'Laura', 'Martin', 'Road trips', 3);
INSERT INTO agents VALUES (6, 'Omar', 'Diallo', 'Séjours balnéaires', 4);
INSERT INTO agents VALUES (7, 'Clara', 'Petit', 'Vols low-cost', 1);
INSERT INTO agents VALUES (8, 'Julien', 'Garnier', 'Séjours linguistiques', 3);
INSERT INTO agents VALUES (9, 'Nina', 'Weber', 'Interrail', NULL);
