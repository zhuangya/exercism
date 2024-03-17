import gleam/order.{type Order}
import gleam/list.{sort}
import gleam/float.{compare}

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  { f -. 32.0 } /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case left, right {
    Celsius(left), Celsius(right) -> compare(left, right)
    Celsius(left), Fahrenheit(right) ->
      compare(left, fahrenheit_to_celsius(right))
    Fahrenheit(left), Celsius(right) ->
      compare(fahrenheit_to_celsius(left), right)
    Fahrenheit(left), Fahrenheit(right) -> compare(left, right)
  }
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  cities
  |> sort(fn(c1: City, c2: City) {
    compare_temperature(c1.temperature, c2.temperature)
  })
}
