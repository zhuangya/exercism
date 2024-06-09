pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  foldr(first, second, fn(acc, item) { [item, ..acc] })
}

pub fn concat(lists: List(List(a))) -> List(a) {
  foldr(lists, [], fn(acc, item) { append(item, acc) })
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  foldl(reverse(list), [], fn(acc, item) {
    case function(item) {
      True -> [item, ..acc]
      False -> acc
    }
  })
}

pub fn length(list: List(a)) -> Int {
  foldl(list, 0, fn(acc, _item) { acc + 1 })
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  foldl(reverse(list), [], fn(acc, item) { [function(item), ..acc] })
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [item, ..rest] -> foldl(rest, function(initial, item), function)
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [item, ..rest] -> function(foldr(rest, initial, function), item)
  }
}

pub fn reverse(list: List(a)) -> List(a) {
  foldl(list, [], fn(acc, item) { [item, ..acc] })
}
