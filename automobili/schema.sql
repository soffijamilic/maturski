DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS oglas;
DROP TABLE IF EXISTS marka;
DROP TABLE IF EXISTS model;
DROP TABLE IF EXISTS gorivo;
DROP TABLE IF EXISTS godiste;
DROP TABLE IF EXISTS menjac;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  email TEXT UNIQUE NOT NULL
);

CREATE TABLE oglas (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  cena INTEGER NOT NULL,
<<<<<<< HEAD
  kilometraza INTEGER NOT NULL,
  godiste INTEGER NOT NULL, 
=======
  id_godista INTEGER NOT NULL,
>>>>>>> main
  id_marke INTEGER NOT NULL,
  id_modela INTEGER NOT NULL,
  id_goriva INTEGER NOT NULL,
  id_menjaca INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id),
  FOREIGN KEY (id_marke) REFERENCES marka (id),
  FOREIGN KEY (id_modela) REFERENCES model (id),
  FOREIGN KEY (id_goriva) REFERENCES gorivo (id),
  FOREIGN KEY (id_godista) REFERENCES godiste (id),
  FOREIGN KEY (id_menjaca) REFERENCES menjac (id)
);

CREATE TABLE marka (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL
);

CREATE TABLE model (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL,
  id_marke INTEGER NOT NULL,
  FOREIGN KEY (id_marke) REFERENCES marka (id),
);

CREATE TABLE gorivo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL
);

CREATE TABLE godiste (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  godina TEXT NOT NULL
);

CREATE TABLE menjac (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL
);

<<<<<<< HEAD
INSERT INTO oglas (author_id, title, body, cena, kilometraza, godiste, id_marke, id_modela, id_goriva, id_tipa, id_menjaca) VALUES
-- Toyota oglasi
(1, 'Prodajem Toyotu Corollu', 'Odlično stanje, malo prešla.', 5000, 120000, 2015, 1, 1, 2, 1, 1),
(1, 'Prodajem Toyotu Corollu', 'Pouzdana i ekonomična.', 5200, 110000, 2016, 1, 1, 2, 1, 1),
(1, 'Prodajem Toyotu Camry', 'Odličan porodični auto.', 7000, 90000, 2016, 1, 2, 2, 2, 2),
(1, 'Prodajem Toyotu Camry', 'Komforan i pouzdan.', 7300, 85000, 2017, 1, 2, 2, 2, 2),
(2, 'Prodajem Toyotu RAV4', 'Sjajan SUV za sve terene.', 12000, 80000, 2018, 1, 3, 1, 3, 2),
(2, 'Prodajem Toyotu RAV4', 'Prostran i udoban.', 12500, 75000, 2019, 1, 3, 1, 3, 2),
(2, 'Prodajem Toyotu Prius', 'Ekonomičan i ekološki prihvatljiv.', 8000, 70000, 2017, 1, 4, 4, 4, 2),
(2, 'Prodajem Toyotu Prius', 'Niska potrošnja goriva.', 8500, 65000, 2018, 1, 4, 4, 4, 2),
(2, 'Prodajem Toyotu Highlander', 'Prostran SUV za sve prilike.', 14000, 85000, 2018, 1, 5, 1, 3, 2),
(2, 'Prodajem Toyotu Highlander', 'Komforan i snažan.', 14500, 80000, 2019, 1, 5, 1, 3, 2),
(2, 'Prodajem Toyotu Land Cruiser', 'Izdržljiv terenac.', 20000, 90000, 2015, 1, 6, 1, 3, 2),
(2, 'Prodajem Toyotu Land Cruiser', 'Izvanredne off-road performanse.', 21000, 85000, 2016, 1, 6, 1, 3, 2),
(1, 'Prodajem Toyotu Yaris', 'Mali potrošač, idealan za grad.', 4500, 95000, 2014, 1, 7, 2, 1, 1),
(1, 'Prodajem Toyotu Yaris', 'Pouzdan i ekonomičan.', 4700, 90000, 2015, 1, 7, 2, 1, 1),
(1, 'Prodajem Toyotu 4Runner', 'Izvrsan SUV za avanture.', 18000, 80000, 2016, 1, 8, 1, 3, 2),
(1, 'Prodajem Toyotu 4Runner', 'Snažan i robustan.', 18500, 75000, 2017, 1, 8, 1, 3, 2),
(1, 'Prodajem Toyotu Tacoma', 'Odličan kamionet za rad.', 16000, 70000, 2017, 1, 9, 1, 5, 2),
(1, 'Prodajem Toyotu Tacoma', 'Snažan i pouzdan.', 16500, 65000, 2018, 1, 9, 1, 5, 2),
(1, 'Prodajem Toyotu C-HR', 'Moderan i ekonomičan SUV.', 15000, 60000, 2019, 1, 10, 1, 3, 2),
(1, 'Prodajem Toyotu C-HR', 'Stil i udobnost.', 15500, 55000, 2020, 1, 10, 1, 3, 2),

