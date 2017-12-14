'use strict';

function getRandomIntInclusive(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);

  return Math.floor(Math.random() * (max - min + 1)) + min;
}

const generateRandomKey = (length=100) => {
  let result = '';
  while(length--) {
    result = result + String.fromCharCode(getRandomIntInclusive(0, 25) + 97);
  }

  return result;
};

class Cipher {
  constructor(key=generateRandomKey()) {
    if (key.match(/[a-z]+$/)) {
      this.key = key;
    } else {
      throw new Error('Bad key');
    }
  }

  getDeltaByIndexAndMethod(index, method) {
    return (method === 'encode' ? 1 : -1) * (this.key.charCodeAt(index % this.key.length) - 97);
  }

  getDeltaByIndex(index) {
    return this.key.charCodeAt(index % this.key.length) - 97;
  }

  trans(secret, method) {
    const l = secret.length;
    let result = '';

    for(let i = 0; i < l; i++) {
      let targetCode = secret.charCodeAt(i) - 97 + this.getDeltaByIndexAndMethod(i, method);

      if (targetCode < 0) {
        targetCode = targetCode + 26;
      }

      if (targetCode > 25) {
        targetCode = targetCode - 26;
      }

      result = result + String.fromCharCode(targetCode + 97);
    }

    return result;
  }

  encode(secret) {
    return this.trans(secret, 'encode');
  }

  decode(puzzle) {
    return this.trans(puzzle, 'decode');
  }
}

module.exports = Cipher;
