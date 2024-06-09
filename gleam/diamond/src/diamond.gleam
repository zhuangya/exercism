import gleam/list
import gleam/result
import gleam/string

pub fn build(letter: String) -> String {
  build_quadrant_iii(letter, [])
  |> amend_each_row
  |> build_top_part
  |> string.join("\n")
}

fn build_quadrant_iii(letter: String, rows: List(String)) -> List(String) {
  let assert Ok(#(prev_letter, _)) =
    letter
    |> string.to_utf_codepoints
    |> list.pop_map(fn(cp) {
      let assert Ok(cp) =
        string.utf_codepoint(string.utf_codepoint_to_int(cp) - 1)

      result.map(Ok(cp), fn(cp) { string.from_utf_codepoints([cp]) })
    })

  case letter {
    _ if letter == "@" ->
      rows
      |> list.map(fn(row) {
        row
        |> string.pad_right(to: list.length(rows), with: " ")
      })
    _ ->
      build_quadrant_iii(
        prev_letter,
        list.append(rows, [
          string.pad_left(letter, to: list.length(rows) + 1, with: " "),
        ]),
      )
  }
}

fn amend_each_row(rows: List(String)) -> List(String) {
  rows
  |> list.map(fn(row) {
    string.concat([
      row,
      row
        |> string.drop_right(1)
        |> string.reverse,
    ])
  })
}

fn build_top_part(rows: List(String)) -> List(String) {
  list.concat([
    rows
      |> list.drop(1)
      |> list.reverse,
    rows,
  ])
}