-- Honda oglasi
(1, 'Prodajem Hondu Civic', 'Mala potrošnja, odličan gradski auto.', 6000, 110000, 2014, 2, 1, 2, 1, 1),
(1, 'Prodajem Hondu Civic', 'Pouzdan i ekonomičan.', 6200, 105000, 2015, 2, 1, 2, 1, 1),
(1, 'Prodajem Hondu Accord', 'Pouzdan i udoban.', 9000, 95000, 2015, 2, 2, 1, 2, 2),
(1, 'Prodajem Hondu Accord', 'Odličan auto za duge vožnje.', 9300, 90000, 2016, 2, 2, 1, 2, 2),
(2, 'Prodajem Hondu CR-V', 'Prostran SUV, odličan za porodicu.', 13000, 85000, 2019, 2, 3, 2, 3, 2),
(2, 'Prodajem Hondu CR-V', 'Komforan i pouzdan.', 13500, 80000, 2020, 2, 3, 2, 3, 2),
(2, 'Prodajem Hondu Pilot', 'Odličan SUV sa mnogo prostora.', 14000, 75000, 2018, 2, 4, 1, 3, 2),
(2, 'Prodajem Hondu Pilot', 'Prostran i udoban.', 14500, 70000, 2019, 2, 4, 1, 3, 2),
(2, 'Prodajem Hondu Fit (Jazz)', 'Kompaktan i ekonomičan auto.', 5000, 90000, 2016, 2, 5, 2, 1, 1),
(2, 'Prodajem Hondu Fit (Jazz)', 'Mali potrošač.', 5200, 85000, 2017, 2, 5, 2, 1, 1),
(2, 'Prodajem Hondu HR-V', 'Mali SUV sa niskom potrošnjom.', 11000, 80000, 2017, 2, 6, 2, 3, 2),
(2, 'Prodajem Hondu HR-V', 'Pouzdan i ekonomičan.', 11500, 75000, 2018, 2, 6, 2, 3, 2),
(2, 'Prodajem Hondu Insight', 'Ekološki prihvatljiv hibrid.', 12000, 70000, 2018, 2, 7, 4, 4, 2),
(2, 'Prodajem Hondu Insight', 'Niska potrošnja, visok kvalitet.', 12500, 65000, 2019, 2, 7, 4, 4, 2),
(2, 'Prodajem Hondu Passport', 'Robustan SUV za sve terene.', 15000, 75000, 2017, 2, 8, 1, 3, 2),
(2, 'Prodajem Hondu Passport', 'Snažan i izdržljiv.', 15500, 70000, 2018, 2, 8, 1, 3, 2),
(2, 'Prodajem Hondu Ridgeline', 'Izdržljiv kamionet.', 18000, 65000, 2016, 2, 9, 1, 5, 2),
(2, 'Prodajem Hondu Ridgeline', 'Pouzdan kamionet za rad.', 18500, 60000, 2017, 2, 9, 1, 5, 2),
(2, 'Prodajem Hondu Clarity', 'Napredni plug-in hibrid.', 19000, 50000, 2019, 2, 10, 4, 4, 2),
(2, 'Prodajem Hondu Clarity', 'Ekonomičan i ekološki auto.', 19500, 45000, 2020, 2, 10, 4, 4, 2),

