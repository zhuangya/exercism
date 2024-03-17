import gleam/float.{product}
import gleam/list

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  case is_triangle(a, b, c) {
    True -> a == b && b == c
    False -> False
  }
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  case is_triangle(a, b, c) {
    True -> a == b || b == c || c == a
    False -> False
  }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  case is_triangle(a, b, c) {
    True -> a != b && b != c && c != a
    False -> False
  }
}

fn is_triangle(a: Float, b: Float, c: Float) -> Bool {
  let assert [a, b, c] =
    [a, b, c]
    |> list.sort(float.compare)
  { a +. b >. c } && product([a, b, c]) >. 0.0
}
