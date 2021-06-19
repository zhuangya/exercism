//
// This is only a SKELETON file for the 'Resistor Color Duo' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const COLORS = [
      'black',
      'brown',
      'red',
      'orange',
      'yellow',
      'green',
      'blue',
      'violet',
      'grey',
      'white',
    ];

export const decodedValue = (colors) => {
  return colors.slice(0, 2).reduce((result, c, index) =>
    result + COLORS.indexOf(c) * Math.pow(10, 1 - index),
  0)
};
