import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(p) -> pizza_price(p) + 1
    ExtraToppings(p) -> pizza_price(p) + 2
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let fee = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }

  fee + add_pizza(order, 0)
}

fn add_pizza(list: List(Pizza), price: Int) -> Int {
  case list {
    [] -> price
    [pizza, ..rest] -> {
      add_pizza(rest, price + pizza_price(pizza))
    }
  }
}
