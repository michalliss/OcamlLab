let curry3 f x y z = f(x, y, z);;
let uncurry3 f (x, y, z) = f x y z;;


let rec sumProd xs = List.fold_left (fun (x, y) h -> (x+h, y*h)) (0, 1) xs;;

let rec sumProd2 xs = List.fold_right (fun h (x,y) -> (x+h, y*h)) xs (0, 1);;


let test = [5;1;-1;2;3;4];;
let (r1, r2) = sumProd2 test;;
print_int r1;;
print_string "\n";;
print_int r2;;


let rec insertionSort pred xs =
    let rec insert poprzedza elem xs =
        match xs with
        [] -> [elem]
        | h::t as l -> if not(poprzedza h elem) then elem::l
                        else h::(insert poprzedza elem t)

    in List.fold_left (fun list h -> insert pred h list) [] xs;;


let tOrder x y = if x <= y then true else false;;

let tOrder2 (x1,y1) (x2,y2) = if x1 <= x2 then true else false
let test2 = [(5,0);(-1,1);(-1,2);(-3,3)];;

let res2 = insertionSort tOrder test;;


open Printf
let () = List.iter (printf "%d ") res2;;
print_string "\n";;

let rec mergeSort pred xs =
    let length = List.length xs in
    if length < 2 then xs else
    let rec split left right counter =
        match counter with
        | 0 -> (List.rev left, right)
        | _ -> split (List.hd right::left) (List.tl right) (counter-1)
    and merge (left, right) =
        match (left, right) with
        | ([], _) -> right
        | (_, []) -> left
        | (h1::t1, h2::t2) -> if pred h1 h2 then h1::merge(t1, right) else h2::merge(left, t2)

    in let(l, r) = split [] xs (length/2)
        in merge(mergeSort pred l, mergeSort pred r);;


let res3 = insertionSort tOrder2 test2;;
let () = List.iter (fun (x,y) -> print_int x; print_string "v"; print_int y) res3;;


