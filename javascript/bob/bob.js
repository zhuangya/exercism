'use strict';

class Bob {
  hey(line) {
    line = line.trim();
    if (line.length === 0) {
      return 'Fine. Be that way!';
    }

    if (line.match(/[A-Z]/) && line.toUpperCase() === line) {
      return 'Whoa, chill out!';
    }

    if (line.endsWith('?')) {
      return 'Sure.';
    }

    return 'Whatever.';

  }
}

module.exports = Bob;
