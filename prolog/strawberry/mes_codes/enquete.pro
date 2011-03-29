/* Nom, jourAlibi, nomAlibi, Douteux, nomVengeance, nomHeritier, nomDette, nomCrime, possedeArme */

alibi_donne_par(luc,mardi,bernard).
alibi_donne_par(paul,mardi,bernard).
alibi_donne_par(louis,mardi,luc).
alibi_donne_par(alain,jeudi,luc).

douteux(alain).

a_vu_commettre_un_crime(jean, alain).
est_heritier_de(bernard,jean).
est_heritier_de(jean,louis).
doit_argent(louis,jean).
doit_argent(luc,jean).

desire_se_venger(paul, jean).

a_arme(luc).
a_arme(louis).
a_arme(alain).

a_tue(Nom1,Nom2, Jour) :- peut_desirer_tuer(Nom1, Nom2), a_arme(Nom1), pas_alibi_pour(Nom1, Jour).

pas_alibi_pour(Nom1, Jour) :- alibi_donne_par(Nom1, Jour, Nom2), !, fail.
pas_alibi_pour(_,_).

pas_alibi_pour(Nom1,Jour):- pas_alibi_pour(Nom1, Jour).
pas_alibi_pour(Nom1, Jour):- alibi_donne_par(Nom1, Jour, Nom2), douteux(Nom2).

peut_desirer_tuer(Nom1, Nom2):- a_interet_a_tuer(Nom1, Nom2).
peut_desirer_tuer(Nom1, Nom2):- desire_se_venger(Nom2, Nom1).

a_interet_a_tuer(Nom1,Nom2) :- est_heritier_de(Nom1, Nom2).
a_interet_a_tuer(Nom1, Nom2) :- doit_argent(Nom1, Nom2).
a_interet_a_tuer(Nom1, Nom2) :- a_vu_commettre_un_crime(Nom2,Nom1).

?- a_tue(X,jean,mardi), write("c'est "), write(X), write(" qui a tué Jean.").
