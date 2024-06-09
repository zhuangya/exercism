pub type TreasureChest(generic_treasure) {
  TreasureChest(password: String, treasure: generic_treasure)
}

pub type UnlockResult(generic_treasure) {
  Unlocked(generic_treasure)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case password == chest.password {
    True -> Unlocked(chest.treasure)
    False -> WrongPassword
  }
}
