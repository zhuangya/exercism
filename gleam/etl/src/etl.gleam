import gleam/dict.{type Dict}
import gleam/list
import gleam/string

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  dict.fold(legacy, dict.new(), fn(acc, value, letters) {
    list.fold(letters, acc, fn(d, l) {
      dict.insert(d, l |> string.lowercase(), value)
    })
  })
}
