DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS oglas;
DROP TABLE IF EXISTS marka;
DROP TABLE IF EXISTS model;
DROP TABLE IF EXISTS gotivo;
DROP TABLE IF EXISTS tip_vozila;
DROP TABLE IF EXISTS gorivo;

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
);

CREATE TABLE gorivo (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL
);

CREATE TABLE tip_vozila (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL
);

CREATE TABLE pogon (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  naziv TEXT NOT NULL
);

INSERT INTO marka (naziv)
VALUES 
   ('Toyota'),
   ('Honda'),
   ('Mazda');

INSERT INTO gorivo (naziv)
VALUES 
   ('Dizel'),
   ('Benzin'),
   ('Elektricni pogon')
   ('Hibridni pogon'),
   ('Benzin + Gas (TNG)'),
   ('Benzin + Metan (CNG)');