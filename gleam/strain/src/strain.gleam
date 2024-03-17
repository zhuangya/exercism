pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_keep([], list, predicate)
}

fn do_keep(result: List(t), list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  case list {
    [] -> reverse(result)
    [head, ..tail] -> {
      let next = case predicate(head) {
        True -> [head, ..result]
        False -> result
      }
      do_keep(next, tail, predicate)
    }
  }
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_discard([], list, predicate)
}

fn do_discard(
  result: List(t),
  list: List(t),
  predicate: fn(t) -> Bool,
) -> List(t) {
  case list {
    [] -> reverse(result)
    [head, ..tail] -> {
      let next = case predicate(head) {
        True -> result
        False -> [head, ..result]
      }
      do_discard(next, tail, predicate)
    }
  }
}

fn reverse(list: List(t)) -> List(t) {
  do_reverse(list, [])
}

fn do_reverse(list: List(t), acc: List(t)) -> List(t) {
  case list {
    [] -> acc
    [head, ..tail] -> do_reverse(tail, [head, ..acc])
  }
}
