-- Q2
etapesConnexes(depart, arrivee).
etapesConnexes(X, Y) :- troncon(X, Y, _).
etapesConnexes(X, Y) :- troncon(X, Z, _), etapesConnexes(Z, Y).

etapesConnexes('Orleans', 'Fleury-les-Aubrais') ?

-- Q3

parcoursEnTerre(X, Y, DistanceTotale) :- 
    troncon(X, Y, enTerre, Distance), 
    enTerre = 'terre', 
    DistanceTotale = Distance.
parcoursEnTerre(X, Z, DistanceTotale) :- 
    troncon(X, Y, enTerre, Distance), 
    enTerre = 'terre', 
    parcoursEnTerre(Y, Z, DistanceRestante), 
    DistanceTotale = Distance + DistanceRestante.

parcoursEnTerre('Orleans', 'Fleury-les-Aubrais', DistanceTotale) ?

-- Q4
parcoursImpair(X, Y) :- etapesConnexes(X, Y), not troncon(X, Y).
parcoursImpair(X, Y) :- troncon(X, Z), etapesConnexes(Z, Y), not troncon(X, Y), not troncon(Y, Z).
parcoursImpair(X, Y) :- troncon(X, Z), etapesConnexes(Z, Y), troncon(X, Y), not troncon(Y, Z).

parcoursImpair('Orleans', 'Fleury-les-Aubrais') ?

-- Q5
circuit(X, Y) :- etapesConnexes(X, Y), etapesConnexes(Y, X).
circuit(X, Z) :- etapesConnexes(X, Y), circuit(Y, Z), X != Z.