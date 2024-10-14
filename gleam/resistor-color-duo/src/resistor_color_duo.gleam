import gleam/bool.{guard}
import gleam/list

pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

fn resistor_value(color: Color) -> Int {
  case color {
    Black -> 0
    Brown -> 1
    Red -> 2
    Orange -> 3
    Yellow -> 4
    Green -> 5
    Blue -> 6
    Violet -> 7
    Grey -> 8
    White -> 9
  }
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  let inspecting_resistors = colors |> list.take(2)

  use <- guard(list.length(inspecting_resistors) < 2, Error(Nil))

  inspecting_resistors
  |> list.map(resistor_value)
  |> list.reduce(fn(acc, v) { acc * 10 + v })
}
