let rec two_fer = function
  | None -> two_fer (Some "you")
  | Some name -> Printf.sprintf "One for %s, one for me." name
