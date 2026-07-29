let is_silence ask = ask |> String.trim |> String.length = 0

let is_question ask =
  let trimmed = String.trim ask in
  let length = String.length trimmed in
  match length with 0 -> false | _ -> trimmed.[length - 1] = '?'

let is_shouting s =
  String.uppercase_ascii s = s
  && String.uppercase_ascii s <> String.lowercase_ascii s

let response_for ask =
  if is_silence ask then "Fine. Be that way!"
  else
    match (is_shouting ask, is_question ask) with
    | true, true -> "Calm down, I know what I'm doing!"
    | true, _ -> "Whoa, chill out!"
    | _, true -> "Sure."
    | _ -> "Whatever."
