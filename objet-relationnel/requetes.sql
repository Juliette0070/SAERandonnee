-- Requete 1
SELECT t.idTroncon, pi.type, COUNT(pi.nom) AS nombre_points_interet
FROM Troncon t, TABLE(t.pointsInteret) pi
GROUP BY t.idTroncon, pi.type;

-- Requete 2
SELECT 
    t.idTroncon,
    iq.nom AS nom_indice,
    (iq.poidsActuel * iq.valeur) AS impact
FROM 
    Troncon t,
    TABLE(t.indicesQualite) iq;
