import gleam/set.{
  type Set, contains, delete, filter, insert, intersection, size, to_list, union,
}
import gleam/list.{reduce}

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(
    collection
      |> contains(card),
    collection
      |> insert(card),
  )
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let assert new_collection =
    collection
    |> delete(my_card)
    |> insert(their_card)

  case
    collection
    |> contains(my_card),
    collection
    |> contains(their_card)
  {
    True, False -> #(True, new_collection)
    _, _ -> #(False, new_collection)
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  case
    collections
    |> reduce(fn(acc, current) { intersection(acc, current) })
  {
    Ok(cards) ->
      cards
      |> to_list
    _ -> []
  }
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  case
    collections
    |> reduce(fn(acc, current) { union(acc, current) })
  {
    Ok(cards) ->
      cards
      |> size
    _ -> 0
  }
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> filter(fn(card) {
    case card {
      "Shiny " <> _ -> True
      _ -> False
    }
  })
}
