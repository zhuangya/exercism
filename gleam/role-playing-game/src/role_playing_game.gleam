import gleam/int
import gleam/option.{type Option, None, Some, unwrap}
import gleam/order.{Eq, Gt, Lt}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health {
    0 ->
      case int.compare(player.level, 10) {
        Gt | Eq -> Some(Player(..player, health: 100, mana: Some(100)))
        Lt -> Some(Player(..player, health: 100))
      }
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    None -> #(Player(..player, health: int.max(0, player.health - cost)), 0)
    Some(mana) ->
      case int.compare(mana, cost) {
        Eq | Gt -> #(Player(..player, mana: Some(mana - cost)), cost * 2)
        Lt -> #(player, 0)
      }
  }
}
