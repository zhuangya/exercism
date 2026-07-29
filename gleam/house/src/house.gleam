import gleam/list
import gleam/string

const fragments = [
  "the house that Jack built.",
  "the malt that lay in",
  "the rat that ate",
  "the cat that killed",
  "the dog that worried",
  "the cow with the crumpled horn that tossed",
  "the maiden all forlorn that milked",
  "the man all tattered and torn that kissed",
  "the priest all shaven and shorn that married",
  "the rooster that crowed in the morn that woke",
  "the farmer sowing his corn that kept",
  "the horse and the hound and the horn that belonged to",
]

fn verse(number: Int) -> String {
  let body =
    fragments
    |> list.take(number)
    |> list.reverse
    |> string.join(" ")

  "This is " <> body
}

pub fn recite(
  start_verse start_verse: Int,
  end_verse end_verse: Int,
) -> String {
  list.range(start_verse, end_verse)
  |> list.map(verse)
  |> string.join("\n")
}
