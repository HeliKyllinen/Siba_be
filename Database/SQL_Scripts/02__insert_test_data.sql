USE casedb;

/* INSERTS */
/* --- Insert: GlobalSettings --- */
INSERT INTO GlobalSetting(name, description, numberValue, textValue) VALUES
    ('X', 'Korkea prioriteettiarvo', 800, NULL);

/* --- Insert: Department --- */
INSERT INTO Department(name, description) VALUES
	('Jazz', 'Aineryhmän kuvaus'),
    ('Laulumusiikki', 'Aineryhmän kuvaus'),
    ('Piano, harmonikka, kitara ja kantele', 'Aineryhmän kuvaus'),
    ('Musiikkikasvatus', 'Aineryhmän kuvaus'),
    ('MuTri', "Aineryhmän kuvaus"),
    ('Vanha musiikki', "Aineryhmän kuvaus"),
    ('Musiikkiteknologia', 'Aineryhmän kuvaus'),
    ('Musiikinjohtaminen sekä orkesteri- ja kuorotoiminta', 'Aineryhmän kuvaus'),
    ('Taidejohtaminen ja yrittäjyys', 'Aineryhmän kuvaus'),
    ('DocMus', 'Tohtoritason koulutusohjelma'),
    ('Kansanmusiikki ja Global music & GLOMAS', 'Aineryhmän kuvaus'),
    ('Kirkkomusiikki ja urut', 'Aineryhmän kuvaus'),
    ('Jouset ja kamarimusiikki', 'Aineryhmän kuvaus'),
    ('Puhaltimet, lyömäsoittimet ja harppu', 'Aineryhmän kuvaus'),
    ('Sävellys ja musiikinteoria', 'Aineryhmän kuvaus'),
    ('Avoin Kampus', 'Aineryhmän kuvaus');

/* --- Insert: `User` --- */
INSERT INTO `User`(email, isAdmin) VALUES
    ('fake_admin@test.co', 1),
    ('fake_planner@test.co', 0),
    ('fake_planner2@test.co', 0);

/* --- Insert: DepartmentPlanner * --- */
INSERT INTO DepartmentPlanner(userId, departmentId) VALUES
    (202, 101),
    (202, 105),
    (203, 103),
    (203, 104),
    (202, 102);

/* --- Insert: Campus --- */
INSERT INTO `Campus` (`name`, `description`) VALUES
	('Siba', 'Sibeliusakatemian kampus');
    
/* --- Insert: Building * --- */
INSERT INTO `Building` (`name`, `description`, `campusId`) VALUES
	('Musiikkitalo', 'Sibeliusakatemian päärakennus', 301),
	('N-talo', 'Sibeliusakatemian opetus ja harjoittelu talo ', 301),
	('R-talo', 'Sibeliusakatemian konserttitalo', 301);

/* --- Insert: SubjectType --- */
INSERT INTO SubjectType(name) VALUES
    ('Teoriatunti'),
    ('Yksilösoittotunti'),
    ('Yksilöharjoitustunti'),
    ('Ryhmäsoitto');

