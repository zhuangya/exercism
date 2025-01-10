import gleam/list

pub type Triplet {
  Triplet(Int, Int, Int)
}

pub fn triplets_with_sum(sum: Int) -> List(Triplet) {
  use a <- list.flat_map(list.range(3, sum / 3))
  use b <- list.filter_map(list.range(a + 1, { sum - a } / 2))

  case verify(a, b, sum) {
    True -> Ok(Triplet(a, b, sum - a - b))
    False -> Error(Nil)
  }
}

fn verify(a: Int, b: Int, sum: Int) -> Bool {
  2 * b * { sum - a } == sum * sum - 2 * sum * a
}
// a^2 + b^2 = c^2
// a^2 + b^2 = (N - (a + b))^2
// a^2 + b^2 = N^2 - 2N(a + b) + a^2 + 2ab + b^2
// 0 = N^2 - 2N(a+b) + 2ab
// 0 = N^2 - 2Na - 2Nb + 2ab
// 2Nb - 2ab = N^2 - 2Na
// -> 2b (N - a) = N^2 - 2Na
