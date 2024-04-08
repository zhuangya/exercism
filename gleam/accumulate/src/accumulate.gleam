import gleam/list

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  convert(list, fun, [])
}

fn convert(list: List(a), fun: fn(a) -> b, result: List(b)) -> List(b) {
  case list {
    [] -> result

    [head, ..tail] -> convert(tail, fun, list.append(result, [fun(head)]))
  }
}
