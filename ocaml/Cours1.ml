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
 2. 