/* --- Insert: `Space` * --- */
INSERT INTO `Space` (`name`, `area`, `people_capasity`, `buildingId`, `availableFrom`, `availableTo`, `classesFrom`, `classesTo`, `subjectTypeId`, `info`) VALUES
	('S6117 Jouset/Kontrabasso', 31.9, 7, 401, '08:00:00', '21:00:00', '09:00:00', '16:00:00', 801, 'ONLY FOR BASSISTS'),
	('S6104 Didaktiikkaluokka Inkeri', 62.5, 30, 401, '08:00:00', '21:00:00', '10:00:00', '17:00:00', 804, 'Musiikkikasvatus'),
	('S7106 Kansanmusiikki/AOV', 63.7, 22, 401, '08:00:00', '21:00:00', '08:00:00', '18:00:00', 804, 'Yhtyeluokka'), 
    ('S6114 Perkussioluokka/Marimbaluokka', 33.3, 4, 401, '08:00:00', '22:00:00', '09:00:00', '15:00:00', 804, 'Vain lyömäsoittajat'),
    ('S1111 Studio Erkki', 36.0, 15, 401, '08:00:00', '22:00:00', '11:00:00', '15:00:00', 804, 'Tilatyyppi: Studio'),
    ('S5109 Jazz/Bändiluokka', 17.5, 2, 401, '08:00:00', '20:00:00', '08:00:00', '16:00:00', 802, 'ONLY FOR JAZZ DEPARTMENT'),
    ('S6112 Harppuluokka', 28.8, 4, 401, '08:00:00', '17:00:00', '11:00:00', '16:00:00', 802, 'Vain harpistit'),
    ('S6113 Puhaltimet/Klarinetti/Harppu', 18.1, 4, 401, '08:00:00', '19:00:00', '08:00:00', '19:00:00', 802, 'Tilatyyppi: Musiikkiluokka'),
    
    ('R312 Opetusluokka', 16.6, 6, 403, '08:00:00', '21:00:00', '08:00:00', '18:00:00', 801, 'Tilatyyppi: Musiikkiluokka'), 
    ('R530 Opetusluokka', 50.0, 18, 403, '08:00:00', '21:00:00', '08:00:00', '19:00:00', 801, 'Luentoluokka'),
    ('R213 Harjoitushuone', 20.0, 4, 403, '08:00:00', '21:00:00', '10:00:00', '16:00:00', 803, 'Ensisijainen varausoikeus vanhan musiikin aineryhmällä'),
    ('R510 Opetusluokka', 81.0, 30, 403, '08:00:00', '21:00:00', '09:00:00', '15:00:00', 801, 'Luentoluokka'),
    ('R416 Opetusluokka', 23.0, 9, 403, '08:00:00', '21:00:00', '10:00:00', '17:00:00', 801, 'Tilatyyppi: Musiikkiluokka'),
    ('R422 Opetusluokka', 23.0, 11, 403, '08:00:00', '19:00:00', '08:00:00', '22:00:00', 801, 'Kitara'),
    ('R410 Opetusluokka', 42.4, 20, 403, '08:00:00', '19:00:00', '08:00:00', '20:00:00', 801, 'Pianopedagogiikka'),
    ('R531 Opetusluokka', 53.0, 17, 403, '09:00:00', '20:00:00', '10:00:00', '14:00:00', 801, 'Tilatyyppi: Musiikkiluokka'),

    ('N522 Säestysluokka', 33.0, 8, 402, '08:00:00', '21:00:00', '08:00:00', '19:00:00', 804, 'Tilatyyppi: Musiikkiluokka'),
    ('N319 Jazz/Lyomäsoittimet, piano ja yhtyeet', 34.0, 5, 402, '08:00:00', '19:00:00', '08:00:00', '17:00:00', 804, 'Varaukset Jukkis Uotilan kautta'),
    ('N315 Jouset', 15.5, 4, 402, '08:00:00', '21:00:00', '08:00:00', '14:00:00', 802, 'Tilatyyppi: Musiikkiluokka'),
    ('N419 Kirkkomusiikki/Urkuluokka', 34.0, 5, 402, '09:00:00', '20:00:00', '08:00:00', '18:00:00', 802, 'Tilatyyppi: Musiikkiluokka'),
    ('N517 Opetusluokka', 15.5, 3, 402, '08:00:00', '21:00:00', '08:00:00', '15:00:00', 801, 'Tilatyyppi: Musiikkiluokka'),
    ('N425 Jouset/Sello', 33.0, 8, 402, '08:00:00', '22:00:00', '09:00:00', '15:00:00', 804, 'Tilatyyppi: Musiikkiluokka'),
    ('N312 Musiikkikasvatus/Vapaasäestys', 34.0, 8, 402, '08:00:00', '22:00:00', '08:00:00', '15:00:00', 804, 'Tilatyyppi: Musiikkiluokka'),
    ('N220 Tohtorikoulut', 49.5, 20, 402, '08:00:00', '19:00:00', '08:00:00', '17:00:00', 801, 'Tilatyyppi: Luentoluokka');

/* --- Insert: SpaceDepartment --- */
INSERT INTO SpaceDepartment (spaceId , departmentId) VALUES
    (1011, 106),
    (1006, 101),
    (1001, 113),
    (1008, 114),
    (1005, 107);

