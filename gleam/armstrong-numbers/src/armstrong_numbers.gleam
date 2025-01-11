import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  let digits = number |> int.digits(10)

  case digits {
    Ok(d) ->
      list.fold(d, 0, fn(sum, current) {
        sum + int_power(current, list.length(d))
      })
      == number
    Error(_) -> False
  }
}

fn int_power(number: Int, exp: Int) -> Int {
  case exp {
    0 -> 1
    1 -> number
    e -> number * int_power(number, e - 1)
  }
}
