import gleam/string.{length}

pub opaque type TreasureChest(generic_treasure) {
  TreasureChest(password: String, treasure: generic_treasure)
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  case length(password) >= 8 {
    True -> Ok(TreasureChest(password, contents))
    False -> Error("Password must be at least 8 characters long")
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case password == chest.password {
    True -> Ok(chest.treasure)
    False -> Error("Incorrect password")
  }
}
