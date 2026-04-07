-- Table courses
CREATE TABLE courses (
id INTEGER PRIMARY KEY,
date TEXT,
heure_debut_course TEXT,
heure_fin_course TEXT,
id_chauffeur INTEGER,
id_voiture INTEGER,
type TEXT,
prix_course INTEGER
);

INSERT INTO courses (id, date, heure_debut_course, heure_fin_course, id_chauffeur, id_voiture, type, prix_course)
VALUES
(1001, '2017-12-05', '06:45', '07:10', 102, 1, 'X', 28.66),
(1002, '2017-12-05', '08:00', '08:15', 101, 3, 'POOL', 9.11),
(1003, '2017-12-07', '09:30', '09:50', 104, 4, 'X', 24.98),
(1004, '2017-12-07', '13:40', '14:05', 105, 1, 'X', 31.27),
(1005, '2017-12-05', '15:15', '16:00', 103, 2, 'POOL', 18.95),
(1006, '2017-12-05', '18:20', '18:55', 101, 3, 'XL', 78.52);

-- Table chauffeurs
CREATE TABLE chauffeurs (
id INTEGER PRIMARY KEY,
prenom TEXT,
nom TEXT,
pseudo TEXT,
note INTEGER,
total_trajets INTEGER,
reference INTEGER
);

INSERT INTO chauffeurs (id, prenom, nom, pseudo, note, total_trajets, reference)
VALUES
(101, 'Sonny', 'Li', '@sonnynomnom', 4.66, 352, NULL),
(102, 'Laura', 'Breiman', '@lauracle', 4.99, 687, 101),
(103, 'Kassa', 'Korley', '@kassablanca', 4.63, 42, NULL),
(104, 'Yakov', 'Kagan', '@yakovkagan', 4.52, 1910, 103);


-- Table chauffeur2
CREATE TABLE chauffeur2 (
id INTEGER PRIMARY KEY,
prenom TEXT,
nom TEXT,
pseudo TEXT,
note INTEGER,
total_trajets INTEGER,
reference INTEGER
);

-- Insertion des données dans la table chauffeur2
INSERT INTO chauffeur2 (id, prenom, nom, pseudo, note, total_trajets, reference) VALUES
(105, 'Zach', 'Sims', '@zsims', 4.85, 787, NULL),
(106, 'Eric', 'Vaught', '@posturelol', 4.96, 54, 101),
(107, 'Jilly', 'Beans', '@jillkuzmin', 4.7, 32, 101);


-- Table voitures
CREATE TABLE voitures (
id INTEGER PRIMARY KEY,
modele TEXT,
os_application TEXT,
status TEXT,
total_trajets_complets INTEGER
);

INSERT INTO voitures (id, modele, os_application, status, total_trajets_complets)
VALUES
(1, 'Ada', 'Ryzac', 'active', 82),
(2, 'Ada', 'Ryzac', 'active', 30),
(3, 'Turing XL', 'Ryzac', 'active', 164),
(4, 'Akira', 'Finux', 'maintenance', 22);
