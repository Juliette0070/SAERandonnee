-- Requete 1
-- Donner les noms des étapes que nous pouvons atteindre directement en suivant les tronçons qui partent d’Orléans.
-- Rep : Champs de Blé et Refuge du Mont Blanc
SELECT DISTINCT e.nomEtape
FROM ETAPE e
JOIN TRONCON t ON e.codeEtape = t.idEtapeArrivee
WHERE t.idEtapeDepart = (SELECT codeEtape FROM ETAPE WHERE nomEtape = 'Orléans');


-- Veuillez fournir la liste des étapes accessibles depuis Orléans avec une seule étape intermédiaire.
-- Rep : Camping Les Pins
SELECT DISTINCT e2.nomEtape
FROM ETAPE e1
JOIN TRONCON t1 ON e1.codeEtape = t1.idEtapeDepart OR e1.codeEtape = t1.idEtapeArrivee
JOIN ETAPE e2 ON (e2.codeEtape = t1.idEtapeDepart OR e2.codeEtape = t1.idEtapeArrivee)
WHERE e1.nomEtape = 'Orléans'
AND e2.nomEtape != 'Orléans';

SELECT DISTINCT e3.nomEtape
FROM ETAPE e1
JOIN TRONCON t1 ON e1.codeEtape = t1.idEtapeDepart
JOIN ETAPE e2 ON (e2.codeEtape = t1.idEtapeArrivee)
JOIN TRONCON t2 ON e2.codeEtape = t2.idEtapeDepart
JOIN ETAPE e3 ON (e3.codeEtape = t2.idEtapeArrivee)
WHERE e1.nomEtape = 'Orléans'
AND e3.nomEtape != 'Orléans'
AND (e1.codeEtape != e3.codeEtape);


-- Veuillez fournir la liste des étapes accessibles depuis Orléans, avec un nombre quelconque d’étapes intermédiaires
-- Rep : Champs de Blé, Refuge du Mont Blanc, Camping Les Pins, Chalet en Montagne, Plage de Saint-Tropez, Forêt de Fontainebleau, Campagne Normande, Désert des Bardenas, Quartier de La Défense

-- NE FONCTIONNE PAS, C'EST DU CHATGPT
WITH CheminEtapes(idEtapeDepart, idEtapeArrivee, Chemin, Niveau) AS (
    SELECT idEtapeDepart, idEtapeArrivee, nomEtape AS Chemin, 1 AS Niveau
    FROM TRONCON
    JOIN ETAPE ON TRONCON.idEtapeArrivee = ETAPE.codeEtape
    WHERE TRONCON.idEtapeDepart = (SELECT codeEtape FROM ETAPE WHERE nomEtape = 'Orléans')
    
    UNION ALL
    
    SELECT t.idEtapeDepart, t.idEtapeArrivee, CheminEtapes.Chemin || ' -> ' || e.nomEtape, Niveau + 1
    FROM CheminEtapes
    JOIN TRONCON t ON CheminEtapes.idEtapeArrivee = t.idEtapeDepart
    JOIN ETAPE e ON t.idEtapeArrivee = e.codeEtape
);
SELECT DISTINCT Chemin
FROM CheminEtapes
JOIN ETAPE ON CheminEtapes.idEtapeArrivee = ETAPE.codeEtape
WHERE ETAPE.nomEtape != 'Orléans';

-- ÇA REND DES TRUCS, JE SAIS PAS SI C'EST BON (je pense pas)
SELECT DISTINCT
    SYS_CONNECT_BY_PATH(ETAPE.nomEtape, ' -> ') AS Chemin
FROM
    ETAPE
JOIN
    TRONCON ON ETAPE.codeEtape = TRONCON.idEtapeArrivee
START WITH
    ETAPE.nomEtape = 'Orléans'
CONNECT BY NOCYCLE
    PRIOR TRONCON.idEtapeArrivee = TRONCON.idEtapeDepart
AND
    LEVEL > 1;
