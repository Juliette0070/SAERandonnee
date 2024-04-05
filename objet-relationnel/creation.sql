DROP TABLE Troncon;
DROP TYPE ListePointInteret;
DROP TYPE ListeIndicesQualite;
DROP TYPE IndiceQualite;
DROP TYPE PointInteret;

CREATE TYPE PointInteret AS OBJECT (
    nom VARCHAR2(100),
    type VARCHAR2(50)
);
/
CREATE TYPE IndiceQualite AS OBJECT (
    nom VARCHAR2(100),
    poidsActuel NUMBER(5, 2),
    valeur NUMBER(5, 2)
);
/
CREATE TYPE ListeIndicesQualite AS TABLE OF IndiceQualite;
/
CREATE TYPE ListePointInteret AS TABLE OF PointInteret;
/
CREATE TABLE Troncon (
    idTroncon VARCHAR2(10),
    nomUsuel VARCHAR2(100),
    pointDep VARCHAR2(100),
    pointArr VARCHAR2(100),
    distance NUMBER(10, 2),
    pointsInteret ListePointInteret,
    indicesQualite ListeIndicesQualite
) NESTED TABLE indicesQualite STORE AS indicesQualite_tab
NESTED TABLE pointsInteret STORE AS pointsInteret_tab;
