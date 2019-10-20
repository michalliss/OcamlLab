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
    match ((abs_float((x0 *. x0 *. x0) -. a)) <= 10.e-19 *. abs_float(a)) with
    | true -> x0
    | false -> root3in a (x0 +. (a /. (x0 *. x0) -. x0) /. 3.)
in if(x > 1.) then root3in x (x /. 3.)
else root3in x x


let res2 = root3 5.;;
print_float res2;;


