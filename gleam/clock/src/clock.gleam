import gleam/int
import gleam/result
import gleam/string

pub type Clock {
  Clock(minutes: Int)
}

fn modulo(a: Int) -> Int {
  a
  |> int.modulo(24 * 60)
  |> result.unwrap(0)
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  { hour * 60 + minute }
  |> int.modulo(24 * 60)
  |> result.unwrap(0)
  |> Clock
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  Clock(minutes: clock.minutes + minutes)
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  let delta = clock.minutes - modulo(minutes)

  case delta {
    _ if delta < 0 -> Clock(minutes: 60 * 24 + delta)
    _ -> Clock(minutes: delta)
  }
}

pub fn display(clock: Clock) -> String {
  let h = clock.minutes / 60 % 24
  let m = clock.minutes % 60

  format(h) <> ":" <> format(m)
}

fn format(n: Int) -> String {
  n |> int.to_string |> string.pad_left(2, "0")
}
