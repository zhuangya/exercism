import gleam/int
import gleam/list
import gleam/string

pub fn recite(
  start_bottles start_bottles: Int,
  take_down take_down: Int,
) -> String {
  lyrics(start_bottles, take_down)
  |> string.join("\n\n")
}

fn lyrics(start_bottles s: Int, take_down t: Int) -> List(String) {
  list.range(s, s - t + 1)
  |> list.map(fn(n) {
    { "" <> quantity(n) <> " green " <> bottle(n) <> " hanging on the wall,\n" }
    |> string.capitalise()
    |> string.repeat(2)
    |> string.append("And if one green bottle should accidentally fall,\n")
    |> string.append(
      "There'll be "
      <> quantity(n - 1)
      <> " green "
      <> bottle(n - 1)
      <> " hanging on the wall.",
    )
  })
}

fn quantity(n: Int) -> String {
  case n {
    0 -> "no"
    1 -> "one"
    2 -> "two"
    3 -> "three"
    4 -> "four"
    5 -> "five"
    6 -> "six"
    7 -> "seven"
    8 -> "eight"
    9 -> "nine"
    10 -> "ten"
    _ -> panic as { "invalid n: " <> int.to_string(n) }
  }
}

fn bottle(n: Int) -> String {
  case n {
    1 -> "bottle"
    _ -> "bottles"
  }
}
