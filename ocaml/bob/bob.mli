(*
Answers to `hey` like a teenager.

## Examples

  # response_for ""
  "Fine. Be that way!"

  # response_for "Do you like math?"
  "Sure."

  # response_for "HELLO!"
  "Woah, chill out!"

  # response_for "Coding is cool."
  "Whatever."
*)
val is_question : string -> bool
val response_for : string -> string
