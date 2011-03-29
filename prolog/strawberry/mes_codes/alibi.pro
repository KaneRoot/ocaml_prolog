
alibi_pour_donne_par(nom, jour, nom2).
douteux(alain).
desire_se_venger(paul,jean).
est_heritier_de(nom,nom).
doit_de_l_argent_a(nom,nom).
possede_une_arme(nom).
a_tue(Nom1,Nom2,Jour) :- peut_desirer_tuer(Nom1,Nom2), possede_une_arme(Nom1), pas_alibi_pour(Nom1,Jour).

peut_desirer_tuer(Nom1,Nom2).
possede_une_arme(Nom1).
pas_alibi_pour(Nom1,Jour).

pas_alibi_pour(Nom1,Jour) :- alibi_pour_donne_par(Nom1,Jour,Nom2), !, fail.
pas_alibi_pour(_,_).
pas_alibi_pour(Nom1,Jour) :- pas_alibi_pour(Nom1,Jour).

pas_alibi_pour(Nom1,Jour) :- pas_alibi_pour(Nom1,Jour).
pas_alibi_pour(Nom1,Jour) :- alibi_pour_donne_par(Nom1,Jour,Nom2), douteux(Nom2).

peut_desirer_tuer(Nom1,Nom2) :- a_interet_a_tuer(Nom1,Nom2).
peut_desirer_tuer(Nom1,Nom2) :- desire_se_venger(Nom1,Nom2).
a_interet_a_tuer(Nom1,Nom2) :- est_heritier_de(Nom1,Nom2).
a_interet_a_tuer(Nom1,Nom2) :- doit_de_l_argent_a(Nom1,Nom2).
a_interet_a_tuer(Nom1,Nom2) :- a_vu_commettre_un_crime(Nom2,Nom1).
