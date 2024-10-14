import gleam/list
import gleam/set
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let clean_phrase =
    phrase
    |> string.lowercase
    |> string.to_graphemes
    |> list.filter(fn(x) { x != " " && x != "-" })

  let set_size =
    clean_phrase
    |> set.from_list()
    |> set.size()

  set_size == list.length(clean_phrase)
}
