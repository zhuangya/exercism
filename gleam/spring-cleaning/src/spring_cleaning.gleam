import gleam/string.{split}

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(err) = problem
  err
}

pub fn remove_team_prefix(team: String) -> String {
  let assert "Team " <> name = team
  name
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert [region, team] = split(combined, ",")

  #(region, remove_team_prefix(team))
}
