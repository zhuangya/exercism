import gleam/option.{None, Some}
import gleam/dict.{type Dict, drop, fold, has_key, insert, update}

pub type ScoreBoard =
  Dict(String, Int)

pub fn create_score_board() -> ScoreBoard {
  dict.from_list([#("The Best Ever", 1_000_000)])
}

pub fn add_player(
  score_board: ScoreBoard,
  player: String,
  score: Int,
) -> ScoreBoard {
  score_board
  |> insert(player, score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) -> ScoreBoard {
  score_board
  |> drop([player])
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  case has_key(score_board, player) {
    True ->
      score_board
      |> update(player, fn(score) {
        case score {
          Some(i) -> i + points
          None -> points
        }
      })
    False -> score_board
  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  score_board
  |> fold(score_board, fn(board, player, _points) {
    update_score(board, player, 100)
  })
}
