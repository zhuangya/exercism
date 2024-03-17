import gleam/list
import gleam/pair
import gleam/string

const dn_dr_pairs = [
  #(1000, "M"),
  #(900, "CM"),
  #(500, "D"),
  #(400, "CD"),
  #(100, "C"),
  #(90, "XC"),
  #(50, "L"),
  #(40, "XL"),
  #(10, "X"),
  #(9, "IX"),
  #(5, "V"),
  #(4, "IV"),
  #(1, "I"),
]

pub fn convert(number: Int) -> String {
  {
    use #(n, r), #(dn, dr) <- list.fold(over: dn_dr_pairs, from: #(number, ""))
    #(n % dn, r <> string.repeat(dr, n / dn))
  }
  |> pair.second
}
