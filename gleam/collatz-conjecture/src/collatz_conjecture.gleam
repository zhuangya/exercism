import gleam/bool

pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  run(number, 0)
}

fn run(number: Int, steps: Int) -> Result(Int, Error) {
  use <- bool.guard(number <= 0, Error(NonPositiveNumber))

  case number {
    1 -> Ok(steps)

    e if e % 2 == 0 -> run(e / 2, steps + 1)
    o if o % 2 == 1 -> run(o * 3 + 1, steps + 1)

    _ -> panic
  }
}
