let rec fib x =
    match x with
    | 0 -> 1
    | 1 -> 1
    | _ -> (fib(x-1) + fib(x-2))

;;

let res  = fib(6);;

print_int res;;
print_string "\n";;




let rec fibTail x =
    let rec acFib x1 x2 n=
       if(n = 0) then x2
       else acFib x2 (x1+x2) (n-1)
in acFib 0 1 x;;

let res2 = fibTail(42);;

print_int res2;;
print_string "\n";;





let rec root3 x =
    let rec root3in a x0 =
    match ((abs_float((x0 *. x0 *. x0) -. a)) <= 10.e-15 *. abs_float(a)) with
    | true -> x0
    | false -> root3in a (x0 +. (a /. (x0 *. x0) -. x0) /. 3.)
in if(x > 1.) then root3in x (x /. 3.)
else root3in x x


let res2 = root3 5.;;
print_float res2;;
print_string "\n";;



let _::_::x::_ = [-2;-1;0;1;2];;
print_int x;;
print_string "\n";;

let _::(x,_)::_ = [(1,2);(0,1)];;
print_int x;;
print_string "\n";;



let rec initSegment (xs, ys) =
    match (xs, ys) with
    | ([], _ ) -> true
    | (h::tl, []) -> false
    | (h1::t1, h2::t2) -> if(h1 = h2) then initSegment(t1, t2) else false;;

let res5 = initSegment ([1;2;4], [1;2;3;4;5]);;
print_string (string_of_bool res5);;
print_string "\n";;




let rec replaceNth (xs, count, elem) =
    if count < 0 then xs
    else match (xs, count) with
    | ([], _) -> xs
    | (h::t, 0) -> elem::t
    | (h::t, _) -> h::replaceNth(t, count-1, elem);;

let res6 = replaceNth ([1;2;3;4;5], 2, 7);;
open Printf
let () = List.iter (printf "%d ") res6;;
print_string "\n";;3








