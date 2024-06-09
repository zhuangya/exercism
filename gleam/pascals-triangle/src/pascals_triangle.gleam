import gleam/list

pub fn rows(n: Int) -> List(List(Int)) {
  gen([], n)
}

fn gen(rows: List(List(Int)), limit: Int) -> List(List(Int)) {
  case
    rows
    |> list.length,
    rows
    |> list.last
  {
    n, _ if n == limit -> rows
    _, Error(Nil) -> gen([[1]], limit)
    _, Ok(last_row) ->
      gen(
        rows
          |> list.append([
          list.map2(
            last_row
              |> list.append([0]),
            last_row
              |> list.prepend(0),
            fn(x, y) { x + y },
          ),
        ]),
        limit,
      )
  }
}
