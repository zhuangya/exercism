import gleam/bool.{guard}
import gleam/int
import gleam/list

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> list.flat_map(find_multiples(_, limit))
  |> list.unique
  |> list.fold(0, int.add)
}

fn find_multiples(base: Int, limit: Int) -> List(Int) {
  use <- guard(limit < base, [])
  limit / base
  |> list.range(1, _)
  |> list.filter_map(fn(i) {
    case base * i {
      result if result < limit -> Ok(result)
      _ -> Error(Nil)
    }
  })
}