-- Mazda oglasi
(1, 'Prodajem Mazdu Mazda3', 'Pouzdan gradski auto.', 5500, 105000, 2014, 3, 1, 2, 1, 1),
(1, 'Prodajem Mazdu Mazdu Mazda3', 'Ekonomičan i pouzdan.', 5700, 100000, 2015, 3, 1, 2, 1, 1),
(1, 'Prodajem Mazdu Mazda6', 'Prostran i udoban sedan.', 8500, 95000, 2016, 3, 2, 1, 2, 2),
(1, 'Prodajem Mazdu Mazda6', 'Luksuzni sedan sa visokim performansama.', 9000, 90000, 2017, 3, 2, 1, 2, 2),
(1, 'Prodajem Mazdu CX-3', 'Kompaktan SUV sa stilom.', 12000, 85000, 2017, 3, 3, 2, 3, 2),
(1, 'Prodajem Mazdu CX-3', 'Savremen dizajn i praktičnost.', 12500, 80000, 2018, 3, 3, 2, 3, 2),
(1, 'Prodajem Mazdu CX-5', 'Sjajan SUV sa niskom potrošnjom.', 12500, 70000, 2017, 3, 4, 1, 3, 2),
(1, 'Prodajem Mazdu CX-5', 'Moderan SUV sa prostranom unutrašnjošću.', 13000, 65000, 2018, 3, 4, 1, 3, 2),
(1, 'Prodajem Mazdu CX-9', 'Veliki SUV, odličan za duge vožnje.', 15000, 60000, 2019, 3, 5, 1, 3, 2),
(1, 'Prodajem Mazdu CX-9', 'Pouzdan SUV za porodicu.', 15500, 55000, 2020, 3, 5, 1, 3, 2),
(1, 'Prodajem Mazdu Mazda2', 'Ekonomičan gradski auto.', 4500, 95000, 2015, 3, 6, 2, 1, 1),
(1, 'Prodajem Mazdu Mazda2', 'Mali gradski automobil.', 4700, 90000, 2016, 3, 6, 2, 1, 1),
(1, 'Prodajem Mazdu CX-30', 'Moderan SUV sa naprednom tehnologijom.', 17000, 50000, 2018, 3, 7, 1, 3, 2),
(1, 'Prodajem Mazdu CX-30', 'Povezan i komforan.', 17500, 45000, 2019, 3, 7, 1, 3, 2),
(1, 'Prodajem Mazdu MX-30', 'Električni SUV sa naprednom tehnologijom.', 20000, 30000, 2020, 3, 8, 3, 4, 2),
(1, 'Prodajem Mazdu MX-30', 'Inovativni električni automobil.', 20500, 25000, 2021, 3, 8, 3, 4, 2),
(1, 'Prodajem Mazdu CX-7', 'Prostran SUV sa visokim performansama.', 13500, 65000, 2016, 3, 9, 1, 3, 2),
(1, 'Prodajem Mazdu CX-7', 'Pouzdan SUV za porodicu.', 14000, 60000, 2017, 3, 9, 1, 3, 2),
(1, 'Prodajem Mazdu B-Series', 'Pouzdan kamionet za rad.', 9500, 85000, 2015, 3, 10, 1, 5, 2),
(1, 'Prodajem Mazdu B-Series', 'Robustan pick-up kamionet.', 10000, 80000, 2016, 3, 10, 1, 5, 2);
=======
INSERT INTO oglas (author_id, title, body, cena, id_godista, id_marke, id_modela, id_goriva, id_menjaca)
VALUES
(1, 'Prodajem Toyotu Corollu', 'Odlično stanje, malo prešla.', 5000, 19, 1, 1, 2, 1, 1),
(1, 'Prodajem Toyotu Camry', 'Odličan porodični auto.', 7000, 20, 1, 2, 2, 2, 2),
(2, 'Prodajem Toyotu RAV4', 'Sjajan SUV za sve terene.', 12000, 22, 1, 3, 1, 3, 2),
(2, 'Prodajem Toyotu Prius', 'Ekonomičan i ekološki prihvatljiv.', 8000, 21, 1, 4, 4, 4, 2),
(1, 'Prodajem Hondu Civic', 'Mala potrošnja, odličan gradski auto.', 6000, 18, 3, 1, 2, 1, 1),
(1, 'Prodajem Hondu Accord', 'Pouzdan i udoban.', 9000, 19, 3, 2, 1, 2, 2),
(2, 'Prodajem Hondu CR-V', 'Prostran SUV, odličan za porodicu.', 13000, 23, 3, 3, 2, 3, 2),
(2, 'Prodajem Hondu Pilot', 'Odličan SUV sa mnogo prostora.', 14000, 22, 3, 4, 1, 3, 2),
(1, 'Prodajem Mazdu Mazda3', 'Pouzdan gradski auto.', 5500, 18, 2, 1, 2, 1, 1),
(1, 'Prodajem Mazdu CX-5', 'Sjajan SUV sa niskom potrošnjom.', 12500, 21, 2, 4, 1, 3, 2),
(2, 'Prodajem Mazdu CX-9', 'Veliki SUV, odličan za duge vožnje.', 15000, 23, 2, 5, 1, 3, 2),
(2, 'Prodajem Mazdu MX-30', 'Električni SUV sa naprednom tehnologijom.', 20000, 24, 2, 6, 3, 4, 2);
>>>>>>> main


