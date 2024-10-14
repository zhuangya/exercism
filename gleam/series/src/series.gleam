import gleam/bool.{guard}
import gleam/list
import gleam/string

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  let input_length = input |> string.length()

  use <- guard(input_length == 0, Error(EmptySeries))
  use <- guard(size < 0, Error(SliceLengthNegative))
  use <- guard(size == 0, Error(SliceLengthZero))
  use <- guard(size > input_length, Error(SliceLengthTooLarge))

  Ok(
    input
    |> string.to_graphemes()
    |> list.window(size)
    |> list.map(fn(x) { string.join(x, "") }),
  )
}

pub type Error {
  SliceLengthTooLarge
  SliceLengthNegative
  SliceLengthZero
  EmptySeries
}
