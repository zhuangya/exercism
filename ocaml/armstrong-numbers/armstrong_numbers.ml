let validate candidate =
  let rec digits n = if n < 10 then 1 else 1 + digits (n / 10) in
  let rec pow base exp = if exp = 0 then 1 else base * pow base (exp - 1) in
  let power = digits candidate in

  let rec sum current acc =
    match current with
    | 0 -> acc = candidate
    | _ -> sum (current / 10) (acc + pow (current mod 10) power)
  in

  sum candidate 0
