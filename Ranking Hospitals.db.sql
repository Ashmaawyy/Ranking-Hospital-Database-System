BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Hospital" (
	"Provider Number"	INTEGER NOT NULL UNIQUE,
	"Name"	TEXT NOT NULL,
	"Governate"	TEXT NOT NULL,
	PRIMARY KEY("Provider Number" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Status" (
	"Status ID"	INTEGER NOT NULL UNIQUE,
	"Status"	TEXT,
	PRIMARY KEY("Status ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Rules" (
	"Rule ID"	INTEGER NOT NULL UNIQUE,
	"Rules"	TEXT,
	PRIMARY KEY("Rule ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Ranks" (
	"Rank ID"	INTEGER NOT NULL UNIQUE,
	"Ranks"	INTEGER NOT NULL,
	"Status ID"	INTEGER,
	FOREIGN KEY("Status ID") REFERENCES "Status"("Status ID"),
	PRIMARY KEY("Rank ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Standards" (
	"Standard ID"	INTEGER NOT NULL UNIQUE,
	"Standard Mortality Rates"	INTEGER NOT NULL,
	"Disease"	TEXT,
	PRIMARY KEY("Standard ID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Hospital_Rank" (
	"Pro_Num"	INTEGER,
	"Rank_ID"	INTEGER,
	FOREIGN KEY("Rank_ID") REFERENCES "Ranks"("Rank ID"),
	FOREIGN KEY("Pro_Num") REFERENCES "Hospital"("Provider Number"),
	PRIMARY KEY("Rank_ID","Pro_Num")
);
CREATE TABLE IF NOT EXISTS "Hospital_Status" (
	"Pro Num"	INTEGER,
	"Status ID"	INTEGER,
	FOREIGN KEY("Pro Num") REFERENCES "Hospital"("Provider Number"),
	FOREIGN KEY("Status ID") REFERENCES "Status"("Status ID"),
	PRIMARY KEY("Pro Num","Status ID")
);
CREATE TABLE IF NOT EXISTS "Hospital_Mortality_Rate" (
	"Pro_Num"	INTEGER NOT NULL,
	"Mortal_ID"	INTEGER NOT NULL,
	FOREIGN KEY("Pro_Num") REFERENCES "Hospital"("Provider Number"),
	FOREIGN KEY("Mortal_ID") REFERENCES "Mortality_Rates"("Mortal ID"),
	PRIMARY KEY("Pro_Num","Mortal_ID")
);
CREATE TABLE IF NOT EXISTS "Mortality_Rates" (
	"Mortal ID"	INTEGER NOT NULL UNIQUE,
	"Mortality Rate"	NUMERIC,
	"Month"	REAL NOT NULL,
	"Standard ID"	INTEGER,
	FOREIGN KEY("Standard ID") REFERENCES "Standards"("Standard ID"),
	PRIMARY KEY("Mortal ID" AUTOINCREMENT)
);
INSERT INTO "Hospital" ("Provider Number","Name","Governate") VALUES (1,'Al-Marwa','Cairo'),
 (2,'Al-Safwa','Giza'),
 (3,'Al-Orman','Giza'),
 (4,'Baheya','Alex'),
 (5,'Abo-El Reesh','Gharbya'),
 (6,'Al-Agoza','Alex'),
 (7,'Al-Haram','Giza'),
 (8,'Al-Jazeera','Cairo'),
 (9,'Tabarak','Dakahlya'),
 (10,'Nasr City Hospital','Cairo');
INSERT INTO "Status" ("Status ID","Status") VALUES (1,'WARNED Once'),
 (2,'WARNED Twice'),
 (3,'NOT WARNED');
INSERT INTO "Rules" ("Rule ID","Rules") VALUES (1,'when hospital is warned for second time, it''s rank is pulled by one rank'),
 (2,'If a hospital''s mortality rate drops than the standard, it receives a warning'),
 (3,'If a hospital wishes to get pulled up in the rank, it must send a pull-up request'),
 (4,'If the hospital''s mortality rates for the past six months is less than or equal to the standard, the pull-up request is accepted'),
 (5,'If the hospital for the past six months received any warning, the pull-up request is denied');
INSERT INTO "Ranks" ("Rank ID","Ranks","Status ID") VALUES (1,1,3),
 (2,1,3),
 (3,2,1),
 (4,3,1),
 (5,4,1),
 (6,5,1),
 (7,6,1),
 (8,7,1),
 (9,8,1),
 (10,8,1);
INSERT INTO "Standards" ("Standard ID","Standard Mortality Rates","Disease") VALUES (1,12.7,'Heart Attack'),
 (2,13.6,'Heart Faliure'),
 (3,11.8,'Pneumonya');
INSERT INTO "Hospital_Rank" ("Pro_Num","Rank_ID") VALUES (1,1),
 (2,2),
 (3,3),
 (4,4),
 (5,5),
 (6,6),
 (7,7),
 (8,8),
 (9,9),
 (10,10);
INSERT INTO "Hospital_Status" ("Pro Num","Status ID") VALUES (1,3),
 (2,3),
 (3,1),
 (4,1),
 (5,1),
 (6,1),
 (7,1),
 (8,1),
 (9,1),
 (10,1);
INSERT INTO "Hospital_Mortality_Rate" ("Pro_Num","Mortal_ID") VALUES (1,1),
 (1,2),
 (1,3),
 (2,4),
 (2,5),
 (2,6),
 (3,7),
 (3,8),
 (3,9),
 (4,10),
 (4,11),
 (4,12),
 (5,13),
 (5,14),
 (5,15),
 (6,16),
 (6,17),
 (6,18),
 (7,19),
 (7,20),
 (7,21),
 (8,22),
 (8,23),
 (8,24),
 (9,25),
 (9,26),
 (9,27),
 (10,28),
 (10,29),
 (10,30);
INSERT INTO "Mortality_Rates" ("Mortal ID","Mortality Rate","Month","Standard ID") VALUES (1,12.6,1.0,1),
 (2,13.5,1.0,2),
 (3,11.7,1.0,3),
 (4,12.7,1.0,1),
 (5,13.6,1.0,2),
 (6,11.8,1.0,3),
 (7,12.8,1.0,1),
 (8,13.7,1.0,2),
 (9,11.9,1.0,3),
 (10,12.9,1.0,1),
 (11,13.8,1.0,2),
 (12,12,1.0,3),
 (13,13,1.0,1),
 (14,13.9,1.0,2),
 (15,13.1,1.0,3),
 (16,13.1,1.0,1),
 (17,14,1.0,2),
 (18,13.2,1.0,3),
 (19,13.2,1.0,1),
 (20,14.1,1.0,2),
 (21,13.3,1.0,3),
 (22,13.3,1.0,1),
 (23,14.2,1.0,2),
 (24,13.4,1.0,3),
 (25,13.4,1.0,1),
 (26,14.3,1.0,2),
 (27,13.5,1.0,3),
 (28,13.5,1.0,1),
 (29,14.4,1.0,2),
 (30,13.6,1.0,3);
COMMIT;
