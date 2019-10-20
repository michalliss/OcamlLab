let rec suma xs =
if xs = [] then 0.
else (List.hd xs) +. (suma(List.tl xs));;

let test1 = [1.;2.;3.];;
let test11 = [];;
let test12 = [1.;2.3;9.9];;
print_float (suma test1);;
print_string "\n";;
print_float (suma test11);;
print_string "\n";;
print_float (suma test12);;
print_string "\n";;




let rec sumak (x1,x2,x3,x4) = x1 +. x2 +. x3 +. x4;;

let test2 = (1.2,2.3,3.4,4.5);;
print_float (sumak test2);;
print_string "\n";;
print_float (sumak (1.0,3.,4.,6.3));;
print_string "\n";;
print_float (sumak (1.,1.,1.,1.));;
print_string "\n";;

let rec polacz (xs, sep) =
if xs = [] then ""
else List.hd xs ^ sep ^ polacz(List.tl xs, sep);;

let test3 = ["Michal";"Jacek";"Liss"];;
let test3a = "/";;
let test31 = ["a";"b";"c"];;
let test3a1 = "8";;
let test32 = [];;
let test3a2 = "a";;


print_string (polacz(test3, test3a));;
print_string "\n";;
print_string (polacz(test31, test3a1));;
print_string "\n";;
print_string (polacz(test32, test3a2));;
print_string "\n";;
let rec mniejsze (xs, arg) =
if xs = [] then true
else if List.hd xs >= arg then false
else mniejsze(List.tl xs, arg);;


let test4 = [1;2;3;4;5;6];;
let test4a = 4;;
let test41 = [1;2;3;4;5;6];;
let test4a1 = 7;;
print_string(string_of_bool (mniejsze(test41, test4a1)));;
print_string "\n";;
print_string(string_of_bool (mniejsze(test41, test4a1)));;
print_string "\n";;

