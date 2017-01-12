CREATE TABLE `Superhero` (
  `SuperheroId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Name`  TEXT NOT NULL,
  `Gender` TEXT NOT NULL,
  `Lair` INTEGER NOT NULL
)

CREATE TABLE `Sidekick` (
  `SidekickId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Name`  TEXT NOT NULL,
  `Gender` TEXT NOT NULL,
  `Profession` INTEGER NOT NULL,
  `SuperheroId` INTEGER,
  FOREIGN KEY(`SuperheroId`) REFERENCES `Superhero`(`SuperheroId`)
)