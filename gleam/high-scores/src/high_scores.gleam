import gleam/int
import gleam/list
import gleam/order

pub fn scores(high_scores: List(Int)) -> List(Int) {
  high_scores
}

pub fn latest(high_scores: List(Int)) -> Result(Int, Nil) {
  list.last(high_scores)
}

pub fn personal_best(high_scores: List(Int)) -> Result(Int, Nil) {
  list.reduce(high_scores, int.max)
}

pub fn personal_top_three(high_scores: List(Int)) -> List(Int) {
  high_scores
  |> list.sort(fn(a, b) {
    case a > b {
      True -> order.Lt
      False -> order.Gt
    }
  })
  |> list.take(3)
}