/* --- Insert: Equipment --- */
INSERT INTO `Equipment` (`name`, `isMovable`, `priority`, `description`) VALUES
	('Urut', 0, 600, 'Valtavan kokoinen soitin'),
	('Kantele', 1, 50, 'Väinämöisen soitin'),
    ('Nokkahuilu', 1, 50, 'Kaikki rakastaa'),
    ('Rumpusetti', 1, 250, 'Ääntä riittää'),
    ('Äänityslaitteisto Xyz', 0, 900, '8 kanavaa'),
    ('Viulu', 1, 50, 'Jousisoitin, 4-kieltä'),
    ('Alttoviulu', 1, 50, 'Jousisoitin, suurempi kuin viulu'),
    ('Sello', 1, 100, 'Suuri, 4-kielinen jousisoitin'),
    ('Kontrabasso', 1, 100, 'Suurin jousisoitin'),
    ('Piano', 0, 900, 'Piano-opetus vaatii kaksi flyygeliä'),
    ('Kitara', 1, 100, '6-kielinen soitin'),
    ('Harmonikka', 1, 200, 'Hanuri'),
    ('Fortepiano', 0, 500, 'Pianon varhaismuoto'),
    ('Huilu', 1, 50, 'puhallinsoitin'),
    ('Oboe', 1, 100, 'puupuhallinsoitin'),
    ('Tuuba', 1, 100, 'Suurehko puhallinsoitin'),
    ('Trumpetti', 1, 50, 'Puhallinsoitin'),
    ('Clavinova', 1, 100, 'Sähköpiano'),
    ('Bassovahvistin', 1, 50, 'Boom boom'),
    ('Kitaravahvistin', 1, 50, 'Äänekäs laatikko'),
    ('Flyygeli', 1, 200, ''),
    ('DVD-soitin', 1, 50, ''),
    ('Äänentoisto (ei PA-laitteet)', 0, 100, ''),
    ('Näyttölaite (videoprojektori)', 0, 200, ''),
    ('Yhtyeluokan äänentoisto', 0, 300, 'PA-laitteet'),
    ('Dokumenttikamera', 0, 250, '');
    
/* --- Insert: SpaceEquipment * --- */
INSERT INTO `SpaceEquipment` (`spaceId`, `equipmentId`) VALUES
	(1001, 2021),
    (1001, 2022),
    (1001, 2023),
    (1001, 2024),
	(1002, 2021),
    (1002, 2004),
    (1002, 2019),
    (1002, 2020),
    (1002, 2022),
    (1002, 2023),
    (1002, 2025),
    (1002, 2024),
    (1002, 2026),
	(1009, 2010),
    (1009, 2021),
    (1009, 2023),
    (1013, 2021),
    (1013, 2023),
    (1020, 2001),
    (1020, 2022),
    (1020, 2023),
    (1020, 2024),
    (1019, 2021),
    (1019, 2022),
    (1019, 2023),
    (1019, 2024);
    
/* --- Insert: Program * --- */
INSERT INTO Program (name , departmentId) VALUES
    ('Piano', 103),
    ('Laulutaide pääaineena', 102),
    ('Kitara', 103),
    ('Kantele', 103),
    ('Jazzsävellys', 101),
    ('Laulutaide', 102),
    ('Musiikinteoria pääaineena', 104),
    ('Jazzmusiikin instrumentti- tai lauluopinnot pääaineena', 102),
    ('Fortepiano', 103),
    ('Global Music', 112),
    ('Harmonikka', 103),
    ('Harppu', 114),
    ('Jousisoitin', 113),
    ('Kansanmusiikki', 111),
    ('Kirkkomusiikki', 112),
    ('Korrepetitio', 102),
    ('Lyömäsoitin', 114),
    ('Musiikin johtaminen', 108),
    ('Musiikin tohtorikoulutus', 110),
    ('Musiikkikasvatus', 104),
    ('Musiikkiteknologia', 107),
    ('Nordic Master in Folk Music', 111),
    ('Nordic Master in Jazz', 101),
    ('Oopperalaulu', 102),
    ('Pianokamarimusiikki ja lied', 103),
    ('Puhallinsoitin', 114),
    ('Sävellys', 115),
    ('Taidejohtaminen ja yrittäjyys', 109),
    ('Urut', 112),
    ('Vanha musiikki', 106),
    ('Avoin Kampus', 110);

