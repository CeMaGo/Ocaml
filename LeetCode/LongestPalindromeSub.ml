let longest_palindrome (s : string) : string =
  let len = String.length s in
  if len < 1 then "" else
  let start = ref 0 in
  let end_ = ref 0 in

  let expand_around_center left right =
    let l = ref left in
    let r = ref right in
    while !l >= 0 && !r < len && s.[!l] = s.[!r] do
      l := !l - 1;
      r := !r + 1;
    done;
    !r - !l - 1
  in

  for i = 0 to len - 1 do
    let len1 = expand_around_center i i in
    let len2 = expand_around_center i (i + 1) in
    let max_len = max len1 len2 in
    if max_len > !end_ - !start + 1 then begin
      start := i - (max_len - 1) / 2;
      end_ := i + max_len / 2;
    end
  done;
  String.sub s !start (!end_ - !start + 1)
;;

(* Example usage: *)
let s1 = "babad";;
let s2 = "cbbd";;

Printf.printf "Longest palindrome in '%s': %s\n" s1 (longest_palindrome s1);;
Printf.printf "Longest palindrome in '%s': %s\n" s2 (longest_palindrome s2);;