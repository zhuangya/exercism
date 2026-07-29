let planet_ratio = function
  | "Earth" -> Some 1.0
  | "Mercury" -> Some 0.2408467
  | "Venus" -> Some 0.61519726
  | "Mars" -> Some 1.8808158
  | "Jupiter" -> Some 11.862615
  | "Saturn" -> Some 29.447498
  | "Uranus" -> Some 84.016846
  | "Neptune" -> Some 164.79132
  | _ -> None

let age_on planet seconds =
  let earth_year_in_seconds = 31557600.0 in
  let s = float_of_int seconds in
  let ratio = planet_ratio planet in
  ratio
  |> Option.map (fun r -> s /. earth_year_in_seconds /. r)
  |> Option.to_result ~none:"not a planet"
