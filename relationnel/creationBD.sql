DROP TABLE NIVEAU_CONFORT CASCADE CONSTRAINTS;
DROP TABLE TYPE_SOL CASCADE CONSTRAINTS;
DROP TABLE ETAPE CASCADE CONSTRAINTS;
DROP TABLE TRONCON CASCADE CONSTRAINTS;

CREATE TABLE NIVEAU_CONFORT (
    idNiveauConfort NUMBER PRIMARY KEY,
    nomNiveauConfort VARCHAR2(255) NOT NULL,
    descriptionNiveauConfort VARCHAR2(255) NOT NULL
);

CREATE TABLE TYPE_SOL (
    idTypeSol NUMBER PRIMARY KEY,
    nomTypeSol VARCHAR2(255) NOT NULL
);

CREATE TABLE ETAPE (
    codeEtape NUMBER PRIMARY KEY,
    nomEtape VARCHAR2(255) NOT NULL,
    latitude NUMBER NOT NULL,
    longitude NUMBER NOT NULL,
    idNiveauConfort NUMBER NOT NULL,
    FOREIGN KEY(idNiveauConfort) REFERENCES NIVEAU_CONFORT(idNiveauConfort)
);

CREATE TABLE TRONCON (
    idTroncon NUMBER PRIMARY KEY,
    nomTroncon VARCHAR2(255) NOT NULL,
    distance NUMBER NOT NULL,
    denivele NUMBER NOT NULL,
    idTypeSol NUMBER NOT NULL,
    idEtapeDepart NUMBER NOT NULL,
    idEtapeArrivee NUMBER NOT NULL,
    FOREIGN KEY(idTypeSol) REFERENCES TYPE_SOL(idTypeSol),
    FOREIGN KEY(idEtapeDepart) REFERENCES ETAPE(codeEtape),
    FOREIGN KEY(idEtapeArrivee) REFERENCES ETAPE(codeEtape)
);
