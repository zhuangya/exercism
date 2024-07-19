import gleam/list
import gleam/string

pub fn to_rna(dna: String) -> Result(String, Nil) {
  dna
  |> string.to_graphemes
  |> list.try_fold("", fn(acc, nucleotide) {
    case convert_to_rna(nucleotide) {
      Ok(rna) -> Ok(acc <> rna)
      Error(_) -> Error(Nil)
    }
  })
}

fn convert_to_rna(dna: String) -> Result(String, Nil) {
  case dna {
    "G" -> Ok("C")
    "C" -> Ok("G")
    "T" -> Ok("A")
    "A" -> Ok("U")
    _ -> Error(Nil)
  }
}
