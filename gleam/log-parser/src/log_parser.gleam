import gleam/option.{Some}
import gleam/regex.{Match}

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regex.from_string("^\\[(DEBUG|INFO|WARNING|ERROR)\\].*")

  regex.check(re, line)
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("<[~*=-]*>")
  line
  |> regex.split(re, _)
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re) = regex.from_string("User\\s+(\\S+)")
  case regex.scan(content: line, with: re) {
    [Match(_, [Some(name)])] -> "[USER] " <> name <> " " <> line
    _ -> line
  }
}
