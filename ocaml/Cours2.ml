Polymorphisme : fonctionnelles

Fonctions générales : 
let rec iter f l = 
	match l with
	| [] -> ()
	| x :: l -> f x ; iter f l ;;

val iter : ('a -> 'b) -> 'a list -> unit = <fun>

Exemple de fonction:
iter (function elem -> printf "%s" elem) l2 ;;
Bonjour tout le monde- : unit = ()


let rec map f l =
	match l with
	| [] -> []
	| x :: l -> let elem = f x in elem :: map f l;;
val map : ('a -> 'b) -> 'a list -> 'b list = <fun>

Les tableaux
Création d'un tableau:

Array.create taille valeur_init
let a = Array.create 10 0 ;;

initialisation avec différentes valeurs;
let a = [| 1; 2 ; 3 ; 4; |];;

Accès à un élément d'indice i :
a.(i)

modification : a.(i) <- v
longueur d'un tableau : Array.length a

Définition de types
Les types enregistrements:
n-uplets dont les composantes sont nommées:

type employe = {nom : string; mutable age: int;}

Pas modifiable par défaut
type personne = {nom = "martin" ; age = 20};;
p.age <- p.age + 1;;

Types sommes :
type piece = PILE | FACE;;

2 constructeurs constants : let v = PILE ;;

let essai p = match p with 
	PILE --> "gagne"
	FACE --> "Perdu";;

Type récursifs
Application aux structures arborescentes :
Arbres binaires:
type int_btree =  Empty | Node of int_btree * int * int_btree

Initialisation d'un arbre binaire:
let t2 = Node ( Node ( Empty, 4, Empty), 3 , Node (Empty, 5, Empty));;

				3
			/		\
		4				5
	/	|				|	\
Empty	Empty		Empty	Empty

Accéder à la valeur de la racine de l'arbre par utilisation du filtrage :

let root_label t = match t with
	Empty -> failwith "root_label truc"
	
Type générique:
éléments quelconques
type 'a btree = Empty | Node of 'a btree * 'a * 'a btree

let t3 = Node(Node(Empty, "un", Empty), "bonjour", Node(Empty, "caml", Empty));;


EXERCICES

type ('f, 'n) arbre = 
	feuille of 'f 
	| Noeud of 'n * ('f, 'n) arbre
				  * ('f, 'n) arbre;;

1) Écrire une fonction hauteur qui calcule la hauteur d'un arbre.

t1 = Noeud ( 3 , Noeud ( 1, Feuille(0), Feuille(2)), Feuille(4));;

				3
			/		\
		1				4
	/		\
0				2

let rec hauteur arb = match arb with
	| Feuille(_) -> 0 
	| Noeud(_, g, d) -> 1 + max (hauteur g) (hauteur d);;

2) Écrire une fonction nombre_feuille qui calcule le nombre de feuilles d'un arbre.

let rec nombre_feuille arb = 
	match arb with
	| Feuille(_) -> 1
	| Noeud(_, g, d) -> 1 + (nombre_feuille g) + (nombre_feuille d);;

3) Écrire une fonction nombre_noeud qui calcule le nombre de noeuds d'un arbre.

let rec nombre_noeud arb = 
	match arb with
	| Feuille(_) -> 0
	| Noeud(_, g, d) -> 1 + (nombre_noeud g) + (nombre_noeud d);;

4) Écrire une fonction miroir qui calcule l'image miroir d'un arbre.

let rec miroir arb = 
	match arb with
	| Feuille (f) -> Feuille(f)
	| Noeud (n, g, d) -> Noeud(n, miroir d, miroir g);;

5) Écrire une fonction appartient x arb qui est vraie si x appartient à l'arbre arb

let rec appartient x arb =
	match arb with
	| Feuille (f) -> if x == f then true else false
	| Noeud (n, g, d) -> if x == n then true else (appartient x g) or (appartient x d);;

6) Écrire la fonction préfixe qui renvoie la liste des éléments de l'arbre dans l'ordre préfixée

variable anonyme = _
