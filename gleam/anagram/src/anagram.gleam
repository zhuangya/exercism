import gleam/dict
import gleam/list
import gleam/result
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  candidates
  |> list.filter(fn(candidate) { is_anagram(word, candidate) })
}

fn is_anagram(target: String, candidate: String) -> Bool {
  to_value(string.to_graphemes(target), Ok(1))
  == to_value(string.to_graphemes(candidate), Ok(1))
  && string.lowercase(target) != string.lowercase(candidate)
}

fn to_value(
  grapheme: List(String),
  product: Result(Int, Nil),
) -> Result(Int, Nil) {
  case grapheme {
    [] -> product
    [head, ..tail] ->
      to_value(
        tail,
        result.try(product, fn(p) {
          result.try(get_prime(head), fn(pp) { Ok(p * pp) })
        }),
      )
  }
}

fn get_prime(letter: String) -> Result(Int, Nil) {
  // List of the first 26 prime numbers
  let primes = [
    2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
    73, 79, 83, 89, 97, 101,
  ]

  // List of lowercase English letters
  let letters = [
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
    "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
  ]

  let map = dict.from_list(list.zip(letters, primes))

  dict.get(map, string.lowercase(letter))
}