INSERT INTO marka (naziv)
VALUES 
   ('Toyota'),
   ('Honda'),
   ('Mazda');

INSERT INTO model (naziv, id_marke) VALUES
  -- Toyota modeli
  ('Corolla', 1), 
  ('Camry', 1),    
  ('RAV4', 1),     
  ('Prius', 1),    
  ('Highlander', 1), 
  ('Land Cruiser', 1), 
  ('Yaris', 1),    
  ('4Runner', 1),  
  ('Tacoma', 1),   
  ('C-HR', 1),     

<<<<<<< HEAD
  -- Honda modeli 
  ('Civic', 2, 1),    
  ('Accord', 2, 2),   
  ('CR-V', 2, 3),     
  ('Pilot', 2, 3),    
  ('Fit (Jazz)', 2, 1), 
  ('HR-V', 2, 3),     
  ('Insight', 2, 4),  
  ('Passport', 2, 3), 
  ('Ridgeline', 2, 5), 
  ('Clarity', 2, 4),  

  -- Mazda modeli 
  ('Mazda3', 3, 1),   
  ('Mazda6', 3, 2),   
  ('CX-3', 3, 3),     
  ('CX-5', 3, 3),     
  ('CX-9', 3, 3),     
  ('Mazda2', 3, 1),   
  ('CX-30', 3, 3),    
  ('MX-30', 3, 4),    
  ('CX-7', 3, 3),     
  ('B-Series', 3, 5);
=======
  -- Mazda modeli
  ('Mazda3', 2),   
  ('Mazda6', 2),   
  ('CX-3', 2),     
  ('CX-5', 2),     
  ('CX-9', 2),     
  ('Mazda2', 2),   
  ('CX-30', 2),    
  ('MX-30', 2),    
  ('CX-7', 2),     
  ('B-Series', 2), 

  -- Honda modeli
  ('Civic', 3),    
  ('Accord', 3),   
  ('CR-V', 3),     
  ('Pilot', 3),    
  ('Fit (Jazz)', 3), 
  ('HR-V', 3),     
  ('Insight', 3),  
  ('Passport', 3), 
  ('Ridgeline', 3), 
  ('Clarity', 3);  
   
>>>>>>> main

INSERT INTO gorivo (naziv)
VALUES 
   ('Dizel'),
   ('Benzin'),
   ('Elektricni pogon'),
   ('Hibridni pogon'),
   ('Benzin + Gas (TNG)'),
   ('Benzin + Metan (CNG)');

INSERT INTO godiste (godina)
VALUES 
    ('1997'),
    ('1998'),
    ('1999'),
    ('2000'),
    ('2001'),
    ('2002'),
    ('2003'),
    ('2004'),
    ('2005'),
    ('2006'),
    ('2007'),
    ('2008'),
    ('2009'),
    ('2010'),
    ('2011'),
    ('2012'),
    ('2013'),
    ('2014'),
    ('2015'),
    ('2016'),
    ('2017'),
    ('2018'),
    ('2019'),
    ('2020'),
    ('2021'),
    ('2022'),
    ('2023'),
    ('2024');

INSERT INTO menjac (naziv)
VALUES 
  ('Manuelni'),
  ('Automatski');
