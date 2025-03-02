let convert (s : string) (num_rows : int) : string =
  if num_rows = 1 || String.length s <= num_rows then s else
  let rows = Array.make num_rows (ref []) in
  let current_row = ref 0 in
  let going_down = ref false in

  String.iter (fun c ->
    rows.(!current_row) := c :: !(rows.(!current_row));
    if !current_row = 0 || !current_row = num_rows - 1 then
      going_down := not !going_down;
    current_row := if !going_down then !current_row + 1 else !current_row - 1;
  ) s;

  let result = Array.fold_left (fun acc row ->
    List.fold_left (fun acc' c -> String.make 1 c ^ acc') acc !row
  ) "" rows in

  result
;;

(* Example usage: *)
let s1 = "PAYPALISHIRING";;
let num_rows1 = 3;;
let s2 = "PAYPALISHIRING";;
let num_rows2 = 4;;
let s3 = "A";;
let num_rows3 = 1;;

Printf.printf "'%s' converted to zigzag with %d rows: %s\n" s1 num_rows1 (convert s1 num_rows1);;
Printf.printf "'%s' converted to zigzag with %d rows: %s\n" s2 num_rows2 (convert s2 num_rows2);;
Printf.printf "'%s' converted to zigzag with %d rows: %s\n" s3 num_rows3 (convert s3 num_rows3);;