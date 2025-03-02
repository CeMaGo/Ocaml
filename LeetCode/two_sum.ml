open Hashtbl

let two_sum (nums : int array) (target : int) : (int * int) option =
  let num_map = create (Array.length nums) in

  let process_element i num =
    let complement = target - num in
    match find_opt num_map complement with
    | Some complement_index -> Some (complement_index, i)
    | None -> add num_map num i; None
  in

  let result = ref None in
  Array.iteri (fun i num ->
    match process_element i num with
    | Some indices -> result := Some indices
    | None -> ()
  ) nums;

  !result
;;

(* Example usage: *)
let nums = [|2; 7; 11; 15|];;
let target = 9;;

match two_sum nums target with
| Some (index1, index2) -> Printf.printf "Indices: %d, %d\n" index1 index2
| None -> Printf.printf "No solution found\n";;

let nums2 = [|3;2;4|];;
let target2 = 6;;

match two_sum nums2 target2 with
| Some (index1, index2) -> Printf.printf "Indices: %d, %d\n" index1 index2
| None -> Printf.printf "No solution found\n";;