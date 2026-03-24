CREATE TABLE startups (
   id INTEGER,
   nom TEXT,
   pays TEXT,
   secteur TEXT,
   annee_creation INTEGER,
   nb_employes INTEGER,
   levee_fonds_millions REAL,
   valorisation_millions REAL,
   stade TEXT,
   fondateur TEXT
);

INSERT INTO startups VALUES (1, 'Spotify', 'Suède', 'Musique', 2006, 8000, 2700, 67000, 'IPO', 'Daniel Ek');
INSERT INTO startups VALUES (2, 'Airbnb', 'États-Unis', 'Voyage', 2008, 6900, 6400, 78000, 'IPO', 'Brian Chesky');
INSERT INTO startups VALUES (3, 'Stripe', 'États-Unis', 'Fintech', 2010, 8000, 8700, 50000, 'Série I', 'Patrick Collison');
INSERT INTO startups VALUES (4, 'Revolut', 'Royaume-Uni', 'Fintech', 2015, 8000, 1700, 33000, 'Série E', 'Nikolay Storonsky');
INSERT INTO startups VALUES (5, 'BlaBlaCar', 'France', 'Voyage', 2006, 700, 600, 2000, 'Série D', 'Frédéric Mazzella');
INSERT INTO startups VALUES (6, 'Doctolib', 'France', 'Santé', 2013, 2800, 900, 5600, 'Série F', 'Stanislas Niox-Château');
INSERT INTO startups VALUES (7, 'Datadog', 'États-Unis', 'Cloud', 2010, 5200, 650, 35000, 'IPO', 'Olivier Pomel');
INSERT INTO startups VALUES (8, 'Klarna', 'Suède', 'Fintech', 2005, 5000, 4600, 14600, 'Série E', 'Sebastian Siemiatkowski');
INSERT INTO startups VALUES (9, 'Canva', 'Australie', 'Design', 2012, 4000, 570, 26000, 'Série F', 'Melanie Perkins');
INSERT INTO startups VALUES (10, 'Discord', 'États-Unis', 'Social', 2015, 600, 1000, 15000, 'Série H', 'Jason Citron');
INSERT INTO startups VALUES (11, 'Figma', 'États-Unis', 'Design', 2012, 1400, 330, 12500, 'Série E', 'Dylan Field');
INSERT INTO startups VALUES (12, 'Notion', 'États-Unis', 'Productivité', 2013, 500, 340, 10000, 'Série C', 'Ivan Zhao');
INSERT INTO startups VALUES (13, 'Mistral AI', 'France', 'IA', 2023, 60, 1100, 6000, 'Série B', 'Arthur Mensch');
INSERT INTO startups VALUES (14, 'OpenAI', 'États-Unis', 'IA', 2015, 2500, 11300, 157000, 'Série F', 'Sam Altman');
INSERT INTO startups VALUES (15, 'Uber', 'États-Unis', 'Logistique', 2009, 32800, 25500, 150000, 'IPO', 'Travis Kalanick');
INSERT INTO startups VALUES (16, 'Deliveroo', 'Royaume-Uni', 'Logistique', 2013, 3500, 1800, 4500, 'IPO', 'Will Shu');
INSERT INTO startups VALUES (17, 'Back Market', 'France', 'E-commerce', 2014, 650, 900, 5100, 'Série E', 'Thibaud Hug de Larauze');
INSERT INTO startups VALUES (18, 'N26', 'Allemagne', 'Fintech', 2013, 1500, 1800, 9000, 'Série E', 'Valentin Stalf');
INSERT INTO startups VALUES (19, 'Bolt', 'Estonie', 'Logistique', 2013, 5000, 2300, 8400, 'Série F', 'Markus Villig');
INSERT INTO startups VALUES (20, 'Wise', 'Royaume-Uni', 'Fintech', 2011, 5800, 400, 11000, 'IPO', 'Kristo Käärmann');
INSERT INTO startups VALUES (21, 'Deezer', 'France', 'Musique', 2007, 600, 400, 1000, 'IPO', 'Daniel Marhely');
INSERT INTO startups VALUES (22, 'Alan', 'France', 'Santé', 2016, 550, 500, 4000, 'Série E', 'Jean-Charles Samuelian');
INSERT INTO startups VALUES (23, 'Lydia', 'France', 'Fintech', 2013, 300, 230, NULL, 'Série C', 'Cyril Chiche');
INSERT INTO startups VALUES (24, 'Vinted', 'Lituanie', 'E-commerce', 2008, 2000, 580, 4500, 'Série F', 'Milda Mitkute');
INSERT INTO startups VALUES (25, 'Sorare', 'France', 'Jeux / NFT', 2018, 200, 740, 4300, 'Série B', 'Nicolas Julia');
INSERT INTO startups VALUES (26, 'Swile', 'France', 'RH / Avantages', 2017, 500, 260, 1100, 'Série C', 'Loïc Soubeyrand');
INSERT INTO startups VALUES (27, 'Qonto', 'France', 'Fintech', 2016, 1400, 600, 5000, 'Série D', 'Alexandre Prot');
INSERT INTO startups VALUES (28, 'Anthropic', 'États-Unis', 'IA', 2021, 1000, 7600, 60000, 'Série D', 'Dario Amodei');
INSERT INTO startups VALUES (29, 'Hugging Face', 'France', 'IA', 2016, 200, 400, 4500, 'Série D', 'Clément Delangue');
INSERT INTO startups VALUES (30, 'Epic Games', 'États-Unis', 'Jeux / NFT', 1991, 4500, 6400, 31500, 'Série F', 'Tim Sweeney');
INSERT INTO startups VALUES (31, 'Databricks', 'États-Unis', 'Cloud', 2013, 7000, 4200, 43000, 'Série I', 'Ali Ghodsi');
INSERT INTO startups VALUES (32, 'Wiz', 'Israël', 'Cybersécurité', 2020, 1200, 1900, 12000, 'Série E', NULL);
INSERT INTO startups VALUES (33, 'Ledger', 'France', 'Crypto', 2014, 700, NULL, 1500, 'Série C', 'Éric Larchevêque');
INSERT INTO startups VALUES (34, 'Contentsquare', 'France', 'Analytics', 2012, 1800, 1400, NULL, 'Série F', 'Jonathan Cherki');
INSERT INTO startups VALUES (35, 'OVHcloud', 'France', 'Cloud', 1999, 3000, 800, 3500, 'IPO', 'Octave Klaba');
