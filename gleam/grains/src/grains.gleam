import gleam/bool
import gleam/int

pub type Error {
  InvalidSquare
}

pub fn square(square: Int) -> Result(Int, Error) {
  use <- bool.guard(
    when: square < 1 || square > 64,
    return: Error(InvalidSquare),
  )

  Ok(int.bitwise_shift_left(1, square - 1))
}

pub fn total() -> Int {
  int.bitwise_shift_left(1, 64) - 1
}
