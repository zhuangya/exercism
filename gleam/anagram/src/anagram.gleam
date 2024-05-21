import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  candidates
  |> list.filter(fn(candidate) { is_anagram(word, candidate) })
}

fn normalize(word: String) -> String {
  word
  |> string.lowercase
  |> string.split("")
  |> list.sort(string.compare)
  |> string.join("")
}

fn is_anagram(target: String, candidate: String) -> Bool {
  normalize(target) == normalize(candidate)
  && string.lowercase(target) != string.lowercase(candidate)
}
