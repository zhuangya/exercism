open Base

let empty = Map.empty (module Char)

let count_nucleotide s c =
  let is_nucleotide c =
    match c with
    | 'A' -> true
    | 'C' -> true
    | 'G' -> true
    | 'T' -> true
    | _ -> false
  in
  let init = if is_nucleotide c then Ok 0 else Error c in
  String.fold s ~init ~f:(fun acc char ->
      match acc with
      | Error e -> Error e
      | Ok n -> (
          match (is_nucleotide char, Char.equal char c) with
          | false, _ -> Error char
          | true, true -> Ok (n + 1)
          | true, false -> Ok n))


let count_nucleotides s =
  let nucleotides = ['A'; 'C'; 'G'; 'T'] in
  List.fold nucleotides ~init:(Ok empty) ~f:(fun acc c ->
      match acc with
      | Error e -> Error e
      | Ok map -> (
          match count_nucleotide s c with
          | Error e -> Error e
          | Ok 0 -> Ok map
          | Ok n -> Ok (Map.set map ~key:c ~data:n)))
