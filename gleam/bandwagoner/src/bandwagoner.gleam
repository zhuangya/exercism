pub type Coach {
  Coach(name: String, former_player: Bool)
}

pub type Stats {
  Stats(wins: Int, losses: Int)
}

pub type Team {
  Team(name: String, coach: Coach, stats: Stats)
}

pub fn create_coach(name: String, former_player: Bool) -> Coach {
  Coach(name, former_player)
}

pub fn create_stats(wins: Int, losses: Int) -> Stats {
  Stats(wins, losses)
}

pub fn create_team(name: String, coach: Coach, stats: Stats) -> Team {
  Team(name, coach, stats)
}

pub fn replace_coach(team: Team, coach: Coach) -> Team {
  Team(..team, coach: coach)
}

pub fn is_same_team(home_team: Team, away_team: Team) -> Bool {
  home_team == away_team
}

pub fn root_for_team(team: Team) -> Bool {
  case team {
    Team(coach: Coach(name: coach_name, ..), ..)
      if coach_name == "Gregg Popovich"
    -> True
    Team(coach: Coach(former_player: former_player, ..), ..) if former_player ->
      True
    Team(name: n, ..) if n == "Chicogo Bulls" -> True
    Team(stats: Stats(wins: wins, ..), ..) if wins >= 60 -> True
    Team(stats: Stats(wins: wins, losses: losses), ..) if losses > wins -> True
    _ -> False
  }
}
