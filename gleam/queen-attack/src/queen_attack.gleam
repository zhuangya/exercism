import gleam/bool
import gleam/int

pub type Position {
  Position(row: Int, column: Int)
}

pub type Error {
  RowTooSmall
  RowTooLarge
  ColumnTooSmall
  ColumnTooLarge
}

pub fn create(queen: Position) -> Result(Nil, Error) {
  use <- bool.guard(queen.row < 0, Error(RowTooSmall))
  use <- bool.guard(queen.row > 7, Error(RowTooLarge))
  use <- bool.guard(queen.column < 0, Error(ColumnTooSmall))
  use <- bool.guard(queen.column > 7, Error(ColumnTooLarge))
  Ok(Nil)
}

pub fn can_attack(
  black_queen black_queen: Position,
  white_queen white_queen: Position,
) -> Bool {
  use <- bool.guard(diff(white_queen.row, black_queen.row) |> equal(0), True)
  use <- bool.guard(
    diff(black_queen.column, white_queen.column) |> equal(0),
    True,
  )
  use <- bool.guard(
    equal(
      diff(black_queen.row, white_queen.row),
      diff(black_queen.column, white_queen.column),
    ),
    True,
  )
  False
}

fn diff(a: Int, b: Int) -> Int {
  int.absolute_value(a - b)
}

fn equal(a: Int, b: Int) -> Bool {
  a == b
}
