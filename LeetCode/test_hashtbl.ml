open Hashtbl

let test_find_opt () =
    let h = create 10 in
    add h "key" 42;
    match find_opt h "key" with
    | Some value -> Printf.printf "Value: %d\n" value
    | None -> Printf.printf "Not found\n"
;;

test_find_opt ();;