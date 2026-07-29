import gleam/bool
import gleam/list
import gleam/string

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  use <- bool.guard(
    when: string.length(strand1) != string.length(strand2),
    return: Error(Nil),
  )

  let differences =
    list.zip(string.to_graphemes(strand1), string.to_graphemes(strand2))
    |> list.count(fn(pair) {
      let #(left, right) = pair
      left != right
    })

  Ok(differences)
}