/* --- Insert: Subject * --- */
INSERT INTO Subject(name, groupSize, groupCount, sessionLength, sessionCount, area, programId, subjectTypeId) VALUES
    ('Saksan kielen perusteet', 10, 2, '01:30:00', 2, 100.5, 3002, 801),
    ('Viulistien kehonhallinta', 20, 1, '00:30:00', 2, 200, 3013, 801),
    ('Piano yksilöopetus', 1, 1, '02:30:00', 2, 40, 3001, 802),
    ('Trumpetin ryhmäsoitto', 10, 1,'01:30:00', 3, 80, 3002, 804),
    ('Kirkkomusiikin ryhmäsoittoa', 15, 4, '02:30:00', 2, 30, 3015, 804),
    ('Ruotsin kielen oppintunti', 40, 2, '01:45:00', 1, 100, 3031, 801),
    ('Kitaran soiton perusteet', 15, 1, '01:30:00', 2, 60, 3003, 804),
    ('Kontrabassonsoitto, taso A', 1, 3, '01:00:00', 2, 10, 3013, 802),
    ('Kanteleensoitto (musiikin kandidaatti)', 1, 4, '01:00:00', 1, 10, 3004, 802),
    ('Yhteissoitto / kantele', 16, 1, '01:30:00', 1, 20, 3004, 804),
    ('Urkujensoitto (musiikin kandidaatti)', 1, 3, '01:30:00', 1, 20, 3029, 802),
    ('Yhteissoitto / kitara', 34, 1, '01:30:00', 1, 35, 3003, 804),
    ('Huilunsoitto, taso A', 1, 5, '01:00:00', 1, 10, 3026, 802),
    ('Fortepianonsoitto 1', 1, 7, '01:10:00', 2, 30, 3001, 802),
    ('Nokkahuilunsoitto, taso B', 1, 3, '01:00:00', 1, 10, 3026, 802),
    ('Viulunsoitto, taso D', 1, 12, '01:00:00', 1, 10, 3013, 802 ),
    ('Tuubansoitto, taso C', 1, 5, '01:00:00', 1, 15, 3026, 802 ),
    ('Harmonikansoitto (musiikin kandidaatti)', 1, 2, '01:00:00', 1, 15, 3011, 802),
    ('Jazz, rumpujensoitto, taso B', 1, 4, '01:00:00', 1, 15, 3017, 802),
    ('Kansanmusiikkiteoria 1', 1, 20, '01:00:00', 2, 40, 3014, 801);

/* --- Insert: SubjectEquipment * --- */
INSERT INTO SubjectEquipment(subjectId, equipmentId, priority) VALUES
    (4003, 2021, 900),
    (4004, 2017, 50),
    (4005, 2001, 900),
    (4007, 2011, 100),
    (4008, 2009, 90),
    (4009, 2002, 50),
    (4010, 2002, 90),
    (4011, 2001, 900),
    (4012, 2011, 90),
    (4013, 2012, 50),
    (4014, 2013, 900),
    (4015, 2003, 50),
    (4016, 2006, 90),
    (4017, 2016, 90),
    (4018, 2012, 90),
    (4019, 2014, 800),
    (4020, 2010, 400);

/* --- Insert: AllocRound * --- */
INSERT INTO AllocRound(name, isSeasonAlloc, userId) VALUES
    ("Testikierros", 0, 201),
    ("Kevät 2023", 1, 201);

/* --- Insert: AllocSubject * --- */
INSERT INTO AllocSubject(subjectId, allocRound, isAlloc, allocatedDate, spaceId) VALUES
    (4001, 10001, 1, '2022-09-21', 1010),
    (4002, 10001, 1, '2022-09-21', 1010),
    (4003, 10001, 1, '2022-09-21', 1010),
    (4004, 10001, 1, '2022-09-21', 1010),
    (4005, 10001, 1, '2022-09-21', 1010),
    (4006, 10001, 1, '2022-09-21', 1010),
    (4007, 10001, 1, '2022-09-21', 1010),
    (4001, 10002, 1, '2022-09-21', 1010),
    (4002, 10002, 0, '2022-09-21', 1010);


/* --- Insert: AllocCurrentRoundUser * --- */
INSERT INTO AllocCurrentRoundUser(allocId, userId) VALUES
    (10001, 201),
    (10001, 202),
    (10002, 201);

/* END */