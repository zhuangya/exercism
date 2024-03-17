import gleam/int
import gleam/pair
import gleam/list

const sound = [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]

pub fn convert(number: Int) -> String {
  let result = {
    use #(n, s), #(dn, ds) <- list.fold(over: sound, from: #(number, ""))
    #(
      n,
      s
        <> {
          case n, n % dn {
            _, 0 -> ds
            0, _ -> ""
            _, _ -> ""
          }
        },
    )
  }

  case result {
    #(_, "") -> int.to_string(number)
    _ -> pair.second(result)
  }
}
