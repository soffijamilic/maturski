DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS oglas;
DROP TABLE IF EXISTS marka;
DROP TABLE IF EXISTS model;
DROP TABLE IF EXISTS gorivo;
DROP TABLE IF EXISTS tip_vozila;
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
  kilometraza INTEGER NOT NULL,
  godiste INTEGER NOT NULL,
  id_marke INTEGER NOT NULL,
  id_modela INTEGER NOT NULL,
  id_goriva INTEGER NOT NULL,
  id_tipa INTEGER NOT NULL,
  id_menjaca INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id),
  FOREIGN KEY (id_marke) REFERENCES marka (id),
  FOREIGN KEY (id_modela) REFERENCES model (id),
  FOREIGN KEY (id_goriva) REFERENCES gorivo (id),
  FOREIGN KEY (id_tipa) REFERENCES tip_vozila (id),
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
  id_tipa INTEGER NOT NULL,
  FOREIGN KEY (id_marke) REFERENCES marka (id),
  FOREIGN KEY (id_tipa) REFERENCES tip_vozila (id)
);

CREATE TABLE gorivo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL
);

CREATE TABLE tip_vozila (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL
);

CREATE TABLE menjac (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL
);

INSERT INTO oglas (author_id, title, body, cena, kilometraza, godiste, id_marke, id_modela, id_goriva, id_tipa, id_menjaca) VALUES
(1, 'Prodajem Toyotu Corollu', 'Odlično stanje, malo prešla.', 5000, 120000, 2015, 1, 1, 2, 1, 1),
(1, 'Prodajem Toyotu Camry', 'Odličan porodični auto.', 7000, 90000, 2016, 1, 2, 2, 2, 2),
(2, 'Prodajem Toyotu RAV4', 'Sjajan SUV za sve terene.', 12000, 80000, 2018, 1, 3, 1, 3, 2),
(2, 'Prodajem Toyotu Prius', 'Ekonomičan i ekološki prihvatljiv.', 8000, 70000, 2017, 1, 4, 4, 4, 2),
(1, 'Prodajem Hondu Civic', 'Mala potrošnja, odličan gradski auto.', 6000, 110000, 2014, 3, 1, 2, 1, 1),
(1, 'Prodajem Hondu Accord', 'Pouzdan i udoban.', 9000, 95000, 2015, 3, 2, 1, 2, 2),
(2, 'Prodajem Hondu CR-V', 'Prostran SUV, odličan za porodicu.', 13000, 85000, 2019, 3, 3, 2, 3, 2),
(2, 'Prodajem Hondu Pilot', 'Odličan SUV sa mnogo prostora.', 14000, 75000, 2018, 3, 4, 1, 3, 2),
(1, 'Prodajem Mazdu Mazda3', 'Pouzdan gradski auto.', 5500, 105000, 2014, 2, 1, 2, 1, 1),
(1, 'Prodajem Mazdu CX-5', 'Sjajan SUV sa niskom potrošnjom.', 12500, 70000, 2017, 2, 4, 1, 3, 2),
(2, 'Prodajem Mazdu CX-9', 'Veliki SUV, odličan za duge vožnje.', 15000, 60000, 2019, 2, 5, 1, 3, 2),
(2, 'Prodajem Mazdu MX-30', 'Električni SUV sa naprednom tehnologijom.', 20000, 30000, 2020, 2, 6, 3, 4, 2);


INSERT INTO marka (naziv)
VALUES 
   ('Toyota'),
   ('Honda'),
   ('Mazda');

INSERT INTO model (naziv, id_marke, id_tipa) VALUES
  -- Toyota modeli
  ('Corolla', 1, 1), 
  ('Camry', 1, 2),    
  ('RAV4', 1, 3),     
  ('Prius', 1, 4),    
  ('Highlander', 1, 3), 
  ('Land Cruiser', 1, 3), 
  ('Yaris', 1, 1),    
  ('4Runner', 1, 3),  
  ('Tacoma', 1, 5),   
  ('C-HR', 1, 3),     

  -- Mazda modeli
  ('Mazda3', 2, 1),   
  ('Mazda6', 2, 2),   
  ('CX-3', 2, 3),     
  ('CX-5', 2, 3),     
  ('CX-9', 2, 3),     
  ('Mazda2', 2, 1),   
  ('CX-30', 2, 3),    
  ('MX-30', 2, 4),    
  ('CX-7', 2, 3),     
  ('B-Series', 2, 5), 

  -- Honda modeli
  ('Civic', 3, 1),    
  ('Accord', 3, 2),   
  ('CR-V', 3, 3),     
  ('Pilot', 3, 3),    
  ('Fit (Jazz)', 3, 1), 
  ('HR-V', 3, 3),     
  ('Insight', 3, 4),  
  ('Passport', 3, 3), 
  ('Ridgeline', 3, 5), 
  ('Clarity', 3, 4);  
   

INSERT INTO gorivo (naziv)
VALUES 
   ('Dizel'),
   ('Benzin'),
   ('Elektricni pogon'),
   ('Hibridni pogon'),
   ('Benzin + Gas (TNG)'),
   ('Benzin + Metan (CNG)');

INSERT INTO tip_vozila (naziv)
VALUES 
  ('Gradski auto'),
  ('Limuzina'),
  ('SUV'),
  ('Hibrid'),
  ('Kamionet');

INSERT INTO menjac (naziv)
VALUES 
  ('Manuelni'),
  ('Automatski');
