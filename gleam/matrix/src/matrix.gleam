import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn row(index: Int, string: String) -> Result(List(Int), Nil) {
  to_matrix(string) |> at(index)
}

pub fn column(index: Int, string: String) -> Result(List(Int), Nil) {
  to_matrix(string)
  |> list.transpose()
  |> at(index)
}

fn to_lines(string: String) -> List(String) {
  string |> string.split("\n")
}

fn to_int(line: String) -> List(Int) {
  line |> string.split(" ") |> list.map(int.parse) |> result.values()
}

fn to_matrix(string: String) -> List(List(Int)) {
  string |> to_lines |> list.map(to_int)
}

fn at(l: List(a), index: Int) -> Result(a, Nil) {
  l
  |> list.drop(index - 1)
  |> list.first
}
