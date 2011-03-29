(* 
 * Les fractales :) 
 *
 * #load "graphics.cma";;
 * open Graphics;;
 * open_graph "";;
 * placer le curseur en a b dans la fenêtre graphique: moveto a b
 * tracer un segment : lineto c d
 * ab x--------------x cd
 *)

#load "graphics.cma";;
open Graphics;;

(* Pour créer un graphe *)

lineto 150 0;; (* On a crée une droite qui part d'où on était et qui écrit jusqu'en bas (0)  *)

open_graph "";;
moveto 100 100;;
let rec vonkoch n a b c d = 
    if n == 0 then( (lineto c d) ; open_graph "" )
    else 
        (((lineto ((2*a+c)/3) ((2*b+d)/3)) ; 
        ((lineto ((a+c)/2-2*(d-b)/7) (b+d)/2+2*(c-a)/7));
        ((lineto ((a+2*c)/3) ((b+2*d)/3) ))) ;
        (vonkoch (n-1) a b c d)) ;;
(*open_graph "" ; (Koch n a b c d);;

read_key() && close_graph();

(* 
 * X: (2*a+c)/3             (2*b+d)/3
 * Y: (a+c)/2-2*(d-b)/7     (b+d)/2+2*(c-a)/7
 * Z: (a+2*c)/3             (b+2*d)/3
 *
 *)

