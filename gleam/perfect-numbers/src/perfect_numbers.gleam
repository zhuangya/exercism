import gleam/bool
import gleam/int
import gleam/list
import gleam/order.{Eq, Gt, Lt}

pub type Classification {
  Perfect
  Abundant
  Deficient
}

pub type Error {
  NonPositiveInt
}

pub fn classify(number: Int) -> Result(Classification, Error) {
  use <- bool.guard(number <= 0, Error(NonPositiveInt))

  case int.compare(aliquot_sum(number), number) {
    Lt -> Ok(Deficient)
    Eq -> Ok(Perfect)
    Gt -> Ok(Abundant)
  }
}

fn aliquot_sum(number: Int) -> Int {
  list.range(1, number / 2)
  |> list.filter(fn(n) { n != number && number % n == 0 })
  |> int.sum()
}
