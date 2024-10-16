import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  case instructions |> string.to_graphemes {
    ["A", ..rest] ->
      move(direction, advance(direction, position), rest |> string.join(""))
    ["R", ..rest] ->
      move(turn(direction, "R"), position, rest |> string.join(""))
    ["L", ..rest] ->
      move(turn(direction, "L"), position, rest |> string.join(""))
    [] -> create(direction, position)
    _ -> panic as "unknown instruction"
  }
}

fn advance(direction: Direction, position: Position) -> Position {
  case direction {
    North -> Position(..position, y: position.y + 1)
    South -> Position(..position, y: position.y - 1)
    East -> Position(..position, x: position.x + 1)
    West -> Position(..position, x: position.x - 1)
  }
}

fn direction_value(direction: Direction) -> Int {
  case direction {
    North -> 0
    East -> 1
    South -> 2
    West -> 3
  }
}

fn value_to_direction(value: Int) -> Direction {
  case value {
    0 -> North
    1 -> East
    2 -> South
    3 -> West
    n if n < 0 -> value_to_direction(n + 4)
    x -> value_to_direction(x % 4)
  }
}

fn turn(direction: Direction, turn: String) -> Direction {
  case turn {
    "R" -> direction_value(direction) + 1 |> value_to_direction
    "L" -> direction_value(direction) - 1 |> value_to_direction
    _ -> panic as "unknown turn/direction"
  }
}
