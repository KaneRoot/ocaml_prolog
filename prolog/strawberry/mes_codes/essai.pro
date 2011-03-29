personne(germaine,95).
personne(émile,43).
personne(léon,30).
personne(lucie,52).
personne(lu,52).
personne(lcie,52).

individu(X) :- personne(X,_).
Majeur(X) :- personne(X,Y), Y>=18 .
Mineur(X) :- personne(X,Y), Y<18 .
Meme_age(X,Y) :- personne(X,Z), personne(Y,Z), X =\= Y .

individu(Paris).
personne(X,52).

/*?- personne(X,20), write(X), fail.

  */
