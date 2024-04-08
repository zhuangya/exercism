import gleam/list

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0b00 -> Ok(Adenine)
    0b01 -> Ok(Cytosine)
    0b10 -> Ok(Guanine)
    0b11 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  use acc, base <- list.fold(over: dna, from: <<>>)
  <<acc:bits, encode_nucleotide(base):2>>
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  decode_dna(dna, [])
}

fn decode_dna(
  dna: BitArray,
  acc: List(Nucleotide),
) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<>> -> Ok(list.reverse(acc))
    <<0b00:2, rest:bits>> -> decode_dna(rest, [Adenine, ..acc])
    <<0b01:2, rest:bits>> -> decode_dna(rest, [Cytosine, ..acc])
    <<0b10:2, rest:bits>> -> decode_dna(rest, [Guanine, ..acc])
    <<0b11:2, rest:bits>> -> decode_dna(rest, [Thymine, ..acc])
    _ -> Error(Nil)
  }
}
