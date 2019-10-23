let rec reverse xs =
    let rec reverse1 (xs, temp) =
        match xs with
        | [] -> temp
        | h::t -> reverse1(t,h::temp)
in reverse1(xs, []);;


let rec podziel xs =
    let rec podziel2 (xs, x1s, x2s) =
        match xs with
        | [] -> (reverse(x1s), reverse(x2s))
        | h::t -> if (h mod 2) = 0 then podziel2(t, (h :: x1s), x2s)
        else podziel2(t, x1s, (h :: x2s))
in podziel2((xs,[],[]));;



let (x1,x2) = podziel [1;2;3;4;5;6;7];;
open Printf
let () = List.iter (printf "%d ") (x1);;
print_string "   ";;
let () = List.iter (printf "%d ") (x2);;
print_string "\n";;


let (x1,x2) = podziel [1];;
open Printf
let () = List.iter (printf "%d ") (x1);;
print_string "   ";;
let () = List.iter (printf "%d ") (x2);;
print_string "\n";;


let (x1,x2) = podziel [];;
open Printf
let () = List.iter (printf "%d ") (x1);;
print_string "   ";;
let () = List.iter (printf "%d ") (x2);;
print_string "\n";;


let (x1,x2) = podziel [2;3;9;1];;
open Printf
let () = List.iter (printf "%d ") (x1);;
print_string "   ";;
let () = List.iter (printf "%d ") (x2);;
print_string "\n";;




let polacz x1 x2 =
    let rec polacz2 x0 left right pb =
    match (left, right) with
    | ([], []) -> reverse x0
    | (hd::tl, []) -> polacz2 (hd::x0) tl right pb
    | ([], hd::tl) -> polacz2 (hd::x0) left tl pb
    | (h1::t1, h2::t2) -> if(pb = 0) then polacz2(h1::x0) t1 right 1 else polacz2(h2::x0) left t2 0
in polacz2 [] x1 x2 0;;

let res3 = polacz [1;2;3] [9;3;2];;
let () = List.iter (printf "%d ") (res3);;
print_string "\n";;


let res3 = polacz [] [1;3;2];;
let () = List.iter (printf "%d ") (res3);;
print_string "\n";;


let res3 = polacz [1] [9;3;2;3;4;4];;
let () = List.iter (printf "%d ") (res3);;
print_string "\n";;


let res3 = polacz [] [];;
let () = List.iter (printf "%d ") (res3);;
print_string "\n";;
