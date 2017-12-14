//
// This is only a SKELETON file for the "Leap" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Year = function (input) {
  this.input = parseInt(input, 10);
};

Year.prototype.isLeap = function () {
  return this.input % 400 === 0 ? true : (this.input % 100 !== 0 && this.input % 4 === 0);
};

module.exports = Year;
