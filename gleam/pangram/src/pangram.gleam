import gleam/list
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  let alphabet = "abcdefghijklmnopqrstuvwxyz"
  let sentence = sentence |> string.lowercase

  alphabet
  |> string.to_graphemes
  |> list.all(string.contains(sentence, _))
}
