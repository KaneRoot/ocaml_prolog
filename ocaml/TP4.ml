Simulation d'automates.

let automate ec lettre = 
	match ec with
	|	0	-> if lettre == 'a' then 0 else 1
	|	1	-> if lettre == 'a' then 2 else 3
	|	2	-> 2
	|	3	-> 3
	|	_	-> failwith "ERREUR" ;;



let rec executebis s ec =
	if (String.length s) == 0 then ec else
	match s.[0] with
	|	'a'	->	(executebis (String.sub s 1 ((String.length s) -1)) (automate ec 'a'))
	|	'b'	->	(executebis	(String.sub s 1 ((String.length s) -1)) (automate ec 'b'))
	|	_	-> failwith "ERREUR" ;;


let execute s =
	if (String.length s) == 0 then (failwith "ERREUR") else
	match s.[0] with
	|	'a'	->	(executebis (String.sub s 1 ((String.length s) -1)) (automate 0 'a'))
	|	'b'	->	(executebis	(String.sub s 1 ((String.length s) -1)) (automate 0 'b'))
	|	_	-> failwith "ERREUR";;

Arbres binaires de recherche.

type 'n arbre_r = Vide | Noeud of 'n arbre_r * 'n arbre_r * 'n arbre_r;;

1.	appartient x arb, pour savoir si x appartient à l'arbre arb 

let rec appartient x arb =
	match arb with
		| Vide -> true
		| Noeud (n, g, d) -> if x == n then true else (appartient x g) or (appartient x d)
		| _	-> false;;

2.	Tester si une fonction booléenne est vraie pour tous les éléments de l'arbre a

let rec verif p a =
	match a with
		| Vide -> (p Vide)
		| Noeud (n, g, d) -> (p n) && (verif p g) && (verif p d)
		| _ -> failwith "ERREUR dans l'arbre";;

3.	Parcours d'un arbre binaire

let rec prefixe a = 
	match a with
	|	Vide -> []
	|	Noeud (r, g, d) ->  [r]@ (prefixe g) @ (prefixe d);;

let rec postfixe a =
	match a with
	|	Vide -> []
	|	Noeud (r, g, d) -> (postfixe g) @ (postfixe d) @ [r];;

let rec infixe a =
	match a with
	|	Vide -> []
	|	Noeud (r, g, d) -> (infixe g) @ [r] @ (infixe d) ;;

4.	inserer un élément "x" de type "a" dans l'arbre binaire de recherche arbre.



##CORRECTION
let automate e c = match (e,c) with
| (0, 'b') -> 1
| (0, 'a') -> 0
| (1, 'b') -> 3
| (1, 'a') -> 2
| (2, 'a') -> 2
| (2, 'b') -> 2
| (3, 'a') -> 3
| (3, 'b') -> 3
| (_, _) -> failwith "automate";;

let rec executeb e s auto = 
if( String.length s) == 1 then (auto e s.[0])
	else let ne = (auto e s.[0]) in (executeb ne ((String.length s) -1 ) auto);;


let execute auto s = (executeb 0 s auto);;

let rec verif p arb = match arb with 
	| vide -> true
	| noeud (e, g, d) -> (p e) & (verif p g) & (verif p d);;

let rec prefixe arb = match arb with 
| vide -> []
| noeud (e, g, d) -> e::(prefixe g)@(prefixe d);;

let rec insere x arb = match arb with 
    | vide -> noeud(x, vide, vide)
    | noeud (e, g, d) -> if  < e then
        noeud ( e, (insere x g), d) else noeud (e, g, (insere x g), d) else
            noeud (e, g, (insere x d));;
let rec it_list f e l1 = match l1 with
| [] -> e
| (x :: q) -> f x (it_list f e q);;

let insere_liste a l1 = (it_list insere a l1);;

insere_liste vide [1; 2; 3];;

let rec retire_plus_grand arb = match arb with
| vide -> failwith "arbre vide"
| noeud (n, g, d) -> (n, g)
| noeud (n, g, d) -> let (m,a) = (retire_plus_grand d) in (m, noeud(n,g,a));;

