pub fn is_leap_year(year: Int) -> Bool {
  // A leap year (in the Gregorian calendar) occurs:
  //
  // In every year that is evenly divisible by 4.
  // Unless the year is evenly divisible by 100, in which case it's only a leap year if the year is also evenly divisible by 400.
  //

  case year % 400, year % 100, year % 4 {
    0, _, _ -> True
    _, 0, _ -> False
    _, _, 0 -> True
    _, _, _ -> False
  }
}
