import gleam/int
import gleam/string

pub type Clock {
  Clock(minutes: Int)
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  let total_minutes = { hour * 60 } + minute

  let a_day = 24 * 60

  case total_minutes {
    tm if tm < 0 -> Clock(a_day + { tm % a_day })
    tm if tm > 0 -> Clock(tm % a_day)
    _ -> Clock(0)
  }
}

fn create_by_minutes(minutes) -> Clock {
  create(0, minutes)
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  create_by_minutes(clock.minutes + minutes)
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  create_by_minutes(clock.minutes - minutes)
}

pub fn display(clock: Clock) -> String {
  let h = clock.minutes / 60
  let m = clock.minutes % 60

  format(h) <> ":" <> format(m)
}

fn format(n: Int) -> String {
  n |> int.to_string |> string.pad_left(2, "0")
}
