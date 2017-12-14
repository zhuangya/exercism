class DnaTranscriber {
  toRna(seq) {
    /*
     * C -> G
     * G -> C
     * A -> U
     * T -> A
     */
    const M = {
      C: 'G',
      G: 'C',
      A: 'U',
      T: 'A',
    };

    let result = '';
    const L = seq.length;

    for(let i = 0; i < L; i++) {
      const rna = M[seq[i]];
      if (rna) {
        result = result + rna;
      } else {
        throw(new Error('Invalid input'));
      }
    }

    return result;
  }
}

module.exports = DnaTranscriber;
