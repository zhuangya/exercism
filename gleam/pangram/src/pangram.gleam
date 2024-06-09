import gleam/list
import gleam/set
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  prepare_sentence_set(sentence)
  |> set.symmetric_difference(letter_set())
  |> set.size
  |> fn(size) { size == 0 }
}

fn prepare_sentence_set(sentence: String) {
  string.to_graphemes(sentence)
  |> list.filter_map(fn(letter) {
    let l = string.lowercase(letter)
    case set.contains(letter_set(), l) {
      True -> Ok(l)
      False -> Error("Invalid character")
    }
  })
  |> list.sort(string.compare)
  |> set.from_list
}

fn letter_set() {
  [
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
    "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
  ]
  |> set.from_list
}
