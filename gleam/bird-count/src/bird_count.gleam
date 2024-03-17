import gleam/int
import gleam/order.{Eq, Gt, Lt}

pub fn today(days: List(Int)) -> Int {
  case days {
    [today, ..] -> today
    _ -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [today, ..rest] -> [today + 1, ..rest]
    _ -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [0, ..] -> True
    [_, ..rest] -> has_day_without_birds(rest)
    _ -> False
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [today, ..rest] -> today + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [today, ..rest] ->
      {
        case int.compare(today, 5) {
          Gt | Eq -> 1
          Lt -> 0
        }
      }
      + busy_days(rest)
  }
}
