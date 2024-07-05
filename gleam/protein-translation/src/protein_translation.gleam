import gleam/list

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  to_proteins(rna, [])
}

fn to_proteins(rna: String, acc: List(String)) -> Result(List(String), Nil) {
  case rna {
    "AUG" <> rest -> to_proteins(rest, ["Methionine", ..acc])
    "UUU" <> rest -> to_proteins(rest, ["Phenylalanine", ..acc])
    "UUC" <> rest -> to_proteins(rest, ["Phenylalanine", ..acc])
    "UUA" <> rest -> to_proteins(rest, ["Leucine", ..acc])
    "UUG" <> rest -> to_proteins(rest, ["Leucine", ..acc])
    "UCU" <> rest -> to_proteins(rest, ["Serine", ..acc])
    "UCC" <> rest -> to_proteins(rest, ["Serine", ..acc])
    "UCA" <> rest -> to_proteins(rest, ["Serine", ..acc])
    "UCG" <> rest -> to_proteins(rest, ["Serine", ..acc])
    "UAU" <> rest -> to_proteins(rest, ["Tyrosine", ..acc])
    "UAC" <> rest -> to_proteins(rest, ["Tyrosine", ..acc])
    "UGU" <> rest -> to_proteins(rest, ["Cysteine", ..acc])
    "UGC" <> rest -> to_proteins(rest, ["Cysteine", ..acc])
    "UGG" <> rest -> to_proteins(rest, ["Tryptophan", ..acc])
    "" | "UAA" <> _ | "UAG" <> _ | "UGA" <> _ -> Ok(list.reverse(acc))
    _ -> Error(Nil)
  }
}
