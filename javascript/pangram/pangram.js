'use strict';

class Pangram {
  constructor(input) {
    this.input = input;

    this.set = new Set(this.input.split('').map(x => x.toLowerCase()).filter(x => x.match(/[a-z]+/)));
  }

  isPangram() {
    return this.set.size === 26;
  }
}

module.exports = Pangram;
