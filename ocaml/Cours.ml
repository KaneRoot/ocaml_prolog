Liste :
let l1 = [1;2;3];;
l1 : int list = [1;2;3]

Constructeur : // Ajout d'un élément
0 :: l1;;
- : int list = [0;1;2;3]

let l2 = "bonjour" :: "tout" :: " le " :: "monde" :: [];;
l2 : string list = ["bonjour" ; "tout" ; "le" ; "monde"]

accès : filtrage

match e with
| [] -> cas vide
| x :: rest -> cas non vide

rest = suppression du premier élément de la liste

let rec print_string_list l = 
	match l with
		| [] -> ()
		| x :: rest -> printf "%s " x ; print_string_list rest ;;
print_string_list : string list -> unit = <fun>

#print_string_list(l2 :: "!!");;
bonjour tout le monde !! - : unit = ()

Vocabulaire:
Close : | filtre -> expression
filtre : définit la condition sur la forme de l'argument du filtrage pour que la clause s'applique ; définit aussi les variables de la clause.
expression : évaluée après liaison des variables du filtre aux morceaux correspondants de l'argument.

Abréviation:
f(x) = match x with filtrage peut aussi s'écrire
f = functino filtrage

/// C'est un peu le switch du C
let rec fact = function
| 0 -> 1
| 1 -> 1
| x -> x * fact(x -1);;
fact : int -> int = <fun>

Filtre " _ " : cas par défaut
Exemple : 
	let closing = function
	| '(' -> ')'
	| '[' -> ']'
	| '{' -> '}'
	| '<' -> '>'
	| _ -> failwith "closing" ;;
closing : char -> char = <fun>

Gardes : mot clé "when" 

let rec fact x = 
	match x with
	| x when x <= 1 -> 1
	| x -> x * fact(x-1);;
	val fact : int -> int = <fun>


	match s.[i] with
	| 'a' .. 'z' | 'A' .. 'Z'
	| '0' .. '9' | ''' | '_'
	| 'é' | 'à' | 'è' | 'ù' | 'â' | 'ê'
	advance (i + 1 ) lim 
	| _ -> i in 
	advance ...



Valeurs polymorphes
La liste vide est de n'importe quel type
[] ;;
: 'a list = []
 ' = prima = type quelconque

 Fonctions polymorphes
 let tete l = 
 match l with 
 | [] -> failwith "tete"
 | x :: l -> x;;
 val tete : 'a list -> 'a = <fun>


 EXERCICES // _ø|ø_ \\ 

 1. Écrire la fonction longueur l qui renvoie le nombre d'éléments de la liste l

 let rec longueur l = 
 match l with
 | [] -> 0
 | x :: l -> 1 + longueur l;;

 2. Écrire la fonction appartient x l qui est vrai si x appartient à la liste l
 
 let rec appartient x l = 
 match l with
 | [] -> false
 | y :: l -> if y == x then true else (appartient x l);;

 3. Écrire la fonction n_ieme n l qui renvoie le énième élément de la liste l
 
 let rec n_ieme n l = 
	match l with
	| [] -> -1
	| x::rest -> if n == 0 then x else (n_ieme (n -1) rest);;
 
 // Solution moyenne
 let rec nieme n (a::q) =
 match n with
 | 0 -> a
 | n -> nieme (n -1) q;;

 4. Écrire la fonction somme l qui renvoie la somme des éléments de la liste

 let rec somme l = 
 match l with
 | [] -> 0
 | x::rest -> x + (somme rest);;
 
 5. Écrire une fonction min_liste qui renvoie le plus petit élément d'une liste

 let rec min_listebis l min = 
 match l with
 | [] -> min
 | x::rest -> if (x < min) then (min_listebis rest x) else (min_listebis rest min);;

 let min_liste l = 
 match l with
 | [] -> (-1)
 | x::rest -> (min_listebis rest x);;

 6. Écrire la fonction miroir l qui renvoie la liste avec les éléments inversés

 let rec miroirbis mir l = 
 match l with
 | [] -> (mir)
 | x::rest -> (miroirbis (x::mir) rest);;


 let miroir l = 
 match l with
 | [] -> []
 | _ -> (miroirbis ([]) l);;  



aplatissement d'une liste (suppression des []) // PAS FAIT

let rec suppar l = 
	match l with
	| [] -> l
	| 

Supprimer un élément dans une liste


let rec supelbis l e res = 
 match l with
 | [] -> res
 | x::rest -> if x == e then (supelbis rest e res) else (supelbis rest e (res@[x]));;

let supel l e = (supelbis l e ([]));;



Écrire une fonction qui transforme une liste de couples en un couple de listes

let rec couplebis l1 l2 l = 
 match l with
 | [] -> (l1,l2)
 | (x,y)::rest -> (couplebis (l1@[x]) (l2@[y]) rest);;
let couple l = 
 match l with
 | [] -> failwith "MARCHE PAS LA"
 | _ -> (couplebis ([]) ([]) l);;

Étant données deux listes, écrire une fonction qui construit la liste des sommes des éléments de même rang sur la longueur la plus courte


let rec sommebis res l1 l2 = 
match l1,l2 with
| [],[] -> res 
| [],_ -> (sommebis (res@l2) ([]) ([]))
| _,[] -> (sommebis (res@l1) ([]) ([]))
| x::rest , y::rest2 -> (sommebis (res@[x+y]) rest rest2);;


let somme l1 l2 = (sommebis ([]) l1 l2);;
