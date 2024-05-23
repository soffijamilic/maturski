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
  id_pogona INTEGER NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id),
  FOREIGN KEY (id_marke) REFERENCES marka (id),
  FOREIGN KEY (id_modela) REFERENCES model (id),
  FOREIGN KEY (id_goriva) REFERENCES gorivo (id),
  FOREIGN KEY (id_tipa) REFERENCES tip_vozila (id),
  FOREIGN KEY (id_pogona) REFERENCES pogon (id)
);

CREATE TABLE marka (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL
);

CREATE TABLE model (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL,
  id_marke INTEGER NOT NULL,
  FOREIGN KEY (id_marke) REFERENCES marka (id)
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
  naziv TEXT NOT NULL,
  id_modela INTEGER NOT NULL,
  FOREIGN KEY (id_modela) REFERENCES model (id)
);

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
   ('Elektricni pogon')
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

INSERT INTO menjac (naziv,id_modela)
VALUES 
   -- Toyota modeli
  ('Manuelni', 1),      -- Corolla
  ('Automatski', 2),    -- Camry
  ('Automatski', 3),    -- RAV4
  ('Automatski', 4),    -- Prius
  ('Automatski', 5),    -- Highlander
  ('Automatski', 6),    -- Land Cruiser
  ('Manuelni', 7),      -- Yaris
  ('Automatski', 8),    -- 4Runner
  ('Manuelni', 9),      -- Tacoma
  ('Automatski', 9),    -- Tacoma (drugi menjac)
  ('Automatski', 10),   -- C-HR

  -- Mazda modeli
  ('Manuelni', 11),     -- Mazda3
  ('Automatski', 11),   -- Mazda3 (drugi menjac)
  ('Manuelni', 12),     -- Mazda6
  ('Automatski', 12),   -- Mazda6 (drugi menjac)
  ('Manuelni', 13),     -- CX-3
  ('Automatski', 13),   -- CX-3 (drugi menjac)
  ('Manuelni', 14),     -- CX-5
  ('Automatski', 14),   -- CX-5 (drugi menjac)
  ('Automatski', 15),   -- CX-9
  ('Manuelni', 16),     -- Mazda2
  ('Automatski', 16),   -- Mazda2 (drugi menjac)
  ('Automatski', 17),   -- CX-30
  ('Automatski', 18),   -- MX-30
  ('Manuelni', 19),     -- CX-7
  ('Automatski', 19),   -- CX-7 (drugi menjac)
  ('Manuelni', 20),     -- B-Series
  ('Automatski', 20);   -- B-Series (drugi menjac)

  -- Honda modeli
  ('Manuelni', 21),     -- Civic
  ('Automatski', 21),   -- Civic (drugi menjac)
  ('Manuelni', 22),     -- Accord
  ('Automatski', 22),   -- Accord (drugi menjac)
  ('Manuelni', 23),     -- CR-V
  ('Automatski', 23),   -- CR-V (drugi menjac)
  ('Automatski', 24),   -- Pilot
  ('Manuelni', 25),     -- Fit (Jazz)
  ('Automatski', 25),   -- Fit (Jazz) (drugi menjac)
  ('Manuelni', 26),     -- HR-V
  ('Automatski', 26),   -- HR-V (drugi menjac)
  ('Automatski', 27),   -- Insight
  ('Manuelni', 28),     -- Passport
  ('Automatski', 28),   -- Passport (drugi menjac)
  ('Automatski', 29),   -- Ridgeline
  ('Automatski', 30);   -- Clarity


