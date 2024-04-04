-- Donner les noms des étapes que nous pouvons atteindre directement en suivant les tronçons qui partent d’Orléans.
-- Rep : Champs de Blé et Refuge du Mont Blanc
SELECT DISTINCT e.nomEtape
FROM ETAPE e
JOIN TRONCON t ON e.codeEtape = t.idEtapeArrivee
WHERE t.idEtapeDepart = (SELECT codeEtape FROM ETAPE WHERE nomEtape = 'Orléans');

-- Veuillez fournir la liste des étapes accessibles depuis Orléans avec une seule étape intermédiaire.
-- Rep : Camping Les Pins
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

SELECT DISTINCT nomEtape
FROM (
    SELECT e.nomEtape, CONNECT_BY_ROOT e_orleans.nomEtape AS depart, LEVEL AS niveau
    FROM TRONCON t
    JOIN ETAPE e ON t.idEtapeArrivee = e.codeEtape
    JOIN ETAPE e_orleans ON t.idEtapeDepart = e_orleans.codeEtape
    START WITH e_orleans.nomEtape = 'Orléans'
    CONNECT BY NOCYCLE PRIOR t.idEtapeArrivee = t.idEtapeDepart
)
WHERE nomEtape != 'Orléans';
