let rec reverse xs =
    let rec reverse1 (xs, temp) =
    if xs = [] then temp
    else reverse1(List.tl xs, List.hd xs :: temp)
in reverse1(xs, []);;


let rec podziel xs =
    let rec podziel2 (xs, x1s, x2s) =
        if xs = [] then (reverse(x1s), reverse(x2s))
        else if ((List.hd xs) mod 2 ) = 0 then podziel2(List.tl xs, (List.hd xs :: x1s), x2s)
        else podziel2(List.tl xs, x1s, (List.hd xs :: x2s))
in podziel2((xs,[],[]));;

podziel [1;2;3;4];;
let (x1,x2) = podziel [1;2;3;4;5;6;7];;

open Printf
let () = List.iter (printf "%d ") (x1);;
print_string "\n";;
let () = List.iter (printf "%d ") (x2);;
print_string "\n";;


let polacz x1 x2 =
    let rec polacz2 x0 x1 x2 pb =
    match (x1, x2) with
    | ([], []) -> reverse x0
    | (hd::tl, []) -> polacz2(hd::x0) tl x2 pb
    | ([], hd::tl) -> polacz2(hd::x0) x1 tl pb
    | (h1::t1, h2::t2) -> if(pb = 0) then polacz2(h1::x0) t1 x2 1 else polacz2(h2::x0) x1 t2 0
in polacz2 [] x1 x2 0;;

let res3 = polacz [1;2;3] [9;3;2];;


let () = List.iter (printf "%d ") (res3);;
print_string "\n";;
