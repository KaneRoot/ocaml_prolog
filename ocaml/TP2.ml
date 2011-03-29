(* HELLO WORLD !!!! *)

let a = "hello" and c = " world" in a^c;;

let rec fibis n u v = if n < 2 then v else fibis (n - 1 ) v (u + v) ;;
let fib n = fibis n 1 1 ;;

let rec pair n = if n == 0 then true else impair (n - 1) and impair n = if n == 0 then false else pair (n -1) ;;
let rec suite n = print_int n ; print_string " " ; if n <> 1 then suite( if ( pair n ) then (n/2) else (n*3+1));;

let rec est_dans ch c = if String.length ch == 0 then false else if ch.[0] == c then true else est_dans(String.sub ch 1 ((String.length ch) - 1)) c ;;

let rec palindrome s = let l =  String.length s in l <= 1 || s.[0] = s.[l - 1] && palindrome (String.sub s 1 (l - 2)) ;;

let rec hanoibis n d i a = if n > 0 then (hanoibis (n - 1) d i a ; print_string("Transfert de " ^ d ^ " vers " ^ a ^ "\n"); hanoibis (n - 1) i d a );;
let hanoi n = hanoibis n "gauche" "centre" "droite" ;;

let rec occurbis ch c nb = let l = String.length ch in if l == 0 then nb else ( if ch.[0] == c then (occurbis (String.sub ch 1 (l - 1)) c (nb + 1)) else (occurbis (String.sub ch 1 (l - 1)) c nb)) ;;
let occur ch c = occurbis ch c 0 ;;

let rec inclusionbis s1 s2 l1 l2 = if l1 < l2 then false else (if (String.compare (String.sub s1 0 l2) s2) == 0 then true else (inclusionbis (String.sub s1 1 (l1 -1)) s2 (l1 -1) l2));;
let inclusion s1 s2 = inclusionbis s1 s2 (String.length s1) (String.length s2);;

let rec positionbis s1 s2 l1 l2 pos = if l1 < l2 then -1 else (if (String.compare (String.sub s1 0 l2) s2) == 0 then pos else (positionbis (String.sub s1 1 (l1 - 1)) s2 (l1 - 1) l2 (pos + 1)));;
let position s1 s2 = positionbis s1 s2 (String.length s1) (String.length s2) 0 ;;

let rec nboccbis s1 s2 l1 l2 nb = if l1 < l2 then nb else (if (String.compare (String.sub s1 0 l2) s2) == 0 then (nboccbis (String.sub s1 1 (l1 -1)) s2 (l1 -1) l2 (nb + 1)) else (nboccbis (String.sub s1 1 (l1 -1)) s2 (l1 - 1) l2 nb));;
let nbocc s1 s2 = nboccbis s1 s2 (String.length s1) (String.length s2) 0 ;;

let remplacebis s1 s2 s3 l1 l2 l3 = let pos = (position s1 s2) in if pos == -1 then print_string("ERREUR !!!\n") else print_string((String.sub s1 0 pos) ^ s3 ^ (String.sub s1 (pos + l2) (l1 - pos - l2 )));;
let remplace s1 s2 s3 = remplacebis s1 s2 s3 (String.length s1) (String.length s2) (String.length s3);;
