module type QUEUE_FUN =
sig
 type 'a t
 exception Empty of string
 val empty: unit -> 'a t
 val enqueue: 'a * 'a t -> 'a t
 val dequeue: 'a t -> 'a t
 val first: 'a t -> 'a
 val isEmpty: 'a t -> bool
end;;

module Lqueue: QUEUE_FUN =
struct
        type 'a t = 'a list
        exception Empty of string
        let empty () = []
        let enqueue (elem, queue) =
                queue @ [elem]
        let dequeue queue =
                match queue with
                | [] -> []
                | h::t -> t
        let first queue =
                match queue with
                | [] -> raise (Empty "pusta kolejka")
                | h::t -> h
        let isEmpty queue =
                queue = []
end;;

let a = Lqueue.empty();;
let b = Lqueue.enqueue (1,a);;
print_int (Lqueue.first b);;


module L2Queue: QUEUE_FUN =
struct
        type 'a t = 'a list * 'a list
        exception Empty of string
        let empty() = ([],[])
        let toNormal queue =
                match queue with
                | ([], yl) -> (List.rev yl, [])
                | queue -> queue
        let enqueue (elem, queue) =
                let (xs, ys) = queue in
                toNormal(xs, elem::ys)
        let dequeue queue =
                match queue with
                | ([], _) -> queue;
                | (h::t, ys) -> toNormal(t, ys)
        let first queue =
                match queue with
                | ([], _) -> raise (Empty "pusta kolejka")
                | (h::t, _) -> h
        let isEmpty queue = let (xs, _) = queue in xs = []
end;;



(*--------------------------------------------------------------------*)

module type QUEUE_MUT =
sig
 type 'a t
 (* The type of queues containing elements of type ['a]. *)
 exception Empty of string
 (* Raised when [first q] is applied to an empty queue [q]. *)
 exception Full of string
 (* Raised when [enqueue(x,q)] is applied to a full queue [q]. *)
 val empty: int -> 'a t
 (* [empty n] returns a new queue of length [n], initially empty. *)
 val enqueue: 'a * 'a t -> unit
 (* [enqueue (x,q)] adds the element [x] at the end of a queue [q]. *)
 val dequeue: 'a t -> unit
 (* [dequeue q] removes the first element in queue [q] *)
 val first: 'a t -> 'a
 (* [first q] returns the first element in queue [q] without removing
 it from the queue, or raises [Empty] if the queue is empty. *)
 val isEmpty: 'a t -> bool
 (* [isEmpty q] returns [true] if queue [q] is empty,
 otherwise returns [false]. *)
 val isFull: 'a t -> bool
 (* [isFull q] returns [true] if queue [q] is full,
 otherwise returns [false]. *)
end;;


module CQueue : QUEUE_MUT =
struct
        type 'a t = {mutable a: 'a option array; mutable f: int; mutable r: int}
        exception Empty of string
        exception Full of string
        let isFull queue = queue.r - queue.f = -1 || queue.r - queue.f + 1 = Array.length queue.a
        let isEmpty queue = queue.r = queue.f
        let empty len = {a = Array.make len None; f = 0; r = 0}
        let enqueue (elem, queue) =
                if isFull queue then raise (Full "pelna") else
                        queue.a.(queue.r) <- Some elem;
                if queue.r = Array.length queue.a - 1
                        then queue.r <- 0
                        else queue.r <- succ queue.r
        let dequeue queue =
                if(isEmpty queue) then () else
                if(queue.f = Array.length queue.a - 1)
                        then queue.f <- 0
                        else queue.f <- succ queue.f
        let first queue =
                if(isEmpty queue) then raise (Empty "pusta") else
                match queue.a.(queue.f) with
                        | Some elem -> elem
                        | _ -> failwith "internal error"
end;;

let q = CQueue.empty 5;;

CQueue.enqueue (1,q);;
CQueue.enqueue (2,q);;
CQueue.enqueue (3,q);;
CQueue.enqueue (4,q);;
CQueue.dequeue q;;
CQueue.dequeue q;;
CQueue.dequeue q;;
CQueue.dequeue q;;
CQueue.enqueue (5,q);;
print_int( CQueue.first q);;


