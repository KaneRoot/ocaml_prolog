% Un commentaire en fin de ligne

personne(alice,f, 85 ,paris,retraitee,1500).
personne(edouard,m,40,strasbourg,ingenieur,3000).
personne(luc,m,27,paris,enseignant,1800).
personne(lucas,m,27,paris,enseignant,1800).
personne(pauline,f,35,marseille,informatitien,2000).


individu(X) :- personne(X,_,_,_,_,_).
masculin(X) :- personne(X,m,_,_,_,_).
feminin(X) :- personne(X,f,_,_,_,_).
est_age_de(X) :- personne(X,_,A,_,_,_).

majeur(X) :- personne(X,_,A,_,_,_), A >= 18 .
mineur(X) :- personne(X,_,A,_,_,_), A<18 .
meme_age(X,Y) :- personne(X,_,A,_,_,_), personne(Y,_,B,_,_,_), A == B.
meme_ville(X,Y) :- personne(X,_,_,V,_,_),personne(Y,_,_,V,_,_).
epoux_possibles(X,Y) :- personne(X,S,_,_,_,_),personne(Y,S2,_,_,_,_), S\==S2.
meme_profession(X,Y) :- personne(X,_,_,_,T,_),personne(Y,_,_,_,T,_).
gagne_plus_que(X,Y) :- personne(X,_,_,_,_,Sal),personne(Y,_,_,_,_,Sal2), Sal > Sal2.
salaires_de_meme_ordre(X,Y) :- personne(X,_,_,_,_,Sal), personne(Y,_,_,_,_,Sal2), 
	(Sal + ((20/100) * Sal)) >= Sal2.
salaires_de_meme_ordre(X,Y) :- personne(X,_,_,_,_,Sal), personne(Y,_,_,_,_,Sal2), 
	(Sal - ((20/100) * Sal)) <= Sal2.


% ?- meme_age(luc,lucas).
% ?- majeur(edouard).
% ?- mineur(edouard).
% ?- feminin(edouard).
% ?- meme_ville(luc,lucas).
% ?- epoux_possibles(luc,pauline).
% ?- meme_profession(luc,pauline).
% ?- gagne_plus_que(alice,luc).

?- salaires_de_meme_ordre(alice,edouard).
