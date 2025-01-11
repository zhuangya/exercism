import gleam/int
import gleam/list

pub type Resistance {
  Resistance(unit: String, value: Int)
}

fn code(c: String) -> Int {
  case c {
    "black" -> 0
    "brown" -> 1
    "red" -> 2
    "orange" -> 3
    "yellow" -> 4
    "green" -> 5
    "blue" -> 6
    "violet" -> 7
    "grey" -> 8
    "white" -> 9
    _ -> panic
  }
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  let assert [f, s, u] = colors |> list.take(3) |> list.map(code)
  let assert Ok(num) = int.undigits([f, s, ..list.repeat(0, u)], 10)
  Ok(case u + 2 {
    x if x > 9 -> Resistance("gigaohms", num / 1_000_000_000)
    x if x > 6 -> Resistance("megaohms", num / 1_000_000)
    x if x > 3 -> Resistance("kiloohms", num / 1000)
    _ -> Resistance("ohms", num)
  })
}
