-- Insertion d'un tronçon avec des points d'intérêt et des indices de qualité
INSERT INTO Troncon (idTroncon, nomUsuel, pointDep, pointArr, distance, pointsInteret, indicesQualite)
VALUES ('t347', 'rue des Roses', 'Orleans', 'Fleury-les-Aubrais', 3.5,
        ListePointInteret(PointInteret('Parc Floral', 'parc')), 
        ListeIndicesQualite(IndiceQualite('difficulte', 2.0, 1.5), IndiceQualite('securite', 4.2, 3.0)));

-- Insertion d'un autre tronçon avec des points d'intérêt et des indices de qualité
INSERT INTO Troncon (idTroncon, nomUsuel, pointDep, pointArr, distance, pointsInteret, indicesQualite)
VALUES ('t348', 'rue de la République', 'Fleury-les-Aubrais', 'Orleans', 2.8,
        ListePointInteret(PointInteret('Théâtre Municipal', 'théâtre')),
        ListeIndicesQualite(IndiceQualite('difficulte', 1.8, 1.2), IndiceQualite('securite', 4.7, 2.5)));

-- Insertion d'un tronçon sans points d'intérêt ni indices de qualité
INSERT INTO Troncon (idTroncon, nomUsuel, pointDep, pointArr, distance, pointsInteret, indicesQualite)
VALUES ('t349', 'rue du Pont', 'Orleans', 'Saran', 6.2, NULL, NULL);

-- Insertion d'un tronçon avec plusieurs points d'intérêt et des indices de qualité
INSERT INTO Troncon (idTroncon, nomUsuel, pointDep, pointArr, distance, pointsInteret, indicesQualite)
VALUES ('t350', 'avenue de la Liberté', 'Orleans', 'Saint-Jean-de-Braye', 4.5,
        ListePointInteret(PointInteret('Musée des Beaux-Arts', 'musée'), PointInteret('Bibliothèque Municipale', 'bibliothèque')),
        ListeIndicesQualite(IndiceQualite('difficulte', 2.5, 1.8), IndiceQualite('securite', 4.5, 2.9)));

-- Insertion d'un autre tronçon avec plusieurs points d'intérêt et des indices de qualité
INSERT INTO Troncon (idTroncon, nomUsuel, pointDep, pointArr, distance, pointsInteret, indicesQualite)
VALUES ('t351', 'rue de la Paix', 'Orleans', 'La Chapelle-Saint-Mesmin', 3.2,
        ListePointInteret(PointInteret('Centre Commercial', 'centre commercial'), PointInteret('Cinéma', 'cinéma'), PointInteret('Piscine Municipale', 'piscine'), PointInteret('Piscine Communautaire', 'piscine')),
        ListeIndicesQualite(IndiceQualite('difficulte', 1.7, 1.1), IndiceQualite('securite', 4.3, 2.7)));
