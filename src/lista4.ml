(* zadanie 2 *)

let f x = raise Not_found;;

(* zadanie 3 *)

type 'a bt = Empty | Node of 'a * 'a bt * 'a bt


let rec breadthBTtail tt =
    let rec breadthBThelp queue resList =
        match queue with
           | [] -> List.rev resList
           | Empty::t -> breadthBThelp t resList
           | Node(value, left, right)::t -> breadthBThelp (t @ [left;right]) (value::resList)
     in breadthBThelp [tt] [];;

let rec breadthBT tt =
        let rec breadthBThelp queue =
        match queue with
        | [] -> []
        | Empty::t -> breadthBThelp t
        | Node(value, left, right)::t -> value::breadthBThelp (t @ [left;right])
        in breadthBThelp [tt];;

let tt = Node(1,
 Node(2,
 Node(4,
 Empty,
Empty
 ),
 Empty
 ),
 Node(3,
 Node(5,
 Empty,
Node(6,
 Empty,
Empty
 )
 ),
 Empty
 )
 );;

let res3 = breadthBT tt;;
open Printf;;
let () = List.iter (printf "%d ") res3;;
print_string "\n";;



(*zadanie 4 *)

let wewSciezka tt =
    let rec wewSciezkaHelp depth curr =
        match curr with
        | Empty -> 0
        | Node(value, left, right) -> depth + wewSciezkaHelp (depth+1) left + wewSciezkaHelp (depth+1) right
    in wewSciezkaHelp 0 tt;;

let res4 = wewSciezka tt;;
print_int res4;;
print_string "\n";;

let zewSciezka tt =
    let rec zewSciezkaHelp depth curr =
        match curr with
        | Empty -> depth
        | Node(value, left, right) -> zewSciezkaHelp (depth+1) left + zewSciezkaHelp (depth+1) right
    in zewSciezkaHelp 0 tt;;


let res5 = zewSciezka tt;;
print_int res5;;
print_string "\n";;


(*zadanie 5 *)
type 'a graph = Graph of ('a -> 'a list)

 let g = Graph
(function
0 -> [3]
| 1 -> [0;2;4]
| 2 -> [1]
| 3 -> []
| 4 -> [0;2]
| n -> failwith ("Graph g: node "^string_of_int n^" doesn't exist")
);;


let rec depthSearch (Graph gfunc) start =
    let rec depthSearchHelp visited curr =
        match curr with
        | [] -> []
        | h::t -> if List.mem h visited then depthSearchHelp(visited) t
                    else h::depthSearchHelp (h::visited) (gfunc h @ t)
    in depthSearchHelp [] [start];;

let res6 = depthSearch g 4;;
let () = List.iter (printf "%d ") res6;;
print_string "\n";;



