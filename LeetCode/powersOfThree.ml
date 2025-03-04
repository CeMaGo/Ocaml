let check_powers_of_three (n : int) : bool =
  let rec check (num : int) : bool =
    if num = 0 then
      true
    else if num mod 3 = 2 then
      false
    else
      check (num / 3)
  in
  check n
;;

(* Example usage: *)
let n1 = 12;;
let n2 = 91;;
let n3 = 21;;

Printf.printf "%d: %B\n" n1 (check_powers_of_three n1);;
Printf.printf "%d: %B\n" n2 (check_powers_of_three n2);;
Printf.printf "%d: %B\n" n3 (check_powers_of_three n3);;