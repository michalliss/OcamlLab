(* pomoc *)
type 'a llist = LNil | LCons of 'a * 'a llist Lazy.t;;

let rec ltake = function
        (0,_) -> []
        | (_, LNil) -> []
        | (n, LCons(x,lazy xs)) -> x::ltake(n-1,xs);;


let rec lfrom k = LCons(k, lazy(lfrom (k+1)));;



(* zadanie 1*)



let lrepeat xls k =
        let rec help xls n =
                match (n,xls) with
                | (_ , LNil) -> LNil
                | (0 , LCons(hd, lazy t)) -> LCons(hd, lazy(help t (k-1)))
                | (n , LCons(hd, lazy t)) -> LCons(hd, lazy(help xls (n-1)))

        in help xls (k-1);;

let res1 = lrepeat (lfrom 1) 5;;
let res1list = ltake (10, res1);;
let () = List.iter (fun x -> print_int x;) res1list;;
print_string "\n";;


(* zadanie 2 *)

let rec lfib =
        let rec help x1 x2 = LCons(x2, lazy(help x2 (x1+x2)))
        in LCons(0, lazy (help 0 1));;


let res2 = ltake(10, lfib);;
let () = List.iter (fun x -> print_int x;) res2;;

print_string "\n";;
(* zadanie 3 *)

type 'a lBT = LEmpty | LNode of 'a * (unit -> 'a lBT) * (unit -> 'a lBT);;

let lBreadth lTree =
        let rec help queue =
                match queue with
                | [] -> LNil
                | LEmpty::tl -> help tl
                | LNode(h, left, right)::tl -> LCons(h, lazy (help (tl @ [left(); right()])))

in help [lTree];;

let rec lTree k = LNode(k, (function () -> lTree (2*k)), (function () -> lTree(2*k+1)));;

let res3 = ltake(10, lBreadth (lTree 5));;
let () = List.iter (fun x -> print_int x;) res3;;

