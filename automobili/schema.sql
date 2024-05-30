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
  id_godista INTEGER NOT NULL,
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
