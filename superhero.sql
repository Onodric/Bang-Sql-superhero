DELETE FROM Sidekick;
DELETE FROM PowerType;
DELETE FROM SuperheroPower;
DELETE FROM SuperheroWeakness;
DELETE FROM Power;
DELETE FROM Weakness;
DELETE FROM Superhero;

DROP TABLE IF EXISTS Sidekick;
DROP TABLE IF EXISTS PowerType;
DROP TABLE IF EXISTS Power;
DROP TABLE IF EXISTS Weakness;
DROP TABLE IF EXISTS SuperheroPower;
DROP TABLE IF EXISTS SuperheroWeakness;
DROP TABLE IF EXISTS Superhero;

CREATE TABLE `Superhero` (
  `SuperheroId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Name`  TEXT NOT NULL,
  `Gender` TEXT NOT NULL,
  `Lair` INTEGER NOT NULL,
  `CostumeColor` TEXT NOT NULL
);

INSERT INTO Superhero VALUES(NULL, 'Green Lantern', 'M', 'Green Room', 'Green');
INSERT INTO Superhero VALUES(NULL, 'Wonder Woman', 'F', 'Paradise Island', 'Red, Blue, Gold');
INSERT INTO Superhero VALUES(NULL, 'Batman', 'M', 'Bat Cave', 'Blue, Yellow');

CREATE TABLE `Sidekick` (
  `SidekickId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Name`  TEXT NOT NULL,
  `Gender` TEXT NOT NULL,
  `Profession` INTEGER NOT NULL,
  `SuperheroId` INTEGER NOT NULL,
  FOREIGN KEY(`SuperheroId`) REFERENCES `Superhero`(`SuperheroId`)
);

INSERT INTO Sidekick
  SELECT NULL, 'Robin', 'M', 'Acrobat', SuperheroId
  FROM Superhero s
  WHERE s.Name = 'Batman';

CREATE TABLE `PowerType` (
  `PowerTypeId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Name`  TEXT NOT NULL
);

CREATE TABLE `Power` (
  `PowerId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Name`  TEXT NOT NULL,
  `PowerTypeId` INTEGER NOT NULL,
  FOREIGN KEY(`PowerTypeId`) REFERENCES `PowerType`(`PowerTypeId`)  
);

CREATE TABLE `SuperheroPower` (
  `SuperheroPowerId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `SuperheroId` INTEGER NOT NULL,
  `PowerId` INTEGER NOT NULL,
  FOREIGN KEY(`SuperheroId`) REFERENCES `Superhero`(`SuperheroId`),
  FOREIGN KEY(`PowerId`) REFERENCES `Power`(`PowerId`)
);

CREATE TABLE `Weakness` (
  `WeaknessId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Name`  TEXT NOT NULL
);

CREATE TABLE `SuperheroWeakness` (
  `SuperheroWeaknessId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `SuperheroId` INTEGER NOT NULL,
  `WeaknessId` INTEGER NOT NULL,
  FOREIGN KEY(`SuperheroId`) REFERENCES `Superhero`(`SuperheroId`),
  FOREIGN KEY(`WeaknessId`) REFERENCES `Weakness`(`WeaknessId`)
);

